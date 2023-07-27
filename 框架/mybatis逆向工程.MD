# mybatis 逆向工程

导入包

```xml
<!--    mybatis逆向工程-->
    <dependency>
      <groupId>org.mybatis.generator</groupId>
      <artifactId>mybatis-generator-core</artifactId>
      <version>1.4.2</version>
    </dependency>
```







>  编写generatorConfig.xml

编写xml直接先把项目结构创建好

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE generatorConfiguration
        PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
        "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
<generatorConfiguration>
    <context id="dbTable" targetRuntime="MyBatis3">
<!--        去除注解-->
        <commentGenerator>
            <property name="suppressAllComments" value="true"/>
        </commentGenerator>
<!--        配置数据库-->
        <jdbcConnection driverClass="com.mysql.cj.jdbc.Driver"
                        connectionURL="jdbc:mysql://127.0.0.1:3306/mybatis?useUnicode=true&amp;characterEncoding=UTF-8&amp;useSSL=false&amp;serverTimezone=Asia/Shanghai&amp;rewriteBatchedStatements=true"
                        userId="root"
                        password="123456">
        </jdbcConnection>
<!--        配置类型映射-->
        <javaTypeResolver>
            <property name="forceBigDecimals" value="false"/>
        </javaTypeResolver>
<!--        配置pojo实体生成的位置-->
        <javaModelGenerator targetPackage="com.mybatis.entity" targetProject="src/main/java">
            <property name="enableSubpackages" value="true"/>
            <property name="trimStrings" value="true"/>
        </javaModelGenerator>
<!--    配置sql映射文件    -->
        <sqlMapGenerator targetPackage="mapper" targetProject="src/main/resources">
            <property name="enableSubpackages" value="true"/>
            <property name="trimStrings" value="true"/>
        </sqlMapGenerator>
<!--         配置mapper接口-->
        <javaClientGenerator type="XMLMAPPER" targetPackage="com.mybatis.mapper" targetProject="src/main/java">
            <property name="enableSubpackages" value="true"/>
            <property name="trimStrings" value="true"/>
        </javaClientGenerator>
<!--        指定表-->
        <table tableName="crop" domainObjectName="Crop"></table>
    </context>
</generatorConfiguration>
```



> 编写测试类

```java
  @Test
    public void generator() throws Exception{
//        定义一个列表
        List<String> warnings = new ArrayList<>();
        boolean overWrite = true;
//        读取加载generator.xml文件
        File file = new File("src/main/resources/generatorConfig.xml");
        ConfigurationParser  cp = new ConfigurationParser(warnings);

        Configuration configuration = cp.parseConfiguration(file);
//         开启回滚
        DefaultShellCallback rallback = new DefaultShellCallback(overWrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(configuration, rallback, warnings);
        myBatisGenerator.generate(null);
        System.out.println("生成成功");
    }
```

