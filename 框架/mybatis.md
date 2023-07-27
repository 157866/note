# MyBatis

注意事项

mybatis的映射配置文件位置必须和dao接口的包结构相同

映射配置文件的mapper标签的namespace属性的取值必须是dao接口的全限命名

映射配置文件的配置操作（select），id的属性和接口dao的方法名

**如果满足这三个条件就可以不用写接口的实现类**

1. 配置环境加载驱动
2. 写实现类
3. 写接口
4. 写mapper.xml
5. 写mybatis主要xml连接到mapper
6. 写工具类用mybatisxml拿出工厂
7. 测试

设置连接数据库

设置时区因为idea的时间和mysql的时间相差8个小时

idea里面连接数据库需要设置servertimezone=Asia/Shanghai

mybatis的主要配置文件

## 1. 第一步导包

```xml

    <dependencies>
    <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis</artifactId>
        <version>3.5.5</version>
    </dependency>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>5.1.32</version>
    </dependency>
    <dependency>
        <groupId>junit</groupId>
        <artifactId>junit</artifactId>
        <version>4.13</version>
        <scope>test</scope>
    </dependency>
    <!--日志导包-->
   <!-- <dependency>
        <groupId>log4j</groupId>
        <artifactId>log4j</artifactId>
        <version>1.2.12</version>
    </dependency>-->
</dependencies>
    <build>
        <resources>
            <resource>
                <directory>src/main/resources</directory>
                <includes>
                    <include>**/*.properties</include>
                    <include>**/*.xml</include>
                </includes>
                <filtering>true</filtering>
            </resource>
            <resource>
                <directory>src/main/java</directory>
                <includes>
                    <include>**/*.properties</include>
                    <include>**/*.xml</include>
                </includes>
                <filtering>true</filtering>
            </resource>

        </resources>
    </build>
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

</project>
```

## 第二步 写DaoMapper的实现类

```java
public class DaoMapper {
    private int id;
    private  String name;
    private  char sex;
     }
```

## 第三步接口

```java
public interface UserMapper{
    List<UserMapper>faindAll();/*返回是个结果集*/
}
```

## 第4步mapper

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
    <mapper namespace="com.wang.userdao.UserMapper">
    <!-- id的值和接口中的方法名一样       resultType返回值就是实现类的相对地址    -->
    <select id=" id的值和接口中的方法名一样" resultType="resultType返回值就是实现类的相对地址">
        /*表名*/
    select * from student 
  </select>
</mapper>
```

## 第五步mybatis的主要配置文件

```xml
<configuration>
    <environments default="database"><!--default的名字要和id一样-->
        <environment id="database">
            <!--配置事务的类型-->
            <transactionManager type="JDBC"/>
            <!--配置连接池-->
            <dataSource type="POOLED">
                <!--四个基本信息-->
                <property name="driver" value="com.mysql.jdbc.Driver"/>
                <property name="url" value="jdbc:mysql://localhost:3306/mybatis?        useSSL=true&amp;useUniocode=true&amp;characterEncoding-UTF-8"/>
                <property name="username" value="root"/>
                <property name="password" value="2849569455"/>
            </dataSource>
        </environment>
    </environments>
    <mappers>
       <!--mapper连接到主配置文件-->
<mapper resource="com/wang/userdao/UserMapper.xml"></mapper>
    </mappers>
