## IO流上

**相对于程序而言，程序向文件或内存写入内容叫做输出流。从文件或内存中读取内容到程序叫做输入流。**

inputSteam 输入流

outputSteam 输出流

**怎么获取外部文档**

注意因为java\是转义符所以需要2个

```java
        /*第一种方法*/
        File file = new File("C:\\Demo1\\wmt.txt");
        System.out.println(file);
        /*第二种方法*/
        File file = new File("C:\\Demo1","wmt.txt");
        System.out.println(file);
        /*第三种方法*/
        File file = new File("C:\\Demo1");
        File file1 = new File(file, "wmt.txt");
        System.out.println(file1);
```

## 创建

怎么新建一个文档

```java
 public static void main(String[] args) throws Exception {
        File file = new File("C:\\Demo1\\wangmengtao.txt");
        boolean newFile = file.createNewFile();// 有异常要抛出
        System.out.println(newFile);
     
     /*如果不存在的路径就会报异常
     java.io.IOException: 找不到该路径
     */ 
     File file = new File("C:\\Demo1\\aaa\\wangmengtao.txt");
        boolean newFile = file.createNewFile();
        System.out.println(newFile);

        /*如果没有路径默认是在文件夹下创建*/
        File file1 = new File("test.txt");
        boolean newFile1 = file1.createNewFile();
        System.out.println(newFile1);
    }
```

怎么新建一个文件夹

```JAVA
  
        //这个方法不能创建多个文件夹
        File file = new File("C:\\Demo1\\aaa");
        boolean mkdir = file.mkdir();
        System.out.println(mkdir);



        //这个方法能创建多个文件夹
        File file = new File("C:\\Demo1\\asa\\aas");
        boolean mkdir = file.mkdirs();
        System.out.println(mkdir);
```

## 删除

删除delete方法

```java
        //文件夹aas中没东西才可以删了
        File file = new File("C:\\Demo1\\asa\\aas");
        boolean mkdir = file.delete();
        System.out.println(mkdir);
```

## 重命名和剪贴

修改文档的名称

```java
//        新建一个文件夹
      File file = new File("file");
        boolean mkdir = file.mkdir();
        System.out.println(mkdir);

       
//      修改文件夹名称
        File file1 = new File("file1");
        boolean b = file.renameTo(file1);
        System.out.println(b);
```

**修改txt的文档**

```java
//        新建一个txt文档
        File file = new File("www.txt");
        boolean newFile = file.createNewFile();
        System.out.println(newFile);
/*修改这个文档的名称*/
        boolean b = file.renameTo(new File("wmt.txt"));
        System.out.println(b);
```

**移动和修改名称**

**总结：如果File改名的路径是在同一个文件夹下面就是改名**

**如果File改名的路径不在同一个文件夹下就是剪贴**

```java
//        新建一个txt文档
        File file = new File("www.txt");
        boolean newFile = file.createNewFile();
        System.out.println(newFile);
/*修改这个文档的名称并移动*/
        boolean b = file.renameTo(new File("C:\\Demo1\\wmt.txt"));
        System.out.println(b);
```

## 判断功能

1.返回值类型不同：前者为String数组，后者为File对象数组 2.数组中元素内容不同：前者为string类型的【文件名】（包含后缀名），后者为File对象类型的【完整路径】

**因此，遍历文件夹中所有文件，包括子文件夹中的文件时，必须用listFiles（）方法**

```java
/*   判断功能
* public boolean isDirectory():判断是否存在目录
* public boolean isFile():判断是否是文件
* public boolean exists():判断是否存在
* public boolean canRead():判断是否可读
* public boolean canWrite():判断是否可写
* public boolean isHidden():判断是否隐藏
* public String list():打印此路径的文件返回的是一个String
* public file listFile():打印此路径的文件夹返回的是一个File
*/
        File file = new File("aaa.txt");
        boolean newFile = file.createNewFile();

        File file1 = new File("bbb");
        boolean mkdir = file1.mkdir();

        //public boolean isDirectory():判断是否存在目录
        //如果是文本的话就不是目录，是文件夹就是目录
        boolean src = file.isDirectory();
        System.out.println(src);

        //public boolean isFile():判断是否是文件
        src= file.isFile();
        System.out.println(src);

        //public boolean exists():判断是否存在
        src=file.exists();
        System.out.println(src);

        //public boolean canRead():判断是否可读
        src= file1.canRead();
        System.out.println(src);

        //public boolean canWrite():判断是否可写
        src=file1.canWrite();
        System.out.println(src);

        //public boolean isHidden():判断是否隐藏
        src=file.isHidden();
        System.out.println(src);
```

