## springMvc

![1607067656093](.\img\1604806935623.png)

![1607067833330](.\img\1607067833330.png)

![1607068555852](.\img\1607068555852.png)

web乱码问题

方法一 手动配置

```java
public class EnecodingFiler implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        servletRequest.setCharacterEncoding("utf-8");
        servletResponse.setCharacterEncoding("utf-8");
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
```

```xml
<filter>
        <filter-name>encoding</filter-name>
        <filter-class>com.wang.font.EnecodingFiler</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>encoding</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
```

方法二 spring的乱码过滤器

```xml
   <filter>
        <filter-name>encoding</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>utf-8</param-value>
        </init-param>
    </filter>
    <filter-mapping>
        <filter-name>encoding</filter-name>
        <url-pattern>/</url-pattern>
    </filter-mapping>
```

注解

@Postmapping 方法上 事务的请求

@RequestMapping 方法上 事务的请求

@Requestparam 传参上 提交域名和方法名称不一样的处理

@RestController 类上 不走视图解析器 走josn rest(休息)

@Controller 类上 默认走视图解析器

@ResponseBody 方法上 面就不会走视图解析器

1. 配置web服务器

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
    <servlet>
        <servlet-name>UserContrller</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <!--加载springmvc-->
            <param-value>classpath:springmvc.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>
    <servlet-mapping>
        <servlet-name>UserContrller</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>
   <!-- spring的乱码过滤器-->
    <filter>
        <filter-name>encoding</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>utf-8</param-value>
        </init-param>
    </filter>
    <filter-mapping>
        <filter-name>encoding</filter-name>
        <url-pattern>/</url-pattern>
    </filter-mapping>
   <!-- <filter>
        <filter-name>encoding</filter-name>
        <filter-class>com.wang.font.EnecodingFiler</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>encoding</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>-->
</web-app>
```

2. 配置springmvc.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/mvc
        http://www.springframework.org/schema/mvc/spring-mvc.xsd
        http://www.springframework.org/schema/context
        https://www.springframework.org/schema/context/spring-context.xsd">



    <!--注解驱动-->
    <mvc:annotation-driven/>
    <!--静态资源过滤器-->
    <mvc:default-servlet-handler/>
    <!--扫描包-->
    <context:component-scan base-package="com.wang.controller"/>
    <!--视图解析器-->
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/jsp/"/>
        <property name="suffix" value=".jsp"/>
    </bean>


</beans>
```

3.controller

```java
@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    /*查询全部的书籍返回一个书籍的展示页面*/
    @RequestMapping("/allBook")
    public String list(Model model){
        List<Books> books = bookService.queryAllBook();
        System.out.println(books);
        /*把集合books放入引号中的books中*/
        model.addAttribute("books",books);
        return "allBook";
    }
```

![1607137767631](C:\Users\开飞机的苏克\AppData\Roaming\Typora\typora-user-images\1607137767631.png)

4.jsp

```html

<%--导入c forEach     each每一个--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
      <%--导入框架--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <title>所有书籍</title>
    <style>
        .row1{
            display: inline-block;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
           <h1>
               <small>书籍列表————————显示所有书籍</small>
           </h1>
            </div>
        </div>
        <div class="row1">
            <div class="col-md-4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toaddbook">添加书籍</a>
            </div>
        </div>
        <div class="row1">
            <div class="col-md-4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/qyeridbook">查找书籍</a>
            </div>
        </div>
        <div class="row1">
            <div class="col-md-4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/borrow/borrowbook">借书记录</a>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <%--通过c：forEache  去遍历集合里面的元素显示出来   items被遍历的对象   var取名--%>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td>${book.bookid}</td>
                        <td>${book.bookname}</td>
                        <td>${book.booknum}</td>
                        <td>${book.detail}</td>
                        <td>
                            <%--${pageContext.request.contextPath}相对地址--%>
                            <a href="${pageContext.request.contextPath}/book/upabook?id=${book.bookid}">修改</a>
                            &nbsp;| &nbsp;
    <%--${pageContext.request.contextPath}走的点击事件 点击删除时给id赋值  相对地址--%>                           
 <a href="${pageContext.request.contextPath}/book/deletbookid?id=${book.bookid}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>
```

Josn

前后端分离时代

```javascript
var user={
naem:"wmt"
    age:14
    sex:"男"
};
var json=JSON.stringfy(user);   转成文本
var obj=JSON.parse(json)   转对象
```

后端部署后端，提供接口提供数据

 josn

前端独立部署，负责渲染后端数据

**思维提升**

自定义工具类

















