# 一、概述：

一个可以使用正则表达式来解析基本类型和字符串（String）的简单文本扫描器。 扫描器：把一些数据识别到计算机中的手段 之前学习的键盘录入只是Scanner扫描器的一种功能。

## 二、构造方法：

### Scanner(File f)：

> 创建一个识别指定文件的内容的扫描器对象【扫描识别指定文件中的基本数据类型数据和字符串数据】

### Scanner(String path)：

> 创建一个识别指定字符串的扫描器对象扫描识别指定字符串中的基本数据类型数据和字符串数据】

### Scanner(InputStream is)：

> 创建一个扫描识别字节输入流中的数据的扫描器对象
>
> **System.in**:就是一个InputStream的对象；从控制台到内存【控制台数据默认连接到键盘】对象就可以识别流中的数据【数据是键盘录入】

# 三、成员方法

## 1、 hasNextXxx():

判断是否还有下一个输入项，其中Xxx可能是任意基本数据类型，返回结果为布尔类型

## 2、nextXxx（）录入基本数据类型

获取下一个输入项，其中Xxx可能是任意基本数据类型，返回对应类型的数据

### 录入基本数据类型的方法：

**nextByte()**:键盘录入byte类型的数字

**nextShort()**:键盘录入short类型的数字

**nextInt()**:键盘录入int类型的数字

**nextLong()**:键盘录入long类型的数字

**nextBoolean()**:键盘录入boolean类型的值

**nextFloat()**:键盘录入float类型的数字

**nextDouble()**:键盘录入double类型的数字

**代码示例**

```java
import java.util.Scanner;

public class ScannerDemo {

	public static void main(String[] args) {
		// 创建扫描器对象
		Scanner sc = new Scanner(System.in);
		// 扫描对应类型的数据
		System.out.println("请输入一个byte类型的数字：");
		byte b = sc.nextByte();
		System.out.println("录入的数字为" + b);
		System.out.println("请输入一个short类型的数字：");
		 short s = sc.nextShort();
		System.out.println("录入的数字为" + s);
		System.out.println("请输入一个int类型的数字：");
		int i = sc.nextInt();
		System.out.println("录入的数字为" + i);
		System.out.println("请输入一个long类型的数字：");
		long l = sc.nextLong();
		System.out.println("录入的数字为" + l);
		System.out.println("请输入一个float类型的数字：");
		float f = sc.nextFloat();
		System.out.println("录入的数字为" + f);
		System.out.println("请输入一个double类型的数字：");
		double d = sc.nextDouble();
		System.out.println("录入的数字为" + d);
		System.out.println("请输入一个boolean类型的值：");
		boolean boo = sc.nextBoolean();
		System.out.println("录入的数字为" + boo);
		
	}
}
1234567891011121314151617181920212223242526272829303132
```

### 总结：

1、录入的数据类型的数据的功能就是**nextXxx()**
2、**Xxx**：就是要录入的数据的数据类型【首字母大写】 3、long和float录入的时候不需要加L 和 F标记

## 3 、next()、nextLine()录入字符串类型

**3.1、next()**：识别一个不带空格的字符串，碰到空格\tab、回车等等结束扫描
**3.2、nextLine()**：获取下一行数据。识别一整行字符串，碰到回车结束扫描

**代码示例**

```java
public static void main(String[] args) {
    //创建Scanner类型的对象（注意要导包）
    //System.in： 标准的输入流，默认指向键盘
    Scanner s = new Scanner(System.in);

    //接受整数
   /* System.out.println("请输入一个整数： ");
    //为了解决（避免）InputMismatchException（录入不匹配）异常，可以加入一个判断
    if (s.hasNextInt()) {  //判断下一个录入的是否是整数，如果是，结果就是true
        int a = s.nextInt();
        System.out.println("a:  "+a);
    }*/

    //接受字符串
    System.out.println("请输入一个字符串： ");
   /* String str1 = s.nextLine(); //结束标记是换行符
    System.out.println("str1:  "+str1);*/

    String str2 = s.next();  //结束标记：空白字符（空格、tab、换行符）
    System.out.println("str2"+str2);
}
123456789101112131415161718192021
```

# Scanner类型的小问题以及解决

1、使用nextInt()录入一个数字后，接着使用同一个扫描器的对象调nextLine()输入一段话 效果： 1、手动录入一个数字 接收展示出来 2、手动录入一个字符串 接收展示出来 **（将会出现无法录入字符串，直接输出的情况）**

```java
public static void main(String[] args) {
	
		Scanner scanner = new Scanner(System.in);
		System.out.println("请输入一个数： ");
		int i = scanner.nextInt();
		System.out.println("您输入的为： " + i);
		
		System.out.println("请输入一个字符串： ");
		String s2 = scanner.nextLine();
		System.out.println("您输入的为： " + s2);
	}

输出结果：
请输入一个数： 
2
您输入的为： 2
请输入一个字符串：   
您输入的为：
123456789101112131415161718
```

2、使用next()录入一个字符串后，接着调用nextLine()方法输入一段话 效果： 1、手动录入一个字符串 接收展示出来 2、再手动录入一个字符串 接收展示出来 **（将会出现无法录入字符串，直接输出的情况）**

```java
public static void main(String[] args) {
	
		Scanner scanner = new Scanner(System.in);
		System.out.println("请输入一个数： ");
		String s1 = scanner.next();
		System.out.println("您输入的为： " + s1);
		
		System.out.println("请输入一个字符串： ");
		String s2 = scanner.nextLine();
		System.out.println("您输入的为： " + s2);
	}
运行结果：
请输入一个数： 
23
您输入的为： 23
请输入一个字符串： 
您输入的为： 
1234567891011121314151617
```

3、使用nextInt()录入一个数字后，接着调用next()方法输入字符串 效果： 1、手动录入一个数字 接收展示出来 2、手动录入一个字符串 接收展示出来

```java
public static void main(String[] args) {
	
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("请输入一个字符串： ");
		String s1 = scanner.nextLine();
		System.out.println("您输入的为： " + s1);
		System.out.println("请输入一个数： ");
		String s2 = scanner.next();
		System.out.println("您输入的为： " + s2);	
	}
运行结果：
请输入一个字符串： 
java
您输入的为： java
请输入一个数： 
20
您输入的为： 20
```