## File的获取功能

**什么是绝对路径：文件在系统磁盘上的路径，从盘符开始，一直到文件或者到文件夹的名称就是绝对路径**

**什么是相对路径：文件相当于当前文件夹的路径，就是相对路径**

```java
/*
    *获取功能：
    *public String getAbsolutePath();获取绝对路径
    *public String getpath();获取相对路径
    *public String getname();获取名称
    *public long length();获取长度，字节数，
    *public long lastModified();获取最后一次的修改事件，毫秒值
    */

    public static void main(String[] args) {
        File file = new File("bbb");
        boolean mkdir = file.mkdir();
        System.out.println(mkdir);
        //public String getAbsolutePath();获取绝对路径
        File absoluteFile = file.getAbsoluteFile();
        System.out.println(absoluteFile);
        //public String getpath();获取相对路径
        String path = file.getPath();
        System.out.println(path);
        //public String getname();获取名称，不会带路径
        String name = file.getName();
        System.out.println(name);
        //public long length();获取长度，字节数，文件夹是没有长度的只有文件才有
        long length = file.length();
        System.out.println(length);
        //public long lastModified();获取最后一次的修改事件，毫秒值
        long l = file.lastModified();
        System.out.println(l);
         /*Date是util包下面的*/
        Date time=new Date(l);
        /*以时间日期来打印*/
        System.out.println(time.toLocaleString());
         /*打印此路径的所有文件和文件夹*/
        File file = new File("D:\\BaiduNetdisk");
        String[] list = file.list();
        for (String aryy:list) {
            System.out.println(aryy);
        }
        System.out.println("===============================");
         /*只打印此路径的文件夹*/
        File[] files = file.listFiles();
        for (File file1:files) {
            System.out.println(file1);
        }
    }
```

## 小小的练习题

C:\Users\34912\Desktop\图书·管理系统备份\book\web

把此路径的后缀为.jpg的图片打印出来绝对位置

**注意只有file类才能使用getabsolutepath**

```java

/*  
File file = new File("C:\\Users\\34912\\Desktop\\图书·管理系统备份\\book\\web");
        String[] list = file.list();
        for (String file1:list) {
            if(file1.endsWith(".jpg")){
                System.out.println(file1);
            }
        }*/
        File file = new File("C:\\Users\\34912\\Desktop\\图书·管理系统备份\\book\\web");
        File[] files = file.listFiles();
        for (File file2:files) {
            String name = file2.getName();
            if(name.endsWith(".jpg")){
                System.out.println(file2.getAbsolutePath());
            }
        }
```

小作业把文件夹里面的文件批量修改

**indexeof方法索引从哪里开始**

```java
 public static void main(String[] args) {
        File file = new File("C:\\Users\\34912\\Desktop\\java-IO流的测试文件");
        File[] files1 = file.listFiles();
        for (File files:files1) {
            String name = files.getName();
            int i = name.indexOf("-");
//       自闭区间包头不包尾 截取前面的名称  加几相当于从第几个元素开始计算的，从第几个元素结尾
            String substring = name.substring(i + 1, i+5);
            int i1 = name.lastIndexOf(".");
            String substring1 = name.substring(i1);
            //把截取出来的名字进行拼接
            String newName=substring+substring1;
            //这里如果不写之前的名字就是相当于剪切
            File file1 = new File(file, newName);
            boolean b = files.renameTo(file1);
            System.out.println(b);
        }
```

## IO流的分类

> 可以按照流向来分

**流向：不管是输入还是输出都是相当于你的程序而言的**

- 输入流inputSteam （读 read）
- 输出流outputSteam （写 write）

> 可以按照传输形式来分

- 字节流 图片，视频，音频

 字节输入流： InputSteam

 字节输出流; OutputSteam

- 字符流 abc

 字符输入流：Reader

 字符输出流：Writer

**不管是字节还是字符流，底层流动的都是字节流**

IO流上的小题总结

在一个文件夹中输入hello，word

字节输出流Output Steam

Output Steam的子类

- File Output Steam（File file）创建一个指定的File对象写入数据的文件输出流。
- File Output Steam (String name) 创建一个向具体有指定名称的文件中输入数据的输出文件流

拓展小知识

1.找到目标文件

File file = new File("E:\\aa\\bb\\a.txt");

2.搭建数据通道

**FileOutputStream fot = new FileOutputStream(file);先清空目标文件中的数据，再将新的数据写出到硬盘。**

**FileOutputStream fot = new FileOutputStream(file, true);向文件中数据的末尾追加需要写出的数据内容。**

3.传输数据

