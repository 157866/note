# 获取token

> 前言

access_token是公众号的全局唯一接口调用凭据，公众号调用各接口时都需使用access_token。开发者需要进行妥善保存。access_token的存储至少要保留512个字符空间。access_token的有效期目前为2个小时，需定时刷新，重复获取将导致上次获取的access_token失效。

公众平台的API调用所需的access_token的使用及生成方式说明：

1、建议公众号开发者使用中控服务器统一获取和刷新access_token，其他业务逻辑服务器所使用的access_token均来自于该中控服务器，不应该各自去刷新，否则容易造成冲突，导致access_token覆盖而影响业务；

2、目前access_token的有效期通过返回的expires_in来传达，目前是7200秒之内的值。中控服务器需要根据这个有效时间提前去刷新新access_token。在刷新过程中，中控服务器可对外继续输出的老access_token，此时公众平台后台会保证在5分钟内，新老access_token都可用，这保证了第三方业务的平滑过渡；

3、access_token的有效时间可能会在未来有调整，所以中控服务器不仅需要内部定时主动刷新，还需要提供被动刷新access_token的接口，这样便于业务服务器在API调用获知access_token已超时的情况下，可以触发access_token的刷新流程。

4、对于可能存在风险的调用，在开发者进行获取 access_token调用时进入风险调用确认流程，需要用户管理员确认后才可以成功获取。具体流程为：

开发者通过某IP发起调用->平台返回错误码[89503]并同时下发模板消息给公众号管理员->公众号管理员确认该IP可以调用->开发者使用该IP再次发起调用->调用成功。

如公众号管理员第一次拒绝该IP调用，用户在1个小时内将无法使用该IP再次发起调用，如公众号管理员多次拒绝该IP调用，该IP将可能长期无法发起调用。平台建议开发者在发起调用前主动与管理员沟通确认调用需求，或请求管理员开启IP白名单功能并将该IP加入IP白名单列表。

公众号和小程序均可以使用AppID和AppSecret调用本接口来获取access_token。AppID和AppSecret可在“微信公众平台-开发-基本配置”页中获得（需要已经成为开发者，且账号没有异常状态）。**调用接口时，请登录“微信公众平台-开发-基本配置”提前将服务器IP地址添加到IP白名单中，点击查看设置方法，否则将无法调用成功。**小程序无需配置IP白名单。





**接口调用请求说明**

> https请求方式: GET https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET



| 参数       | 是否必须 | 说明                                  |
| ---------- | -------- | ------------------------------------- |
| grant_type | 是       | 获取access_token填写client_credential |
| appid      | 是       | 第三方用户唯一凭证                    |
| secret     | 是       | 第三方用户唯一凭证密钥，即appsecret   |





**返回说明**

正常情况下，微信会返回下述JSON数据包给公众号：

```json
{"access_token":"ACCESS_TOKEN","expires_in":7200}
```



**参数说明**

| 参数         | 说明                   |
| ------------ | ---------------------- |
| access_token | 获取到的凭证           |
| expires_in   | 凭证有效时间，单位：秒 |





错误时微信会返回错误码等信息，JSON数据包示例如下（该示例为AppID无效错误）:

```json
{"errcode":40013,"errmsg":"invalid appid"}
```

**返回码说明**

| 返回码 | 说明                                                         |
| ------ | ------------------------------------------------------------ |
| -1     | 系统繁忙，此时请开发者稍候再试                               |
| 0      | 请求成功                                                     |
| 40001  | AppSecret错误或者AppSecret不属于这个公众号，请开发者确认AppSecret的正确性 |
| 40002  | 请确保grant_type字段值为client_credential                    |
| 40164  | 调用接口的IP地址不在白名单中，请在接口IP白名单中进行设置。   |
| 89503  | 此IP调用需要管理员确认,请联系管理员                          |
| 89501  | 此IP正在等待管理员确认,请联系管理员                          |
| 89506  | 24小时内该IP被管理员拒绝调用两次，24小时内不可再使用该IP调用 |
| 89507  | 1小时内该IP被管理员拒绝调用一次，1小时内不可再使用该IP调用   |





### 第一步发送get请求访问微信接口

> 依赖来自于 spring-boot-starter-web

#### 编写RestTemplate 配置类

```java
package com.example.WXSystem.tool.token;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

@Configuration
public class ResTemplateConfig {
    @Bean
    public RestTemplate restTemplate(ClientHttpRequestFactory factory) {
        return new RestTemplate(factory);
    }

    @Bean
    public ClientHttpRequestFactory simpleClientHttpRequestFactory() {
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        //超时设置
        factory.setReadTimeout(5000);//ms
        factory.setConnectTimeout(15000);//ms
        return factory;
    }

}

```



#### 发送get请求

> 需要依赖

```xml
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>fastjson</artifactId>
            <version>1.2.62</version>
        </dependency>
```



