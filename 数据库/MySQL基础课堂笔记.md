# 今日内容

1. 数据库的基本概念


2. MySQL数据库软件
    1. 安装
    2. 卸载
    3. 配置

3. SQL

## 数据库的基本概念

	1. 数据库的英文单词： DataBase 简称 ： DB
	2. 什么数据库？
		* 用于存储和管理数据的仓库。
	
	3. 数据库的特点：
		1. 持久化存储数据的。其实数据库就是一个文件系统
		2. 方便存储和管理数据
		3. 使用了统一的方式操作数据库 -- SQL

 ​ 4. 常见的数据库软件 ​ * 参见《MySQL基础.pdf》

# MySQL数据库软件

	1. 安装
		* 参见《MySQL基础.pdf》
	2. 卸载
		1. 去mysql的安装目录找到my.ini文件
			* 复制 datadir="C:/ProgramData/MySQL/MySQL Server 5.5/Data/"
		2. 卸载MySQL
		3. 删除C:/ProgramData目录下的MySQL文件夹。
		
	3. 配置
		* MySQL服务启动
			1. 手动。
			2. cmd--> services.msc 打开服务的窗口
			3. 使用管理员打开cmd
				* net start mysql : 启动mysql的服务
				* net stop mysql:关闭mysql服务
		* MySQL登录
			1. mysql -uroot -p密码
			2. mysql -hip -uroot -p连接目标的密码
			3. mysql --host=ip --user=root --password=连接目标的密码
		* MySQL退出
			1. exit
			2. quit
	
		* MySQL目录结构
			1. MySQL安装目录：basedir="D:/develop/MySQL/"
				* 配置文件 my.ini
			2. MySQL数据目录：datadir="C:/ProgramData/MySQL/MySQL Server 5.5/Data/"
				* 几个概念
					* 数据库：文件夹
					* 表：文件
					* 数据：数据

# SQL

	1.什么是SQL？
		Structured Query Language：结构化查询语言
		其实就是定义了操作所有关系型数据库的规则。每一种数据库操作的方式存在不一样的地方，称为“方言”。
		
	2.SQL通用语法
		1. SQL 语句可以单行或多行书写，以分号结尾。
		2. 可使用空格和缩进来增强语句的可读性。
		3. MySQL 数据库的 SQL 语句不区分大小写，关键字建议使用大写。
		4. 3 种注释
			* 单行注释: -- 注释内容 或 # 注释内容(mysql 特有) 
			* 多行注释: /* 注释 */
		
	3. SQL分类
		1) DDL(Data Definition Language)数据定义语言
			用来定义数据库对象：数据库，表，列等。关键字：create, drop,alter 等
		2) DML(Data Manipulation Language)数据操作语言
			用来对数据库中表的数据进行增删改。关键字：insert, delete, update 等
		3) DQL(Data Query Language)数据查询语言
			用来查询数据库中表的记录(数据)。关键字：select, where 等
		4) DCL(Data Control Language)数据控制语言(了解)
			用来定义数据库的访问权限和安全级别，及创建用户。关键字：GRANT， REVOKE 等

## 数据库列的类型

> 数值

tinyint 十分小的数据 1个字节 smallint 较小的数据 2个字节 mediumint 中等大小的数据 3个字节 int 标准的整数 4个字节 常用的int bigint 较大的数据 8个字节 float 浮点数 4个字节
double 浮点数 8个字节       (精度问题! )
decimal 字符串形式的浮点数 金融计算的时候，一 般 是使用decimal



> 字符串

char 字符串固定大小的 0~255 varchar 可变字符串 0~65535 常用的变量String tinytext 微型文本. 2^8-1 text 文本串 2^16 -1 保存大文本





> 时间日期

java.util.Date

●date YYYY-MM-DD ,日期格式 ●time HH: mm: SS 时间格式 ●datetime YYYY-MM-DD HH: mm: ss 最常用的时间格式 ●timestamp 时间戳，1970.1.1 到现在的毫秒数!
也较为常用!
●year年份表示



