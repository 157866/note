# spring

## 1.1简历

1. 春天........》软件行业的春天
2. spring的理念使现在的技术更加容易使用，本身就是一个大杂烩，整合了现有技术框架
3. SSH
4. SSM

官网注解：https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-p-namespace

中文版官网注解：https://www.docs4dev.com/docs/zh/spring-framework/5.1.3.RELEASE/reference

官网：https://spring.io/projects/spring-framework#learn

Github：https://github.com/spring-projects/spring-framework

```xml
<!-- https://mvnrepository.com/artifact/org.springframework/spring-webmvc -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>5.2.10.RELEASE</version>
</dependency>
    <dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-jdbc</artifactId>
    <version>5.2.10.RELEASE</version>
</dependency>
```

**在配置文件加载的时候，容器中管理的对象就已经初始化了**

## 构造器注入

## 依赖注入

**所有的属性都要放在双引号之中这是xml配置文件的规则**

```java
    private String name;
    private Address address;
    private String[] books;
    private List<String> hobbys;
    private Map<String,String> card;
    private Set<String> games;
    private String wife;
    private Properties info;
```

```xml
<bean id="User" class="org.example.User">     
        <property name="name" value="wmt"/>
        <property name="books" >
            <array>
                <value>云边有个小卖部<alue>   
                <value>人间失格<alue>
                <value>深海<alue>
            </array>
        </property>

        <property name="hobbys">
            <list>
                <value>看电影<alue>
                <value>看动漫<alue>
            <st>
        </property>
        <property name="card">
            <map>
                <entry key="你我山巅自相逢" value="25484555"></entry>
                <entry key="天" value="1454545455"></entry>
            </map>
        </property>

        <property name="games">
            <set>
                <value>lol<alue>
                <value>cf<alue>
                <value>cs<alue>
            <t>
        </property>

        <property name="wife">
            <null></null>

        </property>

        <property name="info">
            <props>
                <prop key="学号">125454555</prop>
                <prop key="id">11414</prop>
                <prop key="性格">男</prop>
            </props>
        </property>
    </bean>
```

**引用类注入**

```xml
 <bean id="user" class="User">
        <property name="name" value="王"></property>
        <property name="stuby" value="孟"></property>
        <property name="tmei" value="6点"></property>
    </bean>
    <bean id="student" class="student">
        <property name="a" value="1"></property>
        <property name="b" value="2"></property>
        <property name="user" ref="user"></property><!--ref导入引用类型上面的user-->
    </bean>
```

## 扩展注入

p注入

```xml
   xmlns:p="http://www.springframework.org/schema/p"


<bean name="p-namespace" class="com.example.ExampleBean"
        p:email="someone@somewhere.com"/>


```

c注入

```xml

   xmlns:c="http://www.springframework.org/schema/c"

  <bean id="beanOne" class="x.y.ThingOne" c:thingTwo-ref="beanTwo"
        c:thingThree-ref="beanThree" c:email="something@somewhere.com"/>

</beans>
```

## bean的作用域（**Scope**）范围

单例：bean的默认是scope=singleton无论创建多少个都是同一个对象

```xml
<bean id="accountService" class="com.something.DefaultAccountService"/>

<!-- the following is equivalent, though redundant (singleton scope is the default) -->
<bean id="accountService" class="com.something.DefaultAccountService" scope="singleton"/>
```

bean中scope=prototype每一个次从容器中get的时候拿到一个新对象。

```xml
<bean id="accountService" class="com.something.DefaultAccountService" scope="prototype"/>
```

其余的三个session，application，websocket，都只能在web里面使用

## bean的自动装配

**autowire=byname**

*通过名字来装配如果找不到一样名字会报错*

spring的xml配置文件

```xml
 <bean id="student" class="student"></bean>
    <bean id="teachaer" class="Teacher"></bean>
    <bean id="person" class="Person" autowire="byName"><!--autowire自动装配按照名字来-->
        <property name="name" value="王孟涛" ></property>
    </bean>
```

测试

```java
ApplicationContext Context = new ClassPathXmlApplicationContext("spring-byname.xml");
        Person person = Context.getBean("person", Person.class);
           person.getStudent().student1();
```

**autowire=bytype**

**通过类型来装配如果类型一样的有2个就要报错**

```xml
 <bean id="student" class="student"></bean>
    <bean id="teachaer" class="Teacher"></bean>
    <bean id="person" class="Person" autowire="byType"><!--autowire自动装配按照名字来-->
        <property name="name" value="王孟涛" ></property>
    </bean>
```

测试

```java
ApplicationContext Context = new ClassPathXmlApplicationContext("spring-byname.xml");
        Person person = Context.getBean("person", Person.class);
           person.getStudent().student1();/*这里没搞懂*/
```

## 注解装配

jdk1.5就支持注解了，

spring2.5就支持注解了。

要使用注解须知：

1. 导入约束
2. 配置注解支持
3. xml扫描<context：component-scan base-package=“扫描的位置”/>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:context="http://www.springframework.org/schema/context"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context
        https://www.springframework.org/schema/context/spring-context.xsd">

    <context:annotation-config/>

