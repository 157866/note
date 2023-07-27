# Golang

[golang官网

[[Go 语言之旅 (go-zh.org)](https://tour.go-zh.org/welcome/1)

 api ：https://studygolang.com/pkgdoc

[[Go语言标准库文档中文版 | Go语言中文网 | Golang中文社区 | Golang中国 (studygolang.com)](https://studygolang.com/pkgdoc)](https://golang.org/)

## GOLang 基础



### Go入门



#### GOLang 文件目录

> goProject\src\go_code\project01
>
> main                                    project01 下面 和package同级
>
> package

![image-20230704130401049](..\golang_study\imgs\image-20230704130401049.png)



#### 第一个程序

注意：P是大写和Java不一样

> 第一个程序

```go
package main
import "fmt"

func main(){
	fmt.Println("hello")
}
```

package main 爆红   原因我修改了全局配置 GOPATH 的路径和win中不一样

解决方法

​	- go env -w GO111MODULE=auto   在 $GOPATH/src 外层且根目录有 go.mod 文件时，开启模块支持；否者无模块支持。

​	- 或者使用去修改GOPATH路径



> 通过 go build  命令对go文件进行编译，生成.exe文件    可以通过加-o来自定义文件名称但是必须以.exe来当后缀必须在win中
>
> 也可以 通过 go run来运行 .go的代码

```

D:\goProject\src\go_code\project01\main>go build hello.go

D:\goProject\src\go_code\project01\main>dir
 驱动器 D 中的卷是 新加卷
 卷的序列号是 EA5E-5E33

 D:\goProject\src\go_code\project01\main 的目录

2023/07/04  13:52    <DIR>          .
2023/07/04  13:52    <DIR>          ..
2023/07/04  13:52         1,968,128 hello.exe             # 会生成一个.exe文件可执行的
2023/07/04  13:51                68 hello.go
               2 个文件      1,968,196 字节
               2 个目录  7,793,217,536 可用字节

D:\goProject\src\go_code\project01\main>hello.exe
hello

#自定义名称
D:\goProject\src\go_code\project01\main>go build -o myCode.exe hello.go

D:\goProject\src\go_code\project01\main>dir
 驱动器 D 中的卷是 新加卷
 卷的序列号是 EA5E-5E33

 D:\goProject\src\go_code\project01\main 的目录

2023/07/04  14:19    <DIR>          .
2023/07/04  14:19    <DIR>          ..
2023/07/04  13:52         1,968,128 hello.exe
2023/07/04  13:51                68 hello.go
2023/07/04  14:19         1,968,128 myCode.exe    #成功生成
               3 个文件      3,936,324 字节
               2 个目录  7,791,247,360 可用字节
```



#### GO 执行流程分析

- 如果对源码编译后，在执行，Go的执行流程如下

  -  .go文件  通过go build 来编译 生成.exe或者可执行文件  运行   结果

- 如果我们是对源码直接 执行 go run 源码， GO的执行流程如下
  - .go文件 通过 go run 结构   会隐藏编译这个过程



- 这两种运行方式的区别

1. 如果我们先编译生成了可执行文件，那么我们可以将该可执行文件拷贝到没有go开发环境的机器上，仍然可以运行

2. 如果我们是直接go run go源代码， 那么如果要在另外一个机器上这么运行，也需要go开发环境，否则无法执行。

3. 在编译时，编译器会将程序运行依赖的库文件包含在可执行文件中，所以，可执行文件变大了很多。



#### GO语言开发的注意事项

1. Go源文件以"go"为扩展名。
2. Go应用程序的执行入口是main()方法。
3.  Go语 言严格区分大小写。
4.  Go方法由一条条语句构成，每个语句后不需要分号(Go语言会在每行后自动加分号),这也体现出Golang的简洁性。
5.  Go编译器是一 行行进行编译的，因此我们一行就写一条语句，不能把多条语句写在同一个，否则报错
6.  go语言定义的变量或者import的包如果没有使用到，代码不能编译通过。
7. 大括号都是成对出现的，缺一不可。



#### GO语言转译字符

| GO转义字符 |                       解释                        |
| :--------: | :-----------------------------------------------: |
|     \t     |            一个制表单位，实现对齐功能             |
|     \n     |                      换行符                       |
|    \\\     |                       一个\                       |
|    \\"     |                       一个"                       |
|     \r     | 一个回车 从当前行的最前面进行输出，覆盖掉以前内容 |





#### VScode 格式整理

第一种方式

> 选择需要整理格式的代码 按shift+tab  全体向左移动 然后按tab进行首行缩进

```go
package main
import "fmt"

func main(){
    fmt.Println("hello")
    fmt.Println("hello")
    fmt.Println("hello")
    fmt.Println("hello")
}
```



第二种方式

  ​	使用gofmt -w 来进行格式化

```
D:\goProject\src\go_code\project01\main>gofmt -w hello.go
```



行长约定：

​			一行最长不超过80个字符，超过的请使用换行展示，





### 变量

> 变量是程序的基本组成单位



- 概念

  变量相当于内存中一个数据存储空间的表示，你可以把变量看做是-一个房间的门牌号，通过门牌号我们可以找到房间，同样的道理，通过变量名可以访问到变量(值)。

  

-   变量使用的基本步骤

    1.声明变量(有人也叫: 定义变量)
    2.赋值
    3.使用



- 案例

```go
package main

import "fmt"

func main(){
	// 定义一个i
	var i int 
	// 给i赋值
	i = 20
	// 打印出值
	fmt.Println(i)
}
```





1变量表示内存中的一个存储区域

2该区域有自己的名称 (变量名)和类型(数据类型)

3 Golang变量 使用的三种方式

1. 第一种:指定变量类型，声明后若不赋值，使用默认值

   ```
   package main
   import "fmt"
   func main(){
   // 第一种:指定变量类型，声明后若不赋值，使用默认值
   	var  i int
   	fmt.Println("i=", i)   // i = 0
   }
   ```

   

2. 第二种:根据值自行判定变量类型(类型推导)中

   ```
   	// 第二种:根据值自行判定变量类型(类型推导)中
   	var n = 10.1  //会根据你的值来推到这个类型
   	fmt.Println("n=", n)
   ```

   

3. 第三种:省略var, 注意:=左侧的变量不应该是已经声明过的，否则会导致编译错误

```
	// 第三种:省略var, 注意:=左侧的变量不应该是已经声明过的，否则会导致编译错误
	name := "wmt"   // 等价于 var name string = "wmt"
	fmt.Println("c=", name)    
```



4.多变量声明
   在编程中，有时我们需要一次性声明多个变量，Golang也提 供这样的语法

```go
package main
import "fmt"
func main(){
	//    在编程中，有时我们需要一次性声明多个变量，Golang也提 供这样的语法
	var a, b, c int
	fmt.Println(a, b, c)
    
    // 声明多种方式并赋值
	var name, age, sex = "王孟涛",  18, "男"
	fmt.Println(name, age, sex)
    
   // 第三种声明多种变量的方式
	cid, uid, tid := 1, 2, 3
	fmt.Println(cid, uid, tid)

}
```



5.全局变量

> 在main 方法上面声明全局变量

```go
package main
import "fmt"

//声明全局变量
var n1 = "n1"
var n2 = "n2"
//第二种方式
var (
	n3 ="n3"
	n4 ="n4"
)

func main(){
	// 全局变量 
	fmt.Println("n1=", n1,"n2=", n2,"n3=", n3,)
}
```



6. 该区域的数据值可以在同一类型范围内不断变化

7. 变量在同一个作用域内不能重名

8. 变量=变量名+值+数据类型，  这一点请大家注意。
9. Golang的变量如果没有赋初值，编译器会使用默认值,比如int默认值0 string默认值为空串





#### Go变量的数据类型

- 小tips
  - go中使用的是UTF-8的格式   一个汉字占3字节
  - 整型前面加u是无符号的整型可以存放更多

![image-20230706210653726](.\imgs\image-20230706210653726.png)



##### 整型



######  有符号的int

> 代表有符号的int类型  所以会比无符号的int少保存一些

```go
package main
import "fmt"
func main(){ 
	// 基础数据类型 int8  8代表8位=1字节 因为int代表是有符号的8位 第一位表示正数还是负数 0代表正数 1代表负数 因为从0开始所以要减一是127  范围是 -128~127
	var num1 int8
	var num2 int16 //有符号的int16
	var num3 int32 //有符号的int32
	var num4 int64 //有符号的int64
	num1 = -128
    fmt.Println(num1, num2, num3, num4)
}
```



###### 无符号的int

> 无符号的int就代表为正数

```go
	// 无符号类型uint8 8代表8位 1字节 第一位不代表字符所以8位都可以装所以是 0~255
	var num1 uint8   //uint16 uint32 uint64
	num1 = 255
	fmt.Println("num1=", num1) //输出 255
```



###### int其它数据类型的使用



![image-20230707084747212](.\imgs\image-20230707084747212.png)



###### 整型使用的细节

1. Golang各整数类型分:有符号和无符号，int uint的大小和系统有关。

2. Golang的整型默认声明为int型

   ```
   	// 如何查看一个数据的类型
   	var num int = 127
   	// %T  指的是type int的大小是根据你操作系统的大小来的如果你是32位操作系统 这个int的大小就是int32 如此类推
   	fmt.Printf("num 的类型是 %T", num)
   ```

   

3. 如何在程序查看某个变量的字节大小和数据类型(使用较多)

   ```go
   	var num int8 = 127	
   // 如何查看这个数据占用的字节数 %d是一个整数的占位符 unsafe.Sizeof的返回值是一个字节 不是位  需要导入一个unsafe的包
   	fmt.Printf("    num 的字节大小是 %d", unsafe.Sizeof(num))  //8
   ```

   

4. Golang程序中整型变量在使用时，遵守保小不保大的原则，即:在保证程序正确运行下，尽量使用占用空间小的数据类型。 [如:年龄]

   ```go
   	// byte 0~255
   	var age byte
   	age = 100
   	fmt.Print(age)
   ```

   

5. bit: 计算机中的最小存储单位。byte:计算机中基本存储单元。[二进制再详细说]1byte= 8 bit 



##### 浮点类型 

> 创建一个浮点类型



```go
package main

import (
	"fmt"
	"unsafe"
)

func main() {
	// 创建一个单精度
	var price float32 = 38.88
	//  输出price 的类型是 float32 price的所占的字节是 4
	fmt.Printf("price 的类型是 %T price的所占的字节是 %d", price, unsafe.Sizeof(price))
}

```









###### 浮点数分类

>  分为单精度和双精度

![image-20230707093801382](.\imgs\image-20230707093801382.png)

对上图说明：

- 关于浮点数在机器中存放的简单说明，浮点数= 符号位 + 指数位 + 尾数位        说明：浮点数都是有符号的

```go
	// 创建一个有符号的单精度和双精度
	var float1 float32 = -0.147
	var float2 float64 = -84884.154
	// 输出结果float1 = -0.147 float2 = -84884.154
	fmt.Println("float1 =", float1, "float2 =", float2)
```

- 尾数位可能丢失，造成精度损失，比如 -1247.000000000123

```go
	var float3 float32 = -1247.000000000123
	var float4 float64 = -1247.000000000123
	// 输出的结果为 float3 = -1247
	fmt.Println("float3 =", float3)
	// 输出结果float4 = -1247.000000000123
	fmt.Println("float4 =", float4)
```

  说明：

	 	1. 浮点型存数字可能会造成精度丢失
	 	2. float64 要比 float32 要准确
	 	3. 如果我们需要保存一个精度比较高的数，则应该选择用float64





###### float 的使用细节

1. Golang 浮点类型有固定的范围和字段长度，不受具体OS(操作系统)的影响，不像int类型如果操作系统为32位那么int类型的是4字节
2. Golang的浮点类型默认声明长度为float64类型
3. 浮点类型常量有两种表示形式
   1. 十进制数形式：如 5.12    .512   .512 是 0.512的简写 **必须要有小数点**
   2. 科学计数法形式： 如 5.1234e2 = 5.12 * 10的2次方   5.12E-2 = 5.12 / 10的2次方
4. 通常情况下，应使用float64 因为它比float32更精确



##### 字符类型

- 基本简绍

  Golang中**没有专门的字符类型**，如果要存储单个字符(字母)，一般使用byte来保存。字符串就是一串固定长度的字符连接起来的字符序列。Go的字符串是由单个字节连接起来的。也就是说对于传统的字符串是由字符组成的，**而Go的字符串不同，它是由字节组成**的。[官方将string归属到基本数据类型. https://tour.go-zh.org/basics/11 ]



###### 字符型的使用

> 如果保存的ASCII码中是数据可以直接使用byte来保存     

```go
package main

import "fmt"

func main() {
	//字符型的使用
	var c1 byte = 'a'
	var c2 byte = '1'
	//输出的结果是 以ASCII码输出 c1 =  97 c2=  49
	fmt.Println("c1 = ", c1, "c2= ", c2)
	// 输出： c1 =a c2 = 1  表示以char字符输出
	fmt.Printf("c1 =%c c2 = %c \n", c1, c2)

	// 汉字不能使用byte来保存
	//var c3 byte = "王" //untyped string constant
	var c3 int = '王' //必须是单引号
	// %c以字符输出   %d以对于的编码值输出
	// 输出：c3=王 c3 的对应的编码值为 29579
	fmt.Printf("c3=%c c3 的对应的编码值为 %d", c3, c3)
}

```



###### 字符类型使用细节

1. 字符常量是用单引号(")括起来的单个字符。例如: var c1byte= 'a' var c2 int='中' var c3 byte= '9'

2. Go中允许使用转义字符\'来将其后的字符转变为特殊字符型常量。例如: var c3 byte= '\n' // '\n'表示换行符

   ```go
   	// byte 转义字符   \n换行
   	var conversion byte = '\n'
   	// 输出 111111
   	//      2222
   	fmt.Printf("111111%c2222", conversion)
   ```

   

3. Go语言的字符使用UTF-8编码  **英文字母1个字节汉字3个字节**

4. 在Go中，字符的本质是一个整数，直接输出时，是该字符对应的UTF-8编码的码值。

5. 可以直接给某个变量赋一个数字，然后按格式化输出时%c会输出该数字对应的unicode字符

   ````go
   	// 1. 可以直接给某个变量赋一个数字，然后按格式化输出时%c会输出该数字对应的unicode字符
   	var c4 int = 247
   	// 输出： c4 =÷
   	fmt.Printf("\n c4 =%c", c4)
   ````

   

6. 字符类型是可以进行运算的，相当于一个整数，因为它都对应有Unicode码.

   ```go
   	// 2. 字符类型是可以进行运算的，相当于一个整数，因为它都对应有Unicode码.   ASCII 码 a=97
   	var c5 int = 'a' - 30
   	// 输出 67
   	println("c5=", c5)
   ```





###### 字符类型的讨论

1. 字符型存储到计算机中，需要将字符对应的码值(整数)找出来
   	存储:字符-->对应码值---> 进制->存储
   	读取:二进制-->码值---> 字符->读取
2. 字符 和码值的对应关系是通过字符编码表决定的(是规定好)
3.  Go语 言的编码都统一成了utf-8。非常的方便，很统一，再也没有编码乱码的困扰了



##### 布尔类型 bool

- 基本简绍
  - 布尔类型也叫bool类型，bool类 型数据只允许取值true和false
  - bool类型占1个字节。
  - boolean类型适于逻辑运算，一般用于程序流程控制[注:这个后面会详细介绍]: 



##### 字符串

- 基础简绍

字符串就是一串 固定长度的字符连接起来的字符序列。Go的字符串是由单个字节连接起来的。Go语言的字符串的字节使用UTF-8编码标识Unicode文本



使用细节

1. Go语言的字符串的字节使用UTF-8编码标识Unicode文本，这样Golang统-使用UTF-8编码,中文乱码问题不会再困扰程序员。

2. 字符串一旦赋值了，字符串就不能修改了:在Go中字符串是不可变的。
3. 字符串的两种表达形式
   1. 双引号，会识别转义字符
   2. 反引号，以字符串的形式输出，包括换行和特殊字符，可以防止攻击，输出源代码的效果



> 字符串的两种形式

```go
package main

import "fmt"

func main() {
	var str1 string = "aaaaaa\nbbbbb"
	var str2 string = `aasdwa\nasdw\tdasda\asdas`
	// 会换行\n
	fmt.Println(str1)
	// 当文本输出
	fmt.Println(str2)
}

```



###### 字符串拼接

```go
package main

import "fmt"

func main() {
	// 字符串拼接   和Java不一样的地方是换行的话 +号必须在上面
	var str string = "hello" + "world" +
		"hello" + "world" +
		"hello" + "world" +
		"hello" + "world" +
		"hello" + "world" +
		"hello" + "world"
	fmt.Println(str)

}

```



#### 基本数据类型的默认值、

> 基本数据类型的默认值

| 数据类型 | 默认值 |
| :------: | :----: |
|   整型   |   0    |
|  浮点型  |   0    |
|  字符型  |   ""   |
|  布尔型  | false  |

> 案例举一个列子

```go
package main

import "fmt"

func main() {
	var str string
	// %v 表示原值输出
	fmt.Printf("str=%v", str)

}

```



#### 基本数据类型的转化

- 基本简绍
  - Golang和java/c不同，Go 在不同类型的变量之间赋值时需要显式转换。也就是说Golang中数据类型不能自动转换。



- 基本语法

  - T(v)        表达式 T表示需要转换成什么类型   v表示值

  - 实际案例

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	// 类型转换 必须强制转换
    	var num int32 = 100
    	var flo float32 = float32(num)
    	// 大转小 没有隐式转换
    	var num1 int8 = int8(num)
    
    	fmt.Println(flo, num1)
    }
    
    ```

- 细节

1. Go中，数据类型的转换可以是从表示范围小->表示范围大，也可以范围大-- >范围小
2. 被转换的是变量存储的数据(即值)，变量本身的数据类型并没有变化!
3. 在转换中，比如将int64转成int8，编译时不会报错，只是转换的结果是按溢出处理，和我们希望的结果不一样。



- 小tips

  ```go
  package main
  
  import "fmt"
  
  func mian() {
  	var num1 int32 = 12
  	var num2 int8
  	var num3 int8
  
  	num2 = int8(num1) + 127 //编译通过但是结果会溢出
  	num3 = int8(num1) + 128 //编译就不会通过  因为int8 是-128~127 所以编译就不过
  	fmt.Println(num2)
  }
  
  ```

  

#### 基本数据类型和string的转换

- 简绍

  - 在程序开发中，我们经常需要将基本数据类型转成string类型或者将string类型转成基本数据类型。

- 转换方式一

  - fmt.Sprintf("%参数", 表达式)

  - 实际操作

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	// 基本数据类型转string类型
    	var num1 int = 99
    	var num2 float32 = 3.154
    	var b bool = false
    	var myChar byte = 'w'
    	var str string
    
    	// 使用第一种方式来转换 fmt.sprintf方法
    	str = fmt.Sprintf("%d", num1)
    	// 输出 str类型为 string str=99
    	fmt.Printf("str类型为 %T str=%v \n", str, str)
    	// 转变成string
    	str = fmt.Sprintf("%f", num2)
    	// 输出：str类型 string str=3.154000
    	fmt.Printf("str类型 %T str=%v \n", str, str)
    	// bool转换成string
    	str = fmt.Sprintf("%t", b)
    	// 输出:
    	fmt.Printf("str类型为%T str= %v \n", str, str)
    	// byte转string
    	str = fmt.Sprintf("%c", myChar)
    	//str类型为string str=w 
    	fmt.Printf("str类型为%T str=%v \n", str, str)
    }
    
    ```

- 方式二

  - import "strconv"
  
  - ![image-20230707215300554](.\imgs\image-20230707215300554.png)
  
  - 实际操作
  
    ```go
    package main
    
    import "fmt"
    
    func main() {
    	// 基本数据类型转string类型
    	var num1 int = 99
    	var num2 float32 = 3.154
    	var b bool = false
    	var myChar byte = 'w'
    	var str string	
        // 第二种方式来转换
    	str = strconv.FormatInt(int64(num1), 10)
    	fmt.Printf("str= %v  str的类型为 %T \n", str, str)
    	
    	// 把浮点数转换成字符 "f" 格式  10 保留10位小数   32表示这个是float32
    	str = strconv.FormatFloat(float64(num2), 'f', 10, 64)
    	fmt.Printf("str = %v str的类型为%T\n", str, str)
        
        // 把bool类型转换成字符
    	str = strconv.FormatBool(b)
    	fmt.Printf("str = %v str的类型为%T\n", str, str)
        
        //比较简单的int类型转换成string类型
        var num5 int = 45566  
    	str = strconv.Itoa(num5)
    	fmt.Printf("str = %v str的类型为%T\n", str, str)
    }
    ```

#### string类型转基本类型

- 方式

  - strconv 这个包里面 的parseXX( )方法

  - 实际操作

    ```go
    package main
    
    import (
    	"fmt"
    	"strconv"
    )
    
    func main() {
    	// 基本类型转string类型
    	var str1 string = "true"
    	var b bool
    	// 把string类型转换成bool类型   strconv.ParseBool(str1) 这个方法返回的是2个数据 所以应该使用2个来接收 _表示忽略
    	b, _ = strconv.ParseBool(str1)
    	// 输出：b = true, b的类型是bool
    	fmt.Printf("b = %v, b的类型是%T\n", b, b)
    
    	var str2 string = "123456789"
    	var num1 int64
    	// num1 10 代表10进制 64 代表 int64
    	num1, _ = strconv.ParseInt(str2, 10, 64)
    	fmt.Printf("num1 = %v, num1的类型是%T\n", num1, num1)
    
    	var str3 string = "123.456"
    	var f1 float64
    	// 把string转成float32位  返回的值只能是float64位
    	f1, _ = strconv.ParseFloat(str3, 64)
    	fmt.Printf("f1 = %v, f1的类型是%T\n", f1, f1)
    }
    
    ```

##### 注意事项

在将String类型转成基本数据类型时，要确保String**类型能够转成有效的数据**，比如我们可以把"123" ,转成一个整数，但是不能把"hello"转成- -个整数，如果这样做，Golang直接将其转成0









### GoLang 指针



1. 基本数据类型，变量存的就是值，也叫值类型

2. 获取变量的地址，用&，比如: var num int,获取num的地址: &num

   ```go
   package main
   
   import "fmt"
   
   // 演示golang指针
   func main() {
   	var num1 int = 3222
   	// &表示取的是内存地址
   	fmt.Printf("num1的地址是%v", &num1)
   }
   
   ```

   

3. 指针类型，变量存的是一个地址，这个地址指向的空间存的才是值
   比如: var ptr *int = &num

   ```go
   package main
   
   import "fmt"
   
   // 演示golang指针
   func main() {
   	var num1 int = 3222
   	// &表示取的是内存地址
   	fmt.Printf("num1的地址是%v\n", &num1)
   	// 创建一个指针
   	var ptr *int = &num1
   	// 输出： ptr的值为0xc000018098  表示ptr里面的值
   	fmt.Printf("ptr的值为%v\n", ptr)
   	// 当然ptr也有内存地址
   	// 输出： ptr的内存地址= 0xc00000a030
   	fmt.Printf("ptr的内存地址= %v\n", &ptr)
   
   }
   ```

   

4. 获取指针类型所指向的值，使用: `*`，比如:
   var ptr  `*`int, 使用*ptr获取p指向的

```go
package main

import "fmt"

// 演示golang指针
func main() {
	var num1 int = 3222
	// 创建一个指针
	var ptr *int = &num1
    //输出为 3222
	fmt.Printf("ptr指向的值为%v\n", *ptr)

}

```



#### 指针细节说明

1. 值类型，都有对应的指针类型，形式为`*`数据类型，比如int的对应的指针就是`*`int, float32对应的指针类型就是*float, 依次类推。
2. **值类型包括:基本数据类型int系列, float系列, bool, string、数组和结构体struct**





#### 值类型和引用类型

> 通常值类型放在栈中 引用类型放在堆中  因为Golang有逃逸分析具体怎么放还是由Golang决定

- 值类型:基本数据类型int系列, float 系列, bool, string、数组和结构体struct

   1. 值类型:变量直接存储值，内存通常**在栈中分配**

      

- 引用类型:指针、slice切片、map、管道chan、interface 等都是引用类型
  
  1. 引用类型:变量存储的是一个地址，这个地址对应的空间才真正存储数据(值)，**内存通常在堆上分配**，当没有任何变量引用这个地址时，该地址对应的数据空间就成为一个垃圾，由GC来回收。



### 标识符命名规范

- 标识符的概念

1. Golang 对各种变量、方法、函数等命名时使用的字符序列称为标识符
2. 凡是自己可以起名字的地方都叫标识符



- 标识符的命名规范

1. 由26个英文字母大小写，0-9，组成
2. 数字不可以开头。
3. Golang中严格区分大小写。
4. 标识符不能包含空格。
5. 下划线"_ "本身在Go中是一个特殊的标识符，称为空标识符。可以代表任何其它的标识符，但是它对应的值会被忽略(比如:忽略某个返回值)。所以仅能被作为占位符使用，不能作为标识符使用。
6. 不能以系统保留关键字作为标识符，比如break, if等等..

#### 系统保留关键字



![image-20230709120209405](.\imgs\image-20230709120209405.png)



预定义标识符:

![image-20230709120645600](.\imgs\image-20230709120645600.png)



- 标识符的命名规范

1. 包名:保持package的名字和目录保持一致，尽量采取有意义的包名，简短，有意义，不要和标准库不要冲突
2. 变量名、函数名、常量名:采用驼峰法。
3. 如果变量名、函数名、常量名首字母大写，则可以被其他的包访问;如果首字母小写，则只能在本包中使用(注:可以简单的理解成，**首字母大写是公有的，首字母小写是私有的)**







### 运算符

> 因为本身学过java 所以这里简写和Java不一样的地方



#### 基本运算符



##### 运算符优先级

![image-20230709142631828](.\imgs\image-20230709142631828.png)



##### / 除

> 如果整数相除会取整 舍去小数部分

实际案例

```go
package main

import "fmt"

func main() {
	// Golang 运算符 /  输出：2 会取整 舍去小数部分
	fmt.Println(10 / 4)

	var fl float32
	fl = 10 / 4
	// 输出： 2
	fmt.Println(fl)

	// 如果希望保存2位小数的话需要带浮点数运算  输出：2.5
	fl = 10.0 / 4
	fmt.Println(fl)

}

```



##### %取模

实际案例

```go
package main

import "fmt"

func main() {
	// Golang 运算符 %  取模运算

	fmt.Println(`10 % 3 = `, 10 % 3)     //输出： 1
	fmt.Println("10 % -3 = ", 10 % -3)   //输出： 1
    fmt.Println("-10 % 3 = ", -10 % 3)   //输出: -1
	fmt.Println("-10 % -3 = ", -10 % -3) //输出：-1

}

```





##### ++ 和 --

> Golang 中只有 i++ 没有 ++i   并且i++ 只能独立独立使用

案例：

```go
package main

import "fmt"

func main() {
	// Golang 运算符 ++ --   Golang 中只有 i++ 没有 ++i

	var a int = 10
	var b int
	a++
	b = a
	fmt.Println(b)
	//b = a++ 不能这样写   i++ 只能独立独立使用

	if a++ > 0 {  // 不行不能这样写 必须把 a++ 独立使用
		fmt.Println("ok")
	}
}

```





#### 位运算符

![image-20230709143300228](.\imgs\image-20230709143300228.png)



#### 其它运算符



![image-20230709143423738](.\imgs\image-20230709143423738.png)







### 键盘输入

- 步骤

  - 导入 fmt的包
  - 调用 fmt包中的 fmt.ScanLn() 或 fmt.Scanf()

- 案例

  - 方式一使用ScanLn()

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	// 从控制台获取 姓名 年龄 工资 是否结婚
    	// 方式一
    	var name string
    	var age int8
    	var salary float32
    	var isMarry bool
    
    	// 接收
    	fmt.Println("请输入姓名")
    	fmt.Scanln(&name)
    	fmt.Println("请输入年龄")
    	fmt.Scanln(&age)
    	fmt.Println("请输入工资")
    	fmt.Scanln(&salary)
    	fmt.Println("请输入是否结婚")
    	fmt.Scanln(&isMarry)
    
    	fmt.Printf("你的姓名是%v 年纪是%v 工资是%v 是否结婚%v", name, age, salary, isMarry)
    
    }
    
    ```

  

  - 方式二 使用 Scanf()

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	// 从控制台获取 姓名 年龄 工资 是否结婚
    	// 方式一
    	var name string
    	var age int8
    	var salary float32
    	var isMarry bool
    
    	// 方式二
    	fmt.Scanf("%s %d %f %b", &name, &age, &salary, &isMarry)
    
    	fmt.Printf("你的姓名是%v 年纪是%v 工资是%v 是否结婚%v", name, age, salary, isMarry)
    
    }
    
    ```

    

  

  

### 进制



#### 其它进制转十进制



##### 2进制转10进制

- 规则

  - 从最低位开始(右边的)，将每个位上的数提取出来,乘以2的(位数-1)次方,然后求和。

  - 案例

    ```
    把二进制的10111 转换成十进制
    常用上标 ⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ⁺ ⁻ ⁼ ⁽ ⁾ ⁿ º ˙
    10111 = 1 * 2⁰ + 1 * 2¹ + 1 * 2² + 0 * 2³ + 1 * 2⁴  =  23
               1   +    2   +   4    +   0    + 16 = 23
    ```

    

##### 8进制转10进制

-  规则

  - 从最低位开始(右边的)，将每个位上的数提取出来,乘以8的(位数-1)次方然后求和。

  - 案例

    ```
    把8进制的0123 转换成10进制
    0123 = 3 * 8⁰ + 2 * 8¹ + 1 * 8² = 83
             3    +   16   +   64   = 83
    ```

    

  ##### 16进制转换成10进制

> 0x 或者 0X 表示16进制     10用A ，   11用B ， 12用C，  13用D ，  14用E，   15用F

- 规则

  - 从最低位开始(右边的)，将每个位上的数提取出来,乘以16的(位数-1)次方然后求和。

  - 案例

    ```
    0X34A 转换成10进制
    0X34A = 10 * 16⁰ + 4 * 16¹ + 3 * 16² =  842
                10   +   64    +  768    =  842
    
    
    
    ```

    

  

#### 十进制转其它进制



##### 10进制转 2进制

- 规则

  - 将该数不断除以2，直到商为0为止，然后将每步得到的余数倒过来，就是对应的二进制。

  - 案例

    ```
    把 59转成2进制	 从下往上写 111011
    ```

    ![image-20230709160656140](.\imgs\image-20230709160656140.png)



  

##### 10进制转8进制

- 规则

  - 将该数不断除以8，直到商为0为止，然后将每步得到的余数倒过来，就是对应的8进制。

  - 案例

    ```
    把158转成8进制  = 234
    ```

    ![image-20230709161255754](.\imgs\image-20230709161255754.png)



##### 10进制转16进制

- 规则

  - 将该数不断除以16，直到商为0为止，然后将每步得到的余数倒过来，就是对应的16进制。

  - 案例

    ```
    把356 转成16进制 = 0X164
    ```

    ![image-20230709161534105](.\imgs\image-20230709161534105.png)





#### 二进制转其它



##### 二进制转成八进制

- 规则：将二进制数每三位一组(从低 位开始组合),转成对应的八进制数即可。 （为什么要3位一组因为3位刚好表示 0~7 刚好8进制）

  - 案例

    ```
    110111101 转换成 8进制 先3位一组分开
    110      111     101    = 675
    6         7       5
    ```





##### 二进制转出十六进制

- 规则：将二进制数每四位一组(从低 位开始组合),转成对应的十六进制数即可。 为什么要4位一组因为4位刚好表示 0~15 刚好16进制

  - 案例

    ```
    110111101 转换成 16进制 先4位一组分开
    1      1011     1101       = 0X1BD
    1       B         D
    ```

    



#### 其它转二进制



##### 八进制转换成二进制

- 规则：将八进制的每一位数，转成对应的一个3位的二进制数即可。

  - 案例：

    ```
    将0237转成二进制
    0237  = 10011111
    
    2 = 10
    3 = 011
    7 = 111
    ```

    

##### 十六进制转成二进制

- 规则：将十六进制的每一位数，转成对应的一个4位的二进制数即可

  - 案例：

    ```
    0x237 转成二进制
    2 0010
    3 0011
    7 0111
    ```

    



### 位运算



#### 原码，反码，补码

- 说明 对于有符号的而言
  - 二进制的最高位是符号位: 0表示正数,1表示负数
  - 正数的原码，反码，补码都一样
  - 负数的反码=它的原码符号位不变，其它位取反(0->1,1->0)
  - 负数的补码=它的反码+1
  - 0的反码，补码都是0
  -  在计算机运算的时候，都是以**补码**的方式来运算的.



#### &，|，^

> Golang 中有三个位运算

分别是 **按位与& ， 按位或|， 按位异或^** , 它的运算规则是：

1. 按位与&                                                   两位全为 1 结果为1，否则为0
2. 按位或|                                                    两位有一个为1，结果为1，否则是0
3. 按位异或^                                                两位一个为0，一个为1，结果为1，否则为0



##### & 按位与

案例：

```go
package main

import "fmt"

//  两位全为1结果为1，否则为0   两位值 a & b a的补码和b的补码
func main() {
	fmt.Println(2 & 3)
	// 2 的补码 0000 0010
	// 3 的补码 0000 0011
	// 结果：   0000 0010
	// 输出 ：2

	fmt.Println(3 & 4)
	// 3 的补码 0000 0011
	// 4 的补码 0000 0100
	// 结果：   0000 0000
	// 输出：0

}
```



##### | 按位或

案例：

```
package main

import "fmt"

//   两位有一个为1，结果为1，否则是0  两位值 a | b a的补码和b的补码
func main() {
	fmt.Println(2 | 3)
	// 2 的补码 0000 0010
	// 3 的补码 0000 0011
	// 结果：   0000 0011
	// 输出 ：3

	fmt.Println(3 | 4)
	// 3 的补码 0000 0011
	// 4 的补码 0000 0100
	// 结果：   0000 0111
	// 输出：7

}

```



##### ^按位异或

案例：

```go
package main

import "fmt"

//     两位一个为0，一个为1，结果为1，否则为0  两位值 a ^ b a的补码和b的补码
func main() {
	fmt.Println(2 ^ 3)
	// 2 的补码 0000 0010
	// 3 的补码 0000 0011
	// 结果：   0000 0001
	// 输出 ：1

	fmt.Println(3 ^ 4)
	// 3 的补码 0000 0011
	// 4 的补码 0000 0100
	// 结果：   0000 0111
	// 输出：7

}

```





##### 负数举例

> 只要是运算就是补码运算  运算完了转会原码

```go
	fmt.Println(-2 & -3)
	// -2 的原码 1000 0010  反码为 1111 1101 补码为 1111 1110
	// -3 的原码 1000 0011  反码为 1111 1100 补码为 1111 1101
	// 结果：                  进行按位与算出的补码  1111 1100
	//1111 1100 补码算反码  反码为1111 1011 原码为   1000 0100  1000 表示负数  0100 = 4
	// 输出 ：-4

```



#### >> << 移位运算

`>>`  `<<`  右移和左移，运算规则：

- 右移运算符>>:低位溢出,符号位不变并用符号位补溢出的高位

  ```go
  package main
  
  import "fmt"
  
  func main() {
  	// 右移运算符>>:低位溢出,符号位不变并用符号位补溢出的高位
  	// 0000 0001   0000 0000
  	// 输出：0
  	a := 1 >> 2
  	fmt.Println(a)
  
  	// 右移运算符>>:低位溢出,符号位不变并用符号位补溢出的高位
  	c := -1 >> 4
  	// -1的原码 1000 0001 反码 1111 1110  补码 1111 1111   开始向右移动4位  1111 用符号位补充最高位  补码为1111 1111
  	fmt.Println(c)  //输出为-1
  
  }
  
  ```

  



- 左移运算符<<:符号位不变低位补0

  ```go
  package main
  
  import "fmt"
  
  func main() {
  	// 左移运算符<<:符号位不变低位补0
  	// 0000 0001  00000100
  	// 输出：4
  	b := 1 << 2
  	fmt.Println(b)
  }
  
  ```

  



### 流程控制语句



#### 顺序控制

- 介绍

  - 程序从上到下逐行地执行，中间没有任何判断和跳转。
  - 比如下图

  ![image-20230709192138828](.\imgs\image-20230709192138828.png)



#### 分支控制



##### 单分支

基本语法

- if 条件表达式  {

  ​           指向代码块

  }

  - 实际操作

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	var age int8
    	fmt.Println("输入你的年纪")
    	fmt.Scan(&age)
    	if age > 18 {
    		fmt.Println("你已经成年了")
    	}
    }
    
    ```

    



##### 双分支

- 基本语法

  - if 条件表达式  {

    ​           指向代码块

    }else {

    ​              指向代码块

    }

  - 实际操作

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	var age int8
    	fmt.Println("输入你的年纪")
    	fmt.Scan(&age)
    	if age > 18 {
    		fmt.Println("你已经成年了")
    	} else {
    		fmt.Println("你还小")
    	}
    }
    
    ```

    

##### 多分支

基本语法

- if 条件表达式  {

  ​           指向代码块

  }else if{

  ​              指向代码块

  } else {

  

  }

  - 案例：

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	var age int8
    	fmt.Println("请输入年龄")
    	fmt.Scanln(&age)
    	if age < 10 {
    		fmt.Println("你是儿童")
    	} else if age < 16 {
    		fmt.Println("你是少年")
    	} else if age < 18 {
    		fmt.Println("你成年了")
    	} else {
    		fmt.Print("你是大人了")
    	}
    
    }
    
    ```

    

##### 嵌套分支

- 简绍

  - 在一个分支结构中又完整的嵌套了另一个完整的分支结构，里面的分支的结构称为内层分支外面的分支结构称为外层分支。

  - 语法

  - if 条件表达式  {

    ​       if 条件表达式  {

    ​           指向代码块

    }else{

    }

    }

  - 说明： 嵌套分支不宜过多，**建议控制到三层**



##### switch 分支

- 解释

  - switch语句用于基于不同条件执行不同动作，每-一个case 分支都是唯一的，从上到下逐一测试，直到匹配为止**。匹配项后面也不需要再加break**

  - 基本语法：

    ```
    switch 表达式{
    	case 表达式1, 表达式2, ...... :
    		语句块
    	case 表达式3, 表达式4, ...... :
    		语句块
    		
    	default：
    		语句块
    
    }
    ```

  - 实际案例

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	fmt.Println("请输出 a - g")
    	var weekDay byte
    	// 不能以Scanln接收
    	fmt.Scanf("%c", &weekDay)
    	switch weekDay {
    	case 'a':
    		fmt.Println("星期一")
    	case 'b':
    		fmt.Println("星期二")
    	case 'c':
    		fmt.Println("星期三")
    	case 'd':
    		fmt.Println("星期四")
    	case 'e':
    		fmt.Println("星期五")
    	case 'f':
    		fmt.Println("星期六")
    	case 'g':
    		fmt.Println("星期七")
    	}
    }
    
    ```

    

###### switch 细节

1. case后是一一个表达式(即:常量值、变量、一个有**返回值**的函数等都可以)

2. case后的各个表达式的值的数据类型，**必须和switch 的表达式数据类型一致**

3. case后面可以带**多个表达式，使用逗号间隔**。比如case表达式1,表达式2...

4. case后面的表达式如果是**常量值(字面量)**，**则要求不能重复**

5. case后面不需要带break ,程序匹配到一个case后就会执行对应的代码块，然后退出switch,如果一个都匹配不到，则执行default

6. default语句不是必须的.

7. switch后也可以不带表达式，类似if--else 分支来使用。[案例演示]

   ```go
   
   	var age int8 = 18
   	switch {
   	case age < 18:
   		fmt.Println("未成年")
   	case age == 18:
   		fmt.Println("刚刚成年")
   	}
   ```

   

8. switch后也可以直接声明定义一个变量，分号结束，不推荐。[案例演示]

   ```go
   	switch age := 17; {
   	case age < 18:
   		fmt.Println("未成年")
   	case age == 18:
   		fmt.Println("刚刚成年")
   	}
   ```

9. switch穿透fallthrough，如果在case语句块后增加fallthrough则会继续执行下一个case, .也叫switch穿透。

   ```go
   	// switch 中 fallthrough  向下穿透
   	switch num := 10; {
   	case num == 10, num == 20:
   		fmt.Println("10 and 20")
   		fallthrough //向下穿透就算不满足条件也穿透 只能穿透一层
   	case num > 20:
   		fmt.Println("num > 20")
   	}
   ```

10. Type Switch: switch 语句还可以被用于type-switch来判断某个interface 变量中实际指向的变量类型

    ```go
    var x interface{}
    	var y = 10.0
    	x = y
    	switch i := x.(type) {
    	case nil:
    		fmt.Println("x 的类型是nil", i)
    	case int:
    		fmt.Println("x 的类型是int", i)
    	case float32:
    		fmt.Println("x 的类型是float32")
    	case float64:
    		fmt.Println("x 的类型是float64", i) //输出： i = 10
    	case func(int) float32:
    		fmt.Println("x 的类型是func(int)")
    	case bool, string:
    		fmt.Println("x 的类型是bool and string")
    	default:
    		fmt.Println("未知")
    	}
    ```

    

#### 循环控制

##### for循环

- 基本语法

  ```go
  	for 循环变量初始化; 循环条件; 循环变量迭代 {
  		循环语句
  	}
  ```

  

- for循环快速入门

  ```go
  package main
  import "fmt"
  
  func main() {
  	for i := 0; i < 10; i++ {
  		fmt.Println("hello, golang")
  	}
      
      //第二个写法
      	i := 0
  	for i < 10 {
  		fmt.Println("hello, golang")
  		i++
  	}
      //第三种写法  for是死循环  需要配合者 break使用
      
      	for {
  		if i > 5 {
  			fmt.Println("单个for i=", i)
  			break
  		}
  	}
  }
  
  ```



- 如何遍历字符串

  ```go
  package main
  
  import "fmt"
  
  func main() {
  	// 如何遍历字符串 传统方式不能含汉字 因为是按照字节在取的 在utf-8中一个汉字3个字节
  	var str string = "hello string"
  	for i := 0; i < len(str); i++ {
  		fmt.Printf("%c \n", str[i])
  	}
          //使用切片来完成
      	// 如何遍历字符串
  	var str string = "hello string测试"
  	str2 := []rune(str)  //  转一个类型
  	for i := 0; i < len(str2); i++ {
  		fmt.Printf("%c \n", str2[i])
  	}
  
      
  
	// 方式二用range  是按照字符来遍历的不是字节来遍历的  可以含汉字
  	for index, val := range str {
  		fmt.Printf("index = %d val = %c \n", index, val)
  	}
  }
  
  ```
  



##### while 和 do while

Go语言没有while和o...while语法，这一点需要同学们注意一下，如果我们需要使用类似其它语言(比如java/c的while和do...while )，可以通过for循环来实现其使用效果。



```go
package main

import "fmt"

func main() {

	// Golang 中没有while 和do while的 可以使用for来实现
	i := 0
	sum := 0
	for {
		if sum == 10 {              //可以调整if判断的位置  来实现 do while
			break
		}
		sum += 5
		fmt.Println("sum=", sum)
		i++
	}

}

```



#### break

> 和Java一样

案例演示：

```go
package main

import (
	"fmt"
	"math/rand"
)

func main() {
	// 生成随机数
	// 生成随机数到99 看多少次可以生成
	i := 0
	for {
		ranNum := rand.Intn(100) + 1 //不需要seed一个值
		fmt.Println(ranNum)
		i++
		if ranNum == 99 {
			i++
			fmt.Println("随机了", i, "次", ranNum)
			break     //不指定的话就默认跳出一层
		}
	}
}

```



​	break语句出现在多层嵌套的语句块中时，**可以通过标签指明要终止的是哪一层语句块**

案例演示：

```go
package main

import "fmt"

func main() {
cirulation:              // 自定义名称
	for i := 0; i < 5; i++ {

		for i := 0; i < 5; i++ {
			fmt.Println("第二个循环 i=", i)
			if i == 2 {
				fmt.Println("i=", i)
				break cirulation //如果只是 break 只跳最近的循环   break cirulation 跳出最外的循环
			}

		}

	}
	// 输出
	// 第二个循环 i= 0
	// 第二个循环 i= 1
	// 第二个循环 i= 2
	// i= 2

}

```



#### continue

- 基本简绍
  - continue语句用于**结束本次循环**，继续执行下一次循环。
  - continue语句出现在多层嵌套的循环语句体中时，可以通过标签指明要跳过的是哪一层循环,这个和前面的break标签的使用的规则一样。



#### goto

1.Go语言的goto语句可以无条件地转移到程序中指定的行,一般和if配合使用

2.goto语句通常与条件语句配合使用。可用来实现条件转移，跳出循环体等功能。

3.在Go程序设计中**一般不主张使用goto语句**，以 免造成程序流程的混乱，使理解和调试程序都产生困难



实际操作

```go
package main

import "fmt"

func main() {
	i := 20
	fmt.Println("ok1")
	fmt.Println("ok2")
	if i == 20 {
		goto jump //直接跳到 ok5
	}

	fmt.Println("ok3")
	fmt.Println("ok4")
jump:
	fmt.Println("ok5")
	fmt.Println("ok6")
	fmt.Println("ok7")
	// 运行结果：
	// ok1
	// ok2
	// ok5
	// ok6
	// ok7
}

```





### 函数

> 函数的定义

1. 形参列表:表示函数的输入
2. 函数中的语句:表示为了实现某一功能代码块:
3. 函数可以有返回值,也可以没有

- 基本语法

  ```
  func 函数名 (形参列表) (返回值列表) {
  		指向语句
  		return 返回值列表
  }
  ```

  

  - 实际案例

  ```go
  package main
  
  import "fmt"
  
  func main() {
  	result := cal(11, 12, '+')
  	fmt.Println("计算结果为", result)
  
  }
  
  func cal(a float32, b float32, operator byte) float32 {
  	var count float32
  	switch operator {
  	case '+':
  		count = a + b
  		fmt.Println("a + b = ", count)
  	case '-':
  		count = a - b
  		fmt.Println("a - b = ", count)
  	case '*':
  		count = a * b
  		fmt.Println("a * b = ", count)
  	case '/':
  		count = a / b
  		fmt.Println("a / b = ", count)
  	}
  	return count
  }
  
  ```



#### 多个返回值

- 实际操作

  ```go
  package main
  
  import "fmt"
  
  // 计算两数之和和之差
  
  func main() {
  	res1, res2 := sumAndDifference(2, 1)
  	fmt.Println(res1, res2)
  
  }
  
  // 多个返回值
  func sumAndDifference(n1 float32, n2 float32) (float32, float32) {
  	sum := n1 + n2
  	difference := n1 - n2
  	return sum, difference
  
  }
  
  ```

  

#### 函数的递归调用

- 基本简绍

  一个函数在函数体内又调用了本身，我们称为递归调用

> 快速入门

```go
package main

import "fmt"

func main() {
	test(4)
	test2(4)

}

func test(n1 int) {
	if n1 > 2 {
		n1--    //注意--必须写在回调函数前面
		test(n1)
		fmt.Println("test1中 n1= ", n1) // 按照顺序是先输出 2  然后3
	}
}
func test2(n1 int) {
	if n1 > 2 {
		n1--
		test2(n1)
	} else {
		fmt.Println("test2 中n1=", n1) //2
	}
}

```

- 递归说明

1. 执行一个函数时，就创建一个新的受保护的独立空间(新函数栈)
2. 函数的局部变量是独立的，不会相互影响
3. 递归必须向退出递归的条件逼近，否则就是无限递归，死龟了:)
4. 当一个函数执行完毕，或者遇到return，就会返回，遵守谁调用，就将结果返回给谁。



#### 函数的注意事项和说明

1. 函数的形参列表可以是多个，返回值列表也可以是多个。

2. 形参列表和返回值列表的数据类型可以是值类型和引用类型。

3. 函数的命名遵循标识符命名规范，首字母不能是数字，首字母大写该函数可以被本包文件和其它包文件使用，类似public ,首字母小写，只能被本包文件使用，其它包文件不能使用，类似private。

4. 函数中的变量是局部的，函数外不生效

5. 基本数据类型和数组默认都是值传递的，即进行值拷贝。在函数内修改，不会影响到原来的值。[案 例演示]

6. 如果希望函数内的变量能修改函数外的变量，可以传入变量的地址&，函数内以指针的方式操作变量。**从效果上看类似引用**[案例演示:] 

   ```go
   package main
   
   import "fmt"
   
   func main() {
   	n1 := 10
   	ptr(&n1)  // &值传递
   	fmt.Println(n1) //输出为20
   
   }
   
   func ptr(num *int) {  // *int 表示指针类型
   	*num += 10
   }
   
   ```

   

7. Go函数不支持重载。

8. 在Go中，**函数也是一种数据类型**，可以赋值给一个变量，则该变量就是一个函数类型的变量了。通过该变量可以对函数调用。

   ```go
   package main
   
   import "fmt"
   
   func sum(n1 int, n2 int) int {
   	return n1 + n2
   }
   
   func main() {
   	a := sum
   	// 输出： a的类型是= func(int, int) int    sum的类型是= func(int, int) int
   	fmt.Printf("a的类型是= %T    sum的类型是= %T \n", a, sum)
   
   	res := a(10, 20)
   	// 输出： 30
   	fmt.Println(res)
   }
   
   ```

   

9. 函数既然是一种数据类型，因此在Go中，函数可以作为形参，并且调用!

   ```go
   package main
   
   import "fmt"
   
   func sum(n1 int, n2 int) int {
   	return n1 + n2
   }
   // func(int, int) int 是一个函数类型  
   func myfunc(funcVal func(int, int) int, num1 int, num2 int) int { 
   	return funcVal(num1, num2)
   }
   func main() {
   	val := myfunc(sum, 20, 30)
   	fmt.Println(val) //50
   
   }
   
   ```

   

10. 为了简化数据类型定义，Go支持自定义数据类型
    基本语法: type  自定义数据类型名数据类型 // 理解:相当于一个别名
    案例: type myInt int    //这时myInt就等价int来使用了，
    案例: type mySum  func (int, int) int    // 这时mySum就等价一个 函数类型func (int, int) int

```go
package main

import "fmt"

func sum(n1 int, n2 int) int {
	return n1 + n2
}

type my func(int, int) int //取了一个别名 my 是 func(int, int) int 的别名
// 虽然 my 是 func(int, int) int的别名 但是golang觉得他们不是同一种数据类型
func myfunc(funcVal my, num1 int, num2 int) int {
	return funcVal(num1, num2)
}

func main() {

	val := myfunc(sum, 20, 30)
	fmt.Printf("val 的数据类型是%T  val = %v", val, val) //50

}

```

11. 支持函数的返回值命名

    ![image-20230711183814221](.\imgs\image-20230711183814221.png)

    > 如果定义了函数的返回值命名

![image-20230711183712582](.\imgs\image-20230711183150856.png)

12.  使用_标识符，忽略返回值

```go
	_, valb := myFunc(10, 20.1)
```

13. Go支持可变参数  可变参数必须要放在形参列表最后

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	argFunc(10, 20, 30, 40)
    	argFunc2(10, 20, 30, 40, 50)
    }
    
    // 支持0到多个参数
    func argFunc(args ...int) (sum int) {
    	for i := 0; i < len(args); i++ {
    		fmt.Println(args[i])
    	}
    	return
    }
    //支持1 到多个参数 args是切片 可以使用 args[index]
    func argFunc2(n1 int, args ...int) (sum int) {
    	fmt.Println(n1)
    	for index, val := range args {
    		fmt.Println(index, val)
    	}
    	return
    }
    
    ```

    

#### init函数

- 解释

  每一个源文件都可以包含一个 init函数，该函数会在main函数执行前，被Go运行框架调用，也就是说init会在main函数前被调用。

  

- 实际操作

  ```go
  package main
  
  import "fmt"
  
  func main() {
  	fmt.Println("main运行了")
  }
  
  func init() {
  	fmt.Println("init运行了") //init 先运行 可以用于初始化 像Java的静态代码块
  }
  
  ```



##### init细节

如果一个文件同时包含全局变量定义，init函数和main函数，则执行的流程是     **变量定义->init函数>main函数**

- 案例演示

  ```go
  package main
  
  import "fmt"
  
  var age = test()
  
  func test() int {
  	fmt.Println("test运行了")
  	return 18
  }
  
  func init() {
  	fmt.Println("init运行了") //init 先运行 可以用于初始化 像Java的静态代码块
  }
  
  func main() {
  	fmt.Println("main运行了", age)
  }
  
  ```

  

> init函数的作用举例:   
>
> ​	用于数据初始化

utils包中

![image-20230711202213386](.\imgs\image-20230711202213386.png)



funcInit包中 导入utils包

![image-20230711202750951](.\imgs\image-20230711202750951.png)



> 面试题

案例如果main.go和utils.go 都含有变量定义，init 函数时，执行的流程又是怎么样的呢?

![image-20230711210429460](.\imgs\image-20230711210429460.png)





#### 匿名函数

> 简绍

Go支持匿名函数，如果我们某个函数只是希望使用一次，可以考虑使用匿名函数，匿名函数也可以实现多次调用。



##### 匿名函数使用方式



###### 第一种使用方式

> 在定义匿名函数时就直接调用，这种只能调用一次 [案例演示 ]  

```go
package main

import "fmt"

func main() {
      //res的类型是int res = 30 
	fmt.Printf("res的类型是%T res = %v \n", res, res)
    
}
//  使用匿名函数 完成2数相加 自行调用
//  res := 只能在函数中使用  全局变量只能 var 变量名称 =  因为res := 相当于 var res func类型    res = 赋值   赋值语句
//  只能在函数中使用，因为是执行语句
//  此时res 是函数变量
var res = func(n1 int, n2 int) int {
	return n1 + n2
}(10, 20)

```



###### 第二种使用方式

> 将匿名函数赋给一个变量(函数变量)，再通过该变量来调用匿名函数[案例演示]

```go

	// 把func(n1 int, n2 int) int 赋值给 res1
	// 则此时res1 的数据类型就是函数类型 此时我们可以通过res1 来调用
	var res1 = func(n1 int, n2 int) int {
		return n1 + n2
	}

	// 通过res1 来调用
	funcRes1 := res1(20, 30)
    //res1的类型是func(int, int) int  funcRes1的值是50
	fmt.Printf("res1的类型是%T  funcRes1的值是%v\n", res1, funcRes1)
```



###### 全局匿名函数



![image-20230711214103147](.\imgs\image-20230711214103147.png)





![image-20230711214201493](.\imgs\image-20230711214201493.png)





> 本包匿名函数

```go
package main

import (
	"fmt"
)

var (
	fun2 = func(n1 int, n2 int) int {
		return n1 * n2
	}
)

func main() {

	val := fun2(2, 2)
	fmt.Println(val)  //输出 4

}

```



#### 闭包

> 基本介绍: 

闭包就是一个**函数**如与其相关的**引用环境组合**的**一个整体**(实体)



- 案例演示

```go
package main

import "fmt"

func main() {
	f := addUpper()
	fmt.Println(f(1)) //输出11
	fmt.Println(f(2)) //输出13
	fmt.Println(f(3)) //输出16
}

// 累加器
// addUpper() 方法的返回类型是 func (int) int
func addUpper() func(int) int {
	n := 10
	return func(x int) int {
		n += x
		return n
	}
}
```





![image-20230711220659525](.\imgs\image-20230711220659525.png)



1. addUpper()  是一个函数  返回类型是  func(int) int 
2. 返回的是一个匿名函数。但是这个匿名函数引用到函数外的n .因此这个匿名函数就和n形成一个整体，构成闭包。
3. 大家可以这样理解:闭包是类，函数是操作，n是字段。函数和它使用到n构成闭包。
4. 当我们反复的调用f函数时，因为n是初始化一次，因此每调用-一次就进行累计。
5. 我们要搞清楚闭包的关键，就是要分析出**返回的函数它使用(引用)到哪些变量，因为函数和它引用到的变量共同构成闭包。**



##### 闭包实践



```go
package main

import (
	"fmt"
	"strings"
)

func main() {
	fileName := makeSuffix(".jpg") //唯一的好处就是.jpg只需要传一次
	res := fileName("wmt")
	res2 := fileName("model")
	fmt.Println(res, res2)

}

// 请编写一个程序，具体要求如下
// 1)编写一个函数makeSuffix(suffix string) 可以接收一个文件后缀名(比如.jpg)，并返回一个闭包
// 2)调用闭包，可以传入一个文件名，如果该文件名没有指定的后缀(比如.jpg) ,则返回文件名.jpg,如果已经有.jpg后缀，则退回原文件名。
// 3)要求使用闭包的方式完成
// 4) strings.HasSuffix

func makeSuffix(suffix string) func(string) string {

	return func(fileName string) string {
		fileName += suffix
		if strings.HasSuffix(fileName, suffix) {
			return fileName
		} else {
			return fileName
		}
	}
}

```



#### defer 

> 简绍

在函数中，程序员经常需要创建资源(比如:数据库连接、文件句柄、锁等)，为了在函数执行完毕后，及时的释放资源，Go的设计者提供defer (延时机制)。



- 实际案例

```go
package main

import "fmt"

func main() {
	sum(1, 2)

}

// 当执行到defer时， 暂时不执行，会将defer后面的语句压入到独立的栈
// 当函数执行完毕后，再从defer栈， 按照先入后出的方式出栈，执行

func sum(n1, n2 int) int {
	defer fmt.Println("ok1  n1 = ", n1) //最后输出
	defer fmt.Println("ok2 n2 =  ", n2) //第二个输出
	sum := n1 + n2
	fmt.Println("ok3   sum= ", sum) //第一个输出
	return sum
}

```

defer 的细节说明

1. 当go执行到一-个defer时，不会立即执行defer后的语句， 而是将defer后的语句压入到一个栈中然后继续执行函数下一个语句。

2. 当函数执行完毕后，在从defer栈中， 依次从栈顶取出语句执行(注**:遵守栈先入后出的机制**)，所以同学们看到前面案例输出的顺序。

3. 在defer将语句放入栈中，也会将相关的值拷贝同时入栈。看下面代码演示

   ```go
   package main
   
   import "fmt"
   
   func main() {
   	sum(1, 2)
   
   }
   
   // 当执行到defer时， 暂时不执行，会将defer后面的语句压入到独立的栈
   // 当函数执行完毕后，再从defer栈， 按照先入后出的方式出栈，执行
   
   func sum(n1, n2 int) int {
   	defer fmt.Println("ok1  n1 = ", n1) //最后输出    n1 =1
   	defer fmt.Println("ok2 n2 =  ", n2) //第二个输出  n2 =2
   	n1++
   	n2++
   	sum := n1 + n2
   	fmt.Println("ok3   sum= ", sum) //第一个输出
   	return sum
   }
   
   ```





#### 函数参数的传递方式

- 基本简绍

  我们在讲解函数注意事项和使用细节时，已经讲过值类型和引用类型了，这里我们再系统总结一下，因为这是重难点**，值类型参数默认就是值传递**，**而引用类型参数默认就是引用传递。**

- 两种传递方式

  - 值传递
  - 引用传递

  其实，不管是值传递还是引用传递，传递给函数的都是变量的副本，**不同的是，值传递的是值的拷贝****，引用传速的是地址的拷贝**，一般来说，地址拷贝效率高，因为数据量小，而值拷贝诀定拷贝的数据大小，数据越大，效率越低**。



##### 值类型和引用类型

- 值类型：基本数据类型int系列，float系列，bool，string，数组和结构体struct
- 引用类型：指针，slice 切片， map， 管道chan， interface 都是引用类型



>  值传递和引用传递的使用特点

- **值类型默认是值传递:** 变量直接存储值，内存通常在栈中分配
- **引用类型默认是引用传递:** 变量存储的是--个地址，这个地址对应的空间才真正存储数据(值)，内存通常在堆上分配，当没有任何变量引用这个地址时，该地址对应的数据空间就成为一个垃圾，由GC来回收。
- 如果希望函数内的变量能修改函数外的变量，可以传入变量的地址&，函数内以指针的方式操作变量。从效果上看类似引用

 

#### string中常用的函数

> 以下有一些属于内嵌函数  在官网中 builtin可以查看



##### len()

- 基本简绍

  - 统计字符串的长度
  - 实际案例

  ```go
  	str := "wmt王孟涛"
  	// 输出为 str的长度为 12  因为一个汉字占用三个字节
  	fmt.Println("str的长度为", len(str))
  ```



##### string遍历中文问题

- 基本简绍

  - 在遍历字符串的时候有中文会出现切断的问题

  - 处理方式 ：[] rune

  - 实际案例

    ```go
    	str := "wmt王孟涛"
    	str2 := []rune(str) //同于处理中文被分割成一个字符的问题  强行转换成切片
    	for i := 0; i < len(str2); i++ {
    		fmt.Printf("%c", str2[i])
    	}
    ```



##### Atoi

- 基本简绍

  - Atoi是ParseInt(s, 10, 64)的简写。 就是把string 转成int

  - 实际操作

    ```go
    	str := "1234"
    	n1, err := strconv.Atoi(str)
    	if err == nil {
    		fmt.Println("转换成功n1=", n1)
    	} else {
    		fmt.Println("转换失败", err)
    	}
    ```

    

##### Itoa

- 基本简绍
  - Itoa是FormatInt(i, 10) 的简写。

  - 实际操作

    ```go
    	// 把4560转换成string类型
    	str := strconv.Itoa(4560)
    	fmt.Printf("str的类型是%T ,str=%s", str, str)
    ```



##### string转 []byte

- 基本简绍
  - 把string类型转成byte类型 通过byte切片

  - 实际操作

    ```go
    	var bytes = []byte("hello golang")
    	fmt.Printf("%c", bytes)
    ```

    

##### []byte转string

- 基本简绍
  - []byte转string字符串

  - 实际操作

    ```go
    	var str = string([]byte{96, 97, 98})
    	fmt.Printf(str) //输出 `ab
    ```

    

##### 十进制转成其它进制

- 基本简绍

  - ```
    func FormatInt(i int64, base int) string
    ```

  - 返回i的base进制的字符串表示。base 必须在2到36之间，结果中会使用小写字母'a'到'z'表示大于10的数字。

    ​	实际操作

    ```go
    	res := strconv.FormatInt(10, 2)
    	fmt.Printf(res) //1010
    ```



##### 查找字符串中的数据

- 基本简绍

  - ```
    func Contains(s, substr string) bool
    ```

  - 判断字符串s是否包含子串substr。

    ```go
    	str1 := "山巅自相逢.jpg"
    	b := strings.Contains(str1, ".jpg")
    	fmt.Println("str1是否有.jpg", b)  //str1是否有.jpg true
    ```

    

##### Count

- 基本简绍

  - ```go
    func Count(s, sep string) int
    ```

  - 返回字符串s中有几个不重复的sep子串。

    ```go
    	str1 := "你我山巅自相逢 相逢既是缘"
    	count := strings.Count(str1, "相逢")
    	fmt.Println("str1有多少个相逢", count)//str1有多少个相逢 2
    ```

    

##### 不区分大小写字符串比较

- 基本简绍

  - 判断两个utf-8编码字符串（将unicode大写、小写、标题三种格式字符视为相同）是否相同。 == 区分字符大小写的

  - ```
    func EqualFold(s, t string) bool
    ```

  - 实际操作

    ```go
    	str1 := "AbC"
    	fmt.Println(strings.EqualFold(str1, "abc"))//true
    ```

    

##### LastIndex

- 基本简绍

  - 子串sep在字符串s中第一次出现的位置，不存在则返回-1。

  - ```
    func Index(s, sep string) int
    ```

  - 实际操作

    ```go
    	str1 := "你我山巅自相逢 相逢既是缘"
    	index := strings.LastIndex(str1, "相逢")
    	fmt.Println(index) //15   因为一个汉字算3字节
    ```

    

##### LastIndex

- 基本简绍

  - 子串sep在字符串s中最后一次出现的位置，不存在则返回-1。

  - ```
    func LastIndex(s, sep string) int
    ```

  -  实际操作

    ```go
    	str1 := "go golang"
    	lastIndex := strings.LastIndex(str1, "go")
    	fmt.Println(lastIndex) //3
    ```

    

##### Replace

- 基本简绍

  - 返回将s中前n个不重叠old子串都替换为new的新字符串，如果n<0会替换所有old子串。

  - ```
    func Replace(s, old, new string, n int) string
    ```

  - 实际操作

    ```go
    	str1 := "go golang"
    	str2 := strings.Replace(str1, "go", "go语言", -1)
    	fmt.Println(str2)//go语言 go语言lang
    ```

    



##### split

- 基本简绍

  - 用去掉s中出现的sep的方式进行分割，会分割到结尾，并返回生成的所有片段组成的切片（每一个sep都会进行一次切割，即使两个sep相邻，也会进行两次切割）。如果sep为空字符，Split会将s切分成每一个unicode码值一个字符串。

  - ```
    func Split(s, sep string) []string
    ```

  - 实际操作

    ```go
    	str1 := "go,golang,go语言"
    	strArray := strings.Split(str1, ",")
    	for i := 0; i < len(strArray); i++ {
    		fmt.Println(strArray[i])
    		// go
    		// golang
    		// go语言
    
    	}
    ```

    

##### [ToLower ](https://github.com/golang/go/blob/master/src/strings/strings.go?name=release#437) and   [ToUpper](https://github.com/golang/go/blob/master/src/strings/strings.go?name=release#434)

- 解释

  -  ToLower           返回将所有字母都转为对应的小写版本的拷贝。

  - ToUpper            返回将所有字母都转为对应的大写版本的拷贝。

  - 实际操作

    ```go
    	// 输出go LANG
    	fmt.Println(strings.ToLower("GO"), strings.ToUpper("lang"))
    ```

    



##### TrimSpace

- 解释

  - 返回将s前后端所有空白（unicode.IsSpace指定）都去掉的字符串。

  - ```
    func TrimSpace(s string) string
    ```

  - 实际操作

    ```go
    fmt.Println(strings.TrimSpace(" \t\n a lone gopher \n\t\r\n"))
    // 输出： a lone gopher
    ```

    

##### Trim

- 解释

  - 返回将s前后端所有cutset包含的utf-8码值都去掉的字符串。

  - ```
    func Trim(s string, cutset string) string
    ```

  - 实际操作

     ```go
      	// 输出  山巅自相逢
      	str := " $ 山巅自相逢 $"
      	fmt.Println(strings.Trim(str, " $"))
     ```



##### TrimLeft

- 解释

  - 返回将s前端所有cutset包含的utf-8码值都去掉的字符串。

  - ```
    func TrimLeft(s string, cutset string) string
    ```



##### TrimRight

- 解释：

  - 返回将s后端所有cutset包含的utf-8码值都去掉的字符串

  - ```
    func TrimRight(s string, cutset string) string
    ```



##### [HasPrefix](https://github.com/golang/go/blob/master/src/strings/strings.go?name=release#371)

- 解释： 

  - 判断s是否有前缀字符串prefix。

  - ```
    func HasPrefix(s, prefix string) bool
    ```

  - 案例

    ```go
    	path := "ftp://198.162.201.10:8080"
    	// 输出 true
    	fmt.Println(strings.HasPrefix(path, "ftp"))
    ```



#####  [HasSuffix](https://github.com/golang/go/blob/master/src/strings/strings.go?name=release#376)

- 解释：

  - 判断s是否有后缀字符串suffix。

  - ```
    func HasSuffix(s, suffix string) bool
    ```

  - 实际案例

    ```go
    	fileName := "山巅.jpg"
    	// 输出   是否 是.jpg结尾true
    	b := strings.HasSuffix(fileName, ".jpg")
    	fmt.Printf("是否 是.jpg结尾%v", b)
    ```

    

#### Go 中时间日期函数

> time包提供了时间的显示和测量用的函数。日历的计算采用的是公历



##### Now()

​	

- 解释

  - Now返回当前本地时间。

  - ```
    func Now() Time
    ```

  - 实际操作

    ```go
    	now := time.Now()
    	// now类型是 time.Time now = 2023-07-12 12:34:54.4549129 +0800 CST m=+0.005178601
    	fmt.Printf("now类型是 %T now = %v", now, now)
    ```

- 时间函数的课堂练习

  - 编写一个程序查看它的运行时间

    ```go
    package main
    
    import (
    	"fmt"
    	"strconv"
    	"time"
    )
    
    func runTime() {
    	str := ""
    	for i := 0; i < 100000; i++ {
    		str += "hello" + strconv.Itoa(i)
    	}
    }
    
    func main() {
    	start := time.Now().Unix()
    	runTime()
    	end := time.Now().Unix()
    	fmt.Printf("程序运行了%v秒", end-start)
    
    }
    
    ```

    

##### func (Time) [Location](https://github.com/golang/go/blob/master/src/time/time.go?name=release#813)

```
func (t Time) Location() *Location
```

Location返回t的地点和时区信息。



##### func (Time) [Zone](https://github.com/golang/go/blob/master/src/time/time.go?name=release#823)

```
func (t Time) Zone() (name string, offset int)
```

Zone计算t所在的时区，返回该时区的规范名（如"CET"）和该时区相对于UTC的时间偏移量（单位秒）。



##### func (Time) [IsZero](https://github.com/golang/go/blob/master/src/time/time.go?name=release#243)

```
func (t Time) IsZero() bool
```

IsZero报告t是否代表Time零值的时间点，January 1, year 1, 00:00:00 UTC。



##### func (Time) [Local](https://github.com/golang/go/blob/master/src/time/time.go?name=release#796)

```
func (t Time) Local() Time
```

Local返回采用本地和本地时区，但指向同一时间点的Time。



##### func (Time) [UTC](https://github.com/golang/go/blob/master/src/time/time.go?name=release#790)

```
func (t Time) UTC() Time
```

UTC返回采用UTC和零时区，但指向同一时间点的Time。



##### func (Time) [In](https://github.com/golang/go/blob/master/src/time/time.go?name=release#804)

```
func (t Time) In(loc *Location) Time
```

In返回采用loc指定的地点和时区，但指向同一时间点的Time。如果loc为nil会panic。



##### func (Time) [Unix](https://github.com/golang/go/blob/master/src/time/time.go?name=release#830)

```
func (t Time) Unix() int64
```

Unix将t表示为Unix时间，即从时间点January 1, 1970 UTC到时间点t所经过的时间（单位秒）。



##### func (Time) [UnixNano](https://github.com/golang/go/blob/master/src/time/time.go?name=release#838)

```
func (t Time) UnixNano() int64
```

UnixNano将t表示为Unix时间，即从时间点January 1, 1970 UTC到时间点t所经过的时间（单位纳秒）。如果纳秒为单位的unix时间超出了int64能表示的范围，结果是未定义的。注意这就意味着Time零值调用UnixNano方法的话，结果是未定义的。



##### func (Time) [Equal](https://github.com/golang/go/blob/master/src/time/time.go?name=release#74)

```
func (t Time) Equal(u Time) bool
```

判断两个时间是否相同，会考虑时区的影响，因此不同时区标准的时间也可以正确比较。本方法和用t==u不同，这种方法还会比较地点和时区信息。



##### func (Time) [Before](https://github.com/golang/go/blob/master/src/time/time.go?name=release#65)

```
func (t Time) Before(u Time) bool
```

如果t代表的时间点在u之前，返回真；否则返回假。



##### func (Time) [After](https://github.com/golang/go/blob/master/src/time/time.go?name=release#60)

```
func (t Time) After(u Time) bool
```

如果t代表的时间点在u之后，返回真；否则返回假。



##### func (Time) [Date](https://github.com/golang/go/blob/master/src/time/time.go?name=release#292)

```
func (t Time) Date() (year int, month Month, day int)
```

返回时间点t对应的年、月、日。



##### func (Time) [Clock](https://github.com/golang/go/blob/master/src/time/time.go?name=release#387)

```
func (t Time) Clock() (hour, min, sec int)
```

返回t对应的那一天的时、分、秒。



##### func (Time) [Year](https://github.com/golang/go/blob/master/src/time/time.go?name=release#298)

```
func (t Time) Year() int
```

返回时间点t对应的年份。



##### func (Time) [Month](https://github.com/golang/go/blob/master/src/time/time.go?name=release#304)

```
func (t Time) Month() Month
```

返回时间点t对应那一年的第几月。 使用int强转成数字



##### func (Time) [ISOWeek](https://github.com/golang/go/blob/master/src/time/time.go?name=release#331)

```
func (t Time) ISOWeek() (year, week int)
```

返回时间点t对应的ISO 9601标准下的年份和星期编号。星期编号范围[1,53]，1月1号到1月3号可能属于上一年的最后一周，12月29号到12月31号可能属于下一年的第一周。



##### func (Time) [YearDay](https://github.com/golang/go/blob/master/src/time/time.go?name=release#424)

```
func (t Time) YearDay() int
```

返回时间点t对应的那一年的第几天，平年的返回值范围[1,365]，闰年[1,366]。



##### func (Time) [Day](https://github.com/golang/go/blob/master/src/time/time.go?name=release#310)

```
func (t Time) Day() int
```

返回时间点t对应那一月的第几日。



##### func (Time) [Weekday](https://github.com/golang/go/blob/master/src/time/time.go?name=release#316)

```
func (t Time) Weekday() Weekday
```

返回时间点t对应的那一周的周几。



##### func (Time) [Hour](https://github.com/golang/go/blob/master/src/time/time.go?name=release#402)

```
func (t Time) Hour() int
```

返回t对应的那一天的第几小时，范围[0, 23]。



##### func (Time) [Minute](https://github.com/golang/go/blob/master/src/time/time.go?name=release#407)

```
func (t Time) Minute() int
```

返回t对应的那一小时的第几分种，范围[0, 59]。



##### func (Time) [Second](https://github.com/golang/go/blob/master/src/time/time.go?name=release#412)

```
func (t Time) Second() int
```

返回t对应的那一分钟的第几秒，范围[0, 59]。



##### func (Time) [Nanosecond](https://github.com/golang/go/blob/master/src/time/time.go?name=release#418)

```
func (t Time) Nanosecond() int
```

返回t对应的那一秒内的纳秒偏移量，范围[0, 999999999]。



##### func (Time) [Add](https://github.com/golang/go/blob/master/src/time/time.go?name=release#613)

```
func (t Time) Add(d Duration) Time
```

Add返回时间点t+d。



##### func (Time) [AddDate](https://github.com/golang/go/blob/master/src/time/time.go?name=release#658)

```
func (t Time) AddDate(years int, months int, days int) Time
```

AddDate返回增加了给出的年份、月份和天数的时间点Time。例如，时间点January 1, 2011调用AddDate(-1, 2, 3)会返回March 4, 2010。

AddDate会将结果规范化，类似Date函数的做法。因此，举个例子，给时间点October 31添加一个月，会生成时间点December 1。（从时间点November 31规范化而来）



##### func (Time) [Sub](https://github.com/golang/go/blob/master/src/time/time.go?name=release#631)

```
func (t Time) Sub(u Time) Duration
```

返回一个时间段t-u。如果结果超出了Duration可以表示的最大值/最小值，将返回最大值/最小值。要获取时间点t-d（d为Duration），可以使用t.Add(-d)。



##### func (Time) [Round](https://github.com/golang/go/blob/master/src/time/time.go?name=release#1107)

```
func (t Time) Round(d Duration) Time
```

返回距离t最近的时间点，该时间点应该满足从Time零值到该时间点的时间段能整除d；如果有两个满足要求的时间点，距离t相同，会向上舍入；如果d <= 0，会返回t的拷贝。

Example



##### func (Time) [Truncate](https://github.com/golang/go/blob/master/src/time/time.go?name=release#1096)

```
func (t Time) Truncate(d Duration) Time
```

类似Round，但是返回的是最接近但早于t的时间点；如果d <= 0，会返回t的拷贝。

Example



##### func (Time) [Format](https://github.com/golang/go/blob/master/src/time/format.go?name=release#414)

```
func (t Time) Format(layout string) string
```

Format根据layout指定的格式返回t代表的时间点的格式化文本表示。layout定义了参考时间：



```
Mon Jan 2 15:04:05 -0700 MST 2006
```

格式化后的字符串表示，它作为期望输出的例子。同样的格式规则会被用于格式化时间。

预定义的ANSIC、UnixDate、RFC3339和其他版式描述了参考时间的标准或便捷表示。要获得更多参考时间的定义和格式，参见本包的ANSIC和其他版式常量。

Example



##### func (Time) [String](https://github.com/golang/go/blob/master/src/time/format.go?name=release#399)

```
	func (t Time) String() string
	// 格式化日期
	fmt.Println(time.Now().Format("2006-01-02 15:04:05"))
```

String返回采用如下格式字符串的格式化时间。

```
"2006-01-02 15:04:05.999999999 -0700 MST"
```



##### func (Time) [GobEncode](https://github.com/golang/go/blob/master/src/time/time.go?name=release#924)

```
func (t Time) GobEncode() ([]byte, error)
```

GobEncode实现了gob.GobEncoder接口。



##### func (*Time) [GobDecode](https://github.com/golang/go/blob/master/src/time/time.go?name=release#929)

```
func (t *Time) GobDecode(data []byte) error
```

GobEncode实现了gob.GobDecoder接口。



##### func (Time) [MarshalBinary](https://github.com/golang/go/blob/master/src/time/time.go?name=release#845)

```
func (t Time) MarshalBinary() ([]byte, error)
```

MarshalBinary实现了encoding.BinaryMarshaler接口。



##### func (*Time) [UnmarshalBinary](https://github.com/golang/go/blob/master/src/time/time.go?name=release#884)

```
func (t *Time) UnmarshalBinary(data []byte) error
```

UnmarshalBinary实现了encoding.BinaryUnmarshaler接口。



##### func (Time) [MarshalJSON](https://github.com/golang/go/blob/master/src/time/time.go?name=release#935)

```
func (t Time) MarshalJSON() ([]byte, error)
```

MarshalJSON实现了json.Marshaler接口。返回值是用双引号括起来的采用[RFC 3339](http://tools.ietf.org/html/rfc3339)格式进行格式化的时间表示，如果需要会提供小于秒的精度。



##### func (*Time) [UnmarshalJSON](https://github.com/golang/go/blob/master/src/time/time.go?name=release#946)

```
func (t *Time) UnmarshalJSON(data []byte) (err error)
```

UnmarshalJSON实现了json.Unmarshaler接口。时间被期望是双引号括起来的[RFC 3339](http://tools.ietf.org/html/rfc3339)格式。

##### func (Time) [MarshalText](https://github.com/golang/go/blob/master/src/time/time.go?name=release#954)

```
func (t Time) MarshalText() ([]byte, error)
```

MarshalText实现了encoding.TextMarshaler接口。返回值是采用[RFC 3339](http://tools.ietf.org/html/rfc3339)格式进行格式化的时间表示，如果需要会提供小于秒的精度。



##### func (*Time) [UnmarshalText](https://github.com/golang/go/blob/master/src/time/time.go?name=release#963) [¶](https://studygolang.com/static/pkgdoc/pkg/time.htm#pkg-index)

```
func (t *Time) UnmarshalText(data []byte) (err error)
```

UnmarshalText实现了encoding.TextUnmarshaler接口。时间被期望采用[RFC 3339](http://tools.ietf.org/html/rfc3339)格式。





#### Go的时间常量

- 时间常量
  - Nanosecond Duration = 1                           纳秒
  - Microsecond    =  1000 * Nanosecond      微秒
  - Milisecond    =   1000 *  Microsecond       毫秒
  - second  = 1000 *  Milisecond                     秒
  - Minute  = 60 * second                                 分钟
  - Hour = 60 * MInute                                      小时

> 常量的作用： 在程序中可以用于获取指定时间单位的时间，比如下得到100毫秒 100 *Time . Milisecond



##### 休眠

- sleep 函数

- ### func [Sleep](https://github.com/golang/go/blob/master/src/time/sleep.go?name=release#9)

  ```
  func Sleep(d Duration)
  ```

  Sleep阻塞当前go程至少d代表的时间段。d<=0时，Sleep会立刻返回。

- 案例

  ```go
  package main
  
  import (
  	"fmt"
  	"time"
  )
  
  // 每0.1秒打印一次 打印到100就退出
  
  func main() {
  	i := 0
  	for {
  		i++
  		// 0.1秒执行一次
  		time.Sleep(time.Millisecond * 100)
  		fmt.Println(i)
  		if i == 100 {
  			break
  		}
  	}
  
  }
  
  ```



#### 内置函数

Golang设计者为了编程方便，提供了-些函数，这些函数可以直接使用，我们称为Go的内置函数  [内置函数  builtin](https://studygolang.com/pkgdoc)



##### len

- func     len

- ```
  func len(v Type) int
  ```

  内建函数len返回 v 的长度，这取决于具体类型：

  ```
  数组：v中元素的数量
  数组指针：*v中元素的数量（v为nil时panic）
  切片、映射：v中元素的数量；若v为nil，len(v)即为零
  字符串：v中字节的数量
  通道：通道缓存中队列（未读取）元素的数量；若v为 nil，len(v)即为零
  ```





##### new

- func new

- ```
  func new(Type) *Type
  ```

  内建函数new分配内存。其第一个实参为类型，而非值。其返回值为指向该类型的新分配的零值的指针。

- 案例演示

  ```go
  package main
  
  import (
  	"fmt"
  )
  
  func main() {
  	i := 100
  	//         i的类型是 int  i的值地址是 0xc000018098   i的内容是 100
  	fmt.Printf("i的类型是 %T  i的值地址是 %v   i的内容是 %v \n", i, &i, i)
  
  	j := new(int)
  	//          j的类型是 *int  j的值地址是 0xc00000a030   j的内容是 0xc0000180d0  j的内容指向的值是 0
  	fmt.Printf("j的类型是 %T  j的值地址是 %v   j的内容是 %v  j的内容指向的值是 %v \n", j, &j, j, *j)
  }
  
  ```

  



##### make

- func make

- ```
  func make(Type, size IntegerType) Type
  ```

  内建函数make分配并初始化一个类型为切片、映射、或通道的对象。其第一个实参为类型，而非值。make的返回类型与其参数相同，而非指向它的指针。make 主要分配引用类型，其具体结果取决于具体的类型：

  ```
  切片：size指定了其长度。该切片的容量等于其长度。切片支持第二个整数实参可用来指定不同的容量；
       它必须不小于其长度，因此 make([]int, 0, 10) 会分配一个长度为0，容量为10的切片。
  映射：初始分配的创建取决于size，但产生的映射长度为0。size可以省略，这种情况下就会分配一个
       小的起始大小。
  通道：通道的缓存根据指定的缓存容量初始化。若 size为零或被省略，该信道即为无缓存的。
  ```





### 包



> 包的基本概念

go的每 一个文件都是属于一个包的，也就是说go是以包的形式来管理文件和 项目目录结构的



- 包的三大作用

1. 区分相同名字的函数、变量等标识符
2. 当程序文件很多时,可以很好的管理项目
3. 控制**函数、变量**等访问范围，即作用域





#### 包的相关说明

- 打包的基本语法

  - package包名

  

- 引入包的基本语法

  - import 包的路径

  

> 快速入门



1.包的目录结构

![image-20230711103142339](.\imgs\image-20230711103142339.png)



2.utils.go中的编写

```go
package utils

import "fmt"

// 首字母大写表示该函数可导出 类似Java的public
func Show() {
	fmt.Println("我是utils包下面的 Show方法")
}

```



3.package.go 中的编写

```go
package main
//因为golang 中我们配置了GOPATH的环境变量 会自动指到d:\GOproject    \src\go会自动添加 所以从src目录下写起
import "go_code/project07/utils"

func main() {
	utils.Show()

}

```



##### 包的注意事项和细节

1. 在给一个文件打包时，该包对应一个文件夹，比如这里的utils文件夹对应的包名就是utils,文件的包名通常和文件所在的**文件夹名一致**，一般为小写字母

2. 当一个文件要使用其它包函数或变量时，需要先引入对应的包

   1. 引入方式1: import 包名”

   2. 引入方式2：import （

      ​     					包名

      ​						 包名

      ​		             ）

3. package指令在文件第一行，然后是import指令。

4. 在import包时，路径从$GOPATH的src 下开始，**不用带src**,编译器会自动从src下开始引入

5.  可以给import导入取别名     格式： 别名  路径

   ```go
   import (
   	"fmt"
   	test "go_code/test"   //test别名
   )
   ```

6. 如果你要编译成一个可执行程序文件，就需要将这个包声明为main,即package main .这个就是一个语法规范，如果你是写一个库，包名可以自定义。

![image-20230711113502296](C:\Users\34912\Desktop\笔记\golang_study\imgs\image-20230711113502296.png)







#### 导包问题

sdk版本： 1.20版本

> 问题描述导包找不到路径

1.在dos命令中 修改 go env

```
C:\Users\34912>go env
set GO111MODULE=on  // 把修改成 off
```

	修改 go env -w GO111MODULE=on

```
C:\Users\34912>go env set GO111MODULE=off  // 把修改成 off
```



- 案例演示



目录结构:

![image-20230709112858513](.\imgs\image-20230709112858513.png)





testDemo.go 中的内容

```go
package test
// 变量名称首字母大写表示公共的类似Java的public
var Name = "wmt"

```



point2Demo.go 的内容

```go
package main

// 导入test包因为golang 中我们配置了GOPATH的环境变量 会自动指到d:\GOproject    \src\go会自动添加 所以从src目录下写起
import (
	"fmt"
	test "go_code/test"   //test别名
)

func main() {
	var num int64 = 200
	// 定义一个指针指向 num
	var prt *int64 = &num
	// ptr中打印出来的是num的内存地址
	fmt.Printf("ptr=%v \n", prt)
	// 通过指针ptr 修改 num的内容
	*prt = 123
	fmt.Printf("num=%v \n", num)
	// 导包操作
	fmt.Println(test.Name)

}

```



### Go异常处理



- 基本说明

  - Go语言追求简洁优雅，所以，Go语言不支持传统的tr..atch...finally 这种处理。

  - Go中引入的处理方式为: defer, panic, recover

  - 这几个异常的使用场景可以这么简单描述: Go中可以抛出一个panic的异常**，然后在defer中通过recover捕获这个异常**，然后正常处理

  - 实际案例

    ```go
    package main
    
    import "fmt"
    
    func test() {
    	// 匿名函数捕获异常 相当于java try catch
    	defer func() {
    		err := recover()
    		if err != nil {
    			fmt.Println("err=", err)
    		}
    		
    	}()
    	num1 := 10
    	num2 := 0
    	fmt.Println(num1 / num2)
    }
    
    func main() {
    	test()
    	fmt.Println("test下的代码")
    }
    
    	// 运行结果
        //  err= runtime error: integer divide by zero
        //  test下的代码
        
    
    ```





如图下写法 和上面写法表达的意思是相同的

​	![image-20230716170947769](.\imgs\image-20230716170947769.png)





#### 自定义错误

- 自定义错误
  - Go程序中，也支持自定义错误，使用errors.New和pan内置函数。
  - errors.New("错误说明") ,会返回一个error类型的值，表示一一个错误
  -  panic内置函数,接收一个interface{}类型的值(也就是任何值了)作为参数。可以接收error类型的变量，**输出错误信息，并退出程序**





- 语法

  - func New

  - ```
    func New(text string) error
    ```

    使用字符串创建一个错误,请类比fmt包的Errorf方法，差不多可以认为是New(fmt.Sprintf(...))。

  - 实际操作

    ```go
    package main
    
    import (
    	"errors"
    	"fmt"
    )
    
    // 自定义异常
    func readFlie(name string) (err error) {
    	if name != "init.conf" {
    		return errors.New("程序错误文件名称不等于 init.conf")
    	} else {
    		return nil
    	}
    }
    
    func test2() {
    	err := readFlie("i.config")
    	if err != nil {
    		// 如果读取到程序出现错误就打印出异常并且终止程序
    		panic(err)
            //如果运行到 panic 下面不会执行直接终止了
    		fmt.Println("test2 下的代码")
    	}
    }
    
    func main() {
    	test2()
    }
    
    // 输出
    // panic: 程序错误文件名称不等于 init.conf
    
    ```

    



### 数组和切片



#### 数组



- 数组介绍

  - 数组可以存放多个同一-类型数据。数组也是一-种数据类型，在Go中，数组是值类型。

  - 数组案例

    ```go
    package main
    
    import "fmt"
    
    // 计算6只鸡的体重用数组
    func main() {
    	var chooks [6]float32
    	chooks[0] = 10.0
    	chooks[1] = 12.0
    	chooks[2] = 13.0
    	chooks[3] = 14.0
    	chooks[4] = 16.0
    	chooks[5] = 50.1
    
    	var count float32
    	var average string
    	for i := 0; i < len(chooks); i++ {
    		count += chooks[i]
    	}
    	//  fmt.Sprintf("%0.2f",  会保存2位小数
    	average = fmt.Sprintf("%0.2f", count/float32(len(chooks)))
    	fmt.Println("鸡的随机体重是", average)
    
    }
    
    ```

  - 数组的赋值方式

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	// 第一种赋值的方式
    	var numsArrays1 [5]float32 = [5]float32{30.0, 40.0, 55.5, 66.0, 77.0}
    	fmt.Println(numsArrays1)
    	// 第二种赋值方式
    	var numsArrays2 = [2]int{3, 5}
    	fmt.Println(numsArrays2)
    	// 第三种赋值方式
    	var numsArrays3 = [...]byte{'a', 'b', 'c', 'e'}
    	fmt.Println(numsArrays3)
    	// 第四种赋值方式指定下标
    	var names = [3]string{1: "tom", 0: "jack", 2: "wmt"}
    	fmt.Println(names)
        //第五种
    	numsArrays4 := [...]uint{1, 2, 3, 4, 5}
    	fmt.Println(numsArrays4)
    }
    
    ```




- 数组的定义

  - var   数组名称   [数组大小]数组类型

  - 数组的地址和 数组的第一位是一样的 &arrInt == arrInt[0]

  - 数组的下标0位和1位是根据数据类型来的 数据类所占的字节来增加的

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	var arrInt [3]int
    	// arrInt 的值[0 0 0] , arrInt 的地址是 &[0 0 0]  
        // arrInt[0]的地址0xc00000e150 arrInt[1]的地址0xc00000e158
        // int类型是占8个字节
    	fmt.Printf("arrInt 的值%v , arrInt 的地址是 %v  arrInt[0]的地址%v arrInt[1]的地址%v", arrInt, &arrInt, &arrInt[0], &arrInt[1])
    }
    
    ```




- 实际案例

  > 输入5个学生的成绩并且记录

  ```go
  package main
  
  import "fmt"
  
  func main() {
  	var arrfloat [5]float64
  	for i := 1; i <= len(arrfloat); i++ {
  		fmt.Printf("输入的第%v个成绩为", i)
  		fmt.Scanln(&arrfloat[i])
  	}
  
  	for i := 0; i < len(arrfloat); i++ {
  		fmt.Println(arrfloat[i])
  	}
  }
  
  ```



##### 数组的遍历方式

- for-range的遍历

  - 基础语法

    - for index， value  := range array01
    - 说明： 
    - 第一个返回值index是数组下标
    - 第二个value是该下标位置的值
    - 他们都是仅在for循环内部可见的局部变量
    - 变量数组元素的时候，如果不想使用下标index，可以直接把下标index标为下划线 _
    - index和value 不是固定的程序员可以自行指定

  - 实际案例

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	arr := [...]string{"你我", "山巅", "自相逢"}
    
    	for index, value := range arr {
    
    		fmt.Println(index, value)
    	}
    }
    
    ```

  

 ##### 数组的使用细节和注意事项

