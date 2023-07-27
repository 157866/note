# spring Boot

https://spring.io/

spring boot用于开发

spring cloud（云）用于管理微服务



特征

- 创建独立的弹簧应用
- 直接嵌入 Tomcat、Jetty 或底图（无需部署 WAR 文件）
- 提供有意见的"启动器"依赖关系，以简化生成配置
- 尽可能自动配置弹簧和第三方库
- 提供生产就绪功能，如指标、运行状况检查和外部配置
- 绝对没有代码生成，也没有 XML 配置要求



> spring的理念是什么

spring是为了解决企业级应用开发的复杂性而创建的，简化开发！



什么是部署

```undefined
1. 将源代码生成可运行的软件包，例如 jar 包或 war 包等；
2. 将可运行的软件包放到目标环境上；
3. 配置目标环境使得软件包能够运行起来；
```



在ssm项目中所有的依赖都是自己来管理的，在spring boot中这些依赖都是成套的不需要自己来管理

```xml
<!--    starter-prent里面包含boot所有的starter（启动器）-->
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.4.1</version>
    </parent>
```





可以自己去写starter

命名要求：

官方的：spring-boot-starter-name

第三方：name-spring-boot-starter





## spring boot默认扫描规则

建议把主启动类放在需要扫描包的上层







## 注解

@SpringBootApplication：放在主启动类上面



## Spring Boot   Hello Word

导包

```xml
 <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.1.3.RELEASE</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>com.example</groupId>
    <artifactId>test</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>test</name>
    <description>Demo project for Spring Boot</description>
    <properties>
        <java.version>1.8</java.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <scope>runtime</scope>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
        </dependency>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter</artifactId>
            <version>RELEASE</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
```

2.controller

```java
package com.example.test.pojo.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j/*日志*/
@RestController/*@ResponseBody和@Controller的合并*/
@RequestMapping("/user")/*网页总地址*/
public class UserController {
    /*get请求就用@GetMapping  post请求就使用@PostMapping*/
    @GetMapping("/insert")
    public String hello(){
        return "hello";
    }
}

```



run

```java
@SpringBootApplication
public class TestApplication {

    public static void main(String[] args) {
        SpringApplication.run(TestApplication.class, args);
    }

}

```



## hello的探究



#### pom文件



```xml
 <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.1.3.RELEASE</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>

它的父项目是
<parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-dependencies</artifactId>
        <version>2.1.3.RELEASE</version>
        <relativePath>../../spring-boot-dependencies</relativePath>
    </parent>
它来真正的管理spring boot应用里面的依赖版本
```



spring boot版本的仲裁中心；

以后我们导入版本是不需要写版本号的（没有在dependencies中管理的自然要写版本号）



#### 导入依赖（导入启动器）

```
        <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
```

**spring-boot-starter**-web

  spring-boot-starter：springboot场景启动器；帮我们导入了web模块正常运行所依赖的组件；



spring  boot 将所有的功能场景都抽取出来，做成一个一个的starter（启动器），只需要在这些项目引用这些starter相关场景的所有依赖都会导入进来，要用什么功能就导入什么场景的启动器





#### 主程序，主入口类

```java
package com.example.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TestApplication {

    public static void main(String[] args) {
        SpringApplication.run(TestApplication.class, args);
    }

}

```



@SpringBootApplication翻译过来是springboot应用 标注在那个类上表示那个类springboot主配置类

spring boot就应该运行这个main方法来运行spring boot程序





```java
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
@SpringBootConfiguration
@EnableAutoConfiguration
@ComponentScan(
    excludeFilters = {@Filter(
    type = FilterType.CUSTOM,
    classes = {TypeExcludeFilter.class}
), @Filter(
    type = FilterType.CUSTOM,
    classes = {AutoConfigurationExcludeFilter.class}
)}
```

**@SpringBootConfiguration **       spring boot的配置类

​         标注在某个类上，表示这是一个springboot的配置类

​                      **@Configuration**配置类上来标注这个注解

​                                  配置类--------配置文件

​                                          配置类也是容器中的一个组件@Component



**@EnableAutoConfiguration**    开启自动配置功能

​             以前我们需要配置的东西，spring boot帮我们自动配置；**@EnableAutoConfiguration** 告诉spring boot开启自动配置功能；这样自动配置才能生效；



​            **@AutoConfigurationPackage** :自动配置包
​            @lmport(AutoConfigurationPackages.Registrar.class) :
Spring的底层注解@lmport ,给容器中导入一个组件 ;导入的组件由AutoConfigurationPackages.Registrar.class ;

将主配置类( @SpringBootApplication标注的类)的所在包及下面所有子包里面的所有组件扫描到Spring容器;



**EnableAutoConfigurationlmportSelector** :导入哪些组件的选择器;
将所有需要导，入的组件以全类名的方式返回;这些组件就会被添加到容器中;
会给容器中导入非常多的自动配置类( xxxAutoConfiguration) ; 就是给容器中导入这个场景需要的所
有组件,并配置好这些组件;



有了自动配置类,免去了我们手动编写配置注入功能组件等的工作;
SpringFactoriesL oader.loadFactoryNames(EnableAutoConfiguration.lass,classLoader);
Spring Boot在启动的时候从类路径下的META-INF/spring.factories中获取EnableAutoConfiguration指定的值，
将这些值作为自动配置类导入到容器中，

自动配置类就生效,帮我们进行自动配置工作;以前我们需要自己配置的
东西，自动配置类都帮我们配置;



J2EE的整体整合解决方案和自动配置都在spring-boot- autoconfigure-1.5.9.RELEASE.jar 





## 使用Spring Initializer快速创建Spring Boot项目

IDEA都支持使用Spring的项目创建向导快速创建一个Spring Boot项目; 
选择我们需要的模块;向导会联网创建Spring Boot项目;

默认生成的Spring Boot项目;

- 主程序已经生成好了,我们只需要我们自己的逻辑

- resources文件夹中目录结构

- static :保存所有的静态资源; js CSS images ;

- templates :保存所有的模板页面; ( Spring Boot默认jar包使用嵌入式的Tomcat ,默认不支持]SP页
  面) ;可以使用模板引擎( freemarker, thymeleaf ) ;
- application.properties : Spring Boot应用的配置文件;





# spring boot配置

#### 配置文件

spring boot使用全局的配置文件，配置文件名是固定的；

- application.properties
- application.yml



配置文件的作用：

修改spring boot自动配置的默认值；