fileOutputStream.write( byte[] bytes);//将需要写出(输出)的数据以byte数组的形式传输出去。

fileOutputStream.write( byte[] bytes, int off, int len);

bytes：需要写出的数据，需要以byte数组的形式传输。

off：数组中的下标，表示从数组中索引值off出开始写出数据。

len：写出多少个字节的数据。

**4.释放资源**

fot.close();

```java
 public static void main(String[] args) throws IOException {
        //创建输出流，使用FileOutputStream(name)类来构造
        //生产输出流的管道
        //如果没有文件会帮你创建
        FileOutputStream fileOutputStream = new FileOutputStream("C:\\Users\\34912\\Desktop\\java-IO流的测试文件\\w-am.txt");
       //输入要输入的内容这个是字符流，我们要转换成字节流
        String demo="hello,word";
        //通过get.Bytes()的方法来转换成字节流放入byte数组中，
        byte[] bytes = demo.getBytes();
        System.out.println(Arrays.toString(bytes));
        //通过fileOutputStream的一个方法write把数据写入txt
        fileOutputStream.write(bytes);
        //关闭管道
        fileOutputStream.close();

    }
```

## IO流下

System.in的类型可以归结为节点流、字节流、输入流； InputStreamReader这个对象是处理流，字符流，输入流； BufferedReader的类型是缓冲处理流、字符流、输入流。