- 数组是多个相同类型数据的组合，一个数组一旦声明/定义了,其长度是固定的，不能动态变化。

- var arr[]int这时arr就是一个slice切片

- 数组中的元素可以是任何数据类型，包括值类型和引用类型，但是不能混用。

  - 数组创建后，如果没有赋值，有默认值

    - 数值类型数组:  默认值为0

    - 字符串数组:     默认值为 " "

    - bool数组:         默认值为false

- 使用数组的步骤1.声明数组并开辟空间   2给数组各个元素赋值   3使用数组.

- 数组的下标是从0开始的。

- 数组下标必须在指定范围内使用，否则报panic:数组越界，比如

  - var arr [5]int则有效下标为0-4

- Go的数组属值类型，在默认情况下是值传递，因此会进行值拷贝。数组间不会相互影响

  ```go
  package main
  
  import "fmt"
  
  func test01(arr [3]string) {
  	arr[0] = "测试"
  }
  func test02(arr *[3]string) {
  	arr[0] = "测试"
  }
  
  func main() {
  	arr := [...]string{"你我", "山巅", "自相逢"}
  	// 值传递    [你我 山巅 自相逢]
  	test01(arr)
  	fmt.Println(arr)
  	// 地址传递  [测试 山巅 自相逢]
  	test02(&arr)
  	fmt.Println(arr)
  
  }
  ```

  