</beans>
```

@Component这个注解等同于bean的功能

有一个value的属性也就是相当于id，

 位置：在这个类的上面写，

@Repository（用在持久层上面）：放在实现类Dao上面Dao是可以访问数据库的

@Service（用在业务层）；放在service层上面

@Controller（用在控制层上面）放控制器上面的，它能接受用户的提交的参数也可以显示处理结果

**以上三个注解跟@Component有一样的功能都是创建bean的，但是这三个注解有额外的功能**

**@Repository @Service @Controller控制分层的**       如果不取名默认是首字母小写

#### 赋值

@Value 是一个String类型，用来赋一些简单值

使用位置：1.在属性上面无需要set方法推荐使用

2. 在set方法上面

@Autowired 中通常是给引用类型赋值，使用的是自动注入原理，支持byname和by type 默认是bytype赋值

位置1.在属性上面，无需set方法

2. 在set方法上面赋值

## 切面

什么时候考虑用Aop技术

1. **当你要给系统中存在的一个类修改功能，但是原有的类功能不完善，但是你还有代码，就用aop、**

2. **你要给很多类加一个相同功能就使用aop**

AOP面向切面编程，面向切面编程是是从动态角度考虑程序运行过程

AOP的底层实现就是采用动态代理模式来实现，采用了2种代理：jdk的动态代理，与 CGLIB的动态代理、

**实现方式：**

**jdk动态代理：**使用jdk中的proxy，Method， InvocaitonHanberl创建代理对象、

jdk代理必须要求目标类实现接口

**cglib动态代理**：第三方工具库，创建代理对象，原理是继承，通过继承目标类，创建子类，

子类就是代理对象，要求目标不能是final的，方法也不能是final的。

**动态代理的作用**

1. 在目标类源代码不改版的情况去增加功能，

2. 还可以减少重复代码

3. 专注业务逻辑代码
4. 解耦合，让你业务功能和日志分离

AOP：面向切面编程，基于动态代理的，可以使用jdk和cglib两种代理方式，

**有接口时默认是jdk的代理getbean的类型转换应该是接口不是接口的实现类因为要把接口当成动态代理对象**

**有接口也可以使用cglib的代理， aop:config proxy-target-class="true"       getbean的类型转化应该是接口的实现类**

aop就是动态代理规范化，把动态代理的实现步骤，方式都定义好要开发人员去用统一的方式，就用动态代理

**Aspect（方面）**

给你目标增加的功能，就是切面，日志和事务都是切面

**切面的三要素**

切面的功能代码.使用aspect表示给业务增加功能，一般用日志输出，事务，权限等这些都是事务

切面的执行位置.使用pointcut表示切面执行的位置（point点）

切面的执行时间，使用Advice表示时间，是在目标方法前还是目标方法后

**切面的使用步骤**

导入框架aspects框架

```xml
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-aspects</artifactId>
            <version>5.2.5.RELEASE<ersion>
        </dependency> 
```

**配置xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context
        https://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/aop
        https://www.springframework.org/schema/aop/spring-aop.xsd">
    <!-- 配置切面的Bean -->


     <context:component-scan base-package="com.wang.Aop"></context:component-scan>
       <!--有接口的默认情况是使用jdbc技术没有接口使用cglib技术当有接口还想使用cglib就用这个-->
     <aop:aspectj-autoproxy proxy-target-class="true"/>
    <!--重点-->
</beans>

```

**注解的使用**

@Before 前置通知 在目标方法前

@AfterReturning 后置通知 注解有retuning属性

@Around 环绕通知

@AfterThrowing 异常通知

@After 最终通知不管怎么都要被执行

@Aspect 表示这是一个切面

@Pointcut 辅助定义切入点，如果项目有多个切入点重复，就可以使用

**切面的切入表达式**（execution执行）

execution（访问权限  **方法返回值**  **方法声明 **   **（参数）** 异常类型）

```java
              /*表示全切*/
@Before(value = "execution( * *(..))")
```

```java
                             /*精确切*/
@Before(value = "execution(public void com.wang.Aop.UserImpl.user(String))")
```

**JoinPoint方法的定义 **              **P是大写注意**

作用是：可以通知方法中获取方法执行时的信息，列如方法名称，方法实参

如果你的切面功能中需要用到方法的信息就加入joinpoint

这个joinpoint的值是由框架赋予的，**必须是第一个位置参数**

```java
public void myBefore(JoinPoint jp){
    System.out.println(jp.getSignature());/*获取地址*/
    System.out.println(jp.getSignature().getName());/*获取方法名字*/
    Object[] args = jp.getArgs();/*获取方法里面的实参以集合的方式返还*/
    for(Object a:args){
        System.out.println("参数="+a);
    }
```

@Before 前置通知

在目标方法前

无需返还至

```java
@Before(value = "execution( * *(..))")
```

@AfterReturning 后置通知 after（在 .....之后）Returning （返回）

注解有retuning属性返回值

