## springcloud

Spring Cloud的子项目，大致可分成两类，一类是对现有成熟框架”[Spring Boot](https://baike.baidu.com/item/Spring Boot/20249767?fromModule=lemma_inlink)化”的封装和抽象，也是数量最多的项目；第二类是开发了一部分分布式系统的基础设施的实现，如Spring Cloud Stream扮演的就是kafka, ActiveMQ这样的角色。对于我们想快速实践微服务的开发者来说，第一类子项目就已经足够使用，如：

- Spring Cloud Netflix　　是对Netflix开发的一套分布式服务框架的封装，包括服务的发现和注册，负载均衡、断路器、REST客户端、请求路由等。
- Spring Cloud Config　　将配置信息中央化保存, 配置Spring Cloud Bus可以实现动态修改配置文件
- Spring Cloud Stream　　分布式消息队列，是对Kafka, MQ的封装
- Spring Cloud Security　　对Spring Security的封装，并能配合Netflix使用
- Spring Cloud Zookeeper　　对Zookeeper的封装，使之能配置其它Spring Cloud的子项目使用
- Spring Cloud Eureka 是 Spring Cloud Netflix 微服务套件中的一部分，它基于Netflix Eureka 做了二次封装，主要负责完成微服务架构中的服务治理功能。

#### springcloud之eureka

> 创包的小tips

groupid和artifactId被统称为“坐标”是为了保证项目唯一性而提出的，如果你要把你项目弄到[maven](https://so.csdn.net/so/search?q=maven&spm=1001.2101.3001.7020)本地仓库去，你想要找到你的项目就必须根据这两个id去查找。
　　groupId一般分为多个段，这里我只说两段，第一段为域，第二段为公司名称。域又分为org、com、cn等等许多，其中org为非营利组织，com为商业组织。举个apache公司的tomcat项目例子：这个项目的groupId是org.apache，它的域是org（因为tomcat是非营利项目），公司名称是apache，artigactId是tomcat。
　　比如我创建一个项目，我一般会将groupId设置为cn.zr，cn表示域为中国，zr是我个人姓名缩写，artifactId设置为testProj，表示你这个项目的名称是testProj，依照这个设置，你的包结构最好是cn.zr.testProj打头的，如果有个StudentDao，它的全路径就是cn.zr.testProj.dao.StudentDao
　　Version 是项目的版本号，例：1.0-SNAPSHOT 。其中1.0是版本号，SNAPSHOT版本代表不稳定、尚处于开发中的版本。而衍生的有Release版本则代表稳定的版本



###### 创建项目



1.创建一个普通的maven项目删除掉里面的src文件



![image-20221125093308812](.\img\image-20221125093308812.png)



第二步骤创建一个非子项目的01-eureka

![image-20221125093029291](.\img\image-20221125093029291.png)



第三部通过spring Initializr 创建一个 spring boot项目 叫eureka-server

![image-20221125093434438](.\img\image-20221125093434438.png)



注意导入eureka的包

![image-20221125093537253](.\img\image-20221125093537253.png)



最后包的：项目结构

![image-20221125093734096](.\img\image-20221125093734096.png)

######  修改配置文件和pom

修改pom文件按照springcloud官网来配置springboot和springcloud的版本

https://start.spring.io/actuator/info

通过网上在线tool.ul工具来格式化json格式来看环境配置

![image-20221111151056085](.\img\image-20221111151056085.png)



修改eureka中的pom

父类pom依赖：<dependencyManagement>

maven 使用 dependencyManagement元素来提供一种管理账号的版本的方式

通常会在一个组织或者项目的最顶层的父pom中才能看见dependencyManagement

dependenceManagement里只是声明依赖，并不引入，因此子项目需要显示的声明需要用的依赖

如果子项目中指定了版本号，那么会使用子项目指定的jar版本

使用pom.xml中的dependencyManagement元素能让所有子类项目中引用一个依赖不需要写版本号 maven会沿着父子层次向上走，直到找到dependencyManagement元素的项目如何会使用这个元素中管理的版本。
如果子模块需要其他的版本就自己申请version

```xml
 <properties>
        <java.version>1.8</java.version>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
        <spring-boot.version>2.3.12.RELEASE</spring-boot.version>
        <spring-cloud.version>Hoxton.SR9</spring-cloud.version>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-eureka-server</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
            <exclusions>
                <exclusion>
                    <groupId>org.junit.vintage</groupId>
                    <artifactId>junit-vintage-engine</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
    </dependencies>
<!--依赖管理 管理版本号-->
    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>${spring-cloud.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-dependencies</artifactId>
                <version>${spring-boot.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>
```





启动类上开启eureka注册

```java
package com.example.eurekaserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer //开启eureka注册
public class EurekaServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(EurekaServerApplication.class, args);
    }

}

```



编写 eureka服务端的yml

```yml
spring:
  application:
    name: application-eureka-server
server:
  port: 8761
#  eviction 驱逐 赶出     interval 间隔     renewal 重新开始  续订        percent  百分比     threshold   门槛
eureka:
  server:
    eviction-interval-timer-in-ms: 10000 # 服务端每隔多少秒做定期删除的操作
    renewal-percent-threshold: 0.85 # 续约百分比  超过百分之85的应用没有跟你续约  那么eureka会保护你的服务   不会删除任何一个
  instance:
    instance-id: ${eureka.instance.hostname}:${spring.application.name}:${server.port}  # 动态获取实例配置  主机名称： 服务名称: 端口号
    hostname: localhost  # 设计主机名称
    prefer-ip-address: true  #以ip形式显示具体的服务信息
    lease-renewal-interval-in-seconds: 5   # 服务实例的续约时间间隔



```



创在01-eureka下创建一个02-eureka-client-a

![image-20221129152321947](.\img\image-20221129152321947.png)



> 依赖 eureka-client

```xml
 		<dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
        </dependency>
```

修改eureka-client-a的yml

```yml
server:
  port: 8080

spring:
  application:
    name: eureka-server-a

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka
    register-with-eureka: true  # 是否去eureka注册
    fetch-registry: true   #是否去拉去服务列表到本地
    registry-fetch-interval-seconds: 10  #为了缓解服务列表的脏读问题   时间越短脏读越少   性能消耗大
  instance:
    hostname: localhost   # 应用的主机名称  最好写主机ip
    instance-id: ${eureka.instance.hostname}:${spring.application.name}:${server.port}
    prefer-ip-address: true # 显示ip
    lease-renewal-interval-in-seconds: 10 #显示续约的时间


```



>  运行类加注解

```java

@SpringBootApplication
@EnableEurekaClient//开启客户端的功能
public class EurekaClientAApplication {

    public static void main(String[] args) {
        SpringApplication.run(EurekaClientAApplication.class, args);
    }

}

```



###### 如何开启2台相同的微服务

> 如果同一个微服务要开启2个就直接修改配置文件就好了
>
> 其余都不需要改动

![image-20221201163749206](.\img\image-20221201163749206.png)



###### eureka的配置分为三大类

1. server           服务
2. client             客户
3. instance        实例

> 编写eureka服务端的配置

```yml
spring:
  application:
    name: application-eureka-server
server:
  port: 8761
#  eviction 驱逐 赶出     interval 间隔     renewal 重新开始  续订        percent  百分比     threshold   门槛
eureka:
  server:
    eviction-interval-timer-in-ms: 10000 # 服务端每隔多少秒做定期删除的操作
    renewal-percent-threshold: 0.85 # 续约百分比  超过百分之85的应用没有跟你续约  那么eureka会保护你的服务   不会删除任何一个
  instance:
    instance-id: ${eureka.instance.hostname}:${spring.application.name}:${server.port}  # 动态获取实例配置  主机名称： 服务名称: 端口号
    hostname: localhost  # 设计主机名称
    prefer-ip-address: true  #以ip形式显示具体的服务信息
    lease-renewal-interval-in-seconds: 5   # 服务实例的续约时间间隔
```

> 编写eureka客户端的配置



```yml
server:
  port: 8080

spring:
  application:
    name: eureka-server-a

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka
    register-with-eureka: true  # 是否去eureka注册
    fetch-registry: true   #是否去拉去服务列表到本地
    registry-fetch-interval-seconds: 10  #为了缓解服务列表的脏读问题   时间越短脏读越少   性能消耗大
  instance:
    hostname: localhost   # 应用的主机名称  最好写主机ip
    instance-id: ${eureka.instance.hostname}:${spring.application.name}:${server.port}
    prefer-ip-address: true # 显示ip
    lease-renewal-interval-in-seconds: 10 #显示续约的时间

```