YAML ( YAML Ain't Markup Language )
     YAML A Markup Language :是一个标记语言
     YAML isn't Markup Language :不是一个标记语言;

标记语言:
      以前的配置文件;大多都使用的是**xxxx.xml**文件;
      YAML **:以数据为中心**,比json、xml等更适合做配置文件;

YAML :

```yaml
server:
  port: 81
```

xml:

```xml
<server>
   <port>81</port>
</server>
```



#### YAML语法：

k: v    表示一对键值段（必要要有空格）

以空格来分层级关系，只要左对齐的一列数据都是同一个层级(下面示例)。

```yaml
server:
    port: 80
    poth: /hello
```

属性和值也是大小写敏感：



#### 值的写法

###### 字面量：普通值（数字，字符串，布尔）

字符串默认不用加上单引号或者双引号;
     "":双引号;不会转义字符串里面的特殊字符;特殊字符会作为本身想表示的意思
                       name: "zhangsan \n lisi" :输出; zhangsan换行lisi

​    ":单引号;会转义特殊字符,特殊字符最终只是一 个普通的字符串数据
​                       name: 'zhangsan \n lis' :输出; zhangsan \n lisi





###### 对象和Map（属性和值）映射过来就是键值段

k: v在下一-行来写对象的属性和值的关系;注意缩进
对象还是k: v的方式

```yaml
friends:
   lastName: zhangsan
   age: 20
```



行内写法：

```yaml
friends: {  lastName: zhangsan,age: 20} 
```



###### 数组（List, set);

用- 一个表示数组值

```yaml
Animals
   - dog
   - cat
```

行内写法：

```yaml
Animals: [dog,cat]
```



###### ConfigurationProperties注解



在application.yml实际操作：

导入文件处理器：配置文件处理就有提示了

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-configuration-processor</artifactId>
    <optional>true</optional>
</dependency>
```



@Component   ->这个主键是容器组件，才能提供@ConfigurationProperties功能

@Data这个是一个引擎注解，自动生成set  get方法和toString方法

@ConfigurationProperties(prefix = "person")   告诉spring  boot从配置文件哪里映射prefix从哪里开始

```java
@Component
@Data
@ConfigurationProperties(prefix = "person")
public class Person {
    private String username;
    private Map<String,Object>map;
    private List<Object>list;
    private Date time;
    private Object[] array;
    private Dog dog;
}
```

yaml：

```yaml
person:
  username: 王孟涛
  map: {k1: v1,k2: v2}
  list: 集合
  time: 2020/2/9
  array:
    - 数组1
    - 数组2
    - 数组3
  dog:
    username: 小杨
    age: 19
```







如果在application.properties中：

注意idea默认是以utf-8来编译的

如果乱码就设置

settings

File  Encodings

设置成uft-8

![1612839089063](.\img\1612839089063.png)

```properties
person.username=小王
person.time=2020/07/12
person.array=array1
person.map.ke1=v1
person.map.ke2=v2
person.dog.username=小杨
person.dog.age=20
person.list=l1,l2,l3
```





@value和ConfigurationProperties注解的区别

```java
 @Value("${username}")
    private String username;
  @Value("#{12+12}")
    private int age;
```



| 功能                       | @ConfigurationProperties | @value     |
| -------------------------- | ------------------------ | ---------- |
| 特点                       | 批量注入配置文件的属性   | 一个个指定 |
| 松散绑定 （松散语法）      | 支持                     | 不支持     |
| spEL(#{12+12})             | 不支持                   | 支持       |
| JSR303数据校验(@Validated) | 支持                     | 不支持     |
| 复杂类型的封装（map等）    | 支持                     | 不支持     |



配置文件yml还是properties他们都能获取到值;
      如果说,我们只是在某个业务逻辑中需要获取一下配置文件中的某项值,使用@Value ;
      如果说,我们专门编写了- -个javaBean来和配置文件进行映射;



###### 配置文件注入值数据校验

```java
@Component
@Data
@Validated
@ConfigurationProperties(prefix = "person")
public class Person {
    @Email//取校验是不是收到的是邮箱信息
    private String username;
    private Map<String,Object>map;
    private List<Object>list;
    private Date time;
    private Object[] array;
    private Dog dog;
}
```





###### @PropertySource与@ImportResource

Property（性能）Source（来源）

@PropertySource(value = {"classpath:person.propeties"})加载指定配置文件

```java
@PropertySource(value = {"classpath:person.propeties"})
@Component
@Data
@ConfigurationProperties(prefix = "person")
public class Person {

    private String username;
    private Map<String,Object>map;
    private List<Object>list;
    private Date time;
    private Object[] array;
    private Dog dog;
}
```



person.propertes的配置文件

```propertes
person.username=小王
person.time=2020/07/12
person.array=array1
person.map.ke1=v1
person.map.ke2=v2
person.dog.username=小杨
person.dog.age=20
person.list=l1,l2,l3
```



@ImportResource

@ImportResource :导入Spring的配置文件,让配置文件里面的内容生效;
Spring Boot里面没有Spring的配置文件,我们自己编写的配置文件,也不能自动识别; .
想让Spring的配置文件生效,加载进来; @ImportResource标注在一个配置类 上

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
           http://www.springframework.org/schema/beans/spring-beans.xsd">
    <bean id="helloService" class="com.wang.springbootyaml.service.HelloService">

    </bean>
</beans>
```

主运行类上面

```java
@ImportResource(locations = {"classpath:beans.xml"})
//导入spring的配置文件让他生效
```





spring  boot 推荐给容器加组件的方式：

1.配置类==spring配置文件

```java
/*
* @Configuration  指名当前类是一个配置类：就是用来替代之前的spring配置文件
* */
@Configuration
public class MyConfig {
    /*方法的返回值添加到对象中；容器中这组件默认id就是方法名*/
    @Bean
    public HelloService helloService(){
        System.out.println("配置类启动");
        return new HelloService();
    }
```

## 配置文件占位符

 UUID（Universally Unique Identifier）全局唯一标识符，定义为一个字符串主键，采用32位数字组成，编码采用16进制，定义了在时间和空间都完全惟一的系统信息。

 

```properties
 #生成一个随机整数
 person.username=王${random.int}
 person.time=2020/07/12
 person.array=array1${random.uuid}
 person.map.ke1=v1
 person.map.ke2=v2
 person.dog.username=${person.username}小杨
#如果没有配置person.abc:12   ：后面就是给的默认值  只会拼接不会相加   如果没有给默认值会报错
 person.dog.age=20 ${person.abc:12}
 person.list=l1,l2,l3
```





## profile

**多profile文件**

我们在主配置文件编写的时候，文件名可以是 application-{profile}.porperties/yml

application.properties    默认情况使用这个配置文件

application-dev.properties

application-prod.properties



###### yml的配置方法

```yaml
#默认是第一个的配置
#---这个是分割开每一个部分是独立的配置
#spring: profiles: dev  给这个配置取名字
server:
  port: 8080
spring:
  profiles:
    active: pord
---
server:
  port: 8081

spring:
  profiles: dev
---
server:
  port: 8082
spring:
  profiles: pord
```



###### 激活profile

1. 在配置文件中指定：

```properties
spring.profiles.active=prod
```

2. 命令行：

​      --spring.profiles.active=prod

这个的优先级大于spring.profiles.active=prod

![1613093036559](.\img\1613093036559.png)



>  cmd配置命令符

先打包打成packge

打包默认使用第一个配置文件

![1613093463294](.\img\1613093463294.png)



> 虚拟机参数；

  -Dspring.profiles.active=prod

![1613093829099](.\img\1613093829099.png)







## 配置文件加载位置

springboot启动会扫描以下位置的application.properties或者application.yml文件作为Spring boot的默认配置
文件
file../config/
-file:./ .
-classpath:/config/
-classpath:/

**优先级由高到低，改优先级的配置会覆盖低优先级**

**越在外面的配置，优先级越大，包括的东西也越多**

spring boot会从这四个位置全部加载主配置文件，会出现一种状况**互补配置**



## 外部配置文件加载顺序

SpringBoot也可以从以下位置加载配置;优先级从高到低;高优先级的配置覆盖低优先级的配置,所有的配置会
形成**互补配置**



**1.命令行参数**

java -jar spring boot-02-config-02-0.0.1-SNAPSHOT.jar -server.port=8087 --server .context path=/abc

**多个参数使用空格分开；--配置项=值**

2.来自java:comp/env的JNDI属性
3.Java系统属性( System.getProperties() )
4.操作系统环境变量
5.RandomValuePropertySource配置的random.*属性值



由jar报外向jar包内寻找：

**优先加载带profile的：**

**6.jar包外部的application-profile}.properties或application.ym(带spring.profile)配置文件**
**7.jar包内部的application-{profile}.properties或application.yml(带spring.profile)配置文件**

**在来加载不带profile的：**

**8.jar包外部的application.properties或application.ym(不带spring.profile)配置文件**
**9.jar包内部的application.properties或application.yml(不带spring.profile)配置文件**
10.@Configuration注解类.上的@PropertySource
11.通过SpringApplication.setDefaultProperties指定的默认属性