- 如想在其它函数中，去修改原来的数组，可以使用引用传递(指针方式)



##### 二维数组



代码演示

```go
package main

import "fmt"

func main() {
	// 二维数组 赋值方式  二维数组可以理解为 一维数组里面的还有一个数组
	var arrayInt = [4][5]int{{1, 2, 3, 4, 5}, {1, 2, 3, 4, 5}, {1, 2, 3, 4, 5}, {1, 2, 3, 4, 5}}
	fmt.Println(len(arrayInt))    //4 运行很慢效率不高
	fmt.Println(len(arrayInt[0])) //5
	// 遍历二维数组
	for i := 0; i < len(arrayInt); i++ {
		for j := 0; j < len(arrayInt[i]); j++ {
			fmt.Print(arrayInt[i][j])
		}
		fmt.Println()
	}

}

```





#### 切片

1. 切片的英文是slice
2. 切片是数组的一个引用，因此切片是引用类型，在进行传递时，遵守引用传递的机制。
3. 切片的使用和数组类似，遍历切片、访问切片的元素和求切片长度len(slice)都一样。
4. 切片的长度是可以变化的，因此切片是一个可以动态变化数组。
5. 切片定义的基本语法:，
         var变量名[]类型
         比如: var  a   [] int



- 实际操作

  ```go
  package main
  
  import "fmt"
  
  func main() {
  	var arrInt [5]int = [...]int{1, 2, 3, 4, 5}
  
  	slice := arrInt[1:3]
  	// slice 切面的名称const
  	// arrInt[1:3] 数组下标从1开始到3但是不包含3
  
  	fmt.Println("slice 的内容", slice)      //2 3
  	fmt.Println("slice 的长度", len(slice)) //2
  	//cap 容量一般是slice的2倍
  	fmt.Println("slice 的容量", cap(slice)) //4
  }
  ```

  