> null

●没有值,未知 ●==注意,不要使用NULL进行运算，结果为NUll

## 数据库的字段属性（重点）

> unsigned:

- 无符号的整数
- 声明了不能为负数

> zerofill:

- 0填充的
- 不足的位数，使用0来填充， 实列： int（3），1----001

> 自增

- 通常理解自增，自动在上一条记录的基础上+1，
- 通常用来设置唯一的主键，必须是整数类型
- 可以自定义设计主键自增的起始值和步长

> 非空

假设设置为not null，如果不给它赋值，就会报错！

null 如果不填写值，默认就是null



> 默认：

设置默认值！

sex，如果不指定值， 默认为男，



> 扩展

```
每一个表都必须存在以下五个字段，未来做项目用的，表示每一个记录存在意义！

id            主键
version       乐观锁
is_delete     伪删除
gmt_create    创建时间
gmt_update    修改时间
```

## 查看数据库表的定义语句

show ：展示

create ：创造

database： 数据库

table ：列表

```sql
SHOW CREATE DATABASE mybatistest01    —— 查看创建数据库的语句
SHOW CREATE TABLE tb_ordersitem        —— 查看tb_ordersitem 数据表的定义语句
DESC tb_ordersitem                       —— 查看表的数据结构


CREATE TABLE `tb_ordersitem` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `orders_id` int(32) DEFAULT NULL,
  `product_id` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_id` (`orders_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `tb_ordersitem_ibfk_1` FOREIGN KEY (`orders_id`) REFERENCES `tb_orders` (`id`),
  CONSTRAINT `tb_ordersitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin


```

## 修改删除数据库字段

rename ;重署名

modify:修改

change：改变

alter：改变

DROP： 放下

格式：ALTER TABLU 原来的名字 NINAME AS 现在的名字

```sql
ALTER TABLE commodity RENAME AS demo        --   修改表的名称
ALTER TABLE demo ADD age INT(20)            --   给表添加字段
ALTER TABLE demo MODIFY age1 VARCHAR(20)    --  修改约束
ALTER TABLE demo CHANGE age age1 INT(20)    -- 修改字段 
ALTER TABLE demo DROP age1                  -- 删除字段
DROP TABLE IF EXISTS demo                   -- 删除列表
```

结论：

change 用来字段重署名，不能修改字段类型和约束

modify 不用来重署名 ，只能修改字段类型和约束

注意点：

- '' 字段名，使用这个包裹
- 注释 -- /**/
- SQL关键字大小写不敏感，建议大家写小写
- 所以的符号全部用英文

## mySQL数据管理

#### 外键（了解即可）

> 方式二 创建成功后，添加外键

ALTER TABLE 表 ADD CONSTRAINT 约束名 FOREIGN KEY(作为外键的列) REFERENCES 那个表    (那个字段)

```sql
ALTER TABLE tb_orders ADD CONSTRAINT FY_id FOREIGN KEY(user_id) REFERENCES tb_person(card_id)
```

以上操作都是物理外键，数据库级别外键，我们不建议使用

**最佳实践：**

数据库只是单纯的表，用来存数据，只有行和列

我们想使用多张表的数据，想使用外键   **用程序来实现**

操作符

| 操作符     | 涵义           | 范围         | 结果  |
| ---------- | -------------- | ------------ | ----- |
| =          | 等于           | 5=6          | false |
| <> 或者！= | 不等于         | 5<>6         | true  |
| >          | 大于           | 5>4          | true  |
| <          | 小于           | 5<6          | true  |
| > =         | 大于等于       | 5<=5         | true  |
| <=         | 小于等于       | 5<=5         | true  |
| and        | 什么和什么&&   | 5>1 and  5<1 | false |
| or         | 什么或什么\|\| | 5<1 or 1>2   | true  |

#### 数据库引擎

```sql
INNODB 默认使用
MYISAM 早些年使用
```

| 引擎       | MYISAM | INNODB         |
| ---------- | ------ | -------------- |
| 事物支持   | 不支持 | 支持           |
| 外键约束   | 不支持 | 支持           |
| 全文索引   | 支持   | 不支持         |
| 数据行锁定 | 不支持 | 支持           |
| 表空间大小 | 较小   | 较大 越为二倍 |

常规操作：

- MYISAM 节约空间 速度快
- INNODB 安全高，事物处理， 夺表操作

> 物理空间存在位置

所有的数据文件都存在data目录下

本质还是文件存储

MySQL引擎在物理文件上的区别

- innoDB 在数据库表中只有一个*.frm文件，

> 设置数据库字符编码

```sql
CHARSET=utf8 
```

在MySQL中默认编码是字符编码，不支持中文

## 增删改查

**基础的增删改查和删库**

```sql
INSERT INTO login (id,username,password) VALUES(1,"www",12455) -- 添加
UPDATE login SET   username="李泽文" WHERE id=1;  —— 更新
DELETE  FROM login  WHERE id=1;    -- 删除
SELECT * FROM login  WHERE username="王孟涛"     -- 查询
TRUNCATE TABLE login;    --删库  自动编码会重制
```

```

## 用sql语言创建数据库

​```sql

-- 注意点使用英文()  表面和字段名尽量使用''引起来
--  AUTO_INCREMENT自增
-- 字符串使用单引号括起来，数字可以括也可以不括
-- 所有的语句后面加,  （英文的）最后一条可以不用加 
CREATE TABLE IF NOT EXISTS demo(
  id INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  name VARCHAR(30) NOT NULL ,
  pwd VARCHAR(25) NOT NULL ,
  sex VARCHAR(2) NOT NULL
);
CREATE TABLE student(
         id INT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
         name VARCHAR(30)DEFAULT NULL,
         sex  VARCHAR(30)DEFAULT NULL
);


## DDL:操作数据库、表

	1. 操作数据库：CRUD
		1. C(Create):创建
			* 创建数据库：
				* create database 数据库名称;
			* 创建数据库，判断不存在，再创建：
				* create database if not exists 数据库名称;
			* 创建数据库，并指定字符集
				* create database 数据库名称 character set 字符集名;
	
			* 练习： 创建db4数据库，判断是否存在，并制定字符集为gbk
				* create database if not exists db4 character set gbk;
		2. R(Retrieve)：查询
			* 查询所有数据库的名称:
				* show databases;
			* 查询某个数据库的字符集:查询某个数据库的创建语句
				* show create database 数据库名称;
		3. U(Update):修改
			* 修改数据库的字符集
				* alter database 数据库名称 character set 字符集名称;
		4. D(Delete):删除
			* 删除数据库
				* drop database 数据库名称;
			* 判断数据库存在，存在再删除
				* drop database if exists 数据库名称;
		5. 使用数据库
			* 查询当前正在使用的数据库名称
				* select database();
			* 使用数据库
				* use 数据库名称;


	2. 操作表
		1. C(Create):创建
			1. 语法：
				create table 表名(
					列名1 数据类型1,
					列名2 数据类型2,
					....
					列名n 数据类型n
				);
				* 注意：最后一列，不需要加逗号（,）
				* 数据库类型：
					1. int：整数类型
						* age int,
					2. double:小数类型
						* score double(5,2)
					3. date:日期，只包含年月日，yyyy-MM-dd
					4. datetime:日期，包含年月日时分秒	 yyyy-MM-dd HH:mm:ss
					5. timestamp:时间错类型	包含年月日时分秒	 yyyy-MM-dd HH:mm:ss	
						* 如果将来不给这个字段赋值，或赋值为null，则默认使用当前的系统时间，来自动赋值
	
					6. varchar：字符串
						* name varchar(20):姓名最大20个字符
						* zhangsan 8个字符  张三 2个字符


			* 创建表
				create table student(
					id int,
					name varchar(32),
					age int ,
					score double(4,1),
					birthday date,
					insert_time timestamp
				);
			* 复制表：
				* create table 表名 like 被复制的表名;	  	
		2. R(Retrieve)：查询
			* 查询某个数据库中所有的表名称
				* show tables;
				* show create table 表名;
			* 查询表结构
				* desc 表名;
		3. U(Update):修改
			1. 修改表名
				alter table 表名 rename to 新的表名;
			2. 修改表的字符集
				alter table 表名 character set 字符集名称;
			3. 添加一列
				alter table 表名 add 列名 数据类型;
			4. 修改列名称 类型
				alter table 表名 change 列名 新列别 新数据类型;
				alter table 表名 modify 列名 新数据类型;
			5. 删除列
				alter table 表名 drop 列名;
		4. D(Delete):删除
			* drop table 表名;
			* drop table  if exists 表名 ;

* 客户端图形化工具：SQLYog

## DML：增删改表中数据

	1. 添加数据：
		* 语法：
			* insert into 表名(列名1,列名2,...列名n) values(值1,值2,...值n);
		* 注意：
			1. 列名和值要一一对应。
			2. 如果表名后，不定义列名，则默认给所有列添加值
				insert into 表名 values(值1,值2,...值n);
			3. 除了数字类型，其他类型需要使用引号(单双都可以)引起来
	2. 删除数据：
		* 语法：
			* delete from 表名 [where 条件]
		* 注意：
			1. 如果不加条件，则删除表中所有记录。
			2. 如果要删除所有记录
				1. delete from 表名; -- 不推荐使用。有多少条记录就会执行多少次删除操作
				2. TRUNCATE TABLE 表名; -- 推荐使用，效率更高 先删除表，然后再创建一张一样的表。
	3. 修改数据：
		* 语法：
			* update 表名 set 列名1 = 值1, 列名2 = 值2,... [where 条件];
	
		* 注意：
			1. 如果不加任何条件，则会将表中所有记录全部修改。



## DQL：查询表中的记录
	* select * from 表名;
	
	1. 语法：
		select
			字段列表
		from
			表名列表
		where
			条件列表
		group by
			分组字段
		having
			分组之后的条件
		order by
			排序
		limit
			分页限定


	2. 基础查询
		1. 多个字段的查询
			select 字段名1，字段名2... from 表名；
			* 注意：
				* 如果查询所有字段，则可以使用*来替代字段列表。
		2. 去除重复：
			* distinct
		3. 计算列
			* 一般可以使用四则运算计算一些列的值。（一般只会进行数值型的计算）
			* ifnull(表达式1,表达式2)：null参与的运算，计算结果都为null
				* 表达式1：哪个字段需要判断是否为null
				* 如果该字段为null后的替换值。
		4. 起别名：
			* as：as也可以省略


	3. 条件查询
		1. where子句后跟条件
		2. 运算符
			* > 、< 、<= 、>= 、= 、<>
			* BETWEEN...AND  
			* IN( 集合) 
			* LIKE：模糊查询
				* 占位符：
					* _:单个任意字符
					* %：多个任意字符
			* IS NULL  
			* and  或 &&
			* or  或 || 
			* not  或 !
			
				-- 查询年龄大于20岁
	
				SELECT * FROM student WHERE age > 20;
				
				SELECT * FROM student WHERE age >= 20;
				
				-- 查询年龄等于20岁
				SELECT * FROM student WHERE age = 20;
				
				-- 查询年龄不等于20岁
				SELECT * FROM student WHERE age != 20;
				SELECT * FROM student WHERE age <> 20;
				
				-- 查询年龄大于等于20 小于等于30
				
				SELECT * FROM student WHERE age >= 20 &&  age <=30;
				SELECT * FROM student WHERE age >= 20 AND  age <=30;
				SELECT * FROM student WHERE age BETWEEN 20 AND 30;
				
				-- 查询年龄22岁，18岁，25岁的信息
				SELECT * FROM student WHERE age = 22 OR age = 18 OR age = 25
				SELECT * FROM student WHERE age IN (22,18,25);
				
				-- 查询英语成绩为null
				SELECT * FROM student WHERE english = NULL; -- 不对的。null值不能使用 = （!=） 判断
				
				SELECT * FROM student WHERE english IS NULL;
				
				-- 查询英语成绩不为null
				SELECT * FROM student WHERE english  IS NOT NULL;



				-- 查询姓马的有哪些？ like
				SELECT * FROM student WHERE NAME LIKE '马%';
				-- 查询姓名第二个字是化的人
				
				SELECT * FROM student WHERE NAME LIKE "_化%";
				
				-- 查询姓名是3个字的人
				SELECT * FROM student WHERE NAME LIKE '___';


​				
​				-- 查询姓名中包含德的人
​				SELECT * FROM student WHERE NAME LIKE '%德%';



​	
```

#### 去重（distinct）

做用select查询出来的数据去重的数据，只显示一条

```sql
SELECT DISTINCT NAME FROM student 
```

#### where条件字句

> 逻辑运算符

| 运算符      | 语法                  | 描述                    |
| ----------- | --------------------- | ----------------------- |
| and 或 &&  | a and b        a && b | 与 两个都为真         |
| or 或 \|\| | 1>2  \|\|  2<1        | 或   两个中一个为真     |
| not 或 !   | 2!=1                  | 非 真为假 假为真 |

 ==尽量使用英文字母==



> **and**

​     **between**(之间)

```SQL
SELECT * FROM student  WHERE id<=7 AND id>=2
SELECT * FROM student  WHERE id>=2 && id<=7
SELECT * FROM student WHERE id BETWEEN 2 AND 7
```

> or

```sql

```

> not

```sql
SELECT * FROM student WHERE id!=5
SELECT * FROM student WHERE NOT id =5
```

#### 模糊查询 比较运算符

| 运算符      | 语法                 | 描述                       |
| ----------- | -------------------- | -------------------------- |
| is null     | a  is null           | 如果操作符为null，结果为真 |
| is not null | a is  not null       | 如果操作符不为空，结果为真 |
| between     | a  between b  and  c | 若a在b和c 之间，结果为真   |
| like        | a like b             | SQL匹配如果a匹配b结果为真  |
| in          | a in（a1，a2，a3）   | 假设a在a1，或者a2          |

展示：

> like 中 % 和 _

```sql
SELECT * FROM login WHERE username LIKE "王__"  -- 一个下滑线代表一个字符
SELECT * FROM login WHERE username LIKE "王%"    -- 一个百分号代表任意字符
```

> in

```sql
SELECT * FROM login WHERE id in(1,2,3,7)  -- 查询id在1 2 3 7 中的字段 in后面必须跟一个具体值
```

#### 删库的两种方式

delete和truncate（截取）

相同点

- 都可以删除数据库的数据，都不会删除表的结构

不同

TRUNCATE 重新设置，自增计数器会重新归零

truncate 不会影响事物

```sql
TRUNCATE table  demo
```

## 联表查询

> JOIN 对比



![11](..\数据库\11.png)

思路：

- 分析数据来自那些表，如果两个以上就要使用连接查询
- 确定使用那种连接查询？ 七种连接查询
- 确定交叉点 这两张表那些数据是相同的

> INNER JOIN

```sql
SELECT a.id,username,num   --  需要查询的字段
FROM sales AS a            --  查询的表并且去别名
INNER JOIN login AS b      --  关联的另一张表
WHERE a.id=b.id            --  关联的字段
```

> on和where的区别

on是先筛选后关联 where是先关联后筛选

join（连接的表） on（判断的条件） 连接查询

where 等值查询



> RIGHT JOIN

```sql
SELECT a.id,username,num 
FROM sales s
RIGHT JOIN login a
ON s.id = a.id
```

取别名可以省略 用空格来代替





> LEFT JOIN

```sql
SELECT a.id,username,num 
FROM sales s
LEFT JOIN login a
ON s.id = a.id
```

> **结论**

| 操作        | 描述                                       |
| ----------- | ------------------------------------------ |
| inner join  | 如果表中有一个匹配就返回一个值             |
| left   join | 会从左表中返回所有的值，即使右表中没有匹配 |
| right join  | 会从右表中返回所有的值，即使左表中没有匹配 |

#### 自连接及联表查询

> 自连接及联表查询



自己的表和自己的表连接，核心：一张表拆成两张一样的表即可

![image-20210318105110746](..\数据库\image-20210318105110746.png)

```sql
SELECT s.categoryName "父栏目" , sch.categoryName "子栏目" 
FROM school  s
INNER JOIN school  sch
WHERE s.categoryid=sch.pid
```

![image-20210318105237397](..\数据库\image-20210318105237397.png)





> 字段

https://dev.mysql.com/doc/refman/5.7/en/sql-function-reference.html

```sql
-- =============    聚合函数可以统计表中的所有数据     ================
SELECT COUNT(username) FROM t_customer    -- COUNT(计数) 会忽略列中的null值 
SELECT COUNT(*) FROM t_customer           -- 不会忽略null的值  本质：计数
SELECT COUNT(1) FROM t_customer           -- 不会忽略null的值  本质： 计数
--   运行速度  COUNT(列名)  当列名为主键时运行比 COUNT(1) 快 ，如果不为列名则比count（列名） 快


--查询不同课程的平均分，最高分，最低分，平均分大于80
--核心:(根据不同的课程分组)
SELECT SubjectName, AVG(StudentResult) AS平均分, MAX(StudentResu1t) AS最高分, MIN (StudentResult) AS
最低分
FROM result r 
INNER JOIN‘subject sub
ON r. SubjectNo = sub. SubjectNo
GROUP BY r. subjectNo --通过什么字段来分组
HAVING平均分>80

```

## 数据库级别MD5加密

什么是MD5？

主要增强不可逆，具体的值的MD5是一样的

MD5 破解网站的原理，就是把简单的密码做成集合

```sql
INSERT INTO demo VALUES(4,'wmt',MD5(2145),'男')
SELECT name FROM demo WHERE pwd=MD5(2145)
```

### select完整语法

```sql
-- 顺序不能乱
select 字段或者*from 表名    -- 注意表面和字段可以去别名
left join 或者 inner join 或者 tight join  -- 关联另一张表
on id=id   -- 等值字段
where      -- 条件判断
group by   -- 按照指定结果分页
having     --过滤分组的次要条件
order by   -- 指定记录按照一个或者多个条件排序
limit      -- 指定查询的记录从哪条到那条
```

## 事物 ACID

> 什么是事物？

要么都成功，要么都失败，

**原子性 一致性 隔离性 持久性**



> 原子性

要么都成功，要么都失败



> 一致性

事物前后的数据之和要一致



> 隔离性

多个事物，不能相互影响



> 持久性

系统故障或者断电 如果未提交就事物回滚 如果已经提交就保存在数据库里面， 提交数据不可逆。







> 隔离所产生的一些问题



**脏读**

指一个事物读取到一个未提交的数据

**不可重复读**

在一个事物内读取表中的某一条数据，多次读取结果不同。（这个不一定是错误，只是某些场合不对）

**虚读 （幻读）**

是指在一个事物内读取到了别的事物插入的数据，导致前后读取不一致

### sql事物案例

```sql
-- ======================事物========================
SET autocommit = 0 -- 关闭事物提交
SET autocommit = 1 -- 开启事物提交



-- 手动处理事物
SET autocommit = 0 -- 关闭事物提交

-- 开启事物
START TRANSACTION  -- transaction  交易  事物

INSERT 
INSERT

-- 提交事物（成功持久性）
COMMIT
-- 提交失败  事物回滚
ROLLBACK

-- 事物结束开启自动提交
set autocommit =1

-- 了解
SAVEPOINT -- 设置事物的保存点  save（保） point（点）   保持点
ROLLBACK TO  SAVEPOINT -- 返回保存点
RELEASE SAVEPOINT  -- 释放保存点   release

```

**案例:**

 ```sql
SET autocommit= 0;
START TRANSACTION
UPDATE login SET password=password+250 WHERE username='王孟涛'
UPDATE login SET password=password-250 WHERE username='李泽文'
COMMIT;
ROLLBACK;
SET autocommit=1;
 ```

## 索引

MySQL官方对索引的定义为：索引（Index）**是帮助MySQL高效获取数据的数据结构**。提取句子主干，就可以得到索引的本质：索引是数据结构。

#### 索引分类

- 主键索引（PRIMARY KEY）

   唯一表示主键，不可重复 只能有一个列为主键

- 唯一索引（UNIQUE KEY）

 避免重复的列出现，唯一索引可以重复，多个列都可以标识位 唯一索引

- 常规索引（KEY INDEX）

 默认的，index 关键字或者key 关键字来设置

- 全文索引（FullText）

 在特定的数据库引擎中才有，mylsam 最新的INNODB也支持

 快速定位



> 操作索引的基本操作

```sql
-- 格式
-- ALTER table 表名 ADD FULLTEXT INDEX 索引名（字段名） 
ALTER TABLE login ADD FULLTEXT INDEX username(username)  -- 添加索引
SHOW INDEX FROM login   -- 显示所有的索引
EXPLAIN SELECT * FROM login  -- 非全文索引
EXPLAIN SELECT * FROM login WHERE MATCH(username) AGAINST('王')
-- 格式
-- create INDEX 索引名 ON 表名（表字段）
CREATE INDEX pwd_login ON login(password)  -- 第二种方式添加索引
```

索引在小数据中效果不明显，在大数据中效果就很明显

#### 索引原则

- 索引不是越多越好
- 不要对进程变动的数据加索引
- 小数据表不需要加索引
- 索引一般加在常用来查询的字段上

索引文章： https://blog.csdn.net/coder_lcw/article/details/115003529

## 用户权限管理

```sql
-- 权限管理 和备份
CREATE USER wangmengtao IDENTIFIED BY '123456'   -- 添加用户


-- 修改当前密码
set PASSWORD = PASSWORD('123456')

-- 修改指定用户密码
set PASSWORD for wangmengtao=PASSWORD('123456')

-- 重署名   RENAME USER  原来的 TO 现在的
RENAME USER wangmengtao TO wangmengtao2

-- 用户授权    ALL PRIVILEGES 全部授权  库.表    除了给别人授权 其余都可以操作
GRANT ALL PRIVILEGES ON *.* TO wangmengtao2


-- 查询权限  查询结果：'wangmengtao2'@'%'
SHOW GRANTS FOR wangmengtao2
SHOW GRANTS FOR root@localhost


-- 撤销权限
REVOKE ALL PRIVILEGES ON *.* FROM wangmengtao2

-- 删除 用户
 DROP USER wangmengtao2


```

## 数据库备份

> 为什么要备份

- 保证重要数据不丢失
- 数据转移

> MySQL数据库备份的方式

- 直接拷贝物理文件在data下面
- 在可视化工具中手动导出
- 使用命令提示行 mysqldump 命令使用

> 使用命令提示符

```
 -h 本机 -u 用户名  -p 密码   库名 表名  保存地点
mysqldump -hlocalhost -uroot -p123456 market login >D:/ login. sq1
```

## 规范数据库的设置

> 为什么要设计数据库

当数据库比较复杂的时候，我们就需要设计数据库

**糟糕的数据库**

- 数据冗余 浪费空间
- 数据插入和删除都会麻烦，异常【屏蔽使用物理外键】
- 程序性能差

**良好的数据库**

- 节省内存空间
- 保证数据库的完整性
- 方便我们开发系统

**软件开发中关于数据库的设计**

- 分析需求：分析业务和需要处理数据库的需求
- 概要设计： 设计关系ER图

前端模板

https://preview.pro.ant.design/dashboard/analysis?primaryColor=%231890ff&fixSiderbar=true&colorWeak=false&pwa=false

## 三大范式

为什么需要数据规范化？

- 信息重复
- 插入异常
- 删除异常
- 更新异常

> 三大范式

**第一范式(1NF)**

原子性： 保证每一步不可再分

**第二范式(2NF)**

前提：满足第一范式：

每一张表只描述一件事情

**第三范式(3NF)**

前提：满足第二范式：

第三范式要求：每一个字段都要与主键之间相关，不能间接相关，

**规范和性能问题**

关联查询不能超过3张表

- 考虑商业化需求和目标（成本，用户体验！） 数据库的性能更加重要
- 在规范性能的时候适当考虑一下规范性
- 故意给某一些表增加一些冗余的字段（从多表查询变成单表查询）
- 故意增加一些计算列（从大数据量降低为小数据量的查询）

## JDBC

SUN公司为了简化开发人员的(对数据库的统- -)操作,提供了一个Java操作数据库的)规范,俗称JDBC