[参考官方文档](https://docs.spring.io/spring-boot/docs/1.5.9.RELEASE/reference/htmlsingle/#boot-features-external-config)





## 自动装配的原理

配置文件到底写什么，怎么写，自动装配原理

[配置文件能配置的属性参照](https://docs.spring.io/spring-boot/docs/1.5.9.RELEASE/reference/htmlsingle/#common-application-properties)



**自动配置原理：**

1. spring boot 启动时，加载主配置类，开启自动配置功能 ==**@EnableAutoConfiguration**==
2. @EnableAutoConfiguration作用：

- ​          利用 AutoConfigurationImportSelector给容器导入一些组件，
- ​          可以插件selectImports（）方法的内容；
- ​          List<String> configurations = this.getCandidateConfigurations(annotationMetadata, attributes);获取候选的配置

​         SpringFactoriesLoader.loadFactoryNames(） 它是

​         扫描类路径下jar包类路径下的      **META-INF/spring.factories**

​         把扫描到的这些文件的内容包装成properties对象

​         从properties中获取到EnableAutoConfiguration.class类(类名)对应的值，然后把他们添加在容器中



将类路径下的**META-INF/spring.factories**里面使有的配置**EnableAutoConfiguration**的值加入到容器中，

```properties
# Auto Configure
org.springframework.boot.autoconfigure.EnableAutoConfiguration=\
org.springframework.boot.autoconfigure.admin.SpringApplicationAdminJmxAutoConfiguration,\
org.springframework.boot.autoconfigure.aop.AopAutoConfiguration,\
org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration,\
org.springframework.boot.autoconfigure.batch.BatchAutoConfiguration,\
org.springframework.boot.autoconfigure.cache.CacheAutoConfiguration,\
org.springframework.boot.autoconfigure.cassandra.CassandraAutoConfiguration,\
org.springframework.boot.autoconfigure.context.ConfigurationPropertiesAutoConfiguration,\
org.springframework.boot.autoconfigure.context.LifecycleAutoConfiguration,\
org.springframework.boot.autoconfigure.context.MessageSourceAutoConfiguration,\
org.springframework.boot.autoconfigure.context.PropertyPlaceholderAutoConfiguration,\
org.springframework.boot.autoconfigure.couchbase.CouchbaseAutoConfiguration,\
org.springframework.boot.autoconfigure.dao.PersistenceExceptionTranslationAutoConfiguration,\
org.springframework.boot.autoconfigure.data.cassandra.CassandraDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.cassandra.CassandraReactiveDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.cassandra.CassandraReactiveRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.cassandra.CassandraRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.couchbase.CouchbaseDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.couchbase.CouchbaseReactiveDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.couchbase.CouchbaseReactiveRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.couchbase.CouchbaseRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.elasticsearch.ElasticsearchDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.elasticsearch.ElasticsearchRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.elasticsearch.ReactiveElasticsearchRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.elasticsearch.ReactiveElasticsearchRestClientAutoConfiguration,\
org.springframework.boot.autoconfigure.data.jdbc.JdbcRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.jpa.JpaRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.ldap.LdapRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.mongo.MongoReactiveDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.mongo.MongoReactiveRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.mongo.MongoRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.neo4j.Neo4jDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.neo4j.Neo4jReactiveDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.neo4j.Neo4jReactiveRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.neo4j.Neo4jRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.solr.SolrRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.r2dbc.R2dbcDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.r2dbc.R2dbcRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration,\
org.springframework.boot.autoconfigure.data.redis.RedisReactiveAutoConfiguration,\
org.springframework.boot.autoconfigure.data.redis.RedisRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.rest.RepositoryRestMvcAutoConfiguration,\
org.springframework.boot.autoconfigure.data.web.SpringDataWebAutoConfiguration,\
org.springframework.boot.autoconfigure.elasticsearch.ElasticsearchRestClientAutoConfiguration,\
org.springframework.boot.autoconfigure.flyway.FlywayAutoConfiguration,\
org.springframework.boot.autoconfigure.freemarker.FreeMarkerAutoConfiguration,\
org.springframework.boot.autoconfigure.groovy.template.GroovyTemplateAutoConfiguration,\
org.springframework.boot.autoconfigure.gson.GsonAutoConfiguration,\
org.springframework.boot.autoconfigure.h2.H2ConsoleAutoConfiguration,\
org.springframework.boot.autoconfigure.hateoas.HypermediaAutoConfiguration,\
org.springframework.boot.autoconfigure.hazelcast.HazelcastAutoConfiguration,\
org.springframework.boot.autoconfigure.hazelcast.HazelcastJpaDependencyAutoConfiguration,\
org.springframework.boot.autoconfigure.http.HttpMessageConvertersAutoConfiguration,\
org.springframework.boot.autoconfigure.http.codec.CodecsAutoConfiguration,\
org.springframework.boot.autoconfigure.influx.InfluxDbAutoConfiguration,\
org.springframework.boot.autoconfigure.info.ProjectInfoAutoConfiguration,\
org.springframework.boot.autoconfigure.integration.IntegrationAutoConfiguration,\
org.springframework.boot.autoconfigure.jackson.JacksonAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.JdbcTemplateAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.JndiDataSourceAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.XADataSourceAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration,\
org.springframework.boot.autoconfigure.jms.JmsAutoConfiguration,\
org.springframework.boot.autoconfigure.jmx.JmxAutoConfiguration,\
org.springframework.boot.autoconfigure.jms.JndiConnectionFactoryAutoConfiguration,\
org.springframework.boot.autoconfigure.jms.activemq.ActiveMQAutoConfiguration,\
org.springframework.boot.autoconfigure.jms.artemis.ArtemisAutoConfiguration,\
org.springframework.boot.autoconfigure.jersey.JerseyAutoConfiguration,\
org.springframework.boot.autoconfigure.jooq.JooqAutoConfiguration,\
org.springframework.boot.autoconfigure.jsonb.JsonbAutoConfiguration,\
org.springframework.boot.autoconfigure.kafka.KafkaAutoConfiguration,\
org.springframework.boot.autoconfigure.availability.ApplicationAvailabilityAutoConfiguration,\
org.springframework.boot.autoconfigure.ldap.embedded.EmbeddedLdapAutoConfiguration,\
org.springframework.boot.autoconfigure.ldap.LdapAutoConfiguration,\
org.springframework.boot.autoconfigure.liquibase.LiquibaseAutoConfiguration,\
org.springframework.boot.autoconfigure.mail.MailSenderAutoConfiguration,\
org.springframework.boot.autoconfigure.mail.MailSenderValidatorAutoConfiguration,\
org.springframework.boot.autoconfigure.mongo.embedded.EmbeddedMongoAutoConfiguration,\
org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration,\
org.springframework.boot.autoconfigure.mongo.MongoReactiveAutoConfiguration,\
org.springframework.boot.autoconfigure.mustache.MustacheAutoConfiguration,\
org.springframework.boot.autoconfigure.neo4j.Neo4jAutoConfiguration,\
org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration,\
org.springframework.boot.autoconfigure.quartz.QuartzAutoConfiguration,\
org.springframework.boot.autoconfigure.r2dbc.R2dbcAutoConfiguration,\
org.springframework.boot.autoconfigure.r2dbc.R2dbcTransactionManagerAutoConfiguration,\
org.springframework.boot.autoconfigure.rsocket.RSocketMessagingAutoConfiguration,\
org.springframework.boot.autoconfigure.rsocket.RSocketRequesterAutoConfiguration,\
org.springframework.boot.autoconfigure.rsocket.RSocketServerAutoConfiguration,\
org.springframework.boot.autoconfigure.rsocket.RSocketStrategiesAutoConfiguration,\
org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration,\
org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration,\
org.springframework.boot.autoconfigure.security.servlet.SecurityFilterAutoConfiguration,\
org.springframework.boot.autoconfigure.security.reactive.ReactiveSecurityAutoConfiguration,\
org.springframework.boot.autoconfigure.security.reactive.ReactiveUserDetailsServiceAutoConfiguration,\
org.springframework.boot.autoconfigure.security.rsocket.RSocketSecurityAutoConfiguration,\
org.springframework.boot.autoconfigure.security.saml2.Saml2RelyingPartyAutoConfiguration,\
org.springframework.boot.autoconfigure.sendgrid.SendGridAutoConfiguration,\
org.springframework.boot.autoconfigure.session.SessionAutoConfiguration,\
org.springframework.boot.autoconfigure.security.oauth2.client.servlet.OAuth2ClientAutoConfiguration,\
org.springframework.boot.autoconfigure.security.oauth2.client.reactive.ReactiveOAuth2ClientAutoConfiguration,\
org.springframework.boot.autoconfigure.security.oauth2.resource.servlet.OAuth2ResourceServerAutoConfiguration,\
org.springframework.boot.autoconfigure.security.oauth2.resource.reactive.ReactiveOAuth2ResourceServerAutoConfiguration,\
org.springframework.boot.autoconfigure.solr.SolrAutoConfiguration,\
org.springframework.boot.autoconfigure.task.TaskExecutionAutoConfiguration,\
org.springframework.boot.autoconfigure.task.TaskSchedulingAutoConfiguration,\
org.springframework.boot.autoconfigure.thymeleaf.ThymeleafAutoConfiguration,\
org.springframework.boot.autoconfigure.transaction.TransactionAutoConfiguration,\
org.springframework.boot.autoconfigure.transaction.jta.JtaAutoConfiguration,\
org.springframework.boot.autoconfigure.validation.ValidationAutoConfiguration,\
org.springframework.boot.autoconfigure.web.client.RestTemplateAutoConfiguration,\
org.springframework.boot.autoconfigure.web.embedded.EmbeddedWebServerFactoryCustomizerAutoConfiguration,\
org.springframework.boot.autoconfigure.web.reactive.HttpHandlerAutoConfiguration,\
org.springframework.boot.autoconfigure.web.reactive.ReactiveWebServerFactoryAutoConfiguration,\
org.springframework.boot.autoconfigure.web.reactive.WebFluxAutoConfiguration,\
org.springframework.boot.autoconfigure.web.reactive.error.ErrorWebFluxAutoConfiguration,\
org.springframework.boot.autoconfigure.web.reactive.function.client.ClientHttpConnectorAutoConfiguration,\
org.springframework.boot.autoconfigure.web.reactive.function.client.WebClientAutoConfiguration,\
org.springframework.boot.autoconfigure.web.servlet.DispatcherServletAutoConfiguration,\
org.springframework.boot.autoconfigure.web.servlet.ServletWebServerFactoryAutoConfiguration,\
org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration,\
org.springframework.boot.autoconfigure.web.servlet.HttpEncodingAutoConfiguration,\
org.springframework.boot.autoconfigure.web.servlet.MultipartAutoConfiguration,\
org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration,\
org.springframework.boot.autoconfigure.websocket.reactive.WebSocketReactiveAutoConfiguration,\
org.springframework.boot.autoconfigure.websocket.servlet.WebSocketServletAutoConfiguration,\
org.springframework.boot.autoconfigure.websocket.servlet.WebSocketMessagingAutoConfiguration,\
org.springframework.boot.autoconfigure.webservices.WebServicesAutoConfiguration,\
org.springframework.boot.autoconfigure.webservices.client.WebServiceTemplateAutoConfiguration

```

每一个这样的xxxAutoConfiguration类都是容器中的- 一个组件,都加入到容器中;用他们来做自动配置;



每一个自动配置类进行自动配置功能；

>  以**HttpEncodingAutoConfiguration(http编码自动配置)**为例解释自动配置原理；

```java
@Configuration //表示这是一 一个配置类，以前编写的配置文件一样,也可以给容器中添加组件
@EnableConfigurationProperties (HttpEncodingProperties.class) //启动指定类的ConfigurationProperties功能;将配置文件中对应的值和HttpEncodingProperties绑定起来;并把HttpEncodingProperties加入到ioc容器中

@ConditionalOnWebApplication //Spring底层@Conditional注解( Spring注解版)， 根据不同的条件,如果满足指定的条件，整个配置类里面的配置就会生效;判断当前应 用是否是web应用,如果是，当前配置类生效

@ConditionalOnClass (CharacterEncodingFilter.class) //判断当前项目有没有这个类CharacterEncodingFilter ; SpringMVC中进行乱码解决的过滤器; 

@ConditionalOnProperty(prefix = "spring. http. encoding", value = "enabled"，matchIfMissing =true) //判断配置文件中是否存在某个配置 spring . http. encoding . enabled ;如果不存在，判断也是成立的
//即使我们配置文件中不配置pring . http. encoding. enabled=true，也是默认生效的; 
public class HttpEncodingAutoConfiguration {
    
    //他已经和SpringBoot的配置文件映射了
private final HttpEncodingProperties properties;
//只有一一个有参构造器的情况下，参数的值就会从容器中拿
public HttpEncodingAutoConfiguration(HttpEncodingProperties properties) {
this.properties = properties;
}
@Bean
//给容器中添加一一个组件，这个组件的某些值需要从properties中获取
@ConditionalOnMissingBean(CharacterEncodingFilter.class)
public CharacterEncodingFilter characterEncodingFilter() {
CharacterEncodingFilter filter = new OrderedCharacterEncodingFilter();
filter. setEncoding(this . properties. getCharset().name());
filter . setForceRequestEncoding(this . properties . shouldForce(Type . REQUEST));
filter . setForceResponseEncoding(this . properties. shouldForce(Type . RESPONSE));
return filter;
}

```

根据当前不同的条件判断，决定这个配置是否生效？

一但这个配置类生效 ;这个配置类就会给容器中添加各种组件;这些组件的属性是从对应的properties类中获取
的,这些类里面的每一个属性又 是和配置文件绑定的;





所有在配置文件中能配置的属性都是在xxxxProperties类中封装者’;配置文件能配置什么就可以参照某个功
能对应的这个属性类

```java
@ConfigurationProperties(prefix = "spring. http. encoding") //从配置文件中获取指定的值和bean的属性
进行绑定
public class HttpEncodingProperties {
public static final Charset DEFAULT CHARSET = Charset. forName("UTF-8");

```





 精髓：

**1)、SpringBoot启动会加载大量的自动配置类**

**2)、我们看我们需要的功能有没有SpringBoot默认写好的自动配置类;**

**3)、我们再来看这个自动配置类中到底配置了哪些组件; (只要我们要用的组件有,我们就不需要再来配置了)**