- 总结

  - slice 的确是一个引用类型

  - slice 从底层来说，其实就是一个数据结构(struct结构体)

    ```go
    type slice struct{
        ptr *[2]int
        len int
        cap int
    }
    ```

    



##### 切片的使用方式

- 方式一

  - 定义一个切片然后让切片去引用一个已经创建好的数组

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	var arrInt [5]int = [...]int{1, 2, 3, 4, 5}
    
    	slice := arrInt[1:3]
    	// slice 切面的名称const
    	// arrInt[1:3] 数组下标从1开始到3但是不包含3
    
    	fmt.Println("slice 的内容", slice)      //2 3
    	fmt.Println("slice 的长度", len(slice)) //2
    	//cap 容量一般是slice的2倍
    	fmt.Println("slice 的容量", cap(slice)) //4
    }
    ```

    

- 方式二

  - 通过make来创建一个切片

  - 基本语法

    - var 切片名  []type =make([], len, [cap])

    - 实际案例

      ```go
      package main
      
      import "fmt"
      
      func main() {
      	// 使用make创建切片 []int 表示切片的类型  5切片的长度  10切片的容量
      	var slice []int = make([]int, 5, 10)
      	//如果没赋值默认是类型的空值
      	fmt.Println(slice) //[0 0 0 0 0]
      	slice[0] = 10
      	slice[2] = 20
      	fmt.Println(slice) //[10 0 20 0 0]
      }
      
      ```

    - 小结

    - 通过使用make方式创建切片可以指定切片的大小和容量

    - 如果没有切片的各个元素赋值，那么会使用默认值

    - 通过make创建的切片是由make的底层维护对外不可见，只能通过slice去访问各个元素

    

- 方式三

  ```go
  package main
  
  import "fmt"
  
  func main() {
  	// 直接在创建的时候赋值
  	var slice []float32 = []float32{1.0, 20.0, 30.5, 45.6}
  	fmt.Println(slice)
  }
  
  ```



- 方式一和方式二的区别

  - 方式一是直接引用数组，这个数组是事先存在的，程序员是可见的。
  - 方式二 是通过make来创建切片，make也会创建一个数组，是由切片在底层进行维护，程序员是不可见的

  



##### for遍历

- 方式一普通for遍历

```go
package main

