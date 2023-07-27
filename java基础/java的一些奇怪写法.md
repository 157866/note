# 奇怪的写法

## 内部类

正常new外部类直接new就可以了，**如果要使用内部类方法需要用外部类的实例化去调内部类的方法，**

**内部类可以直接访问外部类的私有属性，这是正常类无法做到的**

如果加了static，因为static先执行

**一个java类中可以有很class类，但是只可以有一个public class**

​                     **这个是局部内部类**

![1604315563469](C:\Users\开飞机的苏克\AppData\Roaming\Typora\typora-user-images\1604315563469.png)

内部类

```java
public  class   test{
    
}
class {
    
}
//一个java类里面可以有很多个class，但是只能有一个public class
```

```java
public class test{
    public void mode{
        class test2{
            
        }
    }
    
}
//这个就是局部内部类
```

```java
public class test{
    private int  id;
    public void demo1(){
        System.out.println("这是外部类的方法");
    }
    class test2{
    public void demo2(){
         System.out.println("这是内部类的方法");
    }
    }
}
```

匿名内部类

```java

        Demo1 demo1 = new Demo1();

        demo1.setStudy(new Study() {
            @Override
            public void study() {
                System.out.println("我是匿名类不类");
            }
        });
         demo1.getStudy().study();
```

匿名对象(只能执行一次)

```java
new demo();
```

