## spring boot常用注解



@PathVariable 是spring3.0的一个新功能：接收请求路径中占位符的值

@RequestParam 是从request里面拿取值

@MapperScan 去扫描包下面的mapper文件

@Mapper 指定这个类是操作数据库的mapper

@Configuration 告诉spring这个类是配置类

@Bean  把这个方法注入到容器中





## spring boot properties常用配置

#开启驼峰
mybatis.configuration.map-underscore-to-camel-case=true

#开启建表运行sql
spring.datasource.initialization-mode=always

#也可以自定义数据库的名字：
spring.datasource.schema=classpath:wmt.sql