**4)、给容器中自动配置类添加组件的时候,会从properties类中获取某些属性。我们就可以在配置文件中指定这些属性的值;**



xxxxAutoConfigurartion :自动配置类;

给容器中添加组件

xxxxProperties:封装配置文件中相关属性;



## 细节

###### 1、@Conditional派生注解 ( Spring注解版原生的@Conditional作用)



作用:必须是@Conditional指定的条件成立,才给容器中添加组件,配置配里面的所有内容才生效;



| 条件注解                      | 对应的Condition 处理类    | 处理逻辑                                                     |
| ----------------------------- | ------------------------- | ------------------------------------------------------------ |
| @ConditionalOnBean            | OnBeanCondition           | Spring容器中是否存在对应的实例。可以通过实例的类型、类名、注解、昵称去容器中查找(可以配置从当前容器中查找或者父容器中查找或者两者一起查找) |
| @ConditionalOnClass           | OnClassCondition          | 类加载器中是否存在对应的类。可以通过Class指定(value属性)或者Class的全名指定(name属性)如果是多个类或者多个类名的话，关系是”与”关系，也就是说这些类或者类名都必须同时在类加载器中存在 |
| @ConditionalOnExpression      | OnExpressionCondition     | 判断SpEL 表达式是否成立                                      |
| @ConditionalOnMissingBean     | OnBeanCondition           | Spring容器中是否缺少对应的实例。可以通过实例的类型、类名、注解、昵称去容器中查找(可以配置从当前容器中查找或者父容器中查找或者两者一起查找) |
| @ConditionalOnMissingClass    | OnClassCondition          | 跟ConditionalOnClass的处理逻辑一样，只是条件相反，在类加载器中不存在对应的类 |
| @ConditionalOnProperty        | OnPropertyCondition       | 应用环境中的屬性是否存在。提供prefix、name、havingValue以及matchIfMissing属性。prefix表示属性名的前缀，name是属性名，havingValue是具体的属性值，matchIfMissing是个boolean值，如果属性不存在，这个matchIfMissing为true的话，会继续验证下去，否则属性不存在的话直接就相当于匹配不成功 |
| @ConditionalOnResource        | OnResourceCondition       | 是否存在指定的资源文件。只有一个属性resources，是个String数组。会从类加载器中去查询对应的资源文件是否存在 |
| @ConditionalOnSingleCandidate | OnBeanCondition           | Spring容器中是否存在且只存在一个对应的实例。只有3个属性value、type、search。跟ConditionalOnBean中的这3种属性值意义一样 |
| @ConditionalOnWebApplication  | OnWebApplicationCondition | 应用程序是否是Web程序，没有提供属性，只是一个标识。会从判断Web程序特有的类是否存在，环境是否是Servlet环境，容器是否是Web容器等 |



**自动配置必须要在一定环境下才会生效**

​         我怎么才能知道那些自动配置类生效

​                 在配置中启用debug=true属性；来让控制台来打印自动配置报告，

```java
CONDITIONS EVALUATION REPORT
============================


Positive matches:（匹配成功）
-----------------

   AopAutoConfiguration matched:
      - @ConditionalOnProperty (spring.aop.auto=true) matched (OnPropertyCondition)

   AopAutoConfiguration.ClassProxyingConfiguration matched:
      - @ConditionalOnMissingClass did not find unwanted class 'org.aspectj.weaver.Advice' (OnClassCondition)
      - @ConditionalOnProperty (spring.aop.proxy-target-class=true) matched (OnPropertyCondition)
          
          
                                        
Negative matches:(没有匹配成功)
-----------------

   ActiveMQAutoConfiguration:
      Did not match:
         - @ConditionalOnClass did not find required class 'javax.jms.ConnectionFactory' (OnClassCondition)

   AopAutoConfiguration.AspectJAutoProxyingConfiguration:
      Did not match:
         - @ConditionalOnClass did not find required class 'org.aspectj.weaver.Advice' (OnClassCondition)


```









# 日志

**市面上的日志框架;**

JUL、JCL、Jboss-logging. logback. log4j、 log4j2、 s4...



| 日志门面(日志的抽象层）                                      | 日志实现                                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| JCL ( Jakarta Commons Logging)    SLF4j ( Simple LoggingFacade for Java )        jboss-logging | Log4j      JUL ( java.util.logging )       Log4j2 **Logback** |





左边选一个门面(抽象层)、右边来选一个实现;

日志门面: SLF4J ;

日志实现: Logback ;





SpringBoot :底层是Spring框架, Spring框架默认是用JCL ;

**SpringBoot选用SLF4j和logback ;**





## SLF4j使用

#### 1. 如何在系统中使用SLF4j

以后开发的时候，日志记录方法的调用，不应该来直接调用日志对方的实现类，而是调用日志抽象层里面的方法；给系统里面导入slf4j和jar和 logback的实现jar

```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HelloWorld {
  public static void main(String[] args) {
    Logger logger = LoggerFactory.getLogger(HelloWorld.class);
    logger.info("Hello World");
  }
}
```





图示：导包需要

![concrete-bindings.png (1152×636)](.\img\concrete-bindings.png)



每一个日志的实现框架都有自己的配置文件。使用slf4j以后 **,配置文件还是做成日志实现框架的配置文件**;



#### 2.遗留问题

如何统一使用SLF4J

![legacy.png (1587×1123)](.\img\legacy.png)



**如何让系统中所有的日志都统一到sIf4j ;**

1、将系统中其他日志框架先排除出去;

2、用中间包来替换原有的日志框架;

3、我们导入slf4j其他的实现



#### spring boot 日志关系

```xml
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
```



spring  boot 使用它来做日志功能

```xml
  <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-logging</artifactId>
      <version>2.4.2</version>
      <scope>compile</scope>
    </dependency>
```



底层依赖关系：

![

](.\img\image-20210222103236118.png)

总结:

1 )、SpringBoot底层也是使用slf4j+logback的方式进行日志记录

2)、SpringBoot也把其他的日志都替换成了slf4j ; 

3)、中间替换包?

![image-20210222105113976](.\img\image-20210222105113976.png)



如果我们要引入其他框架?-定要把这个框架的默认日志依赖移除掉?
Spring框架用的是commons-logging ; 





```java
                <dependency>
                     <groupId>org. springfr amework</ groupId>
                     <artifactId> spring-core</artifactId>
                     <exclusions>
                          <exclusion>
                               <groupId> commons-logging</groupId>
                               < artifactId> commons- logging</artifactId>
                          </exclusion>
                      </exclusions>
                </dependency>


```



SpringBoot能自动适配所有的日志，而且底层使用slf4j+logback的方式记录日志，引入其他框架的时候，只

需要把这个框架依赖的日志框架排除掉;





## 日志使用

```java
@RunWith(SpringRunner.class)
@SpringBootApplication
public class SpringBootLoggingApplication {
        Logger logger = LoggerFactory.getLogger(getClass());
        //日志级别
        //从低到高 trace<debug<info<warn<error
        //可以调节日志的输出级别
        @Test
                public void test(){
                logger.trace("这是trace");
                logger.debug("这是debug");
                logger.info("这是info");
                logger.warn("这是warn");
                logger.error("这是error");
        }
}

```

```yaml
logging.level.com.wang=warn
#不指定路径在本项目中生成日志
#指定路径在路径下生成日志
#logging.file=D:/spring.log
#指定路径
logging.path=spring/log
#设置文件的格式
logging.pattern.file=%d{yyyy-MM-dd} === [%thread] === %-51eve1 === %logger{50} ==== %msg%n

```

```
日志输出格式:
%d表示日期时间，
%thread表示线程名，
%-5level :级别从左显示5个字符宽度
%logger{50}表示logger名字最长50个字符，否则按照句点分割。
%msg:日志消息，
%n是换行符
```





## web 开发



使用spring boot：

1. 创建spring boot应用 选中我们需要的模块
2. spring  boot 默认将这些场景配置好了，只需要在配置文件指定少量的配置就可以运行起来
3. 自己编译业务代码，





自动配置原理？

这个场景spring  boot帮我们配置什么？能不能修改？能修改那些配置？能不能扩展？







## spring  boot 对静态资源的映射规则