这些规范的实现由具体的厂商去做~

对于开发，人员来说，我们只需要掌握JDBC接口的操作即可!

![image-20210321102509867](..\数据库\image-20210321102509867.png)







> JDBC代码

![image-20210321104928457](..\数据库\image-20210321104928457.png)

步骤总结:
1、加载驱动 2、连接数据库DriverManager 3、获得执行sql的对象Statement 4、获得返回的结果集 5、释放连接



> DriverManager

```java
// DriverManager. registerDriver(new com. mysq1. jdbc. Driver());
Class. forName ("com. mysq1. jdbc.Driver"); //固定写法，加载驱动!
Connection connection = Drivermanager . getConnection(ur1，username，password);
//connection代表数据库
//数据库设置自动提交
// 事务提交
//事务滚回
connection. ro11back() ;
connecti on. commit();
connecti on. setAutoCommit() ;

```

> URL

```java
string ur1 = "jdbc:mysq1://localhost:3306/jdbcstudy?
useUni code=true&characterEncoding=utf8&usessL=true" ;
// mysq1 -- 3306
//jdbc :mysq1://主机地址:端口号/数据库名?参数1&参数2&参数3
// oralce -- 1521
//jdbc :oracle: thin :@localhost :1521:sid

```

> statement执行sql的对象 prepareStatement执行SQL的对象