import "fmt"

func main() {
	// 通过第已经有了的数组创建slice
	var stringArr = [...]string{"你我", "山巅", "自相逢"}
	var sliceStr = stringArr[:]
	// 采用普通的for循环
	for i := 0; i < len(sliceStr); i++ {
		fmt.Println(sliceStr[i])
	}

}

```





- 方式二

```go
package main

import "fmt"

func main() {	
// 使用for range的方式来遍历
	var sliceInt []int = []int{1, 2, 3, 5, 4}
	for index, value := range sliceInt {
		fmt.Println(index, value)
	}
    
}
```





##### 切片的细节说明

- 切片在初始化时 var slice = arr[startIndex : endIndex]
  - 说明： 从arr数组下标为startIndex，取到下标为endIndex的元素 **不包含endIndex**
- 切片初始化时，仍然不能越界，范围在[0 ~ len (arr)] 之间，但是可以动态增长
  - var slice = arr [0 : end]                 可以简写为 var slice = arr [ : end] 
  - var slice = arr [start : len(arr)]    可以简写为 var slice = arr [start : ]  
  - var slice = arr [0: len(arr)]            可以简写为 var slice = arr [ : ]  
- cap 是一个内置函数，用于统计切片的容量，既最大可以存放多少个元素
- 切片定义完后，还不能使用，因为本身是一个空的，需要引用到一个数组，或者make一个空间供切片来使用
- 切片可以继续切片





##### 切片函数



###### func [append](https://github.com/golang/go/blob/master/src/builtin/builtin.go?name=release#134)

```go
func append(slice []Type, elems ...Type) []Type
```

内建函数append将元素追加到切片的末尾。若它有足够的容量，其目标就会重新切片以容纳新的元素。否则，就会分配一个新的基本数组。append返回更新后的切片，因此必须存储追加后的结果。

```go
slice = append(slice, elem1, elem2)
slice = append(slice, anotherSlice...)
```



> 实际案例

```go
package main