```java
protected void addResourceHandlers(ResourceHandlerRegistry registry) {
            super.addResourceHandlers(registry);
            if (!this.resourceProperties.isAddMappings()) {
                logger.debug("Default resource handling disabled");
            } else {
                ServletContext servletContext = this.getServletContext();
                this.addResourceHandler(registry, "/webjars/**", "classpath:/META-INF/resources/webjars/");
                this.addResourceHandler(registry, this.mvcProperties.getStaticPathPattern(), (registration) -> {
                    registration.addResourceLocations(this.resourceProperties.getStaticLocations());
                    if (servletContext != null) {
                        registration.addResourceLocations(new Resource[]{new ServletContextResource(servletContext, "/")});
                    }

                });
            }
        }
```



1. 所有/webjars/** ,都去classpath:/META-INF/resources/webjars/找资源;
   webjars :以jar包的方式引入静态资源;

![image-20210322084627553](.\img\image-20210322084627553.png)

localhost:8080/webjars/jquery/3.6.0/jquery.js

https://www.webjars.org/



2. "/**" 访问当前项目的任何资源，( 静态资源的文件夹)

```
"classpath:/META-INF/resources/".
"classpath:/resources/",
"classpath:/static/",
"classpath:/public/"
"/":当前项目的根路径

```

locahost:8080/hello         它会去静态资源去找hello



3. 欢迎页;静态资源文件下所有的index.html页面；被“/**”映射；

   locahost:8080/     会找静态资源文件夹下的index页面



4. 所有的**/favicon.ico都是在静态资源文件下找;  设置网页图标



**自定义静态资源文件夹**

```yaml
spring.resources.static-locations=classpath:/hello/,classpath:/wang/
```





## 模板引擎

jsp，Velocity，Freemarker，Thymeleaf





spring boot推荐使用Thymeleaf

语法更简单 功能更强大



> 引入 thyme leaf  模板

```xml
       <java.version>1.8</java.version>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
        <!--<thymeleaf.version>3.0.9.RELEASE</thymeleaf.version>
            这里用的是org.springframework.boot下的spring-boot-starter-thymeleaf,使用<thymeleaf.version>做标签时可能与org.thymeleaf有冲突，导致包获取不正确-->
        <springboot-thymeleaf.version>3.0.9.RELEASE</springboot-thymeleaf.version>
        <!-- 布局功能的支持程序  thymeleaf3主程序  layout2以上版本 -->
        <!-- thymeleaf2   layout1-->
        <thymeleaf-layout-dialect.version>2.3.0</thymeleaf-layout-dialect.version>
```



> 导包

```xml
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-thymeleaf</artifactId>
        </dependency>
```







## thymeleaf是什么？

Thymeleaf是一个现代的服务器端Java模板引擎的web和独立的环境，能够处理HTML, XML, JavaScript, CSS，甚至纯文本。

Thymeleaf的主要目标是提供一种优雅的和高度可维护的方式来创建模板。为了实现这一点，它构建在自然模板的概念上，以不影响模板作为设计原型使用的方式将其逻辑注入模板文件。这改进了设计的交流，并在设计和开发团队之间架起了桥梁。

Thymeleaf的设计从一开始就考虑了Web标准——尤其是HTML5——允许你创建完全验证模板，如果你需要的话。



> thymeleaf 可以解析什么模板

- HTML
- XML
- TEXT
- JAVASCRIPT
- CSS
- RAW

## thymeleaf使用语法



```java
         private String prefix = "classpath:/templates/";
         private String suffix = ".html";


         SpringResourceTemplateResolver defaultTemplateResolver() {
            SpringResourceTemplateResolver resolver = new SpringResourceTemplateResolver();
            resolver.setApplicationContext(this.applicationContext);
            resolver.setPrefix(this.properties.getPrefix());
            resolver.setSuffix(this.properties.getSuffix());
            resolver.setTemplateMode(this.properties.getMode());
            if (this.properties.getEncoding() != null) {
                resolver.setCharacterEncoding(this.properties.getEncoding().name());
            }

            resolver.setCacheable(this.properties.isCache());
            Integer order = this.properties.getTemplateResolverOrder();
            if (order != null) {
                resolver.setOrder(order);
            }

            resolver.setCheckExistence(this.properties.isCheckTemplate());
            return resolver;
        }
```



只要我们把HTML放在classpath:/templates/    thymeleaf 就会帮我们自动渲染







第一步导入 thymeleaf 的约束

```html
<html lang="en" xmlns:th="http://www.thymeleaf.org">
```





java代码

```java
  @GetMapping("/success")
    public  String success(Map<String, Object>map){
        map.put("hello", "hellospringboot");
        return "success";
    }
```



网页

```html
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>成功</title>
</head>
<body>
<h1>springboot</h1>
<div th:text="${hello}"></div>
</body>
</html>
```



### 语法规则

th：text；改变当前元素的文本内容；

th：任意html属性；来替换原生属性

![image-20210322150623613](.\img\image-20210322150623613.png)



>  表达式？
>
> 

我们已经提到过，${...}表达式实际上是在上下文中包含的变量映射上执行的OGNL（对象图导航语言）表达式。

有关OGNL语法和功能的详细信息，请阅读 《OGNL语言指南》
在启用Spring MVC的应用程序中，OGNL将替换为SpringEL，但是其语法与OGNL的语法非常相似（实际上，对于大多数常见情况而言，它们是完全相同的）。

根据OGNL的语法，我们知道以下表达式：



```html
<p>Today is: <span th:text="${today}">13 february 2011</span>.</p>
…实际上等于：
```



ctx.getVariable("today");
但是OGNL允许我们创建功能更强大的表达式，这就是这种方式：

```html
<p th:utext="#{home.welcome(${session.user.name})}">
  Welcome to our grocery store, Sebastian Pepper!
</p>
…通过执行以下操作获取用户名：
```



((User) ctx.getVariable("session").get("user")).getName();
但是，getter方法导航只是OGNL的功能之一。让我们看看更多：

```html
/*

 * Access to properties using the point (.). Equivalent to calling property getters.
   */
   ${person.father.name}

/*

 * Access to properties can also be made by using brackets ([]) and writing 
 * the name of the property as a variable or between single quotes.
   */
   ${person['father']['name']}

/*

 * If the object is a map, both dot and bracket syntax will be equivalent to 
 * executing a call on its get(...) method.
   */
   ${countriesByCode.ES}
   ${personsByName['Stephen Zucchini'].age}

/*

 * Indexed access to arrays or collections is also performed with brackets, 
 * writing the index without quotes.
   */
   ${personsArray[0].name}

/*

 * Methods can be called, even with arguments.
   */
   ${person.createCompleteName()}
   ${person.createCompleteNameWithSeparator('-')}
```




### 表达式基本对象

在上下文变量上评估OGNL表达式时，某些对象可用于表达式，以提高灵活性。这些对象（根据OGNL标准）将以#符号开头进行引用：

#ctx：上下文对象。
#vars: 上下文变量。
#locale：上下文语言环境。
#request：（仅在Web上下文中）HttpServletRequest对象。
#response：（仅在Web上下文中）HttpServletResponse对象。
#session：（仅在Web上下文中）HttpSession对象。
#servletContext：（仅在Web上下文中）ServletContext对象。
因此，我们可以这样做：

Established locale country: <span th:text="${#locale.country}">US</span>.
您可以在附录A中阅读这些对象的完整参考。



### 表达工具对象

####  $ 表达式

除了这些基本对象之外，Thymeleaf将为我们提供一组实用程序对象，这些对象将帮助我们在表达式中执行常见任务。

#execInfo：有关正在处理的模板的信息。
#messages：用于获取变量表达式内的外部化消息的方法，与使用＃{…}语法获得消息的方法相同。
#uris：用于转义部分URL / URI的方法
#conversions：用于执行已配置的转换服务（如果有）的方法。
#dates：java.util.Date对象的方法：格式化，组件提取等。
#calendars：类似于#dates，但用于java.util.Calendar对象。
#numbers：格式化数字对象的方法。
#strings：String对象的方法：包含，startsWith，前置/追加等。
#objects：一般对象的方法。
#bools：布尔值评估的方法。
#arrays：数组方法。
#lists：列表方法。
#sets：套方法。
#maps：地图方法。
#aggregates：用于在数组或集合上创建聚合的方法。
#ids：用于处理可能重复的id属性的方法（例如，由于迭代的结果）。
您可以在 附录B 中检查每个实用程序对象提供的功能。

在我们的主页中重新格式化日期
现在我们知道了这些实用程序对象，可以使用它们来更改在首页中显示日期的方式。而不是在我们的系统中这样做

HomeController：

```java
SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
Calendar cal = Calendar.getInstance();

WebContext ctx = new WebContext(request, servletContext, request.getLocale());
ctx.setVariable("today", dateFormat.format(cal.getTime()));

templateEngine.process("home", ctx, response.getWriter());
```



…我们可以做到这一点：

```java
WebContext ctx = 
    new WebContext(request, response, servletContext, request.getLocale());
ctx.setVariable("today", Calendar.getInstance());

templateEngine.process("home", ctx, response.getWriter());
```



…然后在视图层本身中执行日期格式化：

```html
  Today is: <span th:text="${#calendars.format(today,'dd MMMM yyyy')}">13 May 2011</span>
</p>
```



####  选择表达式（星号语法）

变量表达式不仅可以写成${...}，而且还可以写成*{...}。

但是，有一个重要的区别：星号语法在选定对象而不是整个上下文上评估表达式。也就是说，只要没有选定的对象，美元和星号的语法就完全一样。



什么是选定对象？使用该th:object属性的表达式的结果。让我们在用户个人资料（userprofile.html）页面中使用一个：

```html
<div th:object="${session.user}">
    <p>Name: <span th:text="*{firstName}">Sebastian</span>.</p>
    <p>Surname: <span th:text="*{lastName}">Pepper</span>.</p>
    <p>Nationality: <span th:text="*{nationality}">Saturn</span>.</p>
  </div>
```



