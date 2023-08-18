# Json 



把JSON 解析为JAVABean的过程叫做 **反序列化**

把JAVABean解析为JSON的过程叫做 **序列化**



常用的用于解析JSON的第三方库有：

- Jackson
- Gson
- Fastjson



本次使用Jackson

1. 导包

```xml
   <dependency>
      <groupId>com.fasterxml.jackson.core</groupId>
      <artifactId>jackson-core</artifactId>
      <version>2.15.2</version>
    </dependency>
    <dependency>
      <groupId>com.fasterxml.jackson.core</groupId>
      <artifactId>jackson-databind</artifactId>
      <version>2.15.2</version>
    </dependency>
```





案例 将JSON 转成 javaBean 反序列化

创建测试类型

```java
package com.wmt.json;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;


public class JsonDemo {
    public static void main(String[] args) throws JsonProcessingException {
        String src = "{\n" +
                "    \"name\": \"Java核心技术\",\n" +
                "    \"pubDate\": \"2016-09-01\",\n" +
                "    \"test\": \"2016-09-01\"\n" +
                "}";
        // 		.registerModule( new JavaTimeModule());  注册解析特定的java对象
        ObjectMapper mapper = new ObjectMapper().registerModule( new JavaTimeModule());
		//        反序列化时忽略不存在的java属性
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        //        开启下划线和驼峰相互映射
        mapper.setPropertyNamingStrategy(com.fasterxml.jackson.databind.PropertyNamingStrategy.SNAKE_CASE);
        JsonObject jsonObject = mapper.readValue(src, JsonObject.class);
        System.out.println(jsonObject);
    }
}

```



 只需要引入标准的JSR 310关于JavaTime的数据格式定义至Maven：

```xml
    <dependency>
      <groupId>com.fasterxml.jackson.datatype</groupId>
      <artifactId>jackson-datatype-jsr310</artifactId>
      <version>2.15.2</version>
    </dependency>
```



创建JsonObject

```java
package com.wmt.json;

import java.math.BigDecimal;
import java.time.LocalDate;

public class JsonObject {
    public String name;
    // 特定的java对象
    public LocalDate pubDate;

    public BigDecimal price;

    @Override
    public String toString() {
        return "JsonObject{" +
                "name='" + name + '\'' +
                ", pubDate=" + pubDate +
                ", price=" + price +
                '}';
    }
}

```



序列化

如果把JavaBean变为JSON，那就是序列化。要实现JavaBean到JSON的序列化，只需要一行代码：

```java
   		// 		.registerModule( new JavaTimeModule());  注册解析特定的java对象
        ObjectMapper mapper = new ObjectMapper().registerModule( new JavaTimeModule());
		//        反序列化时忽略不存在的java属性
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        //        开启下划线和驼峰相互映射
        mapper.setPropertyNamingStrategy(com.fasterxml.jackson.databind.PropertyNamingStrategy.SNAKE_CASE);
		//    	  序列化  jsonObject 是需要序列化的对象
		String json = mapper.writeValueAsString(jsonObject);
```





有些时候，内置的解析规则和扩展的解析规则如果都不满足我们的需求，还可以自定义解析。

举个例子，假设`Book`类的`isbn`是一个`BigInteger`：

```
public class Book {
	public String name;
	public BigInteger isbn;
}
```

但JSON数据并不是标准的整形格式：

```
{
    "name": "Java核心技术",
    "isbn": "978-7-111-54742-6"
}
```

直接解析，肯定报错。这时，我们需要自定义一个`IsbnDeserializer`，用于解析含有非数字的字符串：

```
public class IsbnDeserializer extends JsonDeserializer<BigInteger> {
    public BigInteger deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        // 读取原始的JSON字符串内容:
        String s = p.getValueAsString();
        if (s != null) {
            try {
                return new BigInteger(s.replace("-", ""));
            } catch (NumberFormatException e) {
                throw new JsonParseException(p, s, e);
            }
        }
        return null;
    }
}
```

然后，在`Book`类中使用注解标注：

```
public class Book {
    public String name;
    // 表示反序列化isbn时使用自定义的IsbnDeserializer:
    @JsonDeserialize(using = IsbnDeserializer.class)
    public BigInteger isbn;
}
```

类似的，自定义序列化时我们需要自定义一个`IsbnSerializer`，然后在`Book`类中标注`@JsonSerialize(using = ...)`即可。