import "fmt"

func main() {
	slice := []int{100, 200, 300}
	// 追加
	slice = append(slice, 400, 500, 600)
	fmt.Println(slice) //[100 200 300 400 500 600]
	// slice = append(slice, anotherSlice...)  ... 必须加
	slice = append(slice, slice...)//[100 200 300 400 500 600 100 200 300 400 500 600]
}

```



- 底层分析

  1. 切片append操作的本质就是对数组扩容

  2. go底层会创建一 下新的数组newAr  安放扩容后大小

  3. 将slice原来包含的元素拷贝到新的数组newArr

  4. slice重新引用到newArr

  5. 注意newArr是在底层来维护的，程序员不可见.

     >  案例演示：

![image-20230720111626314](C:\Users\34912\Desktop\笔记\golang_study\imgs\image-20230720111626314.png)



###### func [copy](https://github.com/golang/go/blob/master/src/builtin/builtin.go?name=release#141)

```
func copy(dst, src []Type) int
```

内建函数copy将元素从来源切片复制到目标切片中，也能将字节从字符串复制到字节切片中。copy返回被复制的元素数量，它会是 len(src) 和 len(dst) 中较小的那个。来源和目标的底层内存可以重叠。

> 实际案例

```go
package main

import "fmt"

func main() {
	sliceSrc := []string{"你我", "山巅", "自相逢"}

	var sliceCopy = make([]string, 10)
	fmt.Println(sliceCopy) // [         ]
	copy(sliceCopy, sliceSrc)
	fmt.Println(sliceCopy) // [你我 山巅 自相逢       ]
}