完全等同于：

```html
<div>
  <p>Name: <span th:text="${session.user.firstName}">Sebastian</span>.</p>
  <p>Surname: <span th:text="${session.user.lastName}">Pepper</span>.</p>
  <p>Nationality: <span th:text="${session.user.nationality}">Saturn</span>.</p>
</div>
```



也可以混合使用

```html
<div th:object="${session.user}">
  <p>Name: <span th:text="*{firstName}">Sebastian</span>.</p>
  <p>Surname: <span th:text="${session.user.lastName}">Pepper</span>.</p>
  <p>Nationality: <span th:text="*{nationality}">Saturn</span>.</p>
</div>
```



选择对象后，选定的对象也可以作为`#object`表达式变量用于美元表达式：

```html
<div th:object="${session.user}">
  <p>Name: <span th:text="${#object.firstName}">Sebastian</span>.</p>
  <p>Surname: <span th:text="${session.user.lastName}">Pepper</span>.</p>
  <p>Nationality: <span th:text="*{nationality}">Saturn</span>.</p>
</div>
```



如前所述，如果未执行任何对象选择，则美元和星号语法是等效的:

```html
<div>
  <p>Name: <span th:text="*{session.user.name}">Sebastian</span>.</p>
  <p>Surname: <span th:text="*{session.user.surname}">Pepper</span>.</p>
  <p>Nationality: <span th:text="*{session.user.nationality}">Saturn</span>.</p>
</div>
```



#### 连接网址（@表达式）

由于它们的重要性，URL是Web应用程序模板中的一等公民，而Thymeleaf Standard Dialect对它们有一种特殊的语法，该@语法为：@{...}

URL有不同类型：

- 绝对网址： http://www.thymeleaf.org
- 相对URL，可以是：
  - 相对页面： user/login.html
  - 上下文相关：（/itemdetails?id=3服务器中的上下文名称将自动添加）
  - 相对于服务器：（~/billing/processInvoice允许在同一服务器中的另一个上下文（=应用程序）中调用URL。
  - 相对协议网址： //code.jquery.com/jquery-2.0.3.min.js

这些表达式的实际处理以及它们到将要输出的URL的转换是通过org.thymeleaf.linkbuilder.ILinkBuilder注册到ITemplateEngine所使用的对象的接口实现来完成的。



默认情况下，该类的该接口的单个实现被注册org.thymeleaf.linkbuilder.StandardLinkBuilder，这对于脱机（非Web）和基于Servlet API的Web场景都足够。其他场景（例如与非ServletAPI Web框架集成）可能需要链接构建器接口的特定实现。让我们使用这种新语法。符合th:href属性：

```html
<!-- Will produce 'http://localhost:8080/gtvg/order/details?orderId=3' (plus rewriting) -->
<a href="details.html" 
   th:href="@{http://localhost:8080/gtvg/order/details(orderId=${o.id})}">view</a>
 
<!-- Will produce '/gtvg/order/details?orderId=3' (plus rewriting) -->
<a href="details.html" th:href="@{/order/details(orderId=${o.id})}">view</a>
 
<!-- Will produce '/gtvg/order/3/details' (plus rewriting) -->
<a href="details.html" th:href="@{/order/{orderId}/details(orderId=${o.id})}">view</a>

```



#### 片段表达式

片段表达式是表示标记片段并将其在模板中移动的简便方法。这使我们能够复制它们，并将它们作为参数传递给其他模板，依此类推。

最常见的用途是使用`th:insert`或`th:replace`（在后面的部分中有更多关于）的片段插入：

```html
<div th:insert="~{commons :: main}">...</div>
```



但是它们可以在任何地方使用，就像其他任何变量一样：

```html
<div th:with="frag=~{footer :: #main/text()}">
  <p th:insert="${frag}">
</div>
```



#### 字面量

**文字文本**

文本文字只是在单引号之间指定的字符串。它们可以包含任何字符，但是您应该使用来对其中的任何单引号进行转义’。

```html
<p>
  Now you are looking at a <span th:text="'working web application'">template file</span>.
</p>
```



**数字文本**

数字文本就是：数字。

```html
<p>The year is <span th:text="2013">1492</span>.</p>
<p>In two years, it will be <span th:text="2013 + 2">1494</span>.</p>
```



**布尔文本**

布尔文本是`true`和`false`。例如：

```html
<div th:if="${user.isAdmin()} == false"> ...
```



在此示例中，`== false` y是写在花括号外的，因此Thymeleaf负责处理。如果将其写在花括号内，则`OGNL / SpringEL`引擎应负责

```html
<div th:if="${user.isAdmin() == false}"> ...
```



**空文本**

该null文本也可用于：

```html
<div th:if="${variable.something} == null"> ...
```





**文字代币**

实际上，数字，布尔值和null文字是文字标记的一种特殊情况。

这些标记允许在标准表达式中进行一些简化。它们的工作原理与文本文字（'...'）完全相同，但是它们仅允许使用字母（A-Z和a-z），数字（0-9），方括号（[和]），点（.），连字符（-）和下划线（_）。因此，没有空格，没有逗号等。

好的部分？令牌不需要任何引号引起来。因此，我们可以这样做：

```html
<div th:class="content">...</div>
```



代替：

```html
<div th:class="'content'">...</div>
```



#### 附加文本

文本，无论它们是文字还是评估变量或消息表达式的结果，都可以使用+运算符轻松附加：

```html
<span th:text="'The name of the user is ' + ${user.name}">
```



#### 文本替代

文字替换可以轻松格式化包含变量值的字符串，而无需在文字后面附加 `'...' + '...'`。

这些替换项必须用竖线（`|`）包围，例如：

```html
<span th:text="|Welcome to our application, ${user.name}!|">
```



等效于：

```html
<span th:text="'Welcome to our application, ' + ${user.name} + '!'">
```



文字替换可以与其他类型的表达式结合使用：

```html
<span th:text="${onevar} + ' ' + |${twovar}, ${threevar}|">
```

唯一的变量/消息表达式（`${...}，*{...}，#{...}`）被允许内部|…|字面取代。没有其他文字（`'...'`），布尔/数字标记，条件表达式等。



#### 算术运算

一些算术运算也可用：`+，-，*，/和%`。

```html
<div th:with="isEven=(${prodStat.count} % 2 == 0)">
```



请注意，这些运算符也可以在OGNL变量表达式内部应用（在这种情况下，将由OGNL代替Thymeleaf标准表达式引擎执行）：

```html
<div th:with="isEven=${prodStat.count % 2 == 0}">
```



请注意，其中一些运算符存在文本别名：`div（/）`，`mod（%）`。



#### 比较器和平等

在表达式中的值可以与进行比较`>`，`<`，`>`=和`<=`符号，以及`==`和`!=`运营商可以被用来检查是否相等（或缺乏）。请注意，XML规定，不得在属性值中使用`<和>`符号，因此应将其替换为`<`和 `>`。

```html
<div th:if="${prodStat.count} &gt; 1">
<span th:text="'Execution mode is ' + ( (${execMode} == 'dev')? 'Development' : 'Production')">
```

一个更简单的替代方法可能是使用以下某些运算符存在的文本别名：`gt（>）`，`lt（<）`，`ge（>=）`，`le（<=）`，`not（!）`。还有`eq（==）`，`neq/ ne（!=）`。



#### 条件表达式

条件表达式旨在仅根据两个条件的求值结果来求值（它本身就是另一个表达式）。
让我们来看一个例子片段（引入另一个属性修改器，`th:class`）：

```html
tr th:class="${row.even}? 'even' : 'odd'">
  ...
</tr>
```

条件表达式的所有三个部分（condition，then和else）本身的表达式，这意味着它们可以是`变量（${...}，*{...}）`，`消息（#{...}）`，`网址（@{...}）`或`文字（'...'）`。

也可以使用括号嵌套条件表达式：

```html
<tr th:class="${row.even}? (${row.first}? 'first' : 'even') : 'odd'">
  ...
</tr>
```

其他表达式也可以省略，在这种情况下，如果条件为false，则返回null值：

```html
<tr th:class="${row.even}? 'alt'">
  ...
</tr>
```



#### 默认表达式（Elvis运算符）

一个默认的表情是一种特殊的条件值的没有那么一部分。它等效于某些语言（如Groovy）中出现的Elvis运算符，可让您指定两个表达式：如果第一个表达式的计算结果不为null，则使用第一个表达式；如果第二个表达式使用，则使用第二个表达式。

让我们在我们的用户个人资料页面中看到它的实际效果：

```html
<div th:object="${session.user}">
  ...
  <p>Age: <span th:text="*{age}?: '(no age specified)'">27</span>.</p>
</div>
```



如您所见，运算符为`?:`，并且仅当求`*{age}`值结果为null时，才在此处使用它来指定名称的默认值（在这种情况下为文字值）。因此，这等效于：

```html
<p>Age: <span th:text="*{age != null}? *{age} : '(no age specified)'">27</span>.</p>
```



与条件值一样，它们可以在括号之间包含嵌套表达式：

```html
<p>
  Name: 
  <span th:text="*{firstName}?: (*{admin}? 'Admin' : #{default.username})">Sebastian</span>
</p>
```







## 扩展springmvc