```java
String sql= "SELECT FROM users"; //编写SQL

statement. executeQuery(); //查询操作返回ResultSet
statement. execute(); //执行任何SQL
statement. executeupdate(); // 更新、插入、删除。都是用这个，返回一个受影响的行数
```

> resultSet 查询的结果集：封装的所有的查询结果

获得指定数据类型

```java
resultSet. getobject(); //在不知道列类型的情况下使用
//如果知道列的类型就使用指定的类型
resultSet. getStringO;
resultSet. getInt();
resultSet. getF1oat();
resultSet. getDate() ;
resultSet. getobject();

```

> 遍历，指针

```java
resultSet. beforeFirst(); // 移动到最前面
resultset. afterlastO); // 移动到最后面
resultset. next(); //移动到下一个数据
resultSet. previous(); //移动到前一行
resultSet . absolute(row); //移动到指定行
```

> 释放内存

```java
//6、释放连接
resultSet.c1ose();
statement.close0 ;
connection. close(); // 耗资源，用完关掉
```

### statement

**Jdbc中的statement对象用于向数据库发送SQL语句，想完成对数据库的增删改查，只需要通过这个对象向数据库发送增删改**
**查语句即可。**
Statement对象的executeUpdate方法，用于向数据库发送增、删、改的sq|语句，executeUpdate执行完后, 将会返回- -个整 数. (即增删改语句导致了数据库几行数据发生了变化)。
Statement.executeQuery方法用于向数据库发送查询语句，executeQuery方法返回代表查询结果的ResultSet对象。













