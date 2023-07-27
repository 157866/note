



# spring cloud学习

>  spring boot 和 springcloud的配置必须严格按照官网来

https://start.spring.io/actuator/info

通过网上在线tool.ul工具来格式化json格式来看环境配置

![image-20221111151056085](.\img\image-20221111151056085.png)





>  构造项目可以去官网看看官网推荐的版本

![image-20221111152116775](.\img\image-20221111152116775.png)

点击reference.doc  参考文档



![image-20221111152037143](.\img\image-20221111152037143.png)



>  学习的整体架构



![image-20221115083638880](.\img\image-20221115083638880.png)





spring cloud 官网：[Spring Cloud](https://cloud.spring.io/spring-cloud-static/Hoxton.SR1/reference/htmlsingle/)



创建是springcloud项目

1. 创建maven项目

   ![image-20221115092309458](.\img\image-20221115092309458.png)



2. 开启字符utf - 8

![image-20221115092454311](C:\Users\34912\AppData\Roaming\Typora\typora-user-images\image-20221115092454311.png)

3. 开启default默认注解

![image-20221115092547068](.\img\image-20221115092547068.png)



父类pom依赖：<dependencyManagement>

maven 使用 dependencyManagement元素来提供一种管理账号的版本的方式

通常会在一个组织或者项目的最顶层的父pom中才能看见dependencyManagement

dependenceManagement里只是声明依赖，并不引入，因此子项目需要显示的声明需要用的依赖

如果子项目中指定了版本号，那么会使用子项目指定的jar版本

使用pom.xml中的dependencyManagement元素能让所有子类项目中引用一个依赖不需要写版本号 maven会沿着父子层次向上走，直到找到dependencyManagement元素的项目如何会使用这个元素中管理的版本。
如果子模块需要其他的版本就自己申请version

```

<dependencyManagement>
    <dependencies>
        <dependency>
        <groupId>mysq1</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>5.1.2</version>
        </dependency>
    <dependencies>
</dependencyManagement>
```

然后在子项目里就可以添加`mysql-connector`时可以不指定版本号，例如

```xml
<dependencies>
    <dependency>
    <groupId>mysq1</groupId>
    <artifactId>mysql-connector-java</artifactId>
    </dependency>
</dependencies>
```

这样做的好处就是：如果有多个子项目都引用同一样依赖，则可以避免在每个使用的子项目里都声明一个版本号，这样当想升级或切换到另一个版本时，只需要在顶层父容器里更新，而不需要一个一个子项目的修改；另外如果某个子项目需要另外的一个版本，只需要声明version就可。

1. dependencyManagement里只是声明依赖，并不实现引入，因此子项目需要显示的声明需要用的依赖。
   2. 如果不在子项目中声明依赖，是不会从父项目中继承下来的；只有在子项目中写了该依赖项,并且没有指定具体版本，才会从父项目中继承该项，并且version和scope都读取自父pom。
      3. 如果子项目中指定了版本号，那么会使用子项目中指定的jar版本。
         

IDEA右侧旁的Maven插件有`Toggle ' Skip Tests' Mode`按钮，这样maven可以跳过单元测试



父工程创建完成执行`mvn : install`将父工程发布到仓库方便子工程继承。