```xml
   <!--如果是hello就跳转success网页-->
  <mvc:view-controller path="/hello" view-name="success"></mvc:view-controller>
    <!-- 配置拦截器 -->
    <mvc:interceptors>
        <!-- 配置一个全局拦截器，拦截所有请求 -->
        <bean class="interceptor.TestInterceptor" />
        <mvc:interceptor>
            <!-- 配置拦截器作用的路径 -->
            <mvc:mapping path="/**" />
            <!-- 配置不需要拦截作用的路径 -->
            <mvc:exclude-mapping path="" />
            <!-- 定义<mvc:interceptor>元素中，表示匹配指定路径的请求才进行拦截 -->
            <bean class="interceptor.Interceptor1" />
        </mvc:interceptor>
        <mvc:interceptor>
            <!-- 配置拦截器作用的路径 -->
            <mvc:mapping path="/gotoTest" />
            <!-- 定义在<mvc: interceptor>元素中，表示匹配指定路径的请求才进行拦截 -->
            <bean class="interceptor.Interceptor2" />
        </mvc:interceptor>
    </mvc:interceptors>
```



## springboot视图解析



**编写一个配置类（@Configuration），是WebMvcConfigurerAdapter类型 ；不能标注@EnableWebMvc；**

即保留了所有的自动配置，也能使用我们的扩展配置；

Adapter（适配器）

```java
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
@Configuration
public class MyComfig extends WebMvcConfigurerAdapter {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        //浏览器发送请求来到/wangmengtao   请求来到 success页面
        registry.addViewController("/wangmengtao").setViewName("success");
    }
}

```

如果打了@EnableWebMvc就相当于全面接手springmvc所有的配置都要自己写

## 

```java
@Configuration
public class MyComfig extends WebMvcConfigurerAdapter {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        //浏览器发送请求来到/wangmengtao   请求来到 success页面
        registry.addViewController("/wangmengtao").setViewName("success");

    }
    @Bean
    public WebMvcConfigurerAdapter webMvcConfigurerAdapter(){
        //WebMvcConfigurerAdapter   new这个抽象类重写他的方法
        WebMvcConfigurerAdapter adapter = new WebMvcConfigurerAdapter(){
            @Override
            public void addViewControllers(ViewControllerRegistry registry) {
                registry.addViewController("/").setViewName("index");
                registry.addViewController("/index.html").setViewName("index");
            }
        };
        return adapter;
    }
```





## 拦截器

第一步编写controller层

​    HttpSession 把用户信息放入HttpSession

​    

```java
 @PostMapping("/login")
    public  String login(String username, String password, HttpSession session, Model model){
        session.setAttribute("name","username");
        if (!StringUtils.isEmpty(username) && "123456".equals(password)){
            //登录成功，防止表单重复提交  可以重定向到主页
            return "redirect:/main.html";
        }else{
            model.addAttribute("msg","账号或者密码错误");
            return"index";
        }


    }
```



第二步配置拦截器

```java
//拦截器
public class LoginHandlerInterceptor implements HandlerInterceptor {
    //目标方法执行之前
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object name = request.getSession().getAttribute("name");
        if(name == null){
            //没有登录
            request.setAttribute("msg","没有权限请登录");
            request.getRequestDispatcher("/index.html").forward(request,response);
            return false;
        }else {
            //登录
            return true;
        }


    }
```





第三步

开启拦截器

```java
 @Bean
    public WebMvcConfigurerAdapter webMvcConfigurerAdapter(){
        WebMvcConfigurerAdapter adapter = new WebMvcConfigurerAdapter(){
            @Override
            public void addViewControllers(ViewControllerRegistry registry) {
                registry.addViewController("/").setViewName("index");
                registry.addViewController("/index.html").setViewName("index");
                registry.addViewController("/main.html").setViewName("success");
            }

            //注册拦截器
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                //不需要拦截静态资源  springboot已经做好静态资源映射  静态资源：css js
               registry.addInterceptor(new LoginHandlerInterceptor()).addPathPatterns("/**")//拦截所有请求
               .excludePathPatterns("/index.html","/","/login");      // 不拦截那些请求
            }
        };
        return adapter;
    }
```





## 如何修改spring boot 的默认配置

模式：

​         1.spring boot在自动配置很多组件的时候，先看容器中有没有用户自己的配置的（@bean，@component） 如果有就使用 用户配置的，如果没有就使用默认配置的，如果没有才自动配置；有些组件可以存在多个（viewResolver）将用户配置的和自己默认的组合起来；

2. 在springboot中会有非常多的xxxConfigurer帮助我们进行扩展配置



## 国际化

1. 编写国际化配置文件：
2. 使用resourceBundleMessgeSource管理国际化资源文件
3. 在页面使用fml：message取出国际化内容



![image-20210324092810703](.\img\image-20210324092810703.png)







配置信息

第一个是加上一个路径

第二个配置 whymeleaf关闭缓存

第三个 设置国际化编码 

注意： 页面修改完了要ctrl+f9 重新编译

![image-20210324094024707](.\img\image-20210324094024707.png)





#### 判断是否隐藏标签



```html
  <p style="color: red" th:text="${msg}" th:if="${not #strings.isEmpty(msg)}"></p>
```







## 抽取公共页面



```html
//1、抽取公共片段
<div th:fragment=" copy">
//&copy; 2011 The Good Thymes Virtual Grocery
</div>
//2、引入公共片段
<div th: insert="~{footer :: copy}"></div>
~{templatename::selector} //:模板名::选择器   可以提供id来选择  #xxx
~{templatename: : fragmentname}//:模板名::片段名

```



> **三种引入功能片段th属性**

**th:insert :将公共片段整个插入到声明引入的元素中**
**th:replace :将声明引入的元素替换为公共片段**
**th:include :将被引入的片段的内容包含进这个标签中**

insert的功能片段在div标签中
如果使用th:insert等属性进行引入，可以不用写~{} :
行内写法可以加上: [[~{}]];[(~{})] ;







## 怎么设置springboot日期格式

```yaml
# 设置springboot 日期格式
spring.mvc.format.date=yyyy-mm-dd
```





#### th:checked

![image-20210330163117595](.\img\image-20210330163117595.png)



如何复选





## put请求



<!--发送put请求修改员工数据-->
1、SpringMVC中配置HiddenHttpMethodFilter; ( SpringBoot自动配置好的)
2、页面创建一-个post表单
3、创建一个input项，type=hidden      name=" method";    value=put  值就是我们指定的请求方式

**同理delect提交**





## spring boot定制错误页面

1 )、如何定制错误的页面;
1 )、有模板引擎的情况下; error/状态码; [将错误页面命名为错误状态码.html放在模板引起文
件夹里面的error文件夹下] , 发生此状态码的错误就会来到对应的页面;
我们可以使用4xx和5xx作为错误页面的文件名来匹配这种类型的所有错误,精确优先(优先寻找精
确的状态码.html ) ;
页面能获取的信息;
timestamp :时间戳
status :状态码
error :错误提示
exception :异常对象
message :异常消息
errors : JSR303数据校验的错误都在这里





## spring  boot配置servlet

引用web模块默认使用tomcat 的servlet容器

```xml
  <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
```





jetty

undertow

```xml
     <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
<!--            去掉默认的servlet容器-->
               <exclusions>
                   <exclusion>
                       <artifactId>spring-boot-starter-tomcat</artifactId>
                       <groupId>org.springframework.boot</groupId>
                   </exclusion>
               </exclusions>
        </dependency>
<!--        引入其他的servlet容器-->
        <dependency>
            <artifactId>spring-boot-starter-jetty</artifactId>
            <groupId>org.springframework.boot</groupId>
        </dependency>
```



## 外部servlet

内部servlet 

- 优点方便
- 缺点不能使用jsp页面
- 以jar打包



外部servlet

- 可以使用jsp
- 以war打包





第一步构建项目

以war包的方式创建

![image-20210404150436898](.\img\image-20210404150436898.png)



第二步创建webapp 和xml文件  配置tomcat



第三步application.properties配置视图解析器

```java
spring.mvc.view.prefix=/WEB-INF/
spring.mvc.view.suffix=.jsp
```



## Docker

Docker 的核心就是支持将软件编译成一个镜像



核心

docker主机(Host):安装了Docker程序的机器( Docker直接安装在操作系统之上) ;
docker客户端(Client) :连接docker主机进行操作;
docker仓库(Registry) :用来保存各种打包好的软件镜像;
docker镜像(lmages) :软件打包好的镜像;放在docker仓库中;
docker容器(Container) :镜像启动后的实例称为- -个容器;容器是独立运行的一一个或一组应用
使用Docker的步骤:
1 )、安装Docker
2)、去Docker仓库找到这个软件对应的镜像;
3)、使用Docker运行这个镜像,这个镜像就会生成一个Docker容器 ;
4)、对容器的启动停止就是对软件的启动体质





## docker 操作

|      操作      |            作用            |
| :------------: | :------------------------: |
|    查看镜像    |   docker search  关键字    |
|    下载镜像    |     docker pull  名字      |
| 下载的镜像列表 |       docker images        |
| 删除下载的镜像 | docker rmi  镜像列表中的id |

https://www.docker.com/



## 操作容器

|                       操作                        |                          作用                           |
| :-----------------------------------------------: | :-----------------------------------------------------: |
|        service firewalld stop(不建议使用)         |                       关闭防火墙                        |
|    docker run --name mytomcat -d tomcat:latest    |                        启动镜像                         |
|                     docker ps                     |                    查看运行中的容器                     |
|               docker stop  容器的id               |                      停止那个容器                       |
|                   docker ps -a                    |                     查看所有的容器                      |
|                docker start 容器id                |                      启动那个容器                       |
|                 docker rm 容器 id                 |       删除那个容器（删除的时候容器要是停止状态）        |
| docker run --name mytomcat -d -p 8888:8080 tomcat |                       配置tomcat                        |
|                        -d                         |                        后台运行                         |
|                        -p                         | 将主机端口映射到容器的一个端口 主机端口：容器内部的端口 |