</configuration>
```

## 第六步写工具类

```java
private static SqlSessionFactory sqlSessionFactory;/*提升作用域*/
    static {
        try {
            /*通过工厂获取sqlsession*/
            String resource="mybatis.xml";
            /*获取mybatisxml*/
            InputStream inputStream = Resources.getResourceAsStream(resource);
             /*通过SqlSessionFactoryBuilder().build(inputStream)new出
             工厂 sqlSessionFactory
             */
           sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
     /*通过工厂获取sql的写法*/
    public static SqlSession getsqlSession(){
        return sqlSessionFactory.openSession();
    }
```

## 第七步测试

```java
  @Test
    public void test01(){
        SqlSession sqlSession = Tool.getsqlSession();
        UserMapperImpl mapper = sqlSession.getMapper(UserMapperImpl.class);
        List<UserMapper> userMappers = mapper.faindAll();
        for (UserMapper user:userMappers){
            System.out.println(user);
        }
        sqlSession.close();

    }

```

## CRUD

namespace中的包名要跟Dao/mapper接口的包名一致

mapper XML文件

选择查询语句：

- id就是对应方法中的名字

resultType：sql语句执行的返回值

parameterType：参数类型

- `cache` – 给定命名空间的缓存配置。
- `cache-ref` – 其他命名空间缓存配置的引用。
- `resultMap` – 是最复杂也是最强大的元素，用来描述如何从数据库结果集中来加载对象。
- `sql` – 可被其他语句引用的可重用语句块。
- `insert` – 映射插入语句
- `update` – 映射更新语句
- `delete` – 映射删除语句
- `select` – 映射查询语句

| 属性          | 描述                                                         |
| ------------- | ------------------------------------------------------------ |
| id            | 在命名空间中唯一的标识符，可以被用来引用这条语句。           |
| parameterType | 将会传入这条语句的参数类的完全限定名或别名。这个属性是可选的，因为 MyBatis 可以通过 TypeHandler 推断出具体传入语句的参数，默认值为 unset。 |
| resultType    | 从这条语句中返回的期望类型的类的完全限定名或别名。注意如果是集合情形，那应该是集合可以包含的类型，而不能是集合本身。使用 resultType 或 resultMap，但不能同时使用。 |
| resultMap     | 外部 resultMap 的命名引用。结果集的映射是 MyBatis 最强大的特性，对其有一个很好的理解的话，许多复杂映射的情形都能迎刃而解。使用 resultMap 或 resultType，但不能同时使用。 |
| flushCache    | 将其设置为 true，任何时候只要语句被调用，都会导致本地缓存和二级缓存都会被清空，默认值：false。 |
| useCache      | 将其设置为 true，将会导致本条语句的结果被二级缓存，默认值：对 select 元素为 true。 |
| timeout       | 这个设置是在抛出异常之前，驱动程序等待数据库返回请求结果的秒数。默认值为 unset（依赖驱动）。 |
| fetchSize     | 这是尝试影响驱动程序每次批量返回的结果行数和这个设置值相等。默认值为 unset（依赖驱动）。 |
| statementType | STATEMENT，PREPARED 或 CALLABLE 的一个。这会让 MyBatis 分别使用 Statement，PreparedStatement 或 CallableStatement，默认值：PREPARED。 |
| resultSetType | FORWARD_ONLY，SCROLL_SENSITIVE 或 SCROLL_INSENSITIVE 中的一个，默认值为 unset （依赖驱动）。 |
| databaseId    | 如果配置了 databaseIdProvider，MyBatis 会加载所有的不带 databaseId 或匹配当前 databaseId 的语句；如果带或者不带的语句都有，则不带的会被忽略。 |
| resultOrdered | 这个设置仅针对嵌套结果 select 语句适用：如果为 true，就是假设包含了嵌套结果集或是分组了，这样的话当返回一个主结果行的时候，就不会发生有对前面结果集的引用的情况。这就使得在获取嵌套的结果集的时候不至于导致内存不够用。默认值：false。 |
| resultSets    | 这个设置仅对多结果集的情况适用，它将列出语句执行后返回的结果集并每个结果集给一个名称，名称是逗号分隔的。 |

sqlSession.commit();增删改一定要提交事物不然没反应

## 万能的Map

假设我们实体类，或者数据库表中的表，字段或者参数过多，我们应该考虑使用Map

接口这样写

```java
int addLoin2(Map<String,Object> map);
```

mapeer.xml

```xml
 <insert id="addLoin2" parameterType="map">
        insert into login(username,password)  value (#{name},#{pwd})
    </insert>
```

```java
  public static void main(String[] args) {

         SqlSession sqlSession = Tool.getsqlSession();
         LoginMapper mapper = sqlSession.getMapper(LoginMapper.class);
        Map<String, Object> objectObjectHashMap = new HashMap<>();
        objectObjectHashMap.put("name","王孟涛涛");//必须跟xml中的value值相同
        objectObjectHashMap.put("pwd",123456);
        mapper.addLoin2(objectObjectHashMap);
        sqlSession.commit();
        sqlSession.close();

        }
```

## 模糊查询

在sql拼接中使用通配符！

```xml
  <select id="getname" resultType="com.wang.pojo.Login">
        select * from login where username like "%"#{username}"%"
    </select>
```

java代码执行的时候，传递通配符。

```java
List<Login> w = mapper.getname("%w%");
```

## 配置解析

- mybatis-config.xml

  > MyBatis 的配置文件会深深影响MyBatis 行为和属性信息

```xml
confi guration (配置)

properties (属性)

settings (设置)

typeAliases (类型别名)

typeHandlers (类型处理器)

objectFactory (对象工厂)

plugins (插件)

envi ronments ( 环境配置)

transacti onManager (事务管理器)

datasource (数据源)

databaseIdProvider ( 数据库厂商标识)

mappers (映射器)
```

#### 环境配置(environments)

mybatis可以配置适应多种环境

**注意：不管有多少个环境，每一个sqlsessionfactory示例只能选取一个**

factory（厂）

environments（环境）

transactionManager（事物管理）

```xml
 <environments default="test"><!--default的名字要和id一样-->
        <environment id="database">
            <!--配置事务的类型-->
            <transactionManager type="JDBC"/>
            <!--配置连接池-->
            <dataSource type="POOLED">
                <!--四个基本信息-->
                <property name="driver" value="com.mysql.jdbc.Driver"/>
                <property name="url"
                          value="jdbc:mysql://localhost:3306/market?useSSL=true&amp;useUniocode=true&amp;characterEncoding-UTF-8"/>
                <property name="username" value="root"/>
                <property name="password" value="2849569455"/>
            </dataSource>
        </environment>
     
     
      <environment id="test">
            <!--配置事务的类型-->
            <transactionManager type="JDBC"/>
            <!--配置连接池-->
            <dataSource type="POOLED">
                <!--四个基本信息-->
                <property name="driver" value="com.mysql.jdbc.Driver"/>
                <property name="url"
                          value="jdbc:mysql://localhost:3306/market?useSSL=true&amp;useUniocode=true&amp;characterEncoding-UTF-8"/>
                <property name="username" value="root"/>
                <property name="password" value="2849569455"/>
            </dataSource>
        </environment>
     
    </environments>
```

transactionManager type="JDBC"有2中事物一种是jdbc一种是managed

dataSource type="POOLED"连接池有三种pooled，unpooled，jndi

什么是池子它能让web响应更快一点

#### 属性（property）

我们可以通过properties属性来实现引用配置文件

这些属性都是可外部配置且可动态替换的，既可以在典型的Java属性文件中配置，亦可通过properties

元素的子元素来传递。[ db.properties]

dp.porperties

```properties
url=jdbc:mysql://localhost:3306/market?useSSL=true&useUniocode=true&characterEncoding-UTF-8
username=root
passwd=2849569455

```

properties必须写在前面，约定了位置的

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <properties resource="dp.properties"></properties>
    <environments default="database"><!--default的名字要和id一样-->
        <environment id="database">
            <!--配置事务的类型-->
            <transactionManager type="JDBC"/>
            <!--配置连接池-->
            <dataSource type="POOLED">
                <!--四个基本信息-->
                <property name="driver" value="com.mysql.jdbc.Driver"/>
                <property name="url"    value="${url}"/>
                <property name="username" value="${username}"/>
                <property name="password" value="${passwd}"/>
            </dataSource>
        </environment>
    </environments>
    <mappers>
       <package name="com.wang.dao"/>
    </mappers>
</configuration>
```

第二种内嵌的方法

```xml
  <properties resource="dp.properties">
        <property name="driver" value="com.mysql.jdbc.Driver"/>
    </properties>


    <property name="driver" value="${driver}"/>
```

优先级先使用外部的dp.porperties配置

#### typeAliases (类型别名)

类型别名是为了java类型设置一个短的别名，它只跟xml有关，存在的意义仅在于用来减少类完全限定名的冗余。

```xml
<typeAliases>
        <typeAlias type="com.wang.pojo.Login" alias="Login"></typeAlias>
    </typeAliases>
```

第二种方式扫描实体包来

```xml
 <typeAliases>
        <package name="com.wang.pojo"/>
    </typeAliases>
```

默认会以类名首字母小（大）写来命名！大写也行但是建议用小写！

第三种注解别名

注意必须要开启扫描包别名

```xml
<typeAliases>
        <package name="com.wang.pojo"/>
    </typeAliases>
```

```java
@Alias("logins")
public class Login {
```

#### settings (设置)

Logging

Mybatis内置的日志工厂提供日志功能，具体的日志实现有以下几种工具：

- SLF4J
- Apache Commons Logging
- Log4j 2
- Log4j
- JDK logging

## 定义表结构

```xml
<resultMao>

</resultMao>
```

## 动态sql