被切对象必须要有参构造

必须要有返回值

```java
@AfterReturning(value = "execution(public String com.wang.AopAft.UserImpl2.user2(String))",
    returning = "a")
```

@Around 环绕通知

```java
@Around(value = "execution(* *..AopAroumdImpl.dother(..))")
    public Object aspect(ProceedingJoinPoint pjb) throws Throwable {
       Object a=null;/*这里必要要赋值*/
        System.out.println("我是环绕通知前"+ new Date());

        String name=null;

        Object[] args = pjb.getArgs();/*获取数组*/
        if(args!=null&&args.length>1){
            name=(String) args[0];
        }
        if ("wmt".equals(name)){
            a=pjb.proceed();//相当于执行被切方法
        }else{
            System.out.println("错误"+name);
        }

        System.out.println("我是后置通知");

        return a;/*这个的返回值就是调用方法时的反回值*/
    }
```

## spring的事务处理

你的业务需要什么样的事务，说明需要事务的类型、

说明方法需要的事务

事务的隔离级别有4个

DEFAULT:采用DB默认来隔离事务的级别。mysql 的默认为 REPEATABLE_READ： Oracle默认为READ_COMMITTED.

1. READ_UNCOMMITTED:    读未提交。未解决任何问题。
2. READ_COMMITTED:  读以提交，解决脏读，存在不可重复读与幻读。
3. REPEATABLE_READ：可重复读，解决脏读，不可重复读，存在幻读。
4. SERIALIZABLE:串行化，不存在并发问题

事务的超时时间：表示一个方法最长执行时间，如果方法执行超过了时间，就事务回滚。单位是秒，整数值，默认是-1、

事务的传播行为：控制业务方法是不是有事务的，是什么样子的事务，7个传播行为，表示你的业务方法调用时，事务在方法之间是如何使用的。

PROPAGATION_REQUIRED 如果有的事务就加入，没有就自己创建一个

PROPAGATION-REQUIRES_NEW 会新建一个事务 原来的事务会被暂停先执行新建事务执行完了继续执行原来的事务

PROPAGATION-SUPPORTS 有无事务都行

以上三个要掌握

PROPAGATION-MANDATORY

PROPAGATION-NESTED

PROPAGATION-NEVER

PROPAGATION-NOT_SUPPORTED

1. 在xml里面声明事务

```xml
 <!--声明事物-->
    <bean id="TransactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="myDataSource"></property>

     </bean>
   <!--TransactionManager代表事物管理器的id-->
    <tx:annotation-driven transaction-manager="TransactionManager"/>
```

2. 自定义异常

```java
package org.wangmengtao.exce;
         /*自定义的异常*/
public class Not extends RuntimeException{
    public Not() {
        super();
    }

    public Not(String message) {
        super(message);
    }
}

```

3. 在方法上面加注解

```java

    @Transactional
    @Override
    public void buy(Integer id, Integer comnum) {
        System.out.println("buy方法开始");
        Sales sales = new Sales();
        sales.setComid(id);
        sales.setNum(comnum);
        salesMapper.interSales(sales);

        Commodity seletid = commodityMapper.seletid(id);
        if(seletid==null){
           throw new NullPointerException(id+"商品不存在");
        }else if (seletid.getComnum() < comnum)
        {
            throw new Not("商品数量不够");
        }
        Commodity buycommodity = new Commodity();
        buycommodity.setId(id);
        buycommodity.setComnum(comnum);
        commodityMapper.updateCom(buycommodity);
        System.out.println("buy方法结束");
    }
```

4. 测试事务的处理是用jdbc原理所以应该调用接口强转成实例接口







## spring Bean的生命周期

- 创建前的准备
  - Bean在创建之前要从上下文和一些配置中取查找Bean有关的扩展和实现，init-method容器在初始化bean的时候会调用
- 创建实例化
  - 通过反射去创建实列化对象，并且会扫描和解析Bean声明的一些属性
- 依赖注入
  - 如果被实例化的Bean存在依赖其它Bean的一种情况，则需要对这些依赖的Bean进行对象注入 比如@Autowired @Setter
- 容器缓存
  - 主要是把Bean保存到容器以及spring的缓存中 这个阶段就会调用init-methods
- 销毁实例
  - spring应用上下文被关闭的时候那么这个上下文所有的bean都会被销毁，如果有bean实现了像DisposableBean的接口或者配置了Destory-methods 属性的方法会在这个阶段被调用





## AOP

> AOP的概念

AOP, Aspect Oriented Programming,面向切面编程,是对面向对象编程OOP的升华。OOP是纵向对一个事物的抽象，一个对象包括静态的属性信息，包括动态的方法信息等。而AOP是横向的对不同事物的抽象，属性与属性、方法与方法、对象与对象都可以组成一个切面， 而用这种思维去设计编程的方式叫做面向切面编程。



- 动态代理技术

在运行期间，对目标对象的方法进行增强，代理对象同名方法内可以执行原有逻辑的同时嵌入执行其他增强逻辑或其他对象的方法