## spring boot 与数据访问



默认运行sql文件应该取名叫做 schema.sql  或者 schema-all.sql

### 



![搭建环境图](.\img\image-20211213192511391.png)



导包

```xml
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-jdbc</artifactId>
        </dependency>

        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <scope>runtime</scope>
        </dependency>
```



配置JDBC环境

```properties
# 应用名称
spring.application.name=demo
# 应用服务 WEB 访问端口
server.port=8080
#下面这些内容是为了让MyBatis映射
#指定Mybatis的Mapper文件
mybatis.mapper-locations=classpath:mappers/*xml
#指定Mybatis的实体目录
mybatis.type-aliases-package=com.example.wmt.demo.mybatis.entity
# 数据库驱动：
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
# 数据源名称
spring.datasource.name=defaultDataSource
# 数据库连接地址
spring.datasource.url=jdbc:mysql://localhost:3306/db?serverTimezone=UTC
# 数据库用户名&密码：
spring.datasource.username=root
spring.datasource.password=123456

#spring.datasource.initialization-mode=always
#自定义指定路径
#spring.datasource.schema=classpath:wmt.sql
spring.datasource.type=com.alibaba.druid.pool.DruidDataSource
#
spring.datasource.tomcat.initial-size=5
spring.datasource.tomcat.min-idle=5
spring.datasource.tomcat.max-active=20
spring.datasource.tomcat.max-wait=60000
spring.datasource.tomcat.time-between-eviction-runs-millis=60000
spring.datasource.tomcat.min-evictable-idle-time-millis=300000
spring.datasource.tomcat.validation-query=SELECT 1 FORM DUAL
spring.datasource.tomcat.test-while-idle=true
spring.datasource.tomcat.test-on-borrow=false
spring.datasource.tomcat.test-on-return=false

# 打开PSCache，并且指定每个连接上PSCache的大小
spring.datasource.poolPreparedStatements=true
spring.datasource.maxPoolPreparedStatementPerConnectionSize=20
# 配置监控统计拦截的filters，去掉后监控界面sql无法统计，'wall'用于防火墙
#spring.datasource.filters=stat,wall
# 通过connectProperties属性来打开mergeSql功能；慢SQL记录
spring.datasource.connectionProperties=druid.stat.mergeSql=true;druid.stat.slowSqlMillis=10000
```



> 运行程序自己创建数据库DataSourceInitializer

作用：

​      1】：运行建表语句

​      2】：运行插入数据的SQL语句

默认只需要将文件名为：schema-.XXsql   data-XX.sql



springboot版本2.2.4需要开启运行时建表，配置文件去加

```properties
#开启建表运行sql
spring.datasource.initialization-mode=always
#也可以自定义名字：
spring.datasource.schema=classpath:wmt.sql
```



原生jdbc操作数据库

```java
@Controller
@ResponseBody
public class HelloController {
    @Autowired
    JdbcTemplate jdbcTemplate;
    @GetMapping("hello")
    public Map<String,Object> hello(){
        List<Map<String, Object>> maps = jdbcTemplate.queryForList("select * from user ");
        return maps.get(0);

    }

}
```



### 使用druid数据源

导包

```xml
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid</artifactId>
            <version>1.2.8</version>
        </dependency>
```





配置druid的环境

```properties
#配置druid
spring.datasource.tomcat.initial-size=5
spring.datasource.tomcat.min-idle=5
spring.datasource.tomcat.max-active=20
spring.datasource.tomcat.max-wait=60000
spring.datasource.tomcat.time-between-eviction-runs-millis=60000
spring.datasource.tomcat.min-evictable-idle-time-millis=300000
spring.datasource.tomcat.validation-query=SELECT 1 FORM DUAL
spring.datasource.tomcat.test-while-idle=true
spring.datasource.tomcat.test-on-borrow=false
spring.datasource.tomcat.test-on-return=false

# 打开PSCache，并且指定每个连接上PSCache的大小
spring.datasource.poolPreparedStatements=true
spring.datasource.maxPoolPreparedStatementPerConnectionSize=20
# 配置监控统计拦截的filters，去掉后监控界面sql无法统计，'wall'用于防火墙
#spring.datasource.filters=stat,wall
# 通过connectProperties属性来打开mergeSql功能；慢SQL记录
spring.datasource.connectionProperties=druid.stat.mergeSql=true;druid.stat.slowSqlMillis=10000
```



配置类把properties或者yml里面的配置重新注入到xml里面

```java

@Configuration
public class DruidConfig {
    @ConfigurationProperties("spring.datasource")
    /***
     * 把properties的配置文件注入到框架中
     */
    @Bean
    public DataSource druid(){
        return new DruidDataSource();
    }
//    druid视图监控
    @Bean
    public ServletRegistrationBean servletRegistrationBean(){
        ServletRegistrationBean<StatViewServlet> bean = new ServletRegistrationBean<>(new StatViewServlet(), "/druid/*");
        HashMap<String, String> map = new HashMap<>();
        map.put("jmxUsername","admin");
        map.put("jmxUserpassword","123456");
        map.put("allow","");//默认总是访问
        bean.setInitParameters(map);
        return bean;
    }

    //druid资源监控
    @Bean
    public FilterRegistrationBean filterRegistrationBean(){
        FilterRegistrationBean<Filter> bean = new FilterRegistrationBean<>();
        bean.setFilter(new WebStatFilter());
        HashMap<String, String> map = new HashMap<>();
        //exclusions除外这些请求都放行
        map.put("exclusions","*.js,*.css,/druid/*");
        bean.setInitParameters(map);
//        拦截所有请求 Arrays.asList变成集合
        bean.setUrlPatterns(Arrays.asList("/*"));
        return bean;
    }


}
```



### springboot连接mybatis

导包

```xml
       <dependency>
            <groupId>org.mybatis.spring.boot</groupId>
            <artifactId>mybatis-spring-boot-starter</artifactId>
            <version>2.1.4</version>
        </dependency>
```



![image-20220121211342687](.\img\image-20220121211342687.png)





> 注解开发：无需xml

```java

//指定这个类是操作数据库的mapper
@Mapper
public interface UserMapper {
    @Select("select * from user")
    List<User> alluser();
    @Select("select * from user where id=#{id}")
    User searchId(Integer id);

    @Insert("insert into user(name,password,email,gmt_create,gmt_modified) values(#{name},#{password},#{email},#{gmtCreate},#{gmtModified})")
    int insertName(User user);
}

```

### 扫描mapper配置

```java
//告诉mybatis去扫描这个包下面的mapper文件
@MapperScan(value = "com.example.wmt.demo.mybatis.mappers")
@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

}

```





### 开启驼峰映射

> 如果数据库中用下划线间隔字母那就要开启驼峰不然映射不到数据库



方法一：配置properties

```yml
#开启驼峰
mybatis.configuration.map-underscore-to-camel-case=true
```



方法二：写配置类

```java
@Configuration
public class MyBatisConfig {
    @Bean
    public ConfigurationCustomizer configurationCustomizer(){
       return new ConfigurationCustomizer() {
            @Override
            public void customize(org.apache.ibatis.session.Configuration configuration) {
                configuration.setMapUnderscoreToCamelCase(true);
            }
        };
    }
}
```



## 使用xml配置mybatis

先在配置文件中指定全局配置文件：**注意mybatis.config-location必须配置到详细地址**

```properties
#映射mybatis的配置文件必须详细到.xml
mybatis.config-location=classpath:mybatis/mybatisConfig.xml
#指定Mybatis的Mapper文件
mybatis.mapper-locations=classpath:mybatis/mappers/*xml
```



> mapper.xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.example.wmt.demo.mybatis.mappers.UserMapper">
    <delete id="deleteId" parameterType="integer">
        delete from user where id=#{id}
    </delete>
    <select id="allUser" resultType="userdata">
       select * from user
    </select>
    <update id="updateId" parameterType="userdata">
        update user set name=#{name},password=#{password},email=#{email} where id=#{id}
    </update>
</mapper>
```





> mybatisConfig.xml



```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">

<configuration>
    <!--开启驼峰映射-->
<settings>
    <setting name="mapUnderscoreToCamelCase" value="true"/>
</settings>
</configuration>
```





## spring data JPA 



第一步：导入jpa的包

```xml
       <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jdbc</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
```



第二步：配置properties

```properties
#更新或者创建数据表
spring.jpa.hibernate.ddl-auto=update
#操作显示sql
spring.jpa.show-sql=true
```



第三步：编写实体类加上jpa注解

```java
@Data
@Entity
@Table(name = "user")
public class UserEntity {
    @Id//主键
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column//表示字段默认为变量名称
    private String name;
    @Column(name = "pssword")
    private String passWord;

}
```



第四步编写接口继承JpaRepository来对数据库进行操作

```java
//继承JpaRepository来完成数据库的操作
public interface UserRepository extends JpaRepository<UserEntity,Integer> {

}
```



第五步：编写controller层

```java
@RestController
public class UserController {
    @Resource
    private UserRepository userRepository;
    @GetMapping("/getuser/{id}")
//    @PathVariable是spring3.0的一个新功能：接收请求路径中占位符的值
//    @RequestParam 是从request里面拿取值
    public UserEntity getUser(@PathVariable Integer id){
        return userRepository.findById(id).orElse(null);//可以查询数据库里没有的id
    }
    @PostMapping("insertUserEntity")
    public UserEntity insertUserEntity(@RequestBody UserEntity userEntity){
        UserEntity save = userRepository.save(userEntity);
        return save;
    }
}
```



## spring boot 启动配置原理

源码不想听67p-69p







































# 