InputStream is = [System.in](http://system.in/);//键盘输入流
InputStreamReader isr = new InputStreamReader(is);//字节流转换为字符流 BufferedReader bufr = new BufferedReader(isr);//把字符流添加到缓冲流

## 缓冲输入流

**BufferedReader的readLine()方法是阻塞式的, 如果*到达流末尾, 就返回null,* 但如果client的socket末经关闭就销毁, 则会产生IO异常. 正常的方法就是使用socket.close()
关闭不需要的socket.**

翻译：**buffered是缓冲**   **reader读取**

小练习读取文件中的字符

**FileInputStream ：以字节流方式读取；**

**FileReader ：把文件转换为字符流读入；**

InputStream提供的是字节流的读取，而非文本读取，这是和Reader类的根本区别。用Reader读取出来的是char数组或者String ，使用InputStream读取出来的是byte数组。

```java
public static void main(String[] args) throws IOException {
        //创建BufferedReader对象通过有参构成生成一个缓冲处理流
        BufferedReader bufferedReader = new BufferedReader(new FileReader("C:\\Users\\34912\\Desktop\\java-IO流的测试文件\\w-am.txt"));
        //设置一个字符流来存储
        String name;
        //readLine()方法是阻塞式的, 如果到达流末尾, 就返回null,
        while((name=bufferedReader.readLine())!=null){
            System.out.println(name);
        }
        bufferedReader.close();
    }
```

带行号的字节缓冲输入流（Line是线的意思）

LineNumberReader类的特有方法

getLineUnmder：获取行号默认是从1开始

setLineUnmder：设置行号开始的数字

```java
public static void main(String[] args) throws IOException {
        LineNumberReader lineNumberReader = new LineNumberReader(new FileReader("C:\\Users\\34912\\Desktop\\java-IO流的测试文件\\w-am.txt"));
        String name;
        lineNumberReader.setLineNumber(10);//可以设置行号让他从10开始
        while((name=lineNumberReader.readLine())!=null){
            System.out.println(lineNumberReader.getLineNumber()+":"+name);//默认情况getlinenunber方法获取行号默认从1开始
        }
        lineNumberReader.close();
    }
```

## 数据输入输出流

- DataInputSteam
- DataOutputSteam

概念解释：数据输入输出流是基本的数据**输入输出流的子类**（inputSteam/outputSteam）

数据输出流允许程序以**适当的方式**将数据写入**输出流当中**，然后，应用程序可以使用数据输入流将数据读入

为什么是适当的方式因为使用DataOutputSteam输出流输出出来是看不懂的，必须使用对应的DataInputSteam输入才能看得懂

- **DataOutputSteam**

可以以适当的方式把数据写到流中

数据：8大基本类型，字符串类型

- **DataInputSteam**

可以以适当的方式把数据读到程序中来

数据：8大基本类型，字符串类型

**DataOutputSteam**  基本的数据输入到文本中

```java
   public static void main(String[] args) throws IOException {
        DataOutputStream dataOutputStream = new DataOutputStream(new FileOutputStream("demo.txt"));
        /*八大基本类型*/
        dataOutputStream.writeByte(100);
        dataOutputStream.writeChar('w');
        dataOutputStream.writeShort(101);
        dataOutputStream.writeInt(102);
        dataOutputStream.writeFloat(111);
        dataOutputStream.writeDouble(1552);
        dataOutputStream.writeLong(12345);
        dataOutputStream.writeBoolean(true);
        /*字符串*/
        dataOutputStream.writeUTF("hello,word");
    }
```

DataInputSteam 基本的数据类型输出到程序

注意：写入和输出要一一对应

**顺序不能乱**

```java
 public static void main(String[] args) throws IOException {
        DataInputStream dataInputStream = new DataInputStream(new FileInputStream("demo.txt"));
        byte aByte = dataInputStream.readByte();
        char readChar = dataInputStream.readChar();
        short readShort = dataInputStream.readShort();
        int readInt = dataInputStream.readInt();
        float readFloat = dataInputStream.readFloat();
        double readDouble = dataInputStream.readDouble();
        long readLong = dataInputStream.readLong();
        boolean readBoolean = dataInputStream.readBoolean();
        String s = dataInputStream.readUTF();
        System.out.println(aByte);
        System.out.println(readChar);
        System.out.println(readShort);
        System.out.println(readInt);
        System.out.println(readFloat);
        System.out.println(readDouble);
        System.out.println(readLong);
        System.out.println(readBoolean);
        System.out.println(s);
        dataInputStream.close();

    }
```

> 应用场景

运用于网络编程中，

客户端----服务端

链接：流 IO

客户端写-----服务端读

## 内存操作流

> 内存操作流一般只处理临时信息，因为临时信息不需要保存，使用之后就可以删除。

- 操作字节数组

 ByteArrayOutputSteam();

 ByteArrayInputSteam(byte[] buf);

- 操作字符数组

 CharArrayWrite

 CharArrayReader

- 操作字符串

 String write

 String Reader

字节内存流

```java
 public static void main(String[] args) throws IOException {
        //构造内存输出流
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        //输入内存
        byteArrayOutputStream.write("hello,word".getBytes());
        //关闭流
        byteArrayOutputStream.close();
        //取出数据
        byte[] bytes = byteArrayOutputStream.toByteArray();
        System.out.println(Arrays.toString(bytes));
        System.out.println(new String(bytes));
        //从这里可以看出内存输入流很鸡肋不需要懂可以把内容中的对象拿出来

        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
        int bayte;
        while((bayte=byteArrayInputStream.read())!=-1){
            System.out.print((char)bayte);
            System.out.println(new String(bayte));
        }
    }
```

字符内存流

```java
  public static void main(String[] args) throws IOException {
        CharArrayWriter charArrayWriter = new CharArrayWriter();
        char[] charayy={'h','e','l','l','o'};
        charArrayWriter.write(charayy);

        charArrayWriter.close();
        char[] chars = charArrayWriter.toCharArray();
        System.out.println(new String(chars));
        CharArrayReader charArrayReader = new CharArrayReader(chars);
        int i;
        while ((i=charArrayReader.read())!=-1){
            System.out.print((char)i);
        }
    }
```

字符串内存流跟上面操作基本相同

## 打印流

打印流只有输出没有输入

> 分类：

- 字节打印流(pintSteam)

 字节打印流继承了OutputSteam

- 字符打印流(pinWriter)

 字符打印流继承了writer



> 打印流的特殊功能：

- 可以打印所有的类型（包括基本类型和引用类型） 如果是引用类型打印的就是该对象的toString方法
- 可以自动刷新 flush

字节打印流：printWriter

注意要刷新不然数据进不去

```java
 public static void main(String[] args) throws FileNotFoundException {
        PrintWriter printWriter = new PrintWriter("C:\\Users\\34912\\Desktop\\java-IO流的测试文件\\w-am.txt");
        printWriter.println(123);
        printWriter.println(1.22f);
        printWriter.println("wmtio");
        printWriter.println(true);
        printWriter.println(new Object());
          /*刷新*/
        printWriter.flush();
        printWriter.close();

    }
```

自动刷新

注意：加true的地方

```java
 public static void main(String[] args) throws IOException {
        //字节流  打开自动刷新
        PrintWriter printWriter = new PrintWriter(new FileOutputStream
                /*第一个true是，是否删除之前的内容，第二个true是打开刷新*/
                ("C:\\Users\\34912\\Desktop\\java-IO流的测试文件\\w-am.txt",true),true);
        //字符流 打开自动刷新
        PrintWriter printWriter1 = new PrintWriter(new FileWriter
                ("C:\\Users\\34912\\Desktop\\java-IO流的测试文件\\w-gm.txt", true),true);
        printWriter.println("字节流，开始打印，打开刷新");
        printWriter1.println("字符流，开始打印，打开刷新");

    }
```