```





##### slice and string

1. string 底层维护的是一个byte类型的数组
2. string是不可变的，也就说不能通过str[0]= 'w' 方式来修改字符串
3. 如果需要修改字符串，可以先将string -> []byte / 或者[rune->修改->重写转成Wstring.[演示+说明]

> 实际案例

```go
package main

import "fmt"

func main() {
	// str 底层维护的是一个byte类型的数组
	str := "你我山巅自相逢"
	// 使用切片截取出山巅自相逢 因为是一个byte类型按照字节处理  所以一个汉字占用三个字节 所以 str 从6 开始
	slice := str[6:]
	fmt.Println(slice) // 山巅自相逢

}

```





> 修改string类型的下标 汉字的化需要转换成 []rune

 

```go
package main

import "fmt"

func main() {
	// str 底层维护的是一个byte类型的数组
	str := "你我山巅自相逢"
	// 如果要替换str 的值 需要把string 转换成rune
	arr := []rune(str)
	arr[0] = '您'
	//arr的数据类型是[]int32 arr[0]的字符编码是24744
	fmt.Printf("arr的数据类型是%T arr[0]的字符编码是%v\n", arr, arr[0])
	str2 := string(arr)
	//您我山巅自相逢
	fmt.Println(str2)

}
```





### 排序和查找

> 基本概念

排序是将- -组数据， 依指定的顺序进行排列的过程。

- 排序的分类:
  - 内部排序：
    - 指将需要处理的所有数据都加载到内部存储器中进行排序。包括(**交换式排序法、选择式排序法 和 插入式排序法**);
  - 外部排序：
    - 数据量过大，无法全部加载到内存中，需要借助外部存储进行排序。包括**(合并排序法和直接合并排序法)**。





#### 交换排序

> 基本概念

交换式排序属于**内部排序法**，是运用数据值比较后，依判断规则对数据位置进行交换，以达到排序的目的。

- 交换式排序又可以分为两种：
  - 冒泡排序法
  - 快速排序法





##### 冒泡排序的

>  案例从大到小

```go
package main