```java
package com.example.WXSystem.tool.token;

import com.example.WXSystem.tool.Result;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;

/**
 * 获取token
 */
@Component
public class GetToken {
    @Resource
    private RestTemplate restTemplate;

    public Result getToken(String appid, String appSecrect) {
        AccessToken accessToken = null;
//        获取token的地址
        String url = "https://api.weixin.qq.com/cgi-bin/token" + "?grant_type=client_credential&appid=" + appid
                + "&secret=" + appSecrect;
//        发送get请求
        ResponseEntity<AccessToken> forEntity = restTemplate.getForEntity(url, AccessToken.class);
        AccessToken body = forEntity.getBody();
        if (body != null){
            return Result.ok().message("获取token 成功").data(body);
        }
        return Result.error().message("获取token失败");
    }

}

```





### 编写需要的POJO

AccessToken 用于访问成功后 把string类型转成AccessToken类型

```java
package com.example.WXSystem.tool.token;

import lombok.Data;

@Data
public class AccessToken {
    //    获取token
    private String access_token;
    //  状态码
    private Long expires_in;
}

```





编写常量 对象 Parameter

用于调用 getToken() 传参

```java
package com.example.WXSystem.tool.token;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
//在yml中可以通过parameter 来赋值
@ConfigurationProperties(prefix = "parameter")
public class Parameter {
//    第三方用户唯一凭证
    private String APPID;

//    第三方用户唯一凭证密钥，即appsecret
    private String APP_SECRET;

}

```



编写application.xml  给Parameter 赋值

```xml
#配置获取token的参数
parameter.a-p-pID=wxd2151aa83d4b5530
parameter.a-p-p_-s-eCRET=cb4db20ac570a8fef5b3eb8eb7cb3b18
```





### 测试

```java
package com.example.WXSystem;

import com.example.WXSystem.service.ActivityService;
import com.example.WXSystem.tool.Result;
import com.example.WXSystem.tool.token.GetToken;
import com.example.WXSystem.tool.token.Parameter;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import javax.annotation.Resource;


@SpringBootTest
class VotingSystemApplicationTests {

    @Resource
    private GetToken getToken;
    @Resource
    private Parameter parameter;

    @Test
    public void Test() {
      Result token = getToken.getToken(parameter.getAPPID(), parameter.getAPP_SECRET());
       
        System.out.println(token);

    }


}

```







### token持久化



> 微信的token 只有2个小时的有效期



项目结构

![image-20230815174837401](.\imgs\image-20230815174837401.png)







```java
package com.example.WXSystem.tool.token;


import com.example.WXSystem.tool.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.nio.ByteBuffer;
import java.nio.channels.AsynchronousFileChannel;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.concurrent.Future;

/**
 * @author liuqh
 * @date 2019/8/6 下午1:47
 * @description
 */
@Component
public class AccessTokenTask {

    private Logger logger = LoggerFactory.getLogger(AccessTokenTask.class);

    @Resource
    private GetToken getToken;
    @Resource
    private Parameter parameter;

    /**
     * access_token 是小程序的全局唯一调用凭据
     * access_token 的有效期为 2 个小时，需要定时刷新 access_token，重复获取会导致之前一次获取的
     * access_token 失效
     * 延迟一秒执行
     * initialDelay = 1000  延长一秒后执行  之后按照 fixedDelay = 7000*1000 执行 117分钟执行一次
     */
    @Scheduled(initialDelay = 1000, fixedDelay = 7000*1000 )
    public Result getTouTiaoAccessToken(){
        String accessToken = null;
        try {
            Result resultToken = getToken.getToken(parameter.getAPPID(), parameter.getAPP_SECRET());
            System.out.println(resultToken);
            AccessToken data = (AccessToken) resultToken.getData();
            accessToken = data.getAccess_token();

            //将获取到的token放到内存

            logger.info("获取到的微信accessToken为"+accessToken);
        } catch (Exception e) {
            logger.error("获取微信adcessToken出错，信息如下" + e.getMessage());
            return Result.error().message("获取微信adcessToken出错，信息如下" + e.getMessage()).data(accessToken);

        }
//        保存token
        String filePath = "src\\main\\java\\com\\example\\WXSystem\\tool\\token\\token.txt";
        Path path = Paths.get(filePath);
        System.out.println(path);
        try {
            AsynchronousFileChannel fileChannel = AsynchronousFileChannel.open(path, StandardOpenOption.WRITE, StandardOpenOption.CREATE);
            ByteBuffer buffer = ByteBuffer.wrap(accessToken.getBytes(StandardCharsets.UTF_8));
            Future<Integer> writeResult = fileChannel.write(buffer, 0);
            while (!writeResult.isDone()) {
                // Do something else while waiting for the write operation to complete
            }
            logger.info("token的保存路径是" + path);
            buffer.clear();
            fileChannel.close();
        } catch (Exception e) {
            logger.error("token保存有问题" + e.getMessage());
            return Result.error().message("token保存有问题" + e.getMessage());

        }
        return Result.ok().message("token保存成功");

    }
}


```



开启定时器

```java
package com.example.WXSystem;

import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.logging.stdout.StdOutImpl;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan(basePackages = "com.example.WXSystem.dao")
//开启事物
@EnableTransactionManagement
//开启定时任务
@EnableScheduling
public class VotingSystemApplication {

    public static void main(String[] args) {
//        打印mybatis日志
        LogFactory.useCustomLogging(StdOutImpl.class);
        SpringApplication.run(VotingSystemApplication.class, args);
    }

}

```