import "fmt"

func sort(arrInt *[5]int) {

	for i := 0; i < len(arrInt)-1; i++ {
		for j := i + 1; j < len(arrInt); j++ {
			if (*arrInt)[i] < (*arrInt)[j] {
				temp := (*arrInt)[i]
				(*arrInt)[i] = (*arrInt)[j]
				(*arrInt)[j] = temp
			}
		}
	}
}

func main() {
	var arrInt = [5]int{33, 57, 12, 45, 77}
	sort(&arrInt)//使用的是地址传递 sort方法[5]int 写死了我不喜欢 下面是我发现另一种写法
	fmt.Println(arrInt)
}


package main

import "fmt"

func bubbleSort(arrInt []int) {
	for i := 0; i < len(arrInt)-1; i++ {
		for j := i + 1; j < len(arrInt); j++ {
			if arrInt[i] > arrInt[j] {
				temp := arrInt[i]
				arrInt[i] = arrInt[j]
				arrInt[j] = temp
			}
		}
	}
}

func main() {
	arrInt := [...]int{1, 5, 7, 9, 5, 7, 6, 3, 5}
	bubbleSort(arrInt[:]) // 切片传递
}



```



##### 快速排序



###### Lomuto 以元素为观测对象

- Lomuto分割数组后，有三部分，≤pivot、 pivot、 ≥pivot
- Pivot把数组分割后，Pivot所在的位置**正好就是排好后的位置**，这个特性也常常运用在“找数组第N大的数”中。









###### Hoare 以裂缝为观测对象















#### 查找

> 常用的查找方式

- 顺序查找
- 二分查找





##### 顺序查找

> 实际案例



```go
package main

import "fmt"

func main() {
	var resouce = [5]string{"电风扇", "水杯", "充电器", "吹风机", "枕头"}
	var key string
	fmt.Scan(&key)
	fmt.Println("请输入")
	for i := 0; i < len(resouce); i++ {
		if key == resouce[i] {
			fmt.Println("找到了~ ~ ~")
			fmt.Println("当前下标", i)
		} else if i == (len(resouce) - 1) {
			fmt.Println("找不到~~~")
		}
	}
}

```





##### 二分查找

> 实际案例



```go
package main

import "fmt"

// 冒泡排序
func bubbleSort(arrInt []int) {
	for i := 0; i < len(arrInt)-1; i++ {
		for j := i + 1; j < len(arrInt); j++ {
			if arrInt[i] > arrInt[j] {
				temp := arrInt[i]
				arrInt[i] = arrInt[j]
				arrInt[j] = temp
			}
		}
	}
}

// 二分查找
func binarySearch(arrInt []int, findValue int, leftIndex int, rightIndex int) {
	fmt.Println(leftIndex, rightIndex)
	// 判断 左边的下标大于右边的就找不到了
	if leftIndex > rightIndex {
		fmt.Println("找不到了")
		return
	}
	// 算取中间的索引
	half := (leftIndex + rightIndex) / 2
	if arrInt[half] > findValue {
		binarySearch(arrInt, findValue, leftIndex, half-1)
	} else if arrInt[half] < findValue {
		binarySearch(arrInt, findValue, half+1, rightIndex)
	} else {
		fmt.Println("找到了", findValue)
	}
}
func main() {
	arrInt := [...]int{1, 5, 7, 9, 5, 7, 6, 3, 5}
	bubbleSort(arrInt[:]) // 切片传递
	fmt.Println(arrInt)
	binarySearch(arrInt[:], 11, 0, len(arrInt)-1)
}

```







### map

> map是 key - value的数据结构

- 基本语法

  - var map 变量名 map[keytype] valuetype

- key 可以是什么类型

  - golang中的map的key可以是很多种类型，比如bool，数字，string，指针，channel，还可以是只包含前面几种类型的 接口，结构体，数字， **通常为int，string**

- 注意：

  - slice，map还有function不可以，因为这几个没法用 == 来判断
  - 声明是不会分配内存的，初始化需要make，分配内存后才能赋值和使用

  

- 实际案例

  ```go
  package main
  
  import "fmt"
  
  func main() {
  	var user map[string]string
  	// 使用map之前需要先声明
  	user = make(map[string]string, 10)
  	// key是唯一的跟Java中的map是一样的
  	user["tom"] = "是只猫"
  	user["jack"] = "是只老鼠"
  	user["ali"] = "阿里"
  	fmt.Println(user) //map[ali:阿里 jack:是只老鼠 tom:是只猫]
  
  }
  
  ```

- 以上代码说明:

  	1. 使用map之间需要使用make来声明
  	2. map中key是不能重复的不然value的值会被覆盖 和Java是一样的
  	3. map中的value是可以是一样的

  

-  func [make](https://github.com/golang/go/blob/master/src/builtin/builtin.go?name=release#182)

```
func make(Type, size IntegerType) Type
```

内建函数make分配并初始化一个类型为切片、映射、或通道的对象。其第一个实参为类型，而非值。make的返回类型与其参数相同，而非指向它的指针。其具体结果取决于具体的类型：

```
切片：size指定了其长度。该切片的容量等于其长度。切片支持第二个整数实参可用来指定不同的容量；
     它必须不小于其长度，因此 make([]int, 0, 10) 会分配一个长度为0，容量为10的切片。
映射：初始分配的创建取决于size，但产生的映射长度为0。size可以省略，这种情况下就会分配一个
     小的起始大小。
通道：通道的缓存根据指定的缓存容量初始化。若 size为零或被省略，该信道即为无缓存的。
```



#### map的声明方式

```go
package main

import "fmt"

func main() {
	// 第一次声明方式
	var user map[string]string
	// 使用map之前需要先声明
	user = make(map[string]string, 10)
	// key是唯一的跟Java中的map是一样的
	user["tom"] = "是只猫"
	user["jack"] = "是只老鼠"
	user["ali"] = "阿里"
	fmt.Println(user) //map[ali:阿里 jack:是只老鼠 tom:是只猫]
    
    
	// 第二种声明方式
	citys := make(map[string]string, 10)
	citys["no1"] = "北京"
	citys["no2"] = "上海"
	citys["no3"] = "深圳"
	fmt.Println(citys)

	// 第三种方式
	heros := map[string]string{
		"heros1": "劫",
		"heros2": "剑圣",
	}
	fmt.Println(heros)

}

```



#### 嵌套map



- 一个用户 下面有一个name 和 age 和 address

- 案例

  ```go
  package main
  
  import "fmt"
  
  func main() {
  	// 第一个make 声明的是第一个map
  	student := make(map[string]map[string]string, 10)
  	// 第二个map 声明的是第二个map 必须要第二个map
  	student["220102309"] = make(map[string]string, 3)
  	student["220102309"]["name"] = "tom"
  	student["220102309"]["age"] = "18"
  	student["220102309"]["address"] = "成都"
  	fmt.Println(student) //map[220102309:map[address:成都 age:18 name:tom]]
  }
  
  ```






#### CRUD Map

- map增加 和 更新

  -  	map["key"] =value    如果没有key就是添加   有key就是更新

  - 案例演示·

    ```go
    package main
    
    import (
    	"fmt"
    )
    
    func main() {
    	var myMap map[string]string
    	myMap = make(map[string]string, 10)
    	fmt.Println(myMap) //map[]
    	// 添加
    	myMap["name"] = "巡光"
    	fmt.Println(myMap) //map[name:巡光]
        
    	// 更新  当kye相同时就是更新
    	myMap["name"] = "追梦赤子心"
    	fmt.Println(myMap) //map[name:追梦赤子心]
    }
    
    ```

    



- map 删除

  - ```
    func delete(m map[Type]Type1, key Type)
    ```

  - 内建函数delete按照指定的键将元素从映射中删除。若m为nil或无此元素，delete不进行操作。

    ```go
    package main
    
    import (
    	"fmt"
    )
    
    func main() {
    	myMap := make(map[string]string, 10)
    	myMap["no1"] = "北京"
    	myMap["no2"] = "上海"
    	myMap["no3"] = "深圳"
    	myMap["no4"] = "成都"
    	fmt.Println(myMap) //map[no1:北京 no2:上海 no3:深圳 no4:成都]
    	// 删除
    	delete(myMap, "no4")
    	fmt.Println(myMap) // map[no1:北京 no2:上海 no3:深圳]
    }
    
    ```



> map 删除细节：

1. 如果我们要删除map的所有key ， 没有一个专门的方法可以一次性删除，可以遍历一下key 逐个删除， 

2. 或者使用map = make (...) make 一个新的，让原来的成为垃圾，被GC回收



- map 查询

  - value， isNil := map["key"]                 value 是找到的值     isNil 是否有

  - 实际案例

    ```go
    package main
    
    import (
    	"fmt"
    )
    
    func main() {
    	myMap := make(map[string]string, 10)
    	myMap["no1"] = "北京"
    	myMap["no2"] = "上海"
    	myMap["no3"] = "深圳"
    	myMap["no4"] = "成都"
    	// 查询
    	value, isNil := myMap["no1"]
    	if isNil {
    		fmt.Printf("找到了值为 %v", value)
    	} else {
    		fmt.Println("找不到")
    	}
    }
    
    ```

    









#### Map 遍历

- map 遍历使用 for range来遍历

  - 实际案例

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	myMap := make(map[string]string, 10)
    	myMap["no1"] = "北京"
    	myMap["no2"] = "上海"
    	myMap["no3"] = "深圳"
    	myMap["no4"] = "成都"
    
    	for k, v := range myMap {
    		fmt.Printf("k = %v,  v = %v \n", k, v)
    	}
    }
    
    // 输出
    //k = no3,  v = 深圳 
    //k = no4,  v = 成都 
    //k = no1,  v = 北京 
    //k = no2,  v = 上海 
    
    ```

    





#### Map 切片

> 切片的数据类型如果是map，则我们称为 slice of map  ， map 切片，这样使用则map个数就可以动态变化了



- 案例说明

  - 案例要求：使用map来记录user用户的信息  name 和 age 也就说一个user 对应一个map，并且用户的个数可以动态增加 map切片

    ```go
    package main
    
    import "fmt"
    
    func main() {
    	//  使用map来记录user用户的信息  name 和 age 也就说一个user 对应一个map，并且用户的个数可以动态增加 map切片
    	// 声明 map切片 容量为2  个人理解： 切片更像是一个可以自动扩容的数组
    	users := make([]map[string]string, 2)
    	if users[0] == nil {
    		// 在切片下标为0中声明2个map
    		users[0] = make(map[string]string, 2)
    		users[0]["name"] = "tom"
    		users[0]["age"] = "18"
    	}
    	if users[1] == nil {
    		users[1] = make(map[string]string, 2)
    		users[1]["name"] = "jack"
    		users[1]["age"] = "20"
    	}
    
    	person := map[string]string{
    		"name": "猛",
    		"age":  "18",
    	}
    	// users 切片的长度位2 如何让他自动扩容 使用append 会在后面追加
    	users = append(users, person) //[map[age:18 name:tom] map[age:20 name:jack] map[age:18 name:猛]]
    
    	fmt.Println(users)
    
    }
    
    ```

    

- 案例总结
  1.  切片更像是一个可以自动扩容的数组 切片里面可以存你定义的类型格式
  2. 使用append 可以对切片扩容





#### Map 排序

- 基础介绍
  - go 1.20.5是自动排序的 
  - 如果需要排序使用 sort 包

> go lang 的版本   1. 20 .5

```
C:\Users\34912>go version
go version go1.20.5 windows/amd64
```





#### Map 使用细节

-  Map是引用类型

- 实际案例

  ```go
  package main
  
  import "fmt"
  
  func modify(myMap map[int]int) {
  	myMap[1] = 100
  }
  
  func main() {
  	myMap := make(map[int]int)
  	myMap[0] = 0
  	myMap[1] = 1
  	myMap[2] = 2
  	fmt.Println(myMap) //map[0:0 1:1 2:2]
  	modify(myMap)
  	fmt.Println(myMap) //map[0:0 1:100 2:2]
  }
  
  ```





-  map 是自动扩容 不会发送panic

- map 的value 也经常**使用 struct 类型**

  ```go
  package main
  
  import (
  	"fmt"
  )
  
  // 定义一个结构体
  type Stu struct {
  	name    string
  	age     int
  	address string
  }
  
  func main() {
  	myMap := make(map[string]Stu)
  	// 创建一个结构体
  	stu1 := Stu{"巡光", 18, "四川"}
  	stu2 := Stu{"追梦赤子心", 16, "宜宾"}
  	myMap["2201023255"] = stu1
  	myMap["2201023225"] = stu2
  	fmt.Println(myMap)
  }
  
  ```

  

