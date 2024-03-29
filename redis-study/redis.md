[TOC]



前言：

> 与传统数据关系（MySQL）
>
> ​	Redis是key-value数据库（NoSQL一种），MySQL是关系数据库
>
> ​	Redis数据库操作主要在内存，而MySQL主要存储在磁盘
>
> ​	Redis在某一些场景使用中要明显优于MySQL，比如计数器和排行榜



本次Redis版本：7.0.11

本次Linux版本： centOS 7

  ([Download | Redis](https://redis.io/download/#redis-downloads))

[Redis中文学习网 - Redis开发与运维技术、Redis教程、使用手册](https://www.redis.com.cn/)

[Redis 命令参考 — Redis 命令参考 (redisfans.com)](http://doc.redisfans.com/)

[Redis测试](https://try.redis.io/)



redis版本命名规则：

版本第二位是奇数则为非稳定版本如2.7，2.9

版本第二位为偶数则为稳定版本如：2.6，2.8，3.0



## 安装redis



- 查看Linux版本

```
[root@hadoop100 ~]# getconf LONG_BIT
64

```



- Linux安装redis必须先具备gcc编译环境

  - 什么是gcc

   ```
  gcc是linux下的-一个编译程序，是C程序的编译工具。
  GCC(GNU Compiler Collection)是GNU(GNU's Not Unix)计划提供的编译器家族，它能够支持C, C++, Objective-C, Fortran, Java和
  Ada等等程序设计语言前端，同时能够运行在x86, x86-64, IA-64, PowerPC, SPARC和Alpha等等几乎目前所有的硬件平台上。鉴于这些特征，
  以及GCC编译代码的高效性，使得GCC成为绝大多数自由软件开发编译的首选工具。虽然对于程序员们来说，编译器只是-一个工具，除了开发和维
  护人员，很少有人关注编译器的发展，但是GCC的影响力是如此之大，它的性能提升甚至有望改善所有的自由软件的运行效率，同时它的内部结构的
  变化也体现出现代编译器发展的新特征。
  
   ```

- 实际操作

  - 先查看gcc是否安装   gcc -v
    - 查看版本4.8.5以上就可以了（包括4.8.5）

    ```
    [root@hadoop100 ~]# gcc -v
    gcc 版本 4.8.5 20150623 (Red Hat 4.8.5-44) (GCC)
    ```

  - 如果没有gcc 环境安装

    - yum -y install gcc-c++

    ```
    [root@hadoop100 ~]# yum -y install gcc-c++
    ```

  - 查看是否有安装了redis

    - 官网建议升级到redis6.0.8 及以上 不然有安全问题

    ```
    [root@hadoop100 ~]# redis-server -v
    
    ```

  - 把官网下的redis放在Linux中/opt目录下面

    ```
    [root@hadoop100 opt]# ls
    containerd redis-7.0.11.tar.gz  rh
    ```

  - 解压文件

    ```
    [root@hadoop100 opt]# tar -zxvf redis-7.0.11.tar.gz 
    
    [root@hadoop100 opt]# ls
    containerd  redis-7.0.11  redis-7.0.11.tar.gz  rh
    
    ```

  - 进入文件

  ```
  [root@hadoop100 opt]# cd redis-7.0.11/
  [root@hadoop100 redis-7.0.11]# 
  ```

  - 安装redis
    - 默认安装到:/usr/local/bin

  ```
  [root@hadoop100 redis-7.0.11]# make && make install
  Hint: It's a good idea to run 'make test' ;)
  
  ```

  - 查看安装 进入/usr/local/bin
    - cd /usr/local/bin

  ```
  [root@hadoop100 bin]# ll -s
  总用量 21552
   5084 -rwxr-xr-x. 1 root root  5205152 4月  30 10:47 redis-benchmark
      0 lrwxrwxrwx. 1 root root       12 4月  30 10:47 redis-check-aof -> redis-server
      0 lrwxrwxrwx. 1 root root       12 4月  30 10:47 redis-check-rdb -> redis-server
   5296 -rwxr-xr-x. 1 root root  5422568 4月  30 10:47 redis-cli
      0 lrwxrwxrwx. 1 root root       12 4月  30 10:47 redis-sentinel -> redis-server
  11172 -rwxr-xr-x. 1 root root 11436944 4月  30 10:47 redis-server
  
  ```

  >   redis-benchmark              性能测试工具，服务器启动后运行该命令
  >
  >   redis-check-aof                 修复有问题的AOF文件，rdb和aof后面讲
  >
  >   redis-check-rdb                修复有问题的RDB文件
  >
  >   redis-cli                              客户端，操作入口
  >
  >   redis-sentinel                    redis集群使用
  >
  >   redis-server                       redis服务器启动命令



#### 配置reids配置文件

- 创建配置文件备份

```
#进入安装位置
[root@hadoop100 redis-7.0.11]# pwd
/opt/redis-7.0.11
#查看配置文件
[root@hadoop100 redis-7.0.11]# ll
-rw-rw-r--.  1 root root 106545 4月  17 20:54 redis.conf
#创建文件进行备份
[root@hadoop100 redis-7.0.11]# mkdir myconf
#复制
[root@hadoop100 redis-7.0.11]# cp redis.conf myconf/myredis7.conf

```

- 配置 myredis7.conf 

```
[root@hadoop100 myconf]# vim myredis7.conf 

#配置如下
daemonize no                          改成   yes                         成为后台运行

protected-mode yes                    改成    no                          保护模式

bind 127.0.0.1 -::1                   改成 注释                         注释掉不然会影响远程ip连接

requirepass 123456                    设置密码


```

- 运行redis

  ```
  [root@hadoop100 myconf]# redis-server /opt/redis-7.0.11/myconf/myredis7.conf 
  ```

  -  查看启动

  ```
  [root@hadoop100 myconf]# ps -ef | grep redis
  polkitd   19724  19703  0 4月29 ?       00:01:19 redis-server *:6379
  root      19847  19839  0 4月29 pts/0   00:00:00 redis-cli
  root      37596  32133  0 11:33 pts/1    00:00:00 grep --color=auto redis
  
  ```

- 进行连接

  - -a                     auth  密码认证

```
[root@hadoop100 myconf]# redis-cli -a 123456  -p 6379
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379> 
#检测是否成功
127.0.0.1:6379> ping
PONG

```

- 退出客户端
  - quit



- 关闭客户端
  - 如果在客户端里面
    -  SHUTDOWN
  - 如果下远程关闭
    - redis-cli -a 123456 shutdown

```
127.0.0.1:6379> SHUTDOWN
not connected> quit

```

- 卸载redis

```
ls -l /usr/local/bin/redis-*
rm -rf /usr/local/bin/redis-*
```



## Redis十大数据类型



> string

string是redis最基本的类型，一个key对应一个value。

string类型是二进制安全的，意思是redis的string可以包含任何数据，比如jpg图片或者序列化的对象。

string类型是Redis最基本的数据类型，一 个redis中字符串value最多可以是512M

二进制安全表示可以序列化



> list

Redis列表是简单的字符串列表，按照插入顺序排序。你可以添加一个元素到列表的头部(左边)或者尾部(右边)

它的底层实际是个双端链表，最多可以包含2^32 - 1个元素(4294967295,每个列表超过40亿个元素)



> hash

Redis hash是一个string类型的field (字段) 和value (值) 的映射表，hash特别适合用于存储对象。

Redis中每个hash可以存储2^32 - 1键值对(40多亿)



> set

Redis的Set是String类型的无序集合。集合成员是唯一的， 这就意味着集合中不能出现重复的数据，集合对象的编码可以是intset或者hashtable.

Redis中Set集合是通过哈希表实现的，所以添加，删除，查找的复杂度都是0(1)。

集合中最大的成员数为2^32 - 1 (4294967295,每个集合可存储40多亿个成员)



> sorted set

zset(sorted set: 有序集合)

Rediszset和set一样也是string类型元素的集合,且不允许重复的成员。

不同的是每个元素都会关联一个double类型的分数，redis正是通过分数来为集合中的成员进行从小到大的排序。

zset的成员是唯一 的,但分数(score)却可以重复。

zset集合是通过哈希表实现的，所以添加，删除，查找的复杂度都是0(1)。 集合中最大的成员数为2^32 - 1

k1 score v1 



> GEO

Redis GEO主要用于存储地理位置信息，并对存储的信息进行操作，包括

添加地理位置的坐标

获取地理位置的坐标

计算两个位置之间的距离

根据用户给定的经纬度坐标来获取指定范围内的地理位置集合



> HyperLogLog

HyperLogLog是用来做**基数统计**的算法，HyperLogLog 的优点是，在输入元素的数量或者体积非常非常大时，计算基数所需的空间总是固定且是很小的。

在Redis里面，每个HyperLogLog键只需要花费12 KB内存，就可以计算接近2^64个不同元素的基数。这和计算基数时，元素越多耗费内存就越多的集合形成鲜明对比。

但是，因为HyperLogLog只会根据输入元素来计算基数，而不会储存输入元素本身，所以HyperLogLog不能像集合那样，返回输入的各个元素。

**基数表示不重复的**



> bitmap

![image-20230504142653307](..\docker_study\imgs\image-20230504142653307.png)





> bitfield

通过bitfield命令可以**一次性操作多个比特位域(指的是连续的多个比特位)**，它会执行一系列操作 并返回一个响应数组，这个数组中的元

素对应参数列表中的相应操作的执行结果。

说白了就是通过bitfield命令我们可以一次性对多个比特位域进行操作。



> stream

redis 5.0之后的

Redis Stream主要用于消息队列( MQ，Megssage Queue)，Redis 本身是有一一个Redis发布订阅(pub/sub)来实现消息队列的功能，但它有个

缺点就是消息无法持久化，如果出现网络断开、Redis 宕机等，消息就会被丢弃。

简单来说发布订阅(pub/sub)可以分发消息，但无法记录历史消息。

而Redis Stream提供了消息的持久化和主备复制功能，可以让任何客户端访问任何时刻的数据，并且能记住每-一个 客户端的访问位置，还能保证消息不丢失





## Redis十大数据类型命令

**命令不区分大小写  ，key值区分大小写**



> 帮助命令

help @类型

### key



- `keys *`
  - 基本语法

    - keys *                                                         查看所有的key

    - 实际操作

      ```
      127.0.0.1:6379> keys *
      1) "user:1"
      ```

      

- `exists`

  - 基本语法

    - exists  key                                                   查看是否存在

    - 实际操作

      ```
      127.0.0.1:6379> EXISTS user:1
      (integer) 1
      ```

      

- `del`

  - 基本语法

    - del key                                                         删除key         原子	

    - 实际操作 

      ```
      127.0.0.1:6379> del user:1
      (integer) 1
      127.0.0.1:6379> keys *
      (empty array)
      
      ```

      

- `unlink`

  - 基本语法

    - unlink  key                                               非阻塞删除

    - 实际操作

      ```
       127.0.0.1:6379> unlink user:1
      (integer) 1
      127.0.0.1:6379> keys *
      (empty array)
      ```

      

- `ttl`

  - 基本操作

    - ttl key                                                查看还有多少秒过期， -1永不过期  -2已经过期

    - 实际操作

      ```
      127.0.0.1:6379> ttl k1
      (integer) -1
      ```

      

- `expire`

  - 基本语法

    - expire key  秒 

    - 实际操作

      ```
      127.0.0.1:6379> EXPIRE k2 7
      (integer) 1
      127.0.0.1:6379> ttl k2
      (integer) 4
      127.0.0.1:6379> ttl k2
      (integer) 0
      127.0.0.1:6379> ttl k2
      (integer) -2
      
      ```

      

- `move`

  - 基本语法

    - move  key  db                                            移动key值到其它数据库       db默认redis有【0-15】 个数据库

    - 实际操作

      ```
      127.0.0.1:6379> move k1 2
      (integer) 1
      127.0.0.1:6379> keys *
      (empty array)
      127.0.0.1:6379> select 2
      OK
      127.0.0.1:6379[2]> keys *
      1) "k1"
      ```

      

- `select`

  - 基本语法

    - select dbID                                                    使用第几个数据库   

    - 实际操作

      ```
      127.0.0.1:6379> select 2
      OK
      127.0.0.1:6379[2]> keys *
      1) "k1"
      ```

      

- `dbsize`

  - 基本语法

    - dbsize                                                        查看数据库有几个key

    - 实际操作

      ```
      127.0.0.1:6379[15]> DBSIZE
      (integer) 0
      127.0.0.1:6379[15]> set k1 v1
      OK
      127.0.0.1:6379[15]> DBSIZE
      (integer) 1
      
      ```

      



- `flushdb`
  - 基本语法
    - flushdb                                                         清空当前库





- `flushall`
  - 基本语法
    - flushall                                                          通杀全部库







### String




SET key value [NX | XX] [GET] [EX seconds | PX milliseconds | EXAT unix-time-seconds | PXAT unix-time-milliseconds | KEEPTTL]

#### 基本操作



**options**

The `SET` command supports a set of options that modify its behavior:

- `EX` *seconds* -- Set the specified expire time, in seconds.
- `PX` *milliseconds* -- Set the specified expire time, in milliseconds.
- `EXAT` *timestamp-seconds* -- Set the specified Unix time at which the key will expire, in seconds.
- `PXAT` *timestamp-milliseconds* -- Set the specified Unix time at which the key will expire, in milliseconds.
- `NX` -- Only set the key if it does not already exist.
- `XX` -- Only set the key if it already exist.
- `KEEPTTL` -- Retain the time to live associated with the key.
- `GET` -- Return the old string stored at key, or nil if key did not exist. An error is returned and `SET` aborted if the value stored at key is not a string.





##### `ex`

  - 基本语法

    - set key   value  ex   number                             设置过期时间  单位为秒

    - 实际操作

      ```
      127.0.0.1:6379> set k1 v1 ex 10
      OK
      127.0.0.1:6379> TTL k1
      (integer) 2
      127.0.0.1:6379> TTL k1
      (integer) -2
      ```



##### `px`

  - 基本语法

    - set key value px  number                                  设置过期时间   单位为毫秒    

    - 实际操作

      ```
      127.0.0.1:6379> set k1 v1 px 10000
      OK
      127.0.0.1:6379> ttl k1
      (integer) 6
      127.0.0.1:6379> ttl k1
      (integer) -2
      127.0.0.1:6379> 
      ```

      

##### `exat`

  - 基本语法

    - set key value exat unix时间戳                                                     单位秒                     

    - 实际操作

      - 从Java中获取时间戳

      ```Java
        System.out.println(Long.toString(System.currentTimeMillis()/1000L));
      ```

      - redis中操作

      ```
      127.0.0.1:6379> set k2 v2 exat 1683197431
      OK
      127.0.0.1:6379> TTL k2
      (integer) 9794
      ```

      

##### `pxat`

  - 基本语法

    - set key value pxat unix时间                                                      单位毫秒

    - 实际操作

      ```
      127.0.0.1:6379> set k2 v2 pxat 1683290696852
      OK
      127.0.0.1:6379> ttl k2
      (integer) 90949
      
      ```



##### `nx`

  - 基本语法

    - set key value nx                                 没有则创建 有则返回为nil

    - 实际操作

      ```
      127.0.0.1:6379> set k1 v1 nx
      OK
      127.0.0.1:6379> set k1 v1 nx
      (nil)
      
      ```



##### `xx`

  - 基本语法

    - set key value xx                                 有则继续创建  没有则为nil      

    - 实际操作

      ```
      127.0.0.1:6379> set k1 v1xx xx
      OK
      127.0.0.1:6379> get k1
      "v1xx"
      
      127.0.0.1:6379> keys *
      (empty array)
      127.0.0.1:6379> set k1 v1 xx
      (nil)
      
      
      ```



##### `keepttl`

  - 基本语法

    - set key  value   keepttl

    - 实际操作

      ```redis
      #最开始操作 会覆盖掉之前设置的时间
      127.0.0.1:6379> set k1 v1 ex 30
      OK
      127.0.0.1:6379> ttl k1
      (integer) 26
      127.0.0.1:6379> set k1 v2
      OK
      127.0.0.1:6379> ttl k1
      (integer) -1
      
      #会继续保存之前的时间
      127.0.0.1:6379> set k1 v1 ex 30
      OK
      127.0.0.1:6379> ttl k1
      (integer) 27
      127.0.0.1:6379> set k1 v1keepttl keepttl
      OK
      127.0.0.1:6379> ttl k1
      (integer) 8
      ```

      

#### mset/mget

- `mset和mget`

  - 基本语法 

    - mset / mget  

    - 实际操作

      ```
      127.0.0.1:6379> mset k1 v1 k2 v2 k3 v3
      OK
      
      127.0.0.1:6379> mget k1 k2 k3
      1) "v1"
      2) "v2"
      3) "v3"
      
      ```



- `msetnx`

  - 基础语法

  - msetnx  key value   key value                                                      如果是一个整体如果有一个已经有了则全部创建失败

    - 实际操作

      ```
      127.0.0.1:6379> keys *
      1) "k2"
      2) "k3"
      3) "k1"
      127.0.0.1:6379> MSETNX k1 v1 k4 v4
      (integer) 0
      127.0.0.1:6379> keys *
      1) "k2"
      2) "k3"
      3) "k1"
      
      ```



#### getrange/setrange

- `getrange`

  - 基础语法

    - getrange key  start  end                                    start 从0开始下标     -1代表到末尾

    - 实际操作

      ```
      127.0.0.1:6379> set k1 abcdefg12345678
      OK
      127.0.0.1:6379> GETRANGE k1 0 -1
      "abcdefg12345678"
      127.0.0.1:6379> GETRANGE k1 0 3
      "abcd"
      127.0.0.1:6379> GETRANGE k1 0 7
      "abcdefg1"
      
      ```

      

- `setrange`

  - 基础语法

    - setrange  key  offset  value

    - 实际操作

      ```
      127.0.0.1:6379> SETRANGE k1 1 xxxx
      (integer) 15
      127.0.0.1:6379> get k1
      "axxxxfg12345678"
      
      ```

#### 自增 



- `incr`

  - 基本语法

    - incr key                                                                 必须为数字       increase增大

    - 实际操作

      ```
      127.0.0.1:6379> set k2 100
      OK
      127.0.0.1:6379> get k2
      "100"
      127.0.0.1:6379> INCR k2
      (integer) 101
      127.0.0.1:6379> INCR k2
      (integer) 102
      
      ```

- `incrby`

  - 基本语法

    - incrby key  increment                                          定量增加           increment定量的增长

    - 实际操作

      ```
      127.0.0.1:6379> INCRBY k2 3
      (integer) 108
      127.0.0.1:6379> INCRBY k2 3
      (integer) 111
      127.0.0.1:6379> INCRBY k2 3
      (integer) 114
      
      ```



#### 自减

- `decr`

  - 基本语法

    - decr key                                                                value必须为数字  自减一

    - 实际操作

      ```
      127.0.0.1:6379> decr k2
      (integer) 113
      127.0.0.1:6379> decr k2
      (integer) 112
      127.0.0.1:6379> decr k2
      (integer) 111
      
      ```



- `decrby`

  - 基础语法

    - decrby key decrement                                         定量减少         decrement定量的减少

    - 实际操作

      ```
      127.0.0.1:6379> DECRBY k2 3
      (integer) 108
      127.0.0.1:6379> DECRBY k2 3
      (integer) 105
      ```




#### 获取字符串长度内容追加

- `STRLEN`

  - 基础语法

    -  STRLEN key                                                        获取key的长度

    - 实际操作

      ```
      127.0.0.1:6379> STRLEN k1 
      (integer) 15
      ```



- `APPEND`
  - 基础语法
    - APPEND		key             values                          追加在key中的value值里面

		```
    127.0.0.1:6379> APPEND k1 sadawds
    (integer) 22
    127.0.0.1:6379> get k1
    "axxxxfg12345678 sadawds"
    ```
```





#### 分布式锁

- `setnx`

  - 基础语法

    - setnx key value                                                无则创建有则为空

    - 实际操作

```
      #setnx  就是 set key values nx   的简写
      127.0.0.1:6379> set k3 v3 nx
      OK
      127.0.0.1:6379> set k3 v3 nx
      (nil)
      127.0.0.1:6379> setnx k4 v4 
      (integer) 1
      127.0.0.1:6379> setnx k4 v4 
      (integer) 0
      
      ```


​      

- `setex`

  - 基础语法

    - setex  key  seconds  value                                         创建key并且设计时间

    - 实际操作

      ```
      #相当于之前的： 
      # set  key  value    
      # expire   key   secodes
      
      127.0.0.1:6379> setex k5 5 v5
      OK
      127.0.0.1:6379> ttl k5
      (integer) 2
      
      ```

      

#### getset

> 先get再set

一个双端链表的结构，容量是2的32次方减1个元素，大概40多亿，主要功能有push/pop等，一 般用在栈、队列、消息队列等场景。
left、right都可 以插入添加;

如果键不存在，创建新的链表;

如果键已存在，新增内容;

如果值全移除，对应的键也就消失了。

它的底层实际是 个双向链表,对两端的操作性能很高，通过索引下标的操作中间的节点性能会较差。



- `getset`

  - 基础语法

    - getset   key values                                           先获取之前的值然后再覆盖之前的值

    - 实际操作

      ```
      #如果key为空则返回nil
      127.0.0.1:6379> get k1
      "axxxxfg12345678sadawds"
      127.0.0.1:6379> getset k1 hhhh
      "axxxxfg12345678sadawds"
      127.0.0.1:6379> get k1
      "hhhh"
      #另一个操作
      127.0.0.1:6379> set k1 wmt get 
      "hhhh"
      127.0.0.1:6379> get k1
      "wmt"
      ```

      



### list

> 单key 多values

 **Limits**

The max length of a Redis list is 2^32 - 1 (4,294,967,295) elements.



 #### **Basic commands**

- [`LPUSH`](https://redis.io/commands/lpush) adds a new element to the head of a list; [`RPUSH`](https://redis.io/commands/rpush) adds to the tail.
- [`LPOP`](https://redis.io/commands/lpop) removes and returns an element from the head of a list; [`RPOP`](https://redis.io/commands/rpop) does the same but from the tails of a list.
- [`LLEN`](https://redis.io/commands/llen) returns the length of a list.
- [`LMOVE`](https://redis.io/commands/lmove) atomically moves elements from one list to another.
- [`LTRIM`](https://redis.io/commands/ltrim) reduces a list to the specified range of elements.





####  **Blocking commands**

Lists support several blocking commands. For example:

- [`BLPOP`](https://redis.io/commands/blpop) removes and returns an element from the head of a list. If the list is empty, the command blocks until an element becomes available or until the specified timeout is reached.
- [`BLMOVE`](https://redis.io/commands/blmove) atomically moves elements from a source list to a target list. If the source list is empty, the command will block until a new element becomes available.

See the [complete series of list commands](https://redis.io/commands/?group=list).



#### 基础操作



#####  `lpush`

  - 基础语法

    - lpush key value value...                                                 创建一个list从左边进入

    - 实际操作

      ```
      127.0.0.1:6379> lpush list1 1 2 3 4 5
      (integer) 5
      ```

      

#####  `rpush`

  - 基础语法

    - rpush key value value...                                                 创建一个list从右边进入

    - 实际操作

      ```
      127.0.0.1:6379> rpush list2 11 22 33 44 55
      (integer) 5
      ```







##### `lrange`

  - 基础语法

    - lrange  key   start    end                                                       遍历集合    -1表示遍历到最后一个

    - 实际操作

      ```
      127.0.0.1:6379> LRANGE list1 0 -1
      1) "5"
      2) "4"
      3) "3"
      4) "2"
      5) "1"
      127.0.0.1:6379> LRANGE list2 0 -1
      1) "11"
      2) "22"
      3) "33"
      4) "44"
      5) "55"
      
      ```



##### ` lpop` 

  - 基础语法

    - lpop  key                                                     移除上面的一个元素           

    - 实际操作

      ```
      127.0.0.1:6379> lrange list1 0 -1
      1) "5"
      2) "4"
      3) "3"
      4) "2"
      5) "1"
      127.0.0.1:6379> lpop list1
      "5"
      127.0.0.1:6379> lrange list1 0 -1
      1) "4"
      2) "3"
      3) "2"
      4) "1"
      
      ```



##### `rpop`

  - 基础语法

    - rpop   key                                             移除下方的一个元素

    - 实际操作

      ```
      127.0.0.1:6379> lrange list1 0 -1
      1) "4"
      2) "3"
      3) "2"
      4) "1"
      127.0.0.1:6379> rpop list1
      "1"
      127.0.0.1:6379> lrange list1 0 -1
      1) "4"
      2) "3"
      3) "2"
      ```



##### `lindex`

- 基础语法

  - lindex  key  index                                            通过下标获取元素

  - 实际操作

    ```
    127.0.0.1:6379> lindex list1 0
    "4"
    ```

    

  

##### `llen`

- 基础语法

  - llen key                                                             获取list的长度

  - 实际操作

    ```
    127.0.0.1:6379> llen list1
    (integer) 3
    ```

    

##### `lrem`

- 基础语法

  - lrem  key   count  element                               去重    

  - 实际操作

    ```
    127.0.0.1:6379> lpush list1 1 1 1 1 1 1 1 2 2 2 2 2 3 3 3
    (integer) 15
    127.0.0.1:6379> lrange list1 0 -1
     1) "3"
     2) "3"
     3) "3"
     4) "2"
     5) "2"
     6) "2"
     7) "2"
     8) "2"
     9) "1"
    10) "1"
    11) "1"
    12) "1"
    13) "1"
    14) "1"
    15) "1"
    
    127.0.0.1:6379> lrem list1 6 1
    (integer) 6
    127.0.0.1:6379> lrange list1 0 -1
    1) "3"
    2) "3"
    3) "3"
    4) "2"
    5) "2"
    6) "2"
    7) "2"
    8) "2"
    9) "1"
    
    ```

    

##### `ltrim`

- 基础语法

  - ltrim key  startIndex    endIndex                                 截取元素并返回给原来的key

  - 实际操作

    ```
    127.0.0.1:6379> lrange list1 0 -1
    1) "3"
    2) "3"
    3) "3"
    4) "2"
    5) "2"
    6) "2"
    7) "2"
    8) "2"
    9) "1"
    127.0.0.1:6379> ltrim list1 2 5
    OK
    127.0.0.1:6379> lrange list1 0 -1
    1) "3"
    2) "2"
    3) "2"
    4) "2"
    ```

    
##### `rpoplpush`

- 基础语法

  - rpoplpush  source  destination                                 从集合最下面的一个元素转移到目标集合中去

  - 实际操作

    ```
    127.0.0.1:6379> lrange list1 0 -1
    1) "3"
    2) "2"
    3) "2"
    4) "2"
    127.0.0.1:6379> lrange list2 0 -1
    1) "11"
    2) "22"
    3) "33"
    4) "44"
    5) "55"
    127.0.0.1:6379> rpoplpush list1 list2
    "2"
    127.0.0.1:6379> lrange list1 0 -1
    1) "3"
    2) "2"
    3) "2"
    127.0.0.1:6379> lrange list2 0 -1
    1) "2"
    2) "11"
    3) "22"
    4) "33"
    5) "44"
    6) "55"
    
    ```




##### `lset`

- 基础语法

  - lset key  index  element                             通过下表来设置值

  - 实际操作

    ```
    127.0.0.1:6379> lrange list1 0 -1
    1) "3"
    2) "2"
    3) "2"
    127.0.0.1:6379> lset list1 1 redis
    OK
    127.0.0.1:6379> lrange list1 0 -1
    1) "3"
    2) "redis"
    3) "2"
    
    ```







##### `linsert`

- 基础语法

  - linsert  key  before/after   pivot    element                            通过已经知晓的元素在它之前或者之后插入

  - 实际操作

    ```
    127.0.0.1:6379> lrange list1 0 -1
    1) "3"
    2) "redis"
    3) "2"
    127.0.0.1:6379> linsert list1 before redis mysql
    (integer) 4
    127.0.0.1:6379> lrange list1 0 -1
    1) "3"
    2) "mysql"
    3) "redis"
    4) "2"
    ```



##### 实际使用在

微信公众号订阅





### hash



> hash 相当于 Map<string , map<object, object>>



#### Basic commands

- [`HSET`](https://redis.io/commands/hset) sets the value of one or more fields on a hash.
- [`HGET`](https://redis.io/commands/hget) returns the value at a given field.
- [`HMGET`](https://redis.io/commands/hmget) returns the values at one or more given fields.
- [`HINCRBY`](https://redis.io/commands/hincrby) increments the value at a given field by the integer provided.

See the [complete list of hash commands](https://redis.io/commands/?group=hash).





#### 基础操作



##### `hset`

- 基础命令

  - hset key  field value  [field value ....]                       创建hash

  - 实际操作

    ```
    127.0.0.1:6379> hset wmt age 18 sex man length 175
    (integer) 3
    127.0.0.1:6379> hget wmt age
    "18"
    127.0.0.1:6379> hget wmt man
    (nil)
    127.0.0.1:6379> hget wmt sex
    "man"
    
    ```





##### `hget`

- 基础命令

  - hget key  field                                                               获取hash里面的元素        

  - 实际操作

    ```
    127.0.0.1:6379> hset wmt age 18 sex man length 175
    (integer) 3
    127.0.0.1:6379> hget wmt age
    "18"
    127.0.0.1:6379> hget wmt man
    (nil)
    127.0.0.1:6379> hget wmt sex
    "man"
    ```



##### `hmget`

- 基础命令

  - hmget  key   field  [field....]                                        获取多个元素

  - 实际操作

    ```
    127.0.0.1:6379> hmget wmt age sex length
    1) "18"
    2) "man"
    3) "175"
    ```



##### `hgetall`

- 基础命令

  - hgetall key                                                                    获取hash里面的全部值

  - 实际操作

    ```
    127.0.0.1:6379> hgetall wmt
    1) "age"
    2) "18"
    3) "sex"
    4) "man"
    5) "length"
    6) "175"
    ```

    

##### `hdel`

- 基础命令

  - hdel    key    field                                                  删除指定字段

  - 实际操作

    ```
    127.0.0.1:6379> hdel wmt age
    (integer) 1
    ```



##### `hlen`

- 基础命令

  - hlen  key                                                              获取字段的长度

  - 实际操作

    ```
    127.0.0.1:6379> hlen wmt
    (integer) 2
    
    ```



##### `hexists`

- 基础命令

  - hexists   key   field                                                 判断hash里面是否有这个字段

  - 实际操作

    ```
    127.0.0.1:6379> hexists wmt age
    (integer) 0
    127.0.0.1:6379> hexists wmt sex
    (integer) 1
    ```



##### `hkeys`

- 基础命令

  - hkeys  key                                                     获取全部的key值

  - 实际操作

    ```
    127.0.0.1:6379> hkeys wmt
    1) "sex"
    2) "length"
    
    
    ```



##### `hvals`

- 基础命令

  - hvals    key                                                        获取全部的valus 

  - 实际操作

    ```
    127.0.0.1:6379> hvals wmt
    1) "man"
    2) "175"
    ```



##### `hincrby`

- 基础命令

  - hincby  key   field   increment                       增加指定的元素

  - 实际操作

    ```
    127.0.0.1:6379> HINCRBY wmt length 2
    (integer) 177
    ```



##### `hincrbyfloat`

- 基础命令

  - HINCRBYFLOAT key  field   0.5                       浮点数的增加

  - 实际操作

    ```
    127.0.0.1:6379> hgetall wmt
    1) "sex"
    2) "man"
    3) "length"
    4) "177"
    5) "grade"
    6) "18.5"
    7) "age"
    8) "19"
    127.0.0.1:6379> HINCRBYFLOAT wmt grade 0.5
    "19"
    
    ```



##### `hsetnx`

- 基础命令

  - hsetnx  key  field   element                     不存在则创建存在则不创建

  - 实际操作

    ```
    127.0.0.1:6379> hsetnx wangmengtao name wmt 
    (integer) 1
    127.0.0.1:6379> hsetnx wangmengtao name wmt 
    (integer) 0
    
    ```



##### 使用场景

> 早期购物车 目前中小厂还在使用







### set

>  无序无重复



#### Limits

The max size of a Redis set is 2^32 - 1 (4,294,967,295) members.



#### Basic commands

- [`SADD`](https://redis.io/commands/sadd) adds a new member to a set.
- [`SREM`](https://redis.io/commands/srem) removes the specified member from the set.
- [`SISMEMBER`](https://redis.io/commands/sismember) tests a string for set membership.
- [`SINTER`](https://redis.io/commands/sinter) returns the set of members that two or more sets have in common (i.e., the intersection).
- [`SCARD`](https://redis.io/commands/scard) returns the size (a.k.a. cardinality) of a set.

See the [complete list of set commands](https://redis.io/commands/?group=set).







#### 基础命令



##### `sadd`

- 基础命令

  - sadd  key member [ member....]                                      创建set集合无序无重复

  - 实际操作

    ```
    127.0.0.1:6379> sadd set 1 2 3 1
    (integer) 3
    ```

    

##### `smembers`

- 基础命令

  - smembers key                                                                          遍历set集合

  - 实际操作

    ```
    127.0.0.1:6379> SMEMBERS set
    1) "1"
    2) "2"
    3) "3"
    ```

    

##### `sismember `

- 基础命令

  - sismember kye  member                                                      判断该成员是否存在

  - 实际操作

    ```
    127.0.0.1:6379> sismember set 1
    (integer) 1
    127.0.0.1:6379> sismember set 3
    (integer) 1
    127.0.0.1:6379> sismember set 4
    (integer) 0
    
    ```

    

##### `srem`

- 基础操作

  - srem key member [member...]                                               去除多个成员

  - 实际操作

    ```
    127.0.0.1:6379> srem set 1 2
    (integer) 2
    127.0.0.1:6379> smembers set
    1) "3"
    ```

    

##### `scard`

- 基础操作

  - scard key                                                                                      获取集合里面的元素个数

  - 实际操作

     ```
    127.0.0.1:6379> scard set
    (integer) 1
    ```



##### `srandmember `

- 基础操作

  - srandmember key count                                                       从集合中随机展示设置的数字个数元素，元素不删除

  - 实际操作

    ```
    127.0.0.1:6379> srandmember set 2
    1) "5"
    2) "6"
    127.0.0.1:6379> srandmember set 3
    1) "4"
    2) "5"
    3) "3"
    ```

    

##### `spop`

- 基础操作

  - spop  key  count                                                                       从集合弹出设置的数字个数元素，并且删除元素

  - 实际操作

    ```
    127.0.0.1:6379> spop set 1
    1) "3"
    127.0.0.1:6379> spop set 3
    1) "1"
    2) "12"
    3) "5"
    127.0.0.1:6379> smembers set
    1) "2"
    2) "4"
    3) "6"
    4) "7"
    ```

    

##### `smove`

- 基础操作

  - smove source  destination member                                          把source里面指定的member转移到destination

  - 实际操作

    ```
    127.0.0.1:6379> smembers set
    1) "2"
    2) "4"
    3) "6"
    4) "7"
    127.0.0.1:6379> smembers set1
    1) "c"
    2) "a"
    3) "b"
    127.0.0.1:6379> smove set set1 2 
    (integer) 1
    127.0.0.1:6379> smembers set1
    1) "c"
    2) "a"
    3) "2"
    4) "b"
    ```

    



#### 集合运算

> a                   1 2 3 l p
>
> b                   a c x 1 2



##### `sdiff`

>  集合的差集运算A-B

- 基础操作

  - sdiff    key    key                                               第一个key和第二个key相对比取出第一个特有的key

  - 实际操作

    ```
    127.0.0.1:6379> sadd a 1 2 3 l p
    (integer) 5
    127.0.0.1:6379> sadd b a c x 1 2
    (integer) 5
    
    127.0.0.1:6379> sdiff a b 
    1) "l"
    2) "p"
    3) "3"
    
    127.0.0.1:6379> sdiff b a 
    1) "c"
    2) "x"
    3) "a"
    ```

    

##### `sunion`

> 集合的并集运算 A ∪ B

- 基础操作

  - sunion    key    key                                                              去掉2个set重复的部分并且合并起来合并起来

  - 实际操作

    ```
    127.0.0.1:6379> sunion a b
    1) "c"
    2) "1"
    3) "x"
    4) "a"
    5) "p"
    6) "2"
    7) "l"
    8) "3"
    ```

    

##### `sinter`

> 集合的交集运算 A ∩ B

- 基础操作

  - sinter    key     key                                                                把2个set共同的部分提取出来

  - 实际操作

    ```
    127.0.0.1:6379> sinter a b
    1) "1"
    2) "2"
    ```



##### `sintercard`

> Redis 7 的新特性

- 基础操作

  - sintercard  numkeys   key   [key....] [LIMIT  limit]               计算集合A 和 B 的交集个数                 

  - 实际操作

    ```
    127.0.0.1:6379> sintercard 2 a b
    (integer) 2
    ```

    



#### 实际使用场景

> 抽奖 spop
>
> 微信推荐好友   sdiff
>
> 微信点赞  sadd







### sorted set

> 有序集合
>
> set        k1    v1  v2   v3
>
> zset        k1  score v1   score v2   score v3

#### Basic commands

- [`ZADD`](https://redis.io/commands/zadd) adds a new member and associated score to a sorted set. If the member already exists, the score is updated.
- [`ZRANGE`](https://redis.io/commands/zrange) returns members of a sorted set, sorted within a given range.
- [`ZRANK`](https://redis.io/commands/zrank) returns the rank of the provided member, assuming the sorted is in ascending order.
- [`ZREVRANK`](https://redis.io/commands/zrevrank) returns the rank of the provided member, assuming the sorted set is in descending order.

See the [complete list of sorted set commands](https://redis.io/commands/?group=sorted-set).Basic commands



#### 基础操作



##### `zadd`

- 基础操作

  - ZADD key [NX | XX] [GT | LT] [CH] [INCR] score member [score member...]

  - 实际操作

    ```
    127.0.0.1:6379> zadd zset 10 v1 30 v3 20 v4 59 v5 60 v6
    (integer) 5
    ```

  - 选项

  - **XX**: Only update elements that already exist. Don't add new elements.
  - **NX**: Only add new elements. Don't update already existing elements.
  - **LT**: Only update existing elements if the new score is **less than** the current score. This flag doesn't prevent adding new elements.
  - **GT**: Only update existing elements if the new score is **greater than** the current score. This flag doesn't prevent adding new elements.
  - **CH**: Modify the return value from the number of new elements added, to the total number of elements changed (CH is an abbreviation of *changed*). Changed elements are **new elements added** and elements already existing for which **the score was updated**. So elements specified in the command line having the same score as they had in the past are not counted. Note: normally the return value of `ZADD` only counts the number of new elements added.
  - **INCR**: When this option is specified `ZADD` acts like [`ZINCRBY`](https://redis.io/commands/zincrby). Only one score-element pair can be specified in this mode.





##### `zrange`

- 基本操作

  - ZRANGE key start stop [BYSCORE | BYLEX] [REV] [LIMIT offset count] [WITHSCORES]                             遍历zset

  - 实际操作

    ```
    127.0.0.1:6379> zrange zset 0 -1
    1) "v1"
    2) "v2"
    3) "v4"
    4) "v3"
    5) "v5"
    6) "v6"
    ```
  



##### `zrevrange`

- 基础操作

  - zrevrange key start stop  withscores                               列表反向输出   withscores 输出values的值

  - 实际操作

    ```
    127.0.0.1:6379> zrevrange zset 0 -1 withscores
     1) "v6"
     2) "60"
     3) "v5"
     4) "59"
     5) "v3"
     6) "30"
     7) "v4"
     8) "20"
     9) "v2"
    10) "10"
    11) "v1"
    12) "10"
    ```

    

##### `zrangebyscore `

- 基础语法

  - zrangebyscore key stat end  [withscores]  [limit]                    通过score获取这个范围的key值  withscores 输出values的值

  - 实际操作

    ```
    #包含20 和 40 如果加( 就是不包含
    127.0.0.1:6379> ZRANGEBYSCORE zset 20 40
    1) "v2"
    2) "v3"
    3) "v4"
    ```



##### `zscore`

- 基础语法

  - zscore key member                                       通过value的值来获取score

  - 实际操作

    ```
    127.0.0.1:6379> zscore zset v2
    "20"
    ```

    

##### `zcard`

- 基础语法

  - zcard  key                                                           获取key的长度

  - 实际操作

    ```
    127.0.0.1:6379> zcard zset
    (integer) 6
    ```

    

##### `zrem`

- 基础语法

  - zrem key member [member...]                                  通过value的值来删除

  - 实际操作

    ```
    127.0.0.1:6379> zrem zset v6 v5
    (integer) 2
    ```

    

##### `zincrby`

- 基础语法

  - zincrby key number member                                       根据value的值来跟指定的score增加

  - 实际操作

    ```
    #最开始v1的score的值为10
    127.0.0.1:6379> ZINCRBY zset 10 v1
    "20"
    ```
```
    
    

##### `zcount`

- 基础语法

  - zcount key  min max                                                 通过score的最小和最大值来判断有多少个

  - 实际操作

```
    127.0.0.1:6379> zrange zset 0 -1 withscores
    1) "v1"
    2) "20"
    3) "v2"
    4) "20"
    5) "v3"
    6) "30"
    7) "v4"
    8) "40"
    127.0.0.1:6379> ZCOUNT zset 25 30
    (integer) 1
    
    ```



##### `zmpop`

- 基础语法

  - zmpop numkeys key [key...]  min | max  [COUNT  count]     弹出count大小的最大或者最小值

  - 实际操作

    ```
    127.0.0.1:6379> zmpop 1 zset min count 1
    1) "zset"
    2) 1) 1) "v1"
          2) "20"
    
    ```





##### `zrank`

- 基础语法

  -  zrank key member                                      通过value的值来获取下标

  - 实际操作

    ```
    127.0.0.1:6379> zrange zset 0 -1
    1) "v1"
    2) "v2"
    3) "v3"
    4) "v4"
    127.0.0.1:6379> zrank zset v2
    (integer) 1
    
    ```

    



##### `zrevrank`

- 基础语法

  - zrevrank  key  member                                    通过value来获取逆序下标

  - 实际操作

    ```
    127.0.0.1:6379> zrange zset 0 -1
    1) "v1"
    2) "v2"
    3) "v3"
    4) "v4"
    127.0.0.1:6379> zrank zset v2
    (integer) 1
    127.0.0.1:6379> zrevrank zset v2
    (integer) 2
    
    ```

    





### bitmap

> 由0和一表现的二进制位的bit数组

#### Basic commands

- [`SETBIT`](https://redis.io/commands/setbit) sets a bit at the provided offset to 0 or 1.
- [`GETBIT`](https://redis.io/commands/getbit) returns the value of a bit at a given offset.
- [`BITOP`](https://redis.io/commands/bitop) lets you perform bitwise operations against one or more strings.

See the [complete list of bitmap commands](https://redis.io/commands/?group=bitmap).





##### `setbit`

- 基础语法

  - setbit key offset  0|1                                     创建一个bitmap的值 offset为偏移量   

  - 实际操作

    ```
    127.0.0.1:6379> setbit bitmap  1 1
    0
    ```

    

##### `getbit`

- 基础语法

  - getbit  key  offset                                             获取偏移下表为1的值，下表标从0开始

  - 实际操作

    ```
    127.0.0.1:6379> getbit bitmap 1
    (integer) 1
    ```




##### `strlen`

- 基础语法

  - strlen key                                                                 不是字符长度而是占据几个字节，超过八位后自己按照8位一组一byte在扩容

  - 实际操作

    ```
    127.0.0.1:6379> strlen bitmap
    (integer) 1
    ```



##### `bitcount`

- 基础语法

  - bitcount key                                                                         计算为1的数量

  - 实际操作

    ```
    127.0.0.1:6379> setbit k2 0 1
    (integer) 0
    127.0.0.1:6379> setbit k2 1 1
    (integer) 0
    127.0.0.1:6379> setbit k2 2 1
    (integer) 0
    127.0.0.1:6379> bitcount k2 
    (integer) 3
    
    ```

    

##### `bitop`

> 小案例统计连续两天签到的人

- 基础语法

  - bitop operation  destkey   key   [key]

    - operation 选项
      - and   or    xor   not

  - 实际操作

    ```Linux
    #创建3个用户下标为 0 1 2
    127.0.0.1:6379> hset uid:map 0 uid-2jkhasd5-wmt 1 uid-jasd48-wang 2 uid-nanjwna5-li
    (integer) 3
    127.0.0.1:6379> hgetall uid:map
    1) "0"
    2) "uid-2jkhasd5-wmt"
    3) "1"
    4) "uid-jasd48-wang"
    5) "2"
    6) "uid-nanjwna5-li"
    #判断第一天签到的人数  key后面第一个数为用户下标  第二个为是否签到
    127.0.0.1:6379> setbit 20230510 0 1
    (integer) 0
    127.0.0.1:6379> setbit 20230510 1 1
    (integer) 0
    127.0.0.1:6379> setbit 20230510 2 0
    (integer) 0
    #判断第二天签到的人数  key后面第一个数为用户下标  第二个为是否签到
    127.0.0.1:6379> setbit 20230511 0 0
    (integer) 0
    127.0.0.1:6379> setbit 20230511 1 1
    (integer) 0
    127.0.0.1:6379> setbit 20230511 2 0
    (integer) 0
    #通过bitop 来比较生成一个全新的bitmap countday
    127.0.0.1:6379> bitop and countday 20230510 20230511
    (integer) 1
    #计算连续签到的2天的人数为
    127.0.0.1:6379> bitcount countday
    (integer) 1
    
    
    ```

    

##### 打卡案例

```
#签到情况
127.0.0.1:6379> setbit sign:user1:202305 0 1
(integer) 0
127.0.0.1:6379> setbit sign:user1:202305 1 1
(integer) 0
127.0.0.1:6379> setbit sign:user1:202305 2 1
(integer) 0
127.0.0.1:6379> setbit sign:user1:202305 3 1
(integer) 0
127.0.0.1:6379> setbit sign:user1:202305 5 1
(integer) 0
127.0.0.1:6379> setbit sign:user1:202305 25 1
(integer) 0
127.0.0.1:6379> setbit sign:user1:202305 30 1
(integer) 0
#查看第7天签到没有
127.0.0.1:6379> getbit sign:user1:202305 6
(integer) 0
#查看第31天签到没有
127.0.0.1:6379> getbit sign:user1:202305 30
(integer) 1
#查看一共来了多少天
127.0.0.1:6379> bitcount  sign:user1:202305 
(integer) 7
#查看前11天一共来了多少天
127.0.0.1:6379> bitcount  sign:user1:202305 0 10 bit
(integer) 5
#查看前3天一共来了多少天
127.0.0.1:6379> bitcount  sign:user1:202305 0 2 bit
(integer) 3
```





### HyperLogLog

> redis在2.8.9版本添加了HyperLogLog结构。   string类型

Redis HyperLogLog是用来做基数统计的算法，HyperLogLog 的优点是，在输入元素的数量或者体积非常非常大时，计算基数所需的空间总.

是固定的、并且是很小的。

在Redis里面，每个HyperLogLog键只需要花费12 KB内存，就可以计算接近2^64个不同元素的基数。这和计算基数时，元素越多耗费
内存就越多的集合形成鲜明对比。

但是，因为HyperLogLog只会根据输入元素来计算基数，而不会储存输入元素本身，所以HyperLogLog不能像集合那样,返回输入的各个
元素。.

#### Basic commands

- [`PFADD`](https://redis.io/commands/pfadd) adds an item to a HyperLogLog.
- [`PFCOUNT`](https://redis.io/commands/pfcount) returns an estimate of the number of items in the set.
- [`PFMERGE`](https://redis.io/commands/pfmerge) combines two or more HyperLogLogs into one.

See the [complete list of HyperLogLog commands](https://redis.io/commands/?group=hyperloglog).



#### 基础操作



##### `pfadd`

- 基础操作

  - pfadd   key element [element...]                                     创建一个Hyperloglog

  - 实际操作

    ```
    127.0.0.1:6379> pfadd loglog1 1 2 3 4 5 6
    (integer) 1
    127.0.0.1:6379> pfadd loglog2 1 1 2 2 3 3
    (integer) 1
    ```



##### `pfcount`

- 基础操作

  - pfcount key                                                                    记录基数无重复的个数

  - 实际操作

    ```
    127.0.0.1:6379> pfadd loglog1 1 2 3 4 5 6
    (integer) 1
    127.0.0.1:6379> pfadd loglog2 1 1 2 2 3 3
    (integer) 1
    127.0.0.1:6379> pfcount loglog1
    (integer) 6
    127.0.0.1:6379> pfcount loglog2
    (integer) 3
    ```

    

##### `pfmerge`

- 基础操作

  - pfmerge destkey  sourcekey  [sourcekey...]                       合并hyperloglog

  - 实际操作

    ```
    127.0.0.1:6379> pfmerge loglog loglog1 loglog2
    OK
    ```

    



### GEO

> 保存地理坐标的    zset的子类

主要分为三步

1. 将三维的地球变为二维的坐标
   2. 在将二维的坐标转换为一维的点块
      3. 最后将- -维的点块转换为二进制再通过base32编码
         

![image-20230511134056141](..\redis-study\imgs\image-20230511134056141.png)



> 什么是经纬线

![经纬线](https://bkimg.cdn.bcebos.com/pic/4d086e061d950a7b5037b7a209d162d9f2d3c952?x-bce-process=image/resize,m_lfit,w_536,limit_1)

[经线](https://baike.baidu.com/item/经线/1695723?fromModule=lemma_inlink)和纬线是人们为了在地球上确定位置和方向的，在[地球仪](https://baike.baidu.com/item/地球仪/64759?fromModule=lemma_inlink)和地图上画出来。

经纬线相互垂直。纬线是一条条长度不等的圆圈。最长的纬线，就是[赤道](https://baike.baidu.com/item/赤道/106883?fromModule=lemma_inlink)。 [经线](https://baike.baidu.com/item/经线/1695723?fromModule=lemma_inlink)是一条条长度相等的弧线，连接南北两极。因为经线指示南北方向，所以，经线又叫子午线。

国际上规定，把通过英国[格林尼治天文台](https://baike.baidu.com/item/格林尼治天文台/1027780?fromModule=lemma_inlink)原址的经线，叫做0°经线，也叫[本初子午线](https://baike.baidu.com/item/本初子午线/248147?fromModule=lemma_inlink)。在地球上经线指示南北方向，纬线指示东西方向。东西半球[分界线](https://baike.baidu.com/item/分界线/79262?fromModule=lemma_inlink)：东经160° 西经20°。



#### Basic commands

- [`GEOADD`](https://redis.io/commands/geoadd) adds a location to a given geospatial index (note that longitude comes before latitude with this command).
- [`GEOSEARCH`](https://redis.io/commands/geosearch) returns locations with a given radius or a bounding box.

See the [complete list of geospatial index commands](https://redis.io/commands/?group=geo).



#### 基本操作

##### `geoadd`

- 基础操作

  - geoadd key   longitude   latitude   member                     longitude 经度     latitude   维度

  - 实际操作

    ```
    127.0.0.1:6379> GEOADD city 103.569195 30.911742 "青城山"
    (integer) 1
    ```

    

##### 中文乱码问题

> 加上 --raw

```
127.0.0.1:6379> zrange city 0 -1
1) "\xe9\x9d\x92\xe5\x9f\x8e\xe5\xb1\xb1"
127.0.0.1:6379> quit
[root@hadoop100 ~]# redis-cli -a 123456 --raw
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379> zrange city 0 -1
青城山
```



##### `geopos`

- 基础操作

  - geopos  key   member                                                            获取经纬度

  - 实际操作

    ```
    127.0.0.1:6379> geopos city 青城山
    103.56919616460800171
    30.91174198571239629
    ```



##### `geohash`

- 基础操作

  - geohash    key     member                                                 把经纬度转化成geohash   转化后经度会有误差

  - 实际操作

    ```
    127.0.0.1:6379> geohash city 青城山
    wm3xug2ccn0
    ```

    

##### `geodist`

- 基础操作

  - geodist     key    member        m | km | ft | mi                    查看2个地的距离

  - 实际操作

    ```
    #查看2个地的距离
    127.0.0.1:6379> geodist city 青城山 宜宾  km
    259.8370
    
    127.0.0.1:6379> geoadd city 116.403542 39.924371 "北京"
    1
    127.0.0.1:6379> geoadd  city 104.640892 28.768508 "南京"
    1
    127.0.0.1:6379> geodist city 南京 北京 km
    1642.0406
    
    
    ```

    

##### `georadius`

- 基础操作

  - GEORADIUS key longitude latitude radius <M | KM | FT | MI>  [WITHCOORD] [WITHDIST] [WITHHASH] [COUNT count [ANY]] [ASC | DESC] [STORE key] [STOREDIST key]

  - options

    - WITHDIST表示在返回的结果中同时返回离指定中心点的距离。距离的单位与命令中指定的半径单位相同。
    - WITHCOORD表示在返回的结果中同时返回匹配项的经度和纬度坐标。
    - WITHHASH表示在返回的结果中同时返回匹配项的原始geohash编码的排序集分数，以52位无符号整数的形式表示。
    - 可以使用 ASC 和 DESC 选项来调用两种不同的排序方法。ASC 表示按距离中心最近到最远的顺序排序，而 DESC 表示按距离中心最远到最近的顺序排序。默认情况下，返回所有匹配的项。可以使用 COUNT 选项将结果限制为前 N 个匹配项。如果提供了 ANY，则命令将在找到足够的匹配项后立即返回，因此结果可能不是最接近指定点的结果，但服务器的工作量显着降低。如果没有提供 ANY，则命令将按比例执行与指定区域匹配的项数量，并对它们进行排序，因此即使只返回少量结果，查询非常大的区域并使用非常小的 COUNT 选项可能会很慢。默认情况下，该命令将结果返回给客户端。可以使用 STORE 和 STOREDIST 选项之一将结果存储在一个排序集合中，该集合包含它们的地理空间信息或它们距离中心的浮点数，单位与半径指定的单位相同。

  - 实际操作

    ```
    #当前位置 116.385488 39.87128 北京南站
    127.0.0.1:6379> GEORADIUS city 116.385488 39.87128 10 km withdist withcoord withhash  count 10 desc
    北京
    6.1028
    4069885568957141
    116.40353947877883911
    39.92437143561796375
    天安门
    4.5563
    4069885550849194
    116.40417784452438354
    39.90965230984568279
    
    ```

    



##### `georadiusbymember`

- 基础操作

  - georadiusbymember key  member  radius <M | KM | FT | MI>  [WITHCOORD] [WITHDIST] [WITHHASH] [COUNT count [ANY]] [ASC | DESC] [STORE key] [STOREDIST key]

  - 实际操作

    ```
    127.0.0.1:6379> geoadd city 116.385488 39.87128 "北京南站"
    1
    127.0.0.1:6379> georadiusbymember city  北京南站   10 km   withdist withcoord withhash count 10 asc
    北京南站
    0.0000
    4069885251630939
    116.38548821210861206
    39.87127916621444967
    天安门
    4.5564
    4069885550849194
    116.40417784452438354
    39.90965230984568279
    北京
    6.1028
    4069885568957141
    116.40353947877883911
    39.92437143561796375
    ```

    



### stream

> redis-steam就是redis版的MQ  消息中间件    redis 5.0的特点

#### Basic commands

- [`XADD`](https://redis.io/commands/xadd) adds a new entry to a stream.
- [`XREAD`](https://redis.io/commands/xread) reads one or more entries, starting at a given position and moving forward in time.
- [`XRANGE`](https://redis.io/commands/xrange) returns a range of entries between two supplied entry IDs.
- [`XLEN`](https://redis.io/commands/xlen) returns the length of a stream.

See the [complete list of stream commands](https://redis.io/commands/?group=stream)





#### 基础操作



##### `xadd`

- 基础操作 

  - xadd    key     *    field     value    [field  value...]                         *表示自动生成消息id

  - 实际操作

    ```
    127.0.0.1:6379> xadd mystream * uid 11 uname wmt
    "1683858819951-0"
    127.0.0.1:6379> xadd mystream * uid 12 uname z3
    "1683858985321-0"
    127.0.0.1:6379> xadd mystream * uid 13 uname w5
    "1683859000340-0"
    
    #会自动保证后面的id会比前面大         生成消息id的格式： 毫秒时间戳-该毫秒生成的第几条消息（自增id）
    ```

    

##### `xrange`

- 基础操作

  - xrange   key     start       end       [COUNT   count]                     start：-                      end：+              从小到大遍历

  - 实际操作

    ```
    127.0.0.1:6379> XRANGE mystream - +
    1) 1) "1683858819951-0"
       2) 1) "uid"
          2) "11"
          3) "uname"
          4) "wmt"
    2) 1) "1683858985321-0"
       2) 1) "uid"
          2) "12"
          3) "uname"
          4) "z3"
    3) 1) "1683859000340-0"
       2) 1) "uid"
          2) "13"
          3) "uname"
          4) "w5"
    
    ```

    

##### `xrevrange`

- 基础操作

  - xrevange   key     end     start           [COUNT   count]                     start：-                      end：+                    从大到小遍历

  - 实际操作

    ```
    127.0.0.1:6379> xrevrange mystream + -
    1) 1) "1683859000340-0"
       2) 1) "uid"
          2) "13"
          3) "uname"
          4) "w5"
    2) 1) "1683858985321-0"
       2) 1) "uid"
          2) "12"
          3) "uname"
          4) "z3"
    3) 1) "1683858819951-0"
       2) 1) "uid"
          2) "11"
          3) "uname"
          4) "wmt"
    ```

    

##### `xdel`

- 基础操作

  - xdel    key     id                                                                           按照id来删除

  - 实际操作

    ```
    1) 1) "1683859000340-0"
       2) 1) "uid"
          2) "13"
          3) "uname"
          4) "w5"
    2) 1) "1683858985321-0"
       2) 1) "uid"
          2) "12"
          3) "uname"
          4) "z3"
    3) 1) "1683858819951-0"
       2) 1) "uid"
          2) "11"
          3) "uname"
          4) "wmt"
    127.0.0.1:6379> xdel mystream 1683858819951-0
    (integer) 1
    127.0.0.1:6379> xrevrange mystream + -
    1) 1) "1683859000340-0"
       2) 1) "uid"
          2) "13"
          3) "uname"
          4) "w5"
    2) 1) "1683858985321-0"
       2) 1) "uid"
          2) "12"
          3) "uname"
          4) "z3"
    127.0.0.1:6379> 
    ```



##### `xlen`

* 基础操作

  * xlen   key                                                                              获取key值里面的长度

  * 实际操作

    ```
    127.0.0.1:6379> xlen mystream
    (integer) 2
    ```





##### `xtrim`

- 基础操作

  - xtrim  key    maxlen| minid                                           截取

  - 实际操作

    ```
    #截取id最大的两个
    127.0.0.1:6379> xrange mystream - +
    1) 1) "1683858985321-0"
       2) 1) "uid"
          2) "12"
          3) "uname"
          4) "z3"
    2) 1) "1683859000340-0"
       2) 1) "uid"
          2) "13"
          3) "uname"
          4) "w5"
    3) 1) "1683862393551-0"
       2) 1) "k1"
          2) "v1"
          3) "k2"
          4) "v2"
    4) 1) "1683862436139-0"
       2) 1) "k3"
          2) "v3"
    127.0.0.1:6379> XTRIM mystream maxlen 2
    (integer) 2
    127.0.0.1:6379> xrange mystream - +
    1) 1) "1683862393551-0"
       2) 1) "k1"
          2) "v1"
          3) "k2"
          4) "v2"
    2) 1) "1683862436139-0"
       2) 1) "k3"
          2) "v3"
    
    #根据minid截取比改id要小的值会被抛弃保留大的
    127.0.0.1:6379> xrange mystream - +
    1) 1) "1683863004149-0"
       2) 1) "k1"
          2) "v1"
    2) 1) "1683863009168-0"
       2) 1) "k2"
          2) "v2"
    3) 1) "1683863013266-0"
       2) 1) "k3"
          2) "v3"
    4) 1) "1683863018432-0"
       2) 1) "k4"
          2) "v4"
    127.0.0.1:6379> XTRIM mystream minid 1683863013266-0
    (integer) 2
    127.0.0.1:6379> xrange mystream - +
    1) 1) "1683863013266-0"
       2) 1) "k3"
          2) "v3"
    2) 1) "1683863018432-0"
       2) 1) "k4"
          2) "v4"
    
    
    ```






##### `xread`

- 基础语法

  - XREAD [COUNT count] [BLOCK milliseconds] STREAMS key [key ...] id [id ...]

    - BLOCK是否已阻塞的方式读取消息，默认不阻塞，如果milliseconds设置为0， 表示永远阻塞

  - 实际操作

    ```
    #数据模型
    127.0.0.1:6379> xrange mystream - +
    1) 1) "1683863013266-0"
       2) 1) "k3"
          2) "v3"
    2) 1) "1683863018432-0"
       2) 1) "k4"
          2) "v4"
    3) 1) "1683879338002-0"
       2) 1) "k5"
          2) "v5"
    4) 1) "1683879343944-0"
       2) 1) "k6"
          2) "v6"
    5) 1) "1683879350063-0"
       2) 1) "k7"
          2) "v7"
          
    #  $代表特殊ID，表示以当前Stream已经存储的最大的ID作为最后一个ID， 当前Stream中不存在大于当前最大ID的消息，因此此时#返回nil
     
    #非阻塞
    127.0.0.1:6379> xread count 2 streams mystream $
    (nil)
    
    #0-0代表从最小的ID开始获取Stream中的消息，当不指定count, 将会返回Stream中的所有消息，注意也可以使用0 ( 00/000也都是#可以的
    
    127.0.0.1:6379> xread count 2 streams mystream 0-0
    1) 1) "mystream"
       2) 1) 1) "1683863013266-0"
             2) 1) "k3"
                2) "v3"
          2) 1) "1683863018432-0"
             2) 1) "k4"
                2) "v4"
    
    127.0.0.1:6379> xread count 10 streams mystream 00
    1) 1) "mystream"
       2) 1) 1) "1683863013266-0"
             2) 1) "k3"
                2) "v3"
          2) 1) "1683863018432-0"
             2) 1) "k4"
                2) "v4"
          3) 1) "1683879338002-0"
             2) 1) "k5"
                2) "v5"
          4) 1) "1683879343944-0"
             2) 1) "k6"
                2) "v6"
          5) 1) "1683879350063-0"
             2) 1) "k7"
                2) "v7"
    
    
    #阻塞
    #开启2个客户端一个生产者一个消费者
    #生产者 
    127.0.0.1:6379> xadd mystream * k8 v8
    "1683879938448-0"
    
    #消费者
    127.0.0.1:6379> xread count 1 block 0 streams mystream $
    1) 1) "mystream"
       2) 1) 1) "1683879938448-0"
             2) 1) "k8"
                2) "v8"
    (66.89s)  耗时66秒
    
    
    ```





##### 小总结

![image-20230512162820875](..\redis-study\imgs\image-20230512162820875.png)







#### 创建消费者



##### `xgroup`

- 基础语法

  - xgroup   create  key   groupname id|$                                           创建消费者

    - 创建消费者组的时候必须指定ID, ID为0表示从头开始消费，为$表示只消费新的消息，**队尾新来**

  - 实际操作

    ```
    #创建消费者
    127.0.0.1:6379> XGROUP CREATE mystream groupA $
    OK
    #表示从尾部开始消费
    127.0.0.1:6379> XGROUP CREATE mystream groupB 0
    OK
    #表示从头部开始消费
    ```



##### `xreadgroup`

- 基础操作

  -  XREADGROUP GROUP group consumer [COUNT count] [BLOCK milliseconds] [NOACK] STREAMS key [key ...] id [id ...]

    - " > " 表示从第一条尚未被消费的消息开始读取

  - 实际操作

    ```
    127.0.0.1:6379> XREADGROUP group groupB consumer1 streams mystream >
    1) 1) "mystream"
       2) 1) 1) "1683863013266-0"
             2) 1) "k3"
                2) "v3"
          2) 1) "1683863018432-0"
             2) 1) "k4"
                2) "v4"
          3) 1) "1683879338002-0"
             2) 1) "k5"
                2) "v5"
          4) 1) "1683879343944-0"
             2) 1) "k6"
                2) "v6"
          5) 1) "1683879350063-0"
             2) 1) "k7"
                2) "v7"
          6) 1) "1683879938448-0"
             2) 1) "k8"
                2) "v8"
    127.0.0.1:6379> XREADGROUP group groupB consumer2 streams mystream >
    (nil)
    
    #stream中的消息一旦被消费组里的一个消费者读取了，就不能再被该消费组内的其他消费者读取了，即同一个消费组里的消费者不能消费#同一条消息。刚才的XREADGROUP命令再执行一次，此时读到的就是空值
    
    
    #但是不同组的就可以继续消费
    127.0.0.1:6379> XREADGROUP group groupB2 consumer1 streams  mystream >
    1) 1) "mystream"
       2) 1) 1) "1683863013266-0"
             2) 1) "k3"
                2) "v3"
          2) 1) "1683863018432-0"
             2) 1) "k4"
                2) "v4"
          3) 1) "1683879338002-0"
             2) 1) "k5"
                2) "v5"
          4) 1) "1683879343944-0"
             2) 1) "k6"
                2) "v6"
          5) 1) "1683879350063-0"
             2) 1) "k7"
                2) "v7"
          6) 1) "1683879938448-0"
             2) 1) "k8"
                2) "v8"
    127.0.0.1:6379> XREADGROUP group groupB2 consumer2 streams  mystream >
    (nil)
    
    
    ```

    

> 让组内的多个消费者共同分担读取消息，所以，我们通常会让每个消费者读取部分消息，从而实现消息读取负载在多个消费者间是均衡分布的

```
127.0.0.1:6379> XREADGROUP group groupC consumer1 count 2 streams mystream >
1) 1) "mystream"
   2) 1) 1) "1683863013266-0"
         2) 1) "k3"
            2) "v3"
      2) 1) "1683863018432-0"
         2) 1) "k4"
            2) "v4"
127.0.0.1:6379> XREADGROUP group groupC consumer2 count 2 streams mystream >
1) 1) "mystream"
   2) 1) 1) "1683879338002-0"
         2) 1) "k5"
            2) "v5"
      2) 1) "1683879343944-0"
         2) 1) "k6"
            2) "v6"
127.0.0.1:6379> XREADGROUP group groupC consumer3 count 4 streams mystream >
1) 1) "mystream"
   2) 1) 1) "1683879350063-0"
         2) 1) "k7"
            2) "v7"
      2) 1) "1683879938448-0"
         2) 1) "k8"
            2) "v8"

```



#### ACK机制

> 上面的操作只是表示已读但是没有处理



##### `xpending`

- 基础语法

  - xpending    key      group   [BLOCK milliseconds]  start   end   count  [consumer]                   查看消费者已读未确认的清单列表

  - 实际操作

    ```
    127.0.0.1:6379> XPENDING mystream groupC 
    1) (integer) 6                #消息的总条数
    2) "1683863013266-0"          #消费者读取最小的消息id
    3) "1683879938448-0"          #消费者读取最大的消息id
    4) 1) 1) "consumer1"          #消费者名称
          2) "2"				  #消费者读取的行数
       2) 1) "consumer2"
          2) "2"
       3) 1) "consumer3"
          2) "2"
    
    #查看具体的消费者
    127.0.0.1:6379> xpending mystream groupC  - + 10  consumer1
    1) 1) "1683863013266-0"
       2) "consumer1"
       3) (integer) 6157601
       4) (integer) 1
    2) 1) "1683863018432-0"
       2) "consumer1"
       3) (integer) 6157601
       4) (integer) 1
    ```



##### `XACK`

- 基础操作

  - xack   key  group   id [id...]                                           消息确认

  - 实际操作

    ```
    127.0.0.1:6379> xpending mystream groupC  - + 10  consumer1
    1) 1) "1683863013266-0"
       2) "consumer1"
       3) (integer) 6157601
       4) (integer) 1
    2) 1) "1683863018432-0"
       2) "consumer1"
       3) (integer) 6157601
       4) (integer) 1
    127.0.0.1:6379> XACK mystream groupC  1683863013266-0
    (integer) 1
    127.0.0.1:6379> xpending mystream groupC  - + 10  consumer1
    1) 1) "1683863018432-0"
       2) "consumer1"
       3) (integer) 6200768
       4) (integer) 1
    
    ```

    

##### `xinfo`

- 基础语法

  - xinfo  stream  kye 

  - 实际操作

    ```
    127.0.0.1:6379> XINFO STREAM mystream
     1) "length"
     2) (integer) 6
     3) "radix-tree-keys"
     4) (integer) 1
     5) "radix-tree-nodes"
     6) (integer) 2
     7) "last-generated-id"
     8) "1683879938448-0"
     9) "max-deleted-entry-id"
    10) "1683862436139-0"
    11) "entries-added"
    12) (integer) 13
    13) "recorded-first-entry-id"
    14) "1683863013266-0"
    15) "groups"
    16) (integer) 4
    17) "first-entry"
    18) 1) "1683863013266-0"               #第一个
        2) 1) "k3"
           2) "v3"
    19) "last-entry"
    20) 1) "1683879938448-0"
        2) 1) "k8"
           2) "v8"
    
    ```

    



### bitfield

> 了解即可



BITFIELD命令的作用在于它能够将很多小的整数储存到一个长度较大的位图中，又或者将一 个非常庞大的键分割为多个较小的键来进行储存，从而非常高效地使用内存，使得Redis能够得到更多不同的应用一特别是在实时分析领域:BITFIELD能够以指定的方式对计算溢出进行控制的能力，使得它可以被应用于这一领域。

说人话就是：

> 将一个Redis字符串看作是一个由二进制位组成的数组并能对变长位宽和任意没有字节对齐的指定整型位域进行寻址和修改





![image-20230512190858169](..\redis-study\imgs\image-20230512190858169.png)





[ASCII码一览表，ASCII码对照表 (biancheng.net)](http://c.biancheng.net/c/ascii/)

##### `bitfield`

- 基础语法

  - bitfield  key  GET  encoding   offset|[OVERFLOW WRAP|SAT|FAIL]    SET   encoding   offset   value|INCRBY  encoding offset increment [GET encoding offset|[OVERFLOW WRAP|SAT|FAIL] SET enc

  - 实际操作

    ```
    #get获取
    127.0.0.1:6379> set fieldkey hello
    OK
    127.0.0.1:6379> get fieldkey
    "hello"
    127.0.0.1:6379> bitfield fieldkey get i8 0
    1) (integer) 104   #h对应ASCII码十进制的104
    127.0.0.1:6379> bitfield fieldkey get i8 8
    1) (integer) 101   #e对应ASCII码十进制的101
    127.0.0.1:6379> bitfield fieldkey get i8 16
    1) (integer) 108  #l对应ASCII码十进制的108
    127.0.0.1:6379> bitfield fieldkey get i8 24
    1) (integer) 108  #l对应ASCII码十进制的108
    ```

  - bitfield set

    - 通过set去修改value的值

    - 实际操作     120 ASCII码对应的x

      ```
      127.0.0.1:6379> BITFIELD fieldkey set i8 8 120
      1) (integer) 101
      127.0.0.1:6379> get fieldkey
      "hxllo"
      ```

      

#### 溢出控制

WRAP:使用回绕(wrap around)方法处理有符号整数和无符号整数的溢出情况

SAT:使用饱和计算(saturation arithmetic)方法处理溢出，下溢计算的结果为最小的整数值，而上溢计算的结果为最大的整数值

FAIL:命令将拒绝执行那些会导致.上溢或者下溢情况出现的计算,并向用户返回空值表示计算未被执行



- WRAP溢出

  > 使用回绕(wrap around)方法处理有符号整数和无符号整数的溢出情况

```
127.0.0.1:6379> BITFIELD fieldkey incrby u4 2 1  #从第3个位开始，对接下来的4位无符号数+1
1) (integer) 11
127.0.0.1:6379> BITFIELD fieldkey incrby u4 2 1
1) (integer) 12
127.0.0.1:6379> BITFIELD fieldkey incrby u4 2 1
1) (integer) 13
127.0.0.1:6379> BITFIELD fieldkey incrby u4 2 1
1) (integer) 14
127.0.0.1:6379> BITFIELD fieldkey incrby u4 2 1
1) (integer) 15
127.0.0.1:6379> BITFIELD fieldkey incrby u4 2 1    #默认overflow为wrap,即循环溢出
1) (integer) 0


127.0.0.1:6379> set test a
OK
127.0.0.1:6379> bitfield test get i8 0        #a对应的ASCII码为97
1) (integer) 97
127.0.0.1:6379> BITFIELD test set i8 0 127    #i8表示8位二进制，范围(-128到127)
1) (integer) 97
127.0.0.1:6379> bitfield test get i8 0 
1) (integer) 127
127.0.0.1:6379> BITFIELD test set i8 0 137
1) (integer) 127
127.0.0.1:6379> bitfield test get i8 0       #默认overflow为warp，既循环溢出
1) (integer) -119

```



- STA溢出  

> 使用饱和计算(saturation arithmetic)方法处理溢出，下溢计算的结果为最小的整数值，而上溢计算的结果为最大的整数值

```
127.0.0.1:6379> bitfield test get i8 0 
1) (integer) -119
127.0.0.1:6379> bitfield test overflow sat set i8 0 128
1) (integer) -119
127.0.0.1:6379> BITFIELD test get i8 0
1) (integer) 127

```

- FAIL溢出

> 命令将拒绝执行那些会导致.上溢或者下溢情况出现的计算,并向用户返回空值表示计算未被执行

```
127.0.0.1:6379> bitfield test overflow fail set i8 0 888
1) (nil)

```





## Redis持久化

官网[Redis persistence | Redis](https://redis.io/docs/management/persistence/)

持久性是指将数据写入持久性存储，例如固态硬盘（SSD）。Redis提供了一系列持久性选项。这些选项包括：

RDB（Redis数据库）：RDB持久性在指定的时间间隔内对数据集执行时间点快照。

 AOF（仅追加文件）：AOF持久性记录服务器接收到的每个写操作。这些操作可以在服务器启动时重新播放，重建原始数据集。命令使用与Redis协议本身相同的格式进行记录。 无持久性：您可以完全禁用持久性。这有时用于缓存。 

RDB + AOF：您还可以在同一实例中组合AOF和RDB。 如果您不想考虑这些不同持久性策略之间的权衡，您可以考虑Redis Enterprise的持久性选项，可以使用UI进行预配置。



**RDB的优势 ：**

RDB是Redis数据的非常紧凑的单文件点时间表示。RDB文件非常适合备份。例如，您可能希望每小时归档最近24小时的RDB文件，并每天保存一个RDB快照30天。这样，您可以轻松地在灾难情况下恢复不同版本的数据集。 RDB非常适用于灾难恢复，因为它是一个可以传输到远程数据中心或Amazon S3（可能加密）的单个紧凑文件。 RDB最大化了Redis的性能，因为Redis父进程需要做的唯一工作是分叉一个子进程来执行所有其他操作。父进程永远不会执行磁盘I / O或类似操作。 与AOF相比，RDB允许使用大型数据集进行更快速的重启。 在副本上，RDB支持重启和故障转移后的部分重新同步。



**RDB的缺点 ：**

如果你需要最小化Redis停止工作时（例如停电后）数据丢失的机会，那么RDB并不好。你可以配置不同的保存点，在数据集上写入至少五分钟和100次后生成一个RDB（你可以有多个保存点）。但通常每五分钟或更长时间就会创建一个RDB快照，因此如果Redis因任何原因停止工作而没有正确关闭，你应该准备好失去最新的几分钟数据。 为了使用子进程在磁盘上持久化，RDB需要经常进行fork()操作。如果数据集很大，fork()操作可能会耗费时间，并且如果数据集非常大且CPU性能不佳，则可能导致Redis停止为客户端提供服务数毫秒甚至一秒钟。AOF也需要进行fork()操作，但频率较低，你可以调整日志重写的频率，而不会对耐久性产生任何影响。



**AOF优点：**

 使用AOF Redis更加耐用：您可以有不同的fsync策略：完全不进行fsync、每秒进行fsync、每个查询进行fsync。即使使用默认的每秒fsync策略，写入性能仍然非常好。fsync是使用后台线程执行的，当没有fsync正在进行时，主线程会努力执行写入，因此您只会丢失一秒钟的写入。 AOF日志是追加日志，因此如果发生停电等情况，就没有寻址或损坏问题。即使由于某些原因（磁盘已满或其他原因）日志以半写命令结束，redis-check-aof工具也能轻松修复它。 当AOF文件变得太大时，Redis能够自动在后台重写AOF。重写是完全安全的，因为Redis在继续向旧文件中追加数据的同时，会生成一个完全新的文件，其中包含创建当前数据集所需的最小操作集，一旦第二个文件准备好，Redis就会切换两个文件并开始向新文件追加数据。 AOF以易于理解和解析的格式一个接一个地记录所有操作的日志。您甚至可以轻松地导出AOF文件。例如，即使您意外使用FLUSHALL命令刷新了所有内容，只要在此期间没有重写日志，您仍然可以通过停止服务器、删除最新命令并重新启动Redis来保存数据集。



**AOF缺点 ：**

与相同数据集的等效RDB文件相比，AOF文件通常更大。 AOF可以比RDB慢，具体取决于fsync策略。通常情况下，将fsync设置为每秒，性能仍然非常高，在禁用fsync的情况下，即使在高负载下，它也应该与RDB一样快。尽管如此，RDB能够在巨大的写入负载情况下提供更多关于最大延迟的保证。



Redis < 7.0

如果在重写期间有对数据库的写操作（这些操作会在内存中缓存，并在重写结束时写入新的AOF文件中），AOF可能会使用大量的内存。 所有在重写期间到达的写命令都会被写入磁盘两次。 Redis可以冻结写入并将这些写命令同步到新的AOF文件中，直到重写结束为止。 好的，那我应该使用什么？ 如果您想要与PostgreSQL提供的数据安全程度相当的数据安全度，则通常建议同时使用两种持久化方法。

如果您非常关心数据，但在灾难情况下可以容忍几分钟的数据丢失，那么您可以仅使用RDB。

有许多用户仅使用AOF，但我们不建议这样做，因为定期进行数据库备份、更快速的重启以及在AOF引擎中出现错误的情况下拥有RDB快照是一个很好的主意。

以下部分将详细说明两种持久化模型的一些更多细节。

快照 默认情况下，Redis将数据集的快照保存在名为dump.rdb的二进制文件中。您可以配置Redis，在数据集中至少有M个更改时，每N秒保存一次数据集，或者手动调用SAVE或BGSAVE命令。

例如，此配置将使Redis在数据集中至少有1000个键更改时，每60秒自动将数据集转储到磁盘中：

> ```
> save 60 1000
> ```

这个策略被称为快照。



**它的工作原理是这样的：**

 每当Redis需要将数据集转储到磁盘时，会发生以下情况：

Redis进行分叉。现在我们有一个子进程和一个父进程。

子进程开始将数据集写入临时RDB文件。

当子进程完成对新RDB文件的写入后，它将替换旧文件。

这种方法允许Redis从写时复制语义中受益。



**追加文件** 

快照不是非常持久。如果运行Redis的计算机停止，您的电源线失败，或者您意外地杀死了实例，那么写入Redis的最新数据将丢失。虽然对于某些应用程序来说这可能不是大问题，但在这些情况下需要完全耐用性的用例，而在这些情况下，仅使用Redis快照不是可行的选择。

追加文件是Redis的另一种可选的完全耐用性策略。它在1.1版本中可用。

您可以在配置文件中打开AOF：

```
appendonly yes
```

 从现在开始，每当Redis接收到更改数据集的命令（例如SET）时，它将将其附加到AOF中。当您重新启动Redis时，它将重新播放AOF以重建状态。

自Redis 7.0.0以来，Redis使用多部分AOF机制。也就是说，原始的单个AOF文件被拆分为基本文件（最多一个）和增量文件（可能有多个）。基本文件表示在重写AOF时存在的数据的初始（RDB或AOF格式）快照。增量文件包含自上次创建基本AOF文件以来的增量更改。所有这些文件都放在一个单独的目录中，并由清单文件跟踪。



**日志重写** 

随着写操作的执行，AOF文件会越来越大。例如，如果您将计数器递增100次，您将在数据集中得到一个包含最终值的单个键，但在AOF中会有100个条目。其中99个条目不需要重建当前状态。

重写是完全安全的。当Redis继续向旧文件追加时，会生成一个完全新的文件，其中包含创建当前数据集所需的最小操作集，一旦第二个文件准备好，Redis会切换这两个文件并开始向新文件追加。

因此，Redis支持一项有趣的功能：能够在不中断客户端服务的情况下后台重建AOF。每当您发出BGREWRITEAOF时，Redis将写入重建当前内存数据集所需的最短命令序列。如果您正在使用Redis 2.2的AOF，则需要定期运行BGREWRITEAOF。自Redis 2.4以来，可以自动触发日志重写（有关更多信息，请参见示例配置文件）。

自Redis 7.0.0以来，当计划AOF重写时，Redis父进程会打开一个新的增量AOF文件以继续写入。子进程执行重写逻辑并生成一个新的基本AOF。Redis将使用一个临时清单文件来跟踪新生成的基本文件和增量文件。当它们准备好时，Redis将执行原子替换操作，使此临时清单文件生效。为了避免在AOF重写失败和重试的情况下创建许多增量文件的问题，Redis引入了一个AOF重写限制机制，以确保失败的AOF重写以越来越慢的速率重试。



**追加文件的耐久性如何？** 

您可以配置Redis在磁盘上fsync数据的次数。有三个选项：

appendfsync always：每次将新命令附加到AOF时都会进行fsync。非常非常慢，非常安全。请注意，命令在从多个客户端或管道执行一批命令之后附加到AOF中，因此意味着单个写入和单个fsync（在发送回复之前）。

 appendfsync everysec：每秒进行一次fsync。足够快（自版本2.4以来可能与快照一样快），如果发生灾难，您可能会丢失1秒钟的数据。 

appendfsync no：从不fsync，只将数据放在操作系统的手中。更快但不太安全的方法。通常，Linux会使用此配置每30秒刷新数据，但这取决于内核的确切调整。

 建议（并且默认）策略是每秒进行一次fsync。它既快又相对安全。实际上，always策略非常慢，但它支持组提交，因此如果有多个并行写入，Redis将尝试执行单个fsync操作。

**如果我的AOF被截断了该怎么办？** 

服务器在写入AOF文件时可能会崩溃，或存储AOF文件的卷在写入时已满。当发生这种情况时，AOF仍然包含代表数据集给定时间点版本的一致数据（默认AOF fsync策略可能旧至一秒钟），但AOF中的最后一个命令可能会被截断。最新的Redis主要版本仍然能够加载AOF，只需丢弃文件中最后一个不良格式的命令即可。在这种情况下，服务器将发出以下日志：

```
* Reading RDB preamble from AOF file...
* Reading the remaining AOF tail...
# !!! Warning: short read while loading the AOF file !!!
# !!! Truncating the AOF at offset 439 !!!
# AOF loaded anyway because aof-load-truncated is enabled
```

如果您愿意，可以更改默认配置以强制Redis在这种情况下停止，但默认配置是继续执行，无论文件中的最后一个命令是否格式正确，以确保重新启动后的可用性。

旧版本的Redis可能无法恢复，并且可能需要执行以下步骤：

备份AOF文件的副本。

使用Redis附带的redis-check-aof工具修复原始文件：

``` 
$ redis-check-aof --fix <filename>
```

可选地，使用diff -u检查两个文件之间的差异。

使用修复后的文件重新启动服务器。



**如果我的AOF文件损坏了该怎么办？** 

如果AOF文件不仅被截断，而且在中间存在无效的字节序列而被损坏，则情况更为复杂。Redis将在启动时抱怨并中止：

```
* Reading the remaining AOF tail...
# Bad file format reading the append only file: make a backup of your AOF file, then use ./redis-check-aof --fix <filename>
```



最好的方法是运行redis-check-aof实用程序，最初不使用--fix选项，然后了解问题，跳转到文件中给定的偏移量，并查看是否可以手动修复文件：AOF使用与Redis协议相同的格式，并且相当简单。否则，可以让实用程序为我们修复文件，但在这种情况下，从无效部分到文件末尾的所有AOF部分可能会被丢弃，导致大量数据丢失，如果损坏发生在文件的初始部分。

**它是如何工作的** 

日志重写使用与快照相同的写时复制技巧。它是如何工作的：

**Redis> = 7.0**

Redis分叉，现在我们有一个子进程和一个父进程。

子进程开始在临时文件中编写新的基本AOF。

父进程打开一个新的增量AOF文件以继续编写更新。如果重写失败，则旧的基本文件和增量文件（如果有）加上这个新打开的增量文件表示完整的更新数据集，因此我们是安全的。

当子进程完成重写基本文件时，父进程收到一个信号，并使用新打开的增量文件和子生成的基本文件构建一个临时清单，并将其持久化。

利润！现在Redis执行清单文件的原子交换，以便此AOF重写的结果生效。 Redis还清理旧的基本文件和任何未使用的增量文件。



**Redis <7.0**

Redis分叉，现在我们有一个子进程和一个父进程。

子进程开始在临时文件中编写新的AOF。

父进程在内存缓冲区中累积所有新更改（但同时将新更改写入旧的追加文件中，因此如果重写失败，我们是安全的）。

当子进程完成重写文件时，父进程收到一个信号，并将内存缓冲区附加到子进程生成的文件的末尾。

现在Redis原子地将新文件重命名为旧文件，并开始将新数据附加到新文件中。

如果我目前使用dump.rdb快照，我该如何切换到AOF？ 在版本2.0及更高版本中，有不同的过程可以执行此操作，由于Redis 2.2及更高版本更简单，因此根本不需要重新启动。





AOF和RDB持久性之间的交互
Redis >= 2.4确保在RDB快照操作正在进行时避免触发AOF重写，或者允许在AOF重写正在进行时进行BGSAVE。这可以防止两个Redis后台进程同时进行繁重的磁盘I/O。

当快照正在进行中，用户明确请求使用BGREWRITEAOF进行日志重写操作时，服务器将回复一个OK状态码，告诉用户该操作已计划，并且一旦快照完成，重写将开始。

在启用AOF和RDB持久性的情况下，如果Redis重新启动，则使用AOF文件来重构原始数据集，因为它保证是最完整的。

**备份Redis数据**
在开始本节之前，请确保阅读以下句子：确保备份您的数据库。磁盘会损坏，云中的实例会消失等等：没有备份意味着数据消失的巨大风险。

Redis非常友好于数据备份，因为您可以在数据库运行时复制RDB文件：一旦生成RDB，它就不会被修改，而在生成RDB时，它使用临时名称，并使用rename（2）原子地重命名到其最终目标。只有当新快照完成时。

这意味着在服务器运行时完全安全地复制RDB文件。这是我们建议的：

在服务器中创建一个cron作业，在一个目录中创建每小时的RDB文件快照，并在另一个目录中创建每日快照。
每次运行cron脚本时，请确保调用find命令以确保删除过时的快照：例如，您可以获取最近48小时的每小时快照，并获取一个或两个月的每日快照。确保使用日期和时间信息命名快照。
每天至少一次，请确保将RDB快照传输到数据中心之外，或者至少传输到运行Redis实例的物理机器之外。

**备份AOF持久性**
如果您只启用AOF持久性运行Redis实例，则仍然可以执行备份。自Redis 7.0.0以来，AOF文件被拆分为多个文件，这些文件位于由appenddirname配置确定的单个目录中。在正常操作期间，您只需要复制/打包此目录中的文件即可实现备份。但是，如果在重写期间执行此操作，则可能会得到无效的备份。为了解决此问题，您必须在备份期间禁用AOF重写：

使用CONFIG SET auto-aof-rewrite-percentage 0关闭自动重写
确保在此期间不手动启动重写（使用BGREWRITEAOF）。

检查当前是否正在进行重写
INFO persistence
并验证aof_rewrite_in_progress为0。如果为1，则需要等待重写完成。

现在可以安全地复制appenddirname目录中的文件。
完成后重新启用重写：CONFIG SET auto-aof-rewrite-percentage <prev-value>

注意：如果要最小化禁用AOF重写的时间，则可以创建appenddirname中文件的硬链接（在上述步骤3中），然后在创建硬链接后重新启用重写（步骤4）。现在可以复制/打包硬链接，并在完成后删除它们。这有效，因为Redis保证仅将文件附加到此目录中，或者如果必要，则完全替换它们，因此在任何给定时间点上，内容应该是一致的。

注意：如果要处理备份期间服务器重新启动的情况，并确保重新启动后不会自动启动重写，则可以将上述第1步更改为通过CONFIG REWRITE也保持更新的配置。只需确保在完成后重新启用自动重写（步骤4）并使用另一个CONFIG REWRITE进行持久化。



在版本7.0.0之前，备份AOF文件可以通过简单地复制aof文件（如备份RDB快照）来完成。该文件可能缺少最后一部分，但Redis仍将能够加载它（请参阅有关截断AOF文件的先前部分）。

**灾难恢复**
在Redis的上下文中，灾难恢复基本上与备份相同，加上将这些备份传输到许多不同的外部数据中心的能力。这样，即使某些灾难性事件影响运行Redis并生成快照的主数据中心，数据也是安全的。

我们将回顾成本不太高的最有趣的灾难恢复技术。

Amazon S3和其他类似的服务是实施灾难恢复系统的好方法。只需以加密形式将每日或每小时的RDB快照传输到S3中。您可以使用gpg -c（对称加密模式）加密数据。确保将密码存储在许多不同的安全位置（例如将副本提供给您组织中最重要的人员）。建议使用多个存储服务以提高数据安全性。

使用SCP（SSH的一部分）将快照传输到远程服务器。这是一条相当简单和安全的路线：在离您很远的地方获取一个小型VPS，安装ssh，并生成一个没有密码的ssh客户端密钥，然后将其添加到您的小型VPS的authorized_keys文件中。您已经准备好以自动化方式传输备份。为了获得最佳效果，请至少获取两个不同提供商的VPS。

重要的是要了解，如果没有正确实施，该系统很容易失败。至少，请务必在传输完成后能够验证文件大小（应与您复制的文件大小相匹配），如果您使用VPS，则可能还要验证SHA1摘要。

您还需要某种独立的警报系统，以防备份传输由于某种原因而无法正常工作。



### RDB

下载配置文件：

https://raw.githubusercontent.com/redis/redis/6.0.16/redis.conf

redis  6.0.16及以下   的配置文件  redis.config

```
################################ SNAPSHOTTING  ################################
#
# Save the DB on disk:
#
#   save <seconds> <changes>
#
#   Will save the DB if both the given number of seconds and the given
#   number of write operations against the DB occurred.
#
#   In the example below the behavior will be to save:
#   after 900 sec (15 min) if at least 1 key changed  每隔900秒(15分钟)如果超过了一个key发生了变化就写一份新的RDB文件
#   after 300 sec (5 min) if at least 10 keys changed
#   after 60 sec if at least 10000 keys changed
#
#   Note: you can disable saving completely by commenting out all "save" lines.
#
#   It is also possible to remove all the previously configured save
#   points by adding a save directive with a single empty string argument
#   like in the following example:
#
#   save ""               取消注解就关闭了RDB

save 900 1
save 300 10
save 60 10000

```



redis 6.2.0以上  目前打开的是redis7的配置

```
################################ SNAPSHOTTING  ################################
 413 
 414 # Save the DB to disk.
 415 #
 416 # save <seconds> <changes> [<seconds> <changes> ...]
 417 #
 418 # Redis will save the DB if the given number of seconds elapsed and it
 419 # surpassed the given number of write operations against the DB.
 420 #
 421 # Snapshotting can be completely disabled with a single empty string argument
 422 # as in following example:
 423 #
 424 # save ""
 425 #
 426 # Unless specified otherwise, by default Redis will save the DB:
 427 #   * After 3600 seconds (an hour) if at least 1 change was performed
 428 #   * After 300 seconds (5 minutes) if at least 100 changes were performed
 429 #   * After 60 seconds if at least 10000 changes were performed
 430 #
 431 # You can set these explicitly by uncommenting the following line.
 432 #
 433 # save 3600 1 300 100 60 10000

```



#### 自动触发

> 本次案例   5秒2次保存dump.rdb

```
 #修改保存机制
 412 ################################ SNAPSHOTTING  ################################
 413 
 414 # Save the DB to disk.
 415 #
 416 # save <seconds> <changes> [<seconds> <changes> ...]
 417 #
 418 # Redis will save the DB if the given number of seconds elapsed and it
 419 # surpassed the given number of write operations against the DB.
 420 #
 421 # Snapshotting can be completely disabled with a single empty string argument
 422 # as in following example:
 423 #
 424 # save ""
 425 #
 426 # Unless specified otherwise, by default Redis will save the DB:
 427 #   * After 3600 seconds (an hour) if at least 1 change was performed
 428 #   * After 300 seconds (5 minutes) if at least 100 changes were performed
 429 #   * After 60 seconds if at least 10000 changes were performed
 430 #
 431 # You can set these explicitly by uncommenting the following line.
 432 #
 433 # save 3600 1 300 100 60 10000
 434   save 5 2                                  #五秒如果有2次修改则保存
 
 
 #修改保存路径
 497 # The working directory.
 498 #
 499 # The DB will be written inside this directory, with the filename specified
 500 # above using the 'dbfilename' configuration directive.
 501 #
 502 # The Append Only File will also be created inside this directory.
 503 #
 504 # Note that you must specify a directory here, not a file name.
 505 #dir ./
 506 dir /opt/redis-7.0.11/dumpfile

#修改保存文件名称
 481 # The filename where to dump the DB
 482 dbfilename dump6379.rdb

```

保存重启redis



> 进入后验证是否配置成功

- config
  - 基础语法
    - config  get | set   parameter  [parameter  ...]                            获取配置信息 或者修改配置文件

```
127.0.0.1:6379> CONFIG get requirepass
1) "requirepass"
2) "123456"
127.0.0.1:6379> config get dir
1) "dir"
2) "/opt/redis-7.0.11/dumpfile"

```



> 测试

必须满足时间和频率

```
127.0.0.1:6379> keys *
(empty array)
127.0.0.1:6379> set k1 v1         第二步
OK
127.0.0.1:6379> set k2 v2
OK


[root@hadoop100 dumpfile]# ls     第一步
[root@hadoop100 dumpfile]# ls     第三步
dump6379.rdb

```





#### 如何恢复数据

执行flushdb和flushall命令也会自动生成dump.rdb，但是里面为空毫无意义

shutdown命令模拟宕机也会生成一个dump.rdb

备注:不可以把备份文件dump.rdb和生产redis服务器放在同一台机器，必须分开各自存储，以防生产机物理损坏后备份文件也挂了。



实际操作：

​	前提：你得先redis.config中配置了保存路径

```
dir /opt/redis-7.0.11/dumpfile
```

当前redis有2个key

```
127.0.0.1:6379> keys *
1) "k1"
2) "k2"
3) "k3"
4) "list2"
5) "list1"
6) "k5"
```

也在  /opt/redis-7.0.11/dumpfile  生成了一个dump6379.rdb

```
[root@hadoop100 dumpfile]# pwd
/opt/redis-7.0.11/dumpfile

[root@hadoop100 dumpfile]# ll
总用量 4
-rw-r--r--. 1 root root 190 5月  13 14:00 dump6379.rdb
```

备份一个dump6379.rdb

```
# 先创建一个备份目录
[root@hadoop100 redis-7.0.11]# mkdir dump_copy

[root@hadoop100 dump_copy]# pwd
/opt/redis-7.0.11/dump_copy

#把备份转移到dump_copy
[root@hadoop100 dumpfile]# mv dump6379.rdb  /opt/redis-7.0.11/dump_copy/
mv：是否覆盖"/opt/redis-7.0.11/dump_copy/dump6379.rdb"？ y


```



此时 /opt/redis-7.0.11/dump_copy 文件夹

```
#redis-cli执行清空
127.0.0.1:6379> FLUSHDB
OK
127.0.0.1:6379> keys *
(empty array)
#查看备份目录该目录下又生成了一个dump6379.rdb 但是里面是空的无意义
[root@hadoop100 dumpfile]# pwd
/opt/redis-7.0.11/dumpfile
[root@hadoop100 dumpfile]# ll
总用量 4
-rw-r--r--. 1 root root 89 5月  13 13:46 dump6379.rdb
```



恢复数据

```
#删除这个没有用的dump6379.rdb
[root@hadoop100 dumpfile]# ll
总用量 4
-rw-r--r--. 1 root root 89 5月  13 13:46 dump6379.rdb

#进入dump_copy
[root@hadoop100 dumpfile]# cd dump_copy/
[root@hadoop100 dump_copy]# ls
dump6379.rdb

#复制这个备份到 /opt/redis-7.0.11/dumpfile
[root@hadoop100 dump_copy]# cp dump6379.rdb  /opt/redis-7.0.11/dumpfile/
cp：是否覆盖"/opt/redis-7.0.11/dumpfile/dump6379.rdb"？ y

#查看数据是否保存成功
[root@hadoop100 dumpfile]# redis-server /opt/redis-7.0.11/myconf/myredis7.conf 
[root@hadoop100 dumpfile]# redis-cli -a 123456
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379> ping
PONG
127.0.0.1:6379> keys *
1) "k1"
2) "k2"
3) "k3"
4) "list2"
5) "list1"
6) "k5"

```





#### 自动备份

> 结合之前的shell编程和corntable定时器完成自动备份

- 编写shell脚本

```
#!/bin/bash
#需要复制的文件名称
file_name="dump6379.rdb"
#需要复制的文件路径
path="/opt/redis-7.0.11/dumpfile/${file_name}"
#获取当前时间
date=$(date ++%Y-%m-%d%H:%M:%S)

#复制过去的文件名称
file_name_copy=$date"_"$file_name
#文件备份的路径加文件名称
path_copy="/opt/redis-7.0.11/dump_copy/${file_name_copy}"
echo “redis正在备份”
# 使用cp命令复制PATH到PATH_COPY
cp $path $path_copy
#$?如果上一条语句成功执行就返回0
if [ $? -eq 0 ]
then
	echo "备份成功文件名称为： ${file_name}"
	echo "备份路径为"
	echo ${path_copy}
else
	echo "备份失败"
fi

```

- 写定时任务

```
[root@hadoop100 shell_script]# crontab -e


0 * * * * /shell_script/aotu_redis_copy.sh
#每小时执行一次
```



#### 手动触发

- save

  - 会阻塞严禁线上使用，会暂停缓存功能优先备份 ，线上不要使用这个**会坐牢**
  - SAVE命令可以同步保存数据集，生成一个包含Redis实例中所有数据的时间点快照，以RDB文件的形式保存。但在生产环境中，几乎不需要调用SAVE命令，因为它会阻塞其他客户端。通常使用BGSAVE命令进行后台保存。但如果存在问题导致Redis无法创建后台保存子进程（例如fork（2）系统调用中的错误），则SAVE命令可以作为最后的手段来执行最新数据集的转储。命令返回一个简单字符串回复，OK on success.
  - 什么是fork
    - 在Linux程序中，fork() 会产生一个和父进程完全相同的子进程，但子进程在此后多会exec系统调用，出于效率考虑，尽量避免膨胀。

- BGSAVE（默认）

  - 异步进行快照操作，不阻塞，快照的同时还可以响应客户端请求，该触发方式会fork一个子进程
  - 使用BGSAVE命令可以在后台保存数据库，此时Redis会创建一个子进程来执行保存操作，父进程则继续为客户端提供服务。如果已经有一个后台保存进程在运行，或者正在进行AOF重写操作，则会返回错误。如果使用了BGSAVE SCHEDULE命令，则会在AOF重写操作完成后立即安排后台保存操作。客户端可以使用LASTSAVE命令来检查保存是否成功。最后，如果BGSAVE命令成功启动，则返回"Background saving started"，如果使用了SCHEDULE子命令，则返回"Background saving scheduled"。

  - lastsave                                                    客户端可以使用LASTSAVE命令来检查保存是否成功最后保存成功的时间

    - 实际操作

      ```
      #客户端
      127.0.0.1:6379> LASTSAVE
      (integer) 1683972423
      #linux操作中
      [root@hadoop100 shell_script]# date -d @1683972423
      2023年 05月 13日 星期六 18:07:03 CST
      
      ```

      

#### 修复RDB文件



进入全局命令目录                         cd /usr/local/bin/

查看是否有   redis-check-rdb

```
[root@hadoop100 ~]# cd /usr/local/bin/
[root@hadoop100 bin]# ll
总用量 21552
-rwxr-xr-x. 1 root root  5205152 4月  30 10:47 redis-benchmark
lrwxrwxrwx. 1 root root       12 4月  30 10:47 redis-check-aof -> redis-server
lrwxrwxrwx. 1 root root       12 4月  30 10:47 redis-check-rdb -> redis-server
-rwxr-xr-x. 1 root root  5422568 4月  30 10:47 redis-cli
lrwxrwxrwx. 1 root root       12 4月  30 10:47 redis-sentinel -> redis-server
-rwxr-xr-x. 1 root root 11436944 4月  30 10:47 redis-server


```



开始修复RDB文件

- 基础语法
  - redis-check-rdb   path       

```
[root@hadoop100 bin]# redis-check-rdb /opt/redis-7.0.11/dumpfile/dump6379.rdb 
[offset 0] Checking RDB file /opt/redis-7.0.11/dumpfile/dump6379.rdb
[offset 27] AUX FIELD redis-ver = '7.0.11'
[offset 41] AUX FIELD redis-bits = '64'
[offset 53] AUX FIELD ctime = '1683957634'
[offset 68] AUX FIELD used-mem = '1030544'
[offset 80] AUX FIELD aof-base = '0'
[offset 82] Selecting DB ID 0
[offset 190] Checksum OK
[offset 190] \o/ RDB looks OK! \o/
[info] 6 keys read
[info] 0 expires
[info] 0 already expired

```



#### 如何关闭快照



> 本次生效    关闭RDB保存规则

```
127.0.0.1:6379> config set save ""
```



> 配置禁用     永久生效      只需要解开 # save ""

```
################################ SNAPSHOTTING  ################################

# Save the DB to disk.
#
# save <seconds> <changes> [<seconds> <changes> ...]
#
# Redis will save the DB if the given number of seconds elapsed and it
# surpassed the given number of write operations against the DB.
#
# Snapshotting can be completely disabled with a single empty string argument
# as in following example:
#
# save ""

```



#### RDB配置详情

- 配置命令
  - save <seconds> <changes> 
    - 根据规定时间内修改的次数而去保存dump.rdb
  - dbfilename filename.rdb
    - 设置保存RDB的文件名称
  - dir  path
    - 设置保存RDB文件的路径
  - stop-writes-on-bgsave-error yes
    - 默认yes  如果配置成no，表示你不在乎数据不一致或 者有其他的手段发现和控制这种不一致， 那么在快照写入失败时，
      也能确保redis继续接受新的写请求
  - rdbcompression yes
    - 默认 yes 对于存储到磁盘中的快照，可以设置是否进行压缩存储。如果是的话，redis会采用LZF算法进行压缩。如果你不想消耗CPU来进行压缩的话，可以设置为关闭此功能
  - rdbchecksum yes
    - 默认yes在存储快照后，还可以让redis使用CRC64算法来进行数据校验，但是这样做会增加大约10%的性能消耗，如果希望获取到最大的性能提升，可以关闭此功能
  - rdb-del-sync-files no
    - 在没有持久性的情况下删除复制中使用的RDB文件启用。默认情况下no，此选项是禁用的。



```
################################ SNAPSHOTTING  ################################

# Save the DB to disk.
#
# save <seconds> <changes> [<seconds> <changes> ...]
#
# Redis will save the DB if the given number of seconds elapsed and it
# surpassed the given number of write operations against the DB.
#
# Snapshotting can be completely disabled with a single empty string argument
# as in following example:
#
# save ""
#
# Unless specified otherwise, by default Redis will save the DB:
#   * After 3600 seconds (an hour) if at least 1 change was performed
#   * After 300 seconds (5 minutes) if at least 100 changes were performed
#   * After 60 seconds if at least 10000 changes were performed
#
# You can set these explicitly by uncommenting the following line.
#
# save 3600 1 300 100 60 10000
  save 5 2

# By default Redis will stop accepting writes if RDB snapshots are enabled
# (at least one save point) and the latest background save failed.
# This will make the user aware (in a hard way) that data is not persisting
# on disk properly, otherwise chances are that no one will notice and some
# disaster will happen.
#
# If the background saving process will start working again Redis will
# automatically allow writes again.
#
# However if you have setup your proper monitoring of the Redis server
# and persistence, you may want to disable this feature so that Redis will
# continue to work as usual even if there are problems with disk,
# permissions, and so forth.
stop-writes-on-bgsave-error yes

# Compress string objects using LZF when dump .rdb databases?
# By default compression is enabled as it's almost always a win.
# If you want to save some CPU in the saving child set it to 'no' but
# the dataset will likely be bigger if you have compressible values or keys.
rdbcompression yes

# Since version 5 of RDB a CRC64 checksum is placed at the end of the file.
# This makes the format more resistant to corruption but there is a performance
# hit to pay (around 10%) when saving and loading RDB files, so you can disable it
# for maximum performances.
#
# RDB files created with checksum disabled have a checksum of zero that will
# tell the loading code to skip the check.
rdbchecksum yes

# Enables or disables full sanitization checks for ziplist and listpack etc when
# loading an RDB or RESTORE payload. This reduces the chances of a assertion or
# crash later on while processing commands.
# Options:
#   no         - Never perform full sanitization
#   yes        - Always perform full sanitization
#   clients    - Perform full sanitization only for user connections.
#                Excludes: RDB files, RESTORE commands received from the master
#                connection, and client connections which have the
#                skip-sanitize-payload ACL flag.
# The default should be 'clients' but since it currently affects cluster
# resharding via MIGRATE, it is temporarily set to 'no' by default.
#
# sanitize-dump-payload no

# The filename where to dump the DB
dbfilename dump6379.rdb

# Remove RDB files used by replication in instances without persistence
# enabled. By default this option is disabled, however there are environments
# where for regulations or other security concerns, RDB files persisted on
# disk by masters in order to feed replicas, or stored on disk by replicas
# in order to load them for the initial synchronization, should be deleted
# ASAP. Note that this option ONLY WORKS in instances that have both AOF
# and RDB persistence disabled, otherwise is completely ignored.
#
# An alternative (and sometimes better) way to obtain the same effect is
# to use diskless replication on both master and replicas instances. However
# in the case of replicas, diskless is not always an option.
rdb-del-sync-files no

# The working directory.
#
# The DB will be written inside this directory, with the filename specified
# above using the 'dbfilename' configuration directive.
#
# The Append Only File will also be created inside this directory.
#
# Note that you must specify a directory here, not a file name.
#dir ./
dir /opt/redis-7.0.11/dumpfile

```



#### 小总结



![image-20230515083516865](..\redis-study\imgs\image-20230515083516865.png)







### AOF



#### AOF配置指令

- 常用指令
  - appendonly                                                   是否开启aof                        yes开启no关闭
  - appendfilename                                             配置该文件保存名称
  - appendfsync                                                      写回策略
    - always                                                          同步写回
    - everysec                                                      每秒写回   （默认）
    - no                                                              操作系统控制的写回
  - no-appendfsync-on-rewrite                          aof重写期间是否同步
  - auto-aof-rewrite-percentage 100                 重写触发配置，文件重写策略
  - auto-aof-rewrite-min-size 64mb                   重写触发配置，文件重写策略



#### AOF工作流程

![image-20230515090146374](..\redis-study\imgs\image-20230515090146374.png)





#### AOF写回策略

> AOF缓冲区三种写回策略：    在配置文件中修改     APPEND ONLY MODE

- appendfsync always
  - 同步写回，每个写命令执行完立刻同步地将日志写回磁盘

- appendfsync everysec   默认
  - 每秒写回，每个写命令执行完，只是先把日志写到AOF文件的内存缓冲区，每隔1秒把缓冲区中的内容写入磁盘

- appendfsync no
  - 操作系统控制的写回，每个写命令执行完，只是先把日志写到AOF文件的内存缓冲区，由操作系统决定何时将缓冲区内容写回磁盘



#### AOF配置



> redis 7.0 核心特征 -Multi-part AOF



![image-20230515091251810](..\redis-study\imgs\image-20230515091251810.png)



##### 开启AOF持久化

默认是no    开启为yes

```
appendonly no
```



##### 使用默认的写回策略

```
appendfsync everysec 
```



##### dir保存路径

- redis 6.0中

  - dir配置什么AOF和RDB共同使用一个路径

  ```
  dir /opt/redis-7.0.11/dumpfile 
  ```

- redis 7.0中

  - appenddirname "appendonlydir"   会在dir配置的路径上加一个路径appendonlydir

    ```
    appenddirname "appendonlydir"
    #AOF会保存到/opt/redis-7.0.11/dumpfile/appendonlydir
    ```



##### AOP文件保存名称

- redis 6 中
  - appendfilename           只有这一个配置                        配置文件名称
- redis 7 中
  - 配置从之前的一个变成三个
    - base  表示基础的AOF，他一般由子进程通过重写产生，该文件最多只有一个
    - incr     表示增量AOF   它一般会在AOFRW开始执行时创建，该文件可能存在多个
    - HISTORY:表示历史AOF,它由BASE和INCR AOF变化而来，每次AOFRW成功完成时，本次AOFRW之前对应
      的BASE和INCR AOF都将变为HISTORY, **HISTORY类型的AOF会被Redis自动删除。**

为了管理这些AOF文件，**我们引入了一个manifest (清单)文件来跟踪、管理这些AOF**。|同时，为了便于AOF备份和拷贝，我们将所有的AOF文件和manifest文件放入一个单独的文件目录中，目录名由appenddirname配置(Redis 7.0新增配置项)决定。



```

1404 # - appendonly.aof.1.base.rdb as a base file.
1405 # - appendonly.aof.1.incr.aof, appendonly.aof.2.incr.aof as incremental files.
1406 # - appendonly.aof.manifest as a manifest file.

appendfilename "appendonly.aof"
```



##### 正常恢复

> 开启appendonly

```
#配置文件开启AOF
appendonly yes
```



- 重启redis 查看AOF文件路径

```
[root@hadoop100 dumpfile]# ls
appendonlydir  dump6379.rdb
[root@hadoop100 dumpfile]# cd appendonlydir/
[root@hadoop100 appendonlydir]# ll
总用量 8
-rw-r--r--. 1 root root 89 5月  15 11:10 appendonly.aof.1.base.rdb
-rw-r--r--. 1 root root  0 5月  15 11:10 appendonly.aof.1.incr.aof
-rw-r--r--. 1 root root 88 5月  15 11:10 appendonly.aof.manifest

```

- 根据上面表示已经开启AOF链接redis

```
127.0.0.1:6379> ping
PONG
127.0.0.1:6379> keys *
(empty array)

```

- 插入key值

```
127.0.0.1:6379> set k1 v1 
OK
127.0.0.1:6379> set k2 v2 
OK
127.0.0.1:6379> set k3 v3
OK
127.0.0.1:6379> keys *
1) "k3"
2) "k1"
3) "k2"
```



- 备份appendonlydir

```
[root@hadoop100 dumpfile]# cp -r appendonlydir appendonlydir.back
[root@hadoop100 dumpfile]# ls
appendonlydir  appendonlydir.back  dump6379.rdb

```

- 清空redis 使用AOF来恢复

```
127.0.0.1:6379> keys *
1) "k2"
2) "k3"
3) "k1"
127.0.0.1:6379> FLUSHDB
OK
127.0.0.1:6379> keys *
(empty array)
```



- 为了确定AOF来复原数据我删除了dump.rdb

  ```
  drwxr-xr-x. 2 root root 103 5月  15 11:10 appendonlydir
  drwxr-xr-x. 2 root root 103 5月  15 11:24 appendonlydir.back
  -rw-r--r--. 1 root root  89 5月  15 11:26 dump6379.rdb
  [root@hadoop100 dumpfile]# rm -rf dump6379.rdb 
  [root@hadoop100 dumpfile]# ll
  总用量 0
  drwxr-xr-x. 2 root root 103 5月  15 11:10 appendonlydir
  drwxr-xr-x. 2 root root 103 5月  15 11:24 appendonlydir.back
  
  ```

- 将之前appendonlydir.back复原

```
[root@hadoop100 dumpfile]# rm -rf appendonlydir

[root@hadoop100 dumpfile]# mv appendonlydir.back appendonlydir
[root@hadoop100 dumpfile]# ll
总用量 0
drwxr-xr-x. 3 root root 129 5月  15 11:28 appendonlydir
```



- 重写启动redis

  ```
  [root@hadoop100 myconf]# redis-server myredis7.conf 
  [root@hadoop100 myconf]# redis-cli -a 123456
  Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
  127.0.0.1:6379> keys *
  1) "k2"
  2) "k3"
  3) "k1"
  ```

  

##### 异常恢复



> 故意乱写正常的AOF文件模拟网络闪断文件写error



- 查看appendonlydir文件下的文件

```
[root@hadoop100 appendonlydir]# ll
总用量 12
-rw-r--r--. 1 root root  89 5月  15 11:51 appendonly.aof.1.base.rdb
-rw-r--r--. 1 root root 110 5月  15 11:51 appendonly.aof.1.incr.aof  #大小110
-rw-r--r--. 1 root root  88 5月  15 11:51 appendonly.aof.manifest

```



- 通过set插入

```
#redis-cli端
127.0.0.1:6379> set k5 v5
OK
#linux端
[root@hadoop100 appendonlydir]# ll
总用量 12
-rw-r--r--. 1 root root  89 5月  15 11:51 appendonly.aof.1.base.rdb
-rw-r--r--. 1 root root 162 5月  16 17:17 appendonly.aof.1.incr.aof  #变大了
-rw-r--r--. 1 root root  88 5月  15 11:51 appendonly.aof.manifest

```

- appendonly.aof.1.incr.aof变大了所以我们去模拟乱写入的操作

```
[root@hadoop100 appendonlydir]# vim appendonly.aof.1.incr.aof 

SELECT
$1
0                            #表示0号库
*3
$3
set
$2
k5
$2
vadasdwadhwkjn,sandwqnsan5   # 乱插入的值

```



- 重起redis服务

```
127.0.0.1:6379> SHUTDOWN
not connected> quit
#重写起报错
[root@hadoop100 ~]# redis-server /opt/redis-7.0.11/myconf/myredis7.conf 
[root@hadoop100 ~]# redis-cli -a 123456
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
Could not connect to Redis at 127.0.0.1:6379: Connection refused

#查看6379端口占用情况没有启动
[root@hadoop100 ~]# lsof -i:6379

```



- 修复文件
  - 基础语法
    -  redis-check-aof --fix   文件名称

```
[root@hadoop100 ~]# redis-check-aof --fix /opt/redis-7.0.11/dumpfile/appendonlydir/appendonly.aof.1.incr.aof 
Start checking Old-Style AOF
0x              9e: Expected \r\n, got: 6461
AOF analyzed: filename=/opt/redis-7.0.11/dumpfile/appendonlydir/appendonly.aof.1.incr.aof, size=186, ok_up_to=133, ok_up_to_line=38, diff=53
This will shrink the AOF /opt/redis-7.0.11/dumpfile/appendonlydir/appendonly.aof.1.incr.aof from 186 bytes, with 53 bytes, to 133 bytes
Continue? [y/N]: y
Successfully truncated AOF /opt/redis-7.0.11/dumpfile/appendonlydir/appendonly.aof.1.incr.aof
#重写起成功
[root@hadoop100 ~]# redis-server /opt/redis-7.0.11/myconf/myredis7.conf 
[root@hadoop100 ~]# redis-cli -a 123456
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379> ping
PONG
127.0.0.1:6379> keys *
1) "k3"
2) "k1"
3) "k2"

```



##### flushdb / flushall恢复

```
#第一步清空
127.0.0.1:6379> flushall
OK
127.0.0.1:6379> keys *
(empty array)

#删除错误指令 保存退出
[root@hadoop100 appendonlydir]# vim appendonly.aof.1.incr.aof 
SELECT
$1
0
*2
$6
SELECT
$1
0
*1
$8
flushall   #删除保存


#重启服务
127.0.0.1:6379> keys *
(empty array)
127.0.0.1:6379> SHUTDOWN
not connected> quit
[root@hadoop100 ~]# redis-server /opt/redis-7.0.11/myconf/myredis7.conf 
[root@hadoop100 ~]# redis-cli -a 123456
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379> keys *
1) "k3"
2) "k2"
3) "k1"

```





##### AOF重写命令



###### 什么是重写

> 启动AOF文件的内容压缩，只保留可以恢复数据的最小指令集。

举个例子:比有个key
一开始你  set  k1  v1
然后改成  set  k1 v2
最后改成  set k1 v3
如果不重写，那么这3条语句都在aof文件中，内容占空间不说启动的时候都要执行遍，共计3条命令;但是,我们实际效果只需要set k1 v3这一条, 所以开启重写后，只需要保存set k1 v3就可以了只需要保留最后一次修改值，相当于给aof文件瘦身减肥，性能更好。AOF重写不仅降低了文件的占用空间，同时更小的AOF也可以更快地被Redis加载。



> 解释：

由于AOF持久化是Redis不断将写命令记录到AOF文件中，随着Redis不断的进行，AOF的文件会越来越大，文件越大，占用服务器内存越大以及AOF恢复要求时间越长。为了解决这个问题，**Redis增了重写机制**，当AOF文件的大小超过所设定的峰值时，Redis就会**自动启动**AOF文件的内容压缩，只保留可以恢复数据的**最小指令集或者可以手动使用命令bgrewriteaof 来重新。**



- 配置文件

```
# Automatic rewrite of the append only file.
# Redis is able to automatically rewrite the log file implicitly calling
# BGREWRITEAOF when the AOF log size grows by the specified percentage.
#
# This is how it works: Redis remembers the size of the AOF file after the
# latest rewrite (if no rewrite has happened since the restart, the size of
# the AOF at startup is used).
#
# This base size is compared to the current size. If the current size is
# bigger than the specified percentage, the rewrite is triggered. Also
# you need to specify a minimal size for the AOF file to be rewritten, this
# is useful to avoid rewriting the AOF file even if the percentage increase
# is reached but it is still pretty small.
#
# Specify a percentage of zero in order to disable the automatic AOF
# rewrite feature.

auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb

```

>  注意： 同时满足，且的关系才会触发    自动触发

1.  根据上次重写的aof大小，判断当前aof大小是不是增长了一倍
2.  重写时满足的文件大小



> 手动触发

1. bgrewriteaof  



###### 实际操作

> 前期准备：

- 环境情况
  - appendonly yes                                           开启AOF持久化
  -  auto-aof-rewrite-percentage 100            重写机制，判断当前aof大小是不是增长了一倍， 和下面的重写机制要同时满足才执行
  -  auto-aof-rewrite-min-size  1k                   重写机制，重写时满足的文件大小    
  - aof-use-rdb-preamble no                          关闭 AOF+RDB



- 删除RDB和AOF                   清除干扰项

```
[root@hadoop100 dumpfile]# ll
总用量 4
drwxr-xr-x. 2 root root 103 5月  16 17:40 appendonlydir
-rw-r--r--. 1 root root 115 5月  16 17:41 dump6379.rdb
[root@hadoop100 dumpfile]# rm -rf appendonlydir/
[root@hadoop100 dumpfile]# rm -rf dump6379.rdb 
[root@hadoop100 dumpfile]# ll
总用量 0
```



- 自动触发

> 完成上放环境准备和清除干扰项，重启redis 指向set k1 v1 查看aof文件是否正常

```
#启动redis
[root@hadoop100 myconf]# redis-server  myredis7.conf 
[root@hadoop100 myconf]# redis-cli -a 123456
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379> set k1 v1
OK

#查看是否生成aof文件
[root@hadoop100 dumpfile]# ll
总用量 0
drwxr-xr-x. 2 root root 103 5月  17 08:53 appendonlydir
[root@hadoop100 dumpfile]# cd appendonlydir/
[root@hadoop100 appendonlydir]# ll
总用量 4
-rw-r--r--. 1 root root  0 5月  17 08:53 appendonly.aof.1.base.aof
-rw-r--r--. 1 root root  0 5月  17 08:53 appendonly.aof.1.incr.aof
-rw-r--r--. 1 root root 88 5月  17 08:53 appendonly.aof.manifest

#插入数据
127.0.0.1:6379> keys *
(empty array)
127.0.0.1:6379> set k1 v1
OK
127.0.0.1:6379> keys *
1) "k1"

#查看aof文件大小
[root@hadoop100 appendonlydir]# ll
总用量 8
-rw-r--r--. 1 root root  0 5月  17 08:53 appendonly.aof.1.base.aof
-rw-r--r--. 1 root root 52 5月  17 08:54 appendonly.aof.1.incr.aof
-rw-r--r--. 1 root root 88 5月  17 08:53 appendonly.aof.manifest
[root@hadoop100 appendonlydir]# 

#一直反复修改插入k1的值
OK
127.0.0.1:6379> set k1 1111111111111111111111111111
OK
127.0.0.1:6379> set k1 11111111111111111111111111111111
OK
127.0.0.1:6379> set k1 11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

#当incr到达1k的时候 文件名从1变成了2   base文件也从0变成171
[root@hadoop100 appendonlydir]# ll
总用量 12
-rw-r--r--. 1 root root 171 5月  17 09:00 appendonly.aof.2.base.aof
-rw-r--r--. 1 root root 319 5月  17 09:00 appendonly.aof.2.incr.aof
-rw-r--r--. 1 root root  88 5月  17 09:00 appendonly.aof.manifest


```





- 手动触发
  - BGREWRITAOF 

```
#bgrewriteaof
127.0.0.1:6379> set k2 v2
OK
127.0.0.1:6379> BGREWRITEAOF
Background append only file rewriting started
#发生改变
[root@hadoop100 appendonlydir]# ll
总用量 8
-rw-r--r--. 1 root root 200 5月  17 09:13 appendonly.aof.3.base.aof
-rw-r--r--. 1 root root   0 5月  17 09:13 appendonly.aof.3.incr.aof
-rw-r--r--. 1 root root  88 5月  17 09:13 appendonly.aof.manifest
[root@hadoop100 appendonlydir]# 

```





##### 总结

也就是说AOF文件重写并不是对原文件进行重新整理,而是直接读取服务器现有的键值对,然后用一条命令去代替之前记录这个
键值对的多条或重复命令，生成一个新的文件后去替换原来的AOF文件。

AOF文件重写触发机制:通过redis.conf配置文件中的auto-aof-rewrite-percentage:默认值为100,以及auto-aof-rewrite-min-size: 64mb配置,也就是说默认Redis会记录上次重写时的AOF大小,默认配置是当AOF文件大小是上次rewrite后大小的一倍且文件大于64M时触发。

![image-20230517110457514](..\redis-study\imgs\image-20230517110457514.png)

##### 重写原理

1:在重写开始前，redis会创建一个“重写子进程”，这个子进程会读取现有的AOF文件，并将其包含的指令进行分析压缩并写入到一个临时文件中。

2:与此同时，主进程会将新接收到的写指令一边累积到内存缓冲区中，一边继续写入到原有的AOF文件中，这样做是保证原有的AOF文件的可用性，避免在重写过程中出现意外。

3:当“重写子进程”完成重写工作后，它会给父进程发 一个信号，父进程收到信号后就会将内存中缓存的写指令追加到新AOF文件中

4: 当追加结束后，redis就会用新AOF文件来代替旧AOF文件，之后再有新的写指令，就都会追加到新的AOF文件中

5: 重写aof文件的操作，并没有读取旧的aof文件，而是将整个内存中的数据库内容用命令的方式重写了一个新的aof文件，这点和快照有点类似





### RDB+AOF



#### RDB+AOF优先级

> AOF默认不开，一但开启AOF优先级高于RDB



![image-20230517111235765](..\redis-study\imgs\image-20230517111235765.png)





> 当AOF和RDB同时开启的时候 优先级

在这种情况下,当redis重启的时候会优先载入AOF文件来恢复原始的数据,因为在通常情况下AOF文件保存的数据集要比RDB文件保存的数据集要完整。

RDB的数据不实时，同时使用两者时服务器重启也只会找AOF文件。那要不要只使用AOF呢?作者建议不要，因为RDB更适合用于备份数据库(AOF在不断变化不好备份)，留着rdb作为一个万一的手段。



#### 开启RDB+AOF

- 基本命令
  - aof-use-rdb-preamble yes                            yes表示开启 no表示关闭

> RDB镜像做全量持久化，AOF做增量化



先使用RDB进行快照存储，然后使用AOF持久化记录所有的写操作**，当重写策略满足或手动触发重写的时候，将最新的数据存储为新RDB记录**
。这样的话，重启服务的时候会从RDB和AOF两部分恢复数据，既保证了数据完整性，又提高了恢复数据的性能。简单来说:混合持久化式产
生的文件一部分是RDB格式，一部分是AOF格式。------》 AOF包括了RDB头部+AOF混写







### 纯缓存模式



> 同时关闭RDB和AOF

- 配置文件设置	
  - 禁用RDB
    - save ""                                                                    禁用RDB模式下，我们仍然可以使用命令save，bgsave生成rdb文件
  - 禁止AOF
    - appendonly  no                                                    禁用AOF持久化模式下，我们仍然可以使用命令BGREWIRTEAOF生成aof





## Redis事务

可以一次执行多个命令，本质是一组命令的集合。一个事务中的所有命令都会序列化，按顺序地串行化执行而不会被其它命令插入，不许加塞。



> 原则性

要么都成功，要么都失败



### redis事务VS数据库事务



| redis的特点        |                             解释                             |
| :----------------- | :----------------------------------------------------------: |
| 单独的隔离操作     | Redis的事务仅仅是保证事务里的操作会被连续独占的执行，redis命令执行是单线程架构，在执行完事务内所有指令前是不可能再去同时执行其他客户端的请求的 |
| 没有隔离级别的概览 | 因为事务提交前任何指令都不会被实际执行，也就不存在”事务内的查询要看到事务里的更新，在事务外查询不能看“到这种问题了 |
| 不保证原子性       | Redis的事务不保证原子性，也就是不保证所有指令同时成功或同时失败，只有决定是否开始执行全部指令的能力，没有执行到一半进行回滚的能力 |
| 排它性             | Redis会保证一一个事务内的命令依次执行，而不会被其它命令插入  |





### redis 事务命令



- redis事务命令
  - DISCARD
    - 取消事务，放弃执行事务块的所以命令
  - EXEC
    - 执行所以事务块的命令
  - MULTI
    - 标记一个事务块的开始
  - UNWATCH
    - 取消WATCH命令监控的所有key
  - WATCH key[key...]
    - 监视一个key或者多个key，如果在事务执行之前这个(或这些) key被其他命令所改动,那么事务将被打断。



#### 正常执行

实际操作

> MULTI         表示事务开

> EXEC            表示事务结束

> QUEUED          翻译排队

```
127.0.0.1:6379> MULTI
OK
127.0.0.1:6379(TX)> set k1 v1
QUEUED
127.0.0.1:6379(TX)> set k2 v2
QUEUED
127.0.0.1:6379(TX)> set k3 100
QUEUED
127.0.0.1:6379(TX)> INCR k3
QUEUED
127.0.0.1:6379(TX)> EXEC
1) OK
2) OK
3) OK
4) (integer) 101
127.0.0.1:6379> get k1
"v1"

```



#### 放弃事务

实际操作

> MULTI         表示事务开

> DISCARD     放弃事务

```
127.0.0.1:6379> MULTI
OK
127.0.0.1:6379(TX)> set k1 v11
QUEUED
127.0.0.1:6379(TX)> set k2 v22
QUEUED
127.0.0.1:6379(TX)> DISCARD
OK
127.0.0.1:6379> get k1
"v1"

```



#### 全体连坐

> 有点像事务的原子性

实际操作

```
127.0.0.1:6379(TX)> DISCARD
OK
127.0.0.1:6379> get k1
"v1"
127.0.0.1:6379> MULTI
OK
127.0.0.1:6379(TX)> set k1 v111
QUEUED
127.0.0.1:6379(TX)> set k2 v222
QUEUED
127.0.0.1:6379(TX)> set k3
(error) ERR wrong number of arguments for 'set' command
127.0.0.1:6379(TX)> EXEC
(error) EXECABORT Transaction discarded because of previous errors.
127.0.0.1:6379> get k1
"v1"

```



#### 死道友不死贫道

> 在队列中有问题的语句不会影响到其它语句的执行

```
127.0.0.1:6379> MULTI
OK
127.0.0.1:6379(TX)> set k1 v1111
QUEUED
127.0.0.1:6379(TX)> set email 2849569455@qq.com
QUEUED
127.0.0.1:6379(TX)> INCR email            # value中的值为字符不支持incr
QUEUED
127.0.0.1:6379(TX)> set k2 v2222
QUEUED
127.0.0.1:6379(TX)> INCR k3
QUEUED
127.0.0.1:6379(TX)> EXEC
1) OK
2) OK
3) (error) ERR value is not an integer or out of range
4) OK
5) (integer) 102
127.0.0.1:6379> get email
"2849569455@qq.com"

```



#### watch监控

> watch监控像是乐观锁



**什么是乐观锁：**

乐观锁(Optimistic Lock),顾名思义，就是很乐观，每次去拿数据的时候都认为别人不会修改，所以不会上锁，但是在更新的时候会判断一下在此期间别人有没有去更新这个数据。

**乐观锁策略:提交版本必须大于记录 当前版本才能执行更新**



> 实际操作有人加塞的情况：

- 基本语法
  - watch key[key...]                                                               开启监控
  - unwatch key [key...]                                                         关闭监控

- 客户端1号

```
127.0.0.1:6379> keys *
(empty array)
127.0.0.1:6379> set k v
OK
127.0.0.1:6379> set balance 100
OK
#监视balance
127.0.0.1:6379> watch balance
OK
#开启事务
127.0.0.1:6379> MULTI
OK
127.0.0.1:6379(TX)> set k v1
QUEUED
127.0.0.1:6379(TX)> set balance 150
QUEUED

```



- 客户端2号

```
127.0.0.1:6379> set balance 110
OK
```



- 客户端1号

```
127.0.0.1:6379(TX)> EXEC
(nil)
#结果
127.0.0.1:6379> get k
"v"
127.0.0.1:6379> get balance
"110"

```



> 总结：

1. 当事务中有一个触发了乐观锁机制就事务中的所有语句全部失败

2. 一旦执行了exec之前加的监控锁都会被取消掉了

3. 当客户端连接丢失的时候(比如退出链接)，所有东西都会被取消监视





## redis管道

### 什么是redis管道

> 问题由来：

1客户端向服务端发送命令分四步(发送命令→命令排队→命令执行→返回结果)，并监听Socket返回，通常以阻塞模式等待服务端响应。
2服务端处理命令，并将结果返回给客户端。
上述两步称为: Round Trip Time(简称RTT,数据包往返于两端的时间)，问题笔记最下方



<img src="..\redis-study\imgs\image-20230519095118966.png" alt="image-20230519095118966" style="zoom:67%;" />



如果同时需要执行大量的命令，那么就要等待上一条命令应答后再执行，这中间不仅仅多了RTT (Roung Time Trip)，而且还频繁调用系统
IO，发送网络请求，同时需要redis调用多次read()和write()系统方法，系统方法会将数据从用户态转移到内核态，这样就会对进程上下文有比较大的影响了，性能不太好，o(τ_ _π)o



> 解决思路

管道(pipeline)可以一次性发送多条命令给服务端，服务端依次处理完完毕后，**通过一 条响应一次性将结果返回，通过减少客户端与redis的通信次数来实现降低往返延时时间。**pipeline实现的原理是队列，先进先出特性就保证数据的顺序性。



![image-20230519100245497](..\redis-study\imgs\image-20230519100245497.png)

 解释

> 批处理命令变种优化措施，类似Redis的原生批命令(mget和mset)



### 实际操作

先创建一个cmd.txt文件

```
[root@hadoop100 cmd]# vim cmd.txt
set k100 v100
set k200 v200
hset k300 user wmt
hset k400 age 18
lpush list v1 v2 v3 v4 v5
```



使用Linux的管道运算符

```[root@hadoop100 cmd]# cat cmd.txt 
[root@hadoop100 cmd]# cat cmd.txt 
set k100 v100
set k200 v200
hset k300 user wmt
hset k400 age 18
lpush list v1 v2 v3 v4 v5

[root@hadoop100 cmd]# cat cmd.txt  | redis-cli -a 123456 --pipe
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
All data transferred. Waiting for the last reply...
Last reply received from server.
errors: 0, replies: 5
```



查看运行结果

```
127.0.0.1:6379> LRANGE list 0 -1
1) "v5"
2) "v4"
3) "v3"
4) "v2"
5) "v1"
127.0.0.1:6379> HGET k300 user
"wmt"

```



### 小总结

> pipeline 和原生批量命令的对比

1. 原生批量命令是原子性（例如：mset，mget），plepeline是非原子性
2. 原生批量命令一次只能执行一种命令，pipeline可以执行不同命令
3. 原生命名只能在服务端里实现，而pipeline需要服务端和客户端完成



> pipeline 和事务的对比

1. 事务具有原子性，管道不具有原子性
2. 管道是一次性将多条命令发往服务器，事务是一条一条的发，事务只有接收到exec命令后才会执行
3. 执行事务时会阻塞其它命令的执行，而执行管道中的命令时不会



> pipeline使用注意事项

1. pipeline缓冲的指令只是会依次执行，不保证原子性，如果执行中指令发生异常，将会继续执行后续的指令
2. 使用pipeline组装的命令个数不能太多，不然数据量过大客户端阻塞的时间可能过久，同时服务端此时也被迫回复一二个队列答复，占用很多内存





## redis发布与订阅

> 了解：



### 是什么

是一种消息通信模式:发送者(PUBLISH)发送消息，订阅者(SUBSCRIBE)接收消息，可以实现进程间的消息传递



Redis可以实现消息中间件MQ的功能，通过发布订阅实现消息的引导和分流。
仅代表我个人，不推荐使用该功能，专业的事情交给专业的中间件处理，redis就做好分布式缓存功能



### 能干嘛

Redis客户端可以订阅任意数量的频道,类似我们微信关注多个公众号





### 常用命令

![image-20230519131756589](..\redis-study\imgs\image-20230519131756589.png)



> 推荐先订阅后发布









## redis复制（replica）



> 主从复制master以写为主，salve为读为主

当master数据发生变化的时候，自动将新的数据异步同步到其它salve数据库





### 能干嘛？

1. 读写分离
2. 容灾恢复
3. 数据备份
4. 水平扩容支持高并发



### 怎么配置

- 配从库不配主库

- 权限细节
  - master如果配置了requirepass参数，需要密码登陆，那么slave就要配置masterauth来设置校验密码,否则的话master会拒绝slave的访问请求
- 基本命令
  - info replication
    - 可以查看复制节点的主从关系和配置信息
  - replicaof   主库ip    主库端口
    - 一般写入到redis.config配置文件内
  - salveof   主库ip    主库端口
    - 每次与master断开之后，都需要重新连接，除非你配置进redis.conf文件
    - 在运行期间修改slave节点的信息**，如果该数据库已经是某个主数据库的从数据库,那么会停止和原主数据库的同步关系转而和新的主数据库同步，重新拜码头**
  - salveof no one
    - 使当前数据库停止与其他数据库的同步，转成主数据库，自立为王



### 实际操作

> 配置说明本次案例采用一个master两个slave 

本次redis采用6.2.6

#### 开始编写配置文件  

> 使用Linux来搭建则需要配置文件使用docker则不需要

1. daemonize no                              改成   yes                         成为后台运行  如果在docker里面则为no
2. protected-mode yes                    改成    no                          保护模式
3. bind 127.0.0.1 -::1                         改成 注释                         注释掉不然会影响远程ip连接
4. requirepass 123456                      设置密码
5. port  端口号                                      改成你docker映射的端口号
6. dir   dump文件保存的路径             记住创建路径在写配置文件
7. pidfile /var/run/redis_6379.pid      看进程id用得到还有看管道的时候
8. logfile "路径/文件名称.log"               配置日志
9. dbfilename dump.rdb                      dump文件名称
10. appendonly  yes                                 开启aof数据持久化
11. appendfilename "filename.aof"      设置aof文件名称
12. 从机访问主机的通行密码masterauth，必须                                    从机需要配置主机不需要





> 因为内存不够不采用Linux里搭建redis集群 采用docker来搭建一主两从

redis_master.conf 文件内容

```
# 绑定
bind 0.0.0.0
# 连接保护模式关闭
protected-mode no
# 端口 可以去修改端口号 docker -p 中的端口没有关系 修改后 redis-cli 连接的时候 -p 要指定修改后的端口号 不写默认是6379
port 6379
# 数据库数量
databases 16
# rdb快照规则
# 在900秒（15分钟）后，如果至少更改了1个键
save 900 1
save 300 10
save 60 10000
# rdb快照文件名称
dbfilename dump.rdb
# 客户端连接数量设置
maxclients 10000
# AOF模式开启，默认关闭
appendonly yes
# 文件名
appendfilename "appendonly.aof"
# AOF同步机制 
# 每秒同步
appendfsync everysec
# 文件大小切割
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb
# 淘汰机制设置
maxmemory-policy noeviction

#密码设置
requirepass 123456

```



主机IP

```
[root@hadoop100 /]# docker inspect redis-master | grep IP
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.3",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
                    "IPAMConfig": null,
                    "IPAddress": "172.17.0.3",   #IP地址
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
```





redis_slave.conf 文件内容，在主机的redis_master.conf的配置之上再加多下面的配置

```
# 修改从机的端口号
port 对应的端口号就可以了
# 主机地址
replicaof 172.17.0.3 6400   // 主机IP地址 端口号
masterauth 123456
```

目录结构

```
/myredis
 	/redis_master
 		/data
 		/conf
 			/各自的配置文件
	/redis_slave1
		/data
		/conf
			/各自的配置文件
	/redis_slave2
		/data
		/conf
			/各自的配置文件
```





#### 创建容器

```
# -v 容器卷
# -d 后台启动


# redis 主机启动
docker run \
--restart=always \
--name redis-master \
-v /myredis/redis_master/conf/redis_master.conf:/etc/redis/redis.conf \
-v /myredis/redis_master/data:/data \
-v /etc/localtime:/etc/localtime \
-p 6400:6400 \
-d 7614ae9453d1 redis-server /etc/redis/redis.conf


#redis 从机启动
docker run \
--restart=always \
--name redis-slave1 \
-v /myredis/redis_slave1/conf/redis_slave1.conf:/etc/redis/redis.conf \
-v /myredis/redis_slave1/data:/data \
-v /etc/localtime:/etc/localtime \
-p 6401:6401 \
-d 7614ae9453d1 redis-server /etc/redis/redis.conf



#redis 从机启动
docker run \
--restart=always \
--name redis-slave2 \
-v /myredis/redis_slave2/conf/redis_slave2.conf:/etc/redis/redis.conf \
-v /myredis/redis_slave2/data:/data \
-v /etc/localtime:/etc/localtime \
-p 6402:6402 \
-d 7614ae9453d1 redis-server /etc/redis/redis.conf


```





#### 配置日志文件

> 配置redis 配置文件方便排错

1. redis.conf 的配置  日志文件指的是容器中的文件，千万别理解为**宿主机中的路径**

```
#开启日志的级别
loglevel notice
#日志路径
logfile "/data/log/redis.log"
```



2. 创建/data/log/redis.log

```
#先进入redis容器  创建目录
[root@hadoop100 conf]# docker exec -it redis-master /bin/bash
root@96b1263ba02d:/data# ls
appendonly.aof	dump.rdb
root@96b1263ba02d:/data# mkdir log
root@96b1263ba02d:/data# ls
appendonly.aof	dump.rdb  log
root@96b1263ba02d:/data# cd log
root@96b1263ba02d:/data/log# touch redis.log
root@96b1263ba02d:/data/log# ls
redis.log
```





#### 查看redis主从关系

解释

- --cluster create ip:port  [ip:port...]                          创建主从关系
- --cluster-replicas 12                                                    表示一个master搭建一个slave节点

```
# 主机查看
[root@hadoop100 conf]# docker exec -it redis-master bash -c "redis-cli -h 127.0.0.1 -p 6379"
127.0.0.1:6379> ping
(error) NOAUTH Authentication required.
127.0.0.1:6379> auth 123456
OK
127.0.0.1:6379> info replication
# Replication
role:master
connected_slaves:2
slave0:ip=172.17.0.1,port=6379,state=online,offset=84,lag=1
slave1:ip=172.17.0.1,port=6379,state=online,offset=84,lag=1
master_failover_state:no-failover
master_replid:d94792c0de6cf5a9b1918a7ea39fabe2130cb07a
master_replid2:0000000000000000000000000000000000000000
master_repl_offset:84
second_repl_offset:-1
repl_backlog_active:1
repl_backlog_size:1048576
repl_backlog_first_byte_offset:1
repl_backlog_histlen:84


# 从机查看
[root@hadoop100 conf]# docker exec -it redis-slave1 /bin/bash
root@e5b0e470d0bc:/data# redis-cli -p 6379
127.0.0.1:6379> ping
(error) NOAUTH Authentication required.
127.0.0.1:6379> auth 123456
OK
127.0.0.1:6379> info replication
# Replication
role:slave
master_host:192.168.206.100
master_port:6400
master_link_status:up
master_last_io_seconds_ago:7
master_sync_in_progress:0
slave_read_repl_offset:350
slave_repl_offset:350
slave_priority:100
slave_read_only:1
replica_announced:1
connected_slaves:0
master_failover_state:no-failover
master_replid:d94792c0de6cf5a9b1918a7ea39fabe2130cb07a
master_replid2:0000000000000000000000000000000000000000
master_repl_offset:350
second_repl_offset:-1
repl_backlog_active:1
repl_backlog_size:1048576
repl_backlog_first_byte_offset:1
repl_backlog_histlen:350
127.0.0.1:6379> set k2 v2
(error) READONLY You can't write against a read only replica.  // 从机只能查不能写
127.0.0.1:6379> get k1
"v1"


```



#### 开启端口对外暴露

```
# 开启放端口6400
[root@hadoop100 myredis]# firewall-cmd --zone=public --add-port=6400/tcp --permanent  
success
#立刻生效
[root@hadoop100 myredis]# firewall-cmd --reload 
success
# 查看暴露的端口
[root@hadoop100 myredis]# firewall-cmd --zone=public --list-ports
6400/tcp
[root@hadoop100 myredis]# firewall-cmd --zone=public --add-port=6401/tcp --permanent 
success
[root@hadoop100 myredis]# firewall-cmd --zone=public --add-port=6402/tcp --permanent 
success

```



####  注意事项

daemonize 后台运行

注意：

1.docker -d 已经是后台运行了，所以在redis.conf的配置里，daemonize 设置为no，如果是yes，会出现冲突，然后启动不了redis容器

2.在docker 启动的情况下如果重启防火墙需要重写启动docker              systemctl restart docker

> docker start imageID  异常信息

```
Error response from daemon: driver failed programming external connectivity on endpoint redis-master (97283eb2c3a7ac3d64ecfcad09bcc6f3922f610fd609bb3b1c216d06c49c7861):  (iptables failed: iptables --wait -t nat -A DOCKER -p tcp -d 0/0 --dport 6400 -j DNAT --to-destination 172.17.0.2:6379 ! -i docker0: iptables: No chain/target/match by that name.
 (exit status 1))
Error: failed to start containers: 96b1263ba02d

```



### 总结

1. 从机可以执行写命令吗？

   ```
   # 不能
   [root@hadoop100 ~]# docker exec -it redis-slave1 /bin/bash
   root@e5b0e470d0bc:/data# redis-cli
   127.0.0.1:6379> auth 123456
   OK
   127.0.0.1:6379> set k3 v3
   (error) READONLY You can't write against a read only replica.
   
   ```

2. 从机切入点问题

   ```
   # 首次启动会获取所有的数据，后续跟随，master写salve跟
   
   #主机目前的数据
   127.0.0.1:6379> keys *
   1) "k2"
   2) "name"
   3) "k1"
   
   #模仿从机宕机 redis-slave1 宕机
   127.0.0.1:6379> SHUTDOWN
   [root@hadoop100 ~]# 
   
   # 主机继续插入k3 
   127.0.0.1:6379> set k3 v3
   OK
   
   # 从机redis-slave2去get k3 
   127.0.0.1:6379> get k3
   "v3"
   
   #重写启动redis-slave1 查看是否有k3
   [root@hadoop100 ~]# docker exec -it redis-slave1 /bin/bash
   root@e5b0e470d0bc:/data# redis-cli
   127.0.0.1:6379> auth 123456
   OK
   127.0.0.1:6379> get k3
   "v3"
   
   ```

3. 主机宕机后，从机会上位吗？

   ```
   #从机不动，原地待命，从机的数据可以正常使用：等待主机重新归来。
   #主机宕机 使用shutdown 不会停止docker 容器
   [root@hadoop100 ~]# docker stop redis-master 
   redis-master
   
   #查看从机状态
   127.0.0.1:6379> info replication
   # Replication
   role:slave
   master_host:192.168.206.100
   master_port:6400
   master_link_status:down
   #从机还是可以继续获取之前的数据
   127.0.0.1:6379> get name
   "wmt"
   
   
   # 重新启动主机
   [root@hadoop100 ~]# docker restart redis-master 
   redis-master
   [root@hadoop100 ~]# docker ps
   CONTAINER ID   IMAGE          COMMAND                   CREATED      STATUS          PORTS                                       NAMES
   83dc49b8f6d0   7614ae9453d1   "docker-entrypoint.s…"   7 days ago   Up 2 hours      0.0.0.0:6402->6379/tcp, :::6402->6379/tcp   redis-slave2
   e5b0e470d0bc   7614ae9453d1   "docker-entrypoint.s…"   7 days ago   Up 19 minutes   0.0.0.0:6401->6379/tcp, :::6401->6379/tcp   redis-slave1
   96b1263ba02d   7614ae9453d1   "docker-entrypoint.s…"   7 days ago   Up 4 seconds    0.0.0.0:6400->6379/tcp, :::6400->6379/tcp   redis-master
   [root@hadoop100 ~]# docker exec -it redis-master /bin/bash
   root@96b1263ba02d:/data# redis-cli
   127.0.0.1:6379> auth 123456
   OK
   127.0.0.1:6379> info replication
   # Replication 仍然是主机
   role:master
   connected_slaves:2
   slave0:ip=172.17.0.1,port=6379,state=online,offset=56,lag=0
   slave1:ip=172.17.0.1,port=6379,state=online,offset=56,lag=0
   
   ```

   







### 改换门庭



#### 自立为王

> 当前环境是一主二从    二从需要改成各自为王

```
#修改 redis_slave1的配置文件
-rw-r--r--. 1 root root 738 8月  23 11:26 redis_slave1.conf
[root@hadoop100 conf]# vim redis_slave1.conf 

#把配置文件注释掉
#replicaof 192.168.206.100 6400

#修改 redis_slave2的配置文件
-rw-r--r--. 1 root root 738 8月  23 11:26 redis_slave2.conf
[root@hadoop100 conf]# vim redis_slave2.conf 

#重新启动
[root@hadoop100 conf]# docker restart redis-slave1 redis-slave2
redis-slave1
redis-slave2

# 查看redis-slave1 的状态是 master了
[root@hadoop100 conf]# vim redis_slave1.conf 
[root@hadoop100 conf]# docker exec -it redis-slave1 /bin/bash
root@e5b0e470d0bc:/data# redis-cli
127.0.0.1:6379> auth 123456
OK
127.0.0.1:6379> info replication
# Replication
role:master
connected_slaves:0

# 查看redis-slave2 的状态是 master了
[root@hadoop100 conf]# docker restart redis-slave1 redis-slave2
redis-slave1
redis-slave2
[root@hadoop100 conf]# docker exec -it redis-slave2 /bin/bash
root@83dc49b8f6d0:/data# redis-cli
127.0.0.1:6379> auth 123456
OK
127.0.0.1:6379> info replication
# Replication
role:master
connected_slaves:0

```



#### 当舔狗

- 基本语法
  - salveof  主库IP 主库端口

```
#从机redis_slave1重新回去当舔狗1
127.0.0.1:6379> SLAVEOF 192.168.206.100 6400
OK
127.0.0.1:6379> info replication
# Replication
role:slave
master_host:192.168.206.100
master_port:6400
master_link_status:up

#从机redis_slave2重新回去当舔狗
127.0.0.1:6379> SLAVEOF 192.168.206.100 6400
OK
127.0.0.1:6379> info replication
# Replication
role:slave
master_host:192.168.206.100
master_port:6400
# 主机信息
127.0.0.1:6379> info replication
# Replication
role:master
connected_slaves:2
slave0:ip=172.17.0.1,port=6379,state=online,offset=10528,lag=0
slave1:ip=172.17.0.1,port=6379,state=online,offset=10528,lag=0
master_failover_state:no-failover
```



- 注意重启之后会恢复为master



### 薪火相传

> 当前环境一主二从

上一个slave 可以是下一个slave的master，slave同样可以接收slaves的连接和同步请求，那么该slave作为了链条中下一个的可以有效减轻主master的写压力

```
#主机
127.0.0.1:6379> info replication
# Replication
role:master
connected_slaves:2
slave0:ip=172.17.0.1,port=6379,state=online,offset=11424,lag=0
slave1:ip=172.17.0.1,port=6379,state=online,offset=11424,lag=1


#从机redis_slave1
127.0.0.1:6379> info replication
# Replication
role:slave
master_host:192.168.206.100
master_port:6400
master_link_status:up

#从机redis_slave2
127.0.0.1:6379> info replication
# Replication
role:slave
master_host:192.168.206.100
master_port:6400
master_link_status:up

```



#### 改换门庭 （临时改换）

> 让 redis_slave2  去当 redis_slave1 的舔狗

临时的改换门庭

中途变更转向：会清除之前的数据，重新建立拷贝最新的

- 基本语法
  - slaveof 新主库IP  新主库端口

```
127.0.0.1:6379> SLAVEOF 192.168.206.100 6401
OK

# redis_slave2 改成去舔  redis_slave1 
127.0.0.1:6379> info replication
# Replication
role:slave
master_host:192.168.206.100
master_port:6401  # redis_slave1 的端口号
connected_slaves:0 #表示下面的从机有几个

# redis_slave1 的信息
127.0.0.1:6379> info replication
# Replication
role:slave
master_host:192.168.206.100
master_port:6400
master_link_status:up
master_last_io_seconds_ago:5
master_sync_in_progress:0
slave_read_repl_offset:13188
slave_repl_offset:13188
slave_priority:100
slave_read_only:1 # 从机只读在线
replica_announced:1



```



### 反客为主

> 谁也不跟了，自己当master



- 基本语法

  - salve no one

  ```
  [root@hadoop100 ~]# docker exec -it redis-slave1 /bin/bash
  root@e5b0e470d0bc:/data# redis-cli -a 123456
  Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
  127.0.0.1:6379> info replication
  # Replication
  role:slave   #当前redis为从机 
  master_host:192.168.206.100
  master_port:6400
  master_link_status:up
  master_last_io_seconds_ago:6
  master_sync_in_progress:0
  slave_read_repl_offset:1736
  slave_repl_offset:1736
  slave_priority:100    
  slave_read_only:1     #虽然自己是奴隶 但是手下还有奴隶
  replica_announced:1
  connected_slaves:0
  master_failover_state:no-failover
  master_replid:6f1d3cf84198693dc155bbea2de07c15dd6b7b21
  master_replid2:0000000000000000000000000000000000000000
  master_repl_offset:1736
  second_repl_offset:-1
  repl_backlog_active:1
  repl_backlog_size:1048576
  repl_backlog_first_byte_offset:1
  repl_backlog_histlen:1736
  
  
  #现在需要自立为王
  127.0.0.1:6379> slaveof no one 
  OK
  127.0.0.1:6379> info replication 
  # Replication
  role:master   # 自己已经是master了
  connected_slaves:0
  master_failover_state:no-failover
  master_replid:3a2e21e1c3f31b96400aa8dd550e6c9266fc77af
  master_replid2:6f1d3cf84198693dc155bbea2de07c15dd6b7b21
  master_repl_offset:2086
  second_repl_offset:2087
  repl_backlog_active:1
  repl_backlog_size:1048576
  repl_backlog_first_byte_offset:1
  repl_backlog_histlen:2086
  ```



### 复制原理和工作流程



- slave启动，同步初请

  - slave 启动成功连接到master后会发送一个sync（同步）命令 
  - slave首次全新连接master,一次完全同步(全量复制)将被自动执行，slave自身原有数据会被master数据覆盖清除

- 首次连接，全量复制

  - master节点收到sync命令后会开始在后台保存快照(即RDB持久化，主从复制时会触发RDB)，同时收集所有接收到的用于修改数据集命令缓存起来，master 节点执行RDB持久化完后，master将rdb快照文件和所有缓存的命令发送到所有slave,以完成一次完全同步
  - 而slave服务在接收到数据库文件数据后，将其存盘并加载到内存中，从而完成复制初始化

- 心跳持续，保持通信

  - repl-ping-replica-period 10
    - master 发 PING包的周期，默认是10秒

- 进入平稳，增量复制

  - master继续将新的所有收集到的修改命令自动依次传给slave，完成同步

- 从机下线，重连续传

  - master会检查backlog里面的offset，master和slave 都会保存一个复制的offset还有- -个masterId,offset是保存在backlog中的。Master只会把已经复制的offset后面的数据复制给Slave，类似断点续传。

  

### 复制的缺点

- 复制延时，信号衰弱

  - 由于所有的写操作都是先在Master上操作，然后同步更新到Slave上，所以从Master同步到Slave机器有- -定的延迟， 当系统很繁忙的时候，延迟问题会更加严重，Slave机器数量的增加也会使这个问题更加严重。

    

- master挂了怎么办

  - 默认情况，不会在slave节点中自动重选一个master



## Redis哨兵

### 是什么

  > 吹哨人巡查监控后台master主机是否故障，如果故障了根据投票数自动将某一个从库转换成新主库，继续对外服务

- 作用

  - 监控redis运行状态，包括master和slave
  - 当master down机后，能自动将slave切换成新的master

- 官网

  [High availability with Redis Sentinel | Redis](https://redis.io/docs/management/sentinel/)



### 能干嘛

1. 主从监控
   - 监控主从redis库运行是否正常
2. 消息通知
   - 哨兵可以将故障转移的结果发送给客户端
3. 故障转移
   - 如果Master异常，则会进行主从切换，将其中一个slave做为新Master
4. 配置中心
   - 客户端通过连接哨兵来获取当前Redis服务的主节点地址



### Redis Sentinel 架构

本次案例：

- 三个哨兵
  - 自动监控和维护集群，不存放数据, 只做吹哨人
- 一主二从
  - 一个Master两个slave



<img src=".\imgs\image-20230910150608094.png" alt="image-20230910150608094" style="zoom:67%;" />





### 配置文件



- protected-mode no     			安全保护模式
- port 26379                                端口
- daemonize no                         是否以后台daemonize方式运行
- logfile ""                                    日志
- dir                                               工作目录
- pidfile                                       pid文件路径
- sentinel failover-timeout mymaster 180000
  - 指定多少毫秒之后，主节点没有应答哨兵，此时哨兵主观上认为主节点下线
- sentinel monitor <master-name> <ip> <redis-port> <quorum>
  - 设置要监控的master主机
  - quorum  表示最少几个哨兵认可客观下线  同意故障迁移的法定票数
    - 我们知道，网络是不可靠的，有时候一个sentinel会因为网络堵塞而误以为一个master redis已经死掉了，在sentinel集群环境下需要多个sentinel互相沟通来确认某个master是否真的死了，quorum这个参数是进行客观下线的一个依据，意思是至少有quorum个sentinel认为这个master有故障，才会对这个master进行下线以及故障转移。因为有的时候，某个sentinel|节点可能因为自身网络原因，导致无法连接master,而此时master并没有出现故障，所以，这就需要多个sentine|都一 致认为该master有问题，才可以进行下一步操作，这就保证了公平性和高可用。
- sentinel auth-pass <master-name> <password>
  - master设置了密码，连接master服务的密码
- sentinel parallel-syncs <master-name> <numreplicas>
  - 表示允许并行同步的slave个数， 当Master挂了后，哨兵会选出新的Master,此时，剩余的slave会向新的master发起同步数据
- sentinel failover-timeout <master-name> <milliseconds>
  - 故障转移的超时时间，进行故障转移时，如果超过设置的亳秒，表示故障转移失败
- sentinel notification-script <master-name> <script-path>
  - 配置当某一事件发生时所需要执行的脚本
- sentinel client-reconfig-script <master-name> <script-path>
  - 客户端重新配置主节点参数脚本



### Runing sentinel （启动哨兵）

#### sentinel 架构

> 架构图

<img src=".\imgs\image-20230910150608094.png" alt="image-20230910150608094" style="zoom:67%;" />

- 哨兵集群
  - Sentinel 1      port  26400
  - sentinel 2      port   26401
  - Sentinel 3      port   26402



#### 配置sentinel

查看master的IP地址·

```
[root@hadoop100 /]# docker inspect redis-master | grep IP
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.3",  # IP地址
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
                    "IPAMConfig": null,
                    "IPAddress": "172.17.0.3",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,

```





sentinel 1 的配置

```conf
# Example sentinel 26400.conf

protected-mode no

port 26400

daemonize no

pidfile /var/run/redis-sentinel.pid

#logfile "/data/centinel/centinel26400.log"

dir /tmp

sentinel monitor mymaster 172.17.0.3 6400 2

sentinel auth-pass mymaster 123456
```





sentinel 2配置      port   26401

```conf
# Example sentinel 26401.conf

protected-mode no

port 26401

daemonize no

pidfile /var/run/redis-sentinel.pid

#logfile "/redis/sentinel26401.log"

dir /tmp

sentinel monitor mymaster 172.17.0.3 6400 2

sentinel auth-pass mymaster 123456
```





Sentinel 3配置      port   26402

```conf
# Example sentinel 26402.conf

protected-mode no

port 26402

daemonize no

pidfile /var/run/redis-sentinel.pid

#logfile "/redis/sentinel26402.log"

dir /tmp

sentinel monitor mymaster 172.17.0.3 6400 2

sentinel auth-pass mymaster 123456
```





设置redis 6400  master 的配置文件

因为主机可能宕机会变成从机

```
#设置master密码 
masterauth "123456"
```



创建哨兵集群sentinel的目录结构

```
/myredis_sentinel/myredis_sentinel
									/sentinel26400	
                                    		/sentinel26400.conf
									/sentinel26401
											/sentinel26401.conf
									/sentinel26402
											/sentinel26402.conf
```





创建sentinel 1 的配置文件

```
[root@hadoop100 sentinel26400]# vim sentinel26400.conf	
[root@hadoop100 sentinel26400]# ls
sentinel26400

```



创建sentinel 2 的配置文件

```
[root@hadoop100 sentinel26401]# vim sentinel26401.conf
[root@hadoop100 sentinel26401]# ls
sentinel26401

```



创建sentinel 3 的配置文件

```
[root@hadoop100 sentinel26402]# vim sentinel26402.conf
[root@hadoop100 sentinel26402]# ls
sentinel26402

```



#### 运行docker 容器

运行docker容器

```
# sentinel26400 的哨兵
docker run --name sentinel26400  -v  /myredis_sentinel/myredis_sentinel/sentinel26400/sentinel26400.conf:/usr/local/etc/redis/sentinel.conf -d --net=host redis redis-sentinel /usr/local/etc/redis/sentinel.conf

# sentinel26401 的哨兵
docker run --name sentinel26401  -v  /myredis_sentinel/myredis_sentinel/sentinel26401/sentinel26401.conf:/usr/local/etc/redis/sentinel.conf -d --net=host redis redis-sentinel /usr/local/etc/redis/sentinel.conf

# sentinel26402 的哨兵
docker run --name sentinel26402  -v  /myredis_sentinel/myredis_sentinel/sentinel26402/sentinel26402.conf:/usr/local/etc/redis/sentinel.conf -d --net=host redis redis-sentinel /usr/local/etc/redis/sentinel.conf
```



配置日志  /data/centinel/centinel26400.log    以此操作更改26401和26402哨兵

```
[root@hadoop100 myredis_sentinel]# docker exec -it sentinel26400 /bin/bash
root@hadoop100:/data# mkdir sentinel
root@hadoop100:/data# ls
sentinel
root@hadoop100:/data# cd centinel/
root@hadoop100:/data/centinel# touch sentinel26400.log
root@hadoop100:/data/centinel# ls
sentinel26400.log

```



修改redis6400.conf

```
logfile "/data/sentinel/sentinel26400.log"

logfile "/data/sentinel/sentinel26401.log"

logfile "/data/sentinel/sentinel26402.log"
```



查看运行的redis和哨兵的运行

```
[root@hadoop100 myredis_sentinel]# ps -ef|grep redis
polkitd   11718  11694  0 16:24 ?        00:00:01 redis-server 0.0.0.0:6379
polkitd   11876  11855  0 16:24 ?        00:00:00 redis-server 0.0.0.0:6379
polkitd   12039  12019  0 16:24 ?        00:00:00 redis-server 0.0.0.0:6379
root      12216  12193  0 16:25 ?        00:00:01 redis-sentinel *:26401 [sentinel]
root      12291  12270  0 16:25 ?        00:00:01 redis-sentinel *:26402 [sentinel]
root      12360  12340  0 16:25 ?        00:00:01 redis-sentinel *:26400 [sentinel]
root      13026  12950  0 16:33 pts/4    00:00:00 grep --color=auto redis

```



#### 查看sentinel信息

进入哨兵查看日志

```
root@hadoop100:/data/sentinel# [root@hadoop100 myredis]# docker exec -it sentinel26402 /bin/bash
# 查看日志
root@hadoop100:/data# cat sentinel/sentinel26402.log   
1:X 17 Sep 2023 11:44:57.224 # User requested shutdown...
1:X 17 Sep 2023 11:44:57.224 * Removing the pid file.
1:X 17 Sep 2023 11:44:57.225 # Sentinel is now ready to exit, bye bye...
1:X 17 Sep 2023 11:54:04.221 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
#redis 的版本信息
1:X 17 Sep 2023 11:54:04.221 # Redis version=6.2.6, bits=64, commit=00000000, modified=0, pid=1, just started
1:X 17 Sep 2023 11:54:04.221 # Configuration loaded
1:X 17 Sep 2023 11:54:04.222 * monotonic clock: POSIX clock_gettime
#当前哨兵的信息
1:X 17 Sep 2023 11:54:04.223 * Running mode=sentinel, port=26402.
1:X 17 Sep 2023 11:54:04.224 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
1:X 17 Sep 2023 11:54:04.225 # Could not rename tmp config file (Device or resource busy)
1:X 17 Sep 2023 11:54:04.225 # WARNING: Sentinel was not able to save the new configuration on disk!!!: Device or resource busy
1:X 17 Sep 2023 11:54:04.225 # Sentinel ID is 1d7f800796eaee02e5957968e192a42ccfdeda17
1:X 17 Sep 2023 11:54:04.225 # +monitor master mymaster 172.17.0.3 6400 quorum 2
#从机信息
1:X 17 Sep 2023 11:54:04.227 * +slave slave 172.17.0.4:6401 172.17.0.4 6401 @ mymaster 172.17.0.3 6400
1:X 17 Sep 2023 11:54:04.229 # Could not rename tmp config file (Device or resource busy)
1:X 17 Sep 2023 11:54:04.229 # WARNING: Sentinel was not able to save the new configuration on disk!!!: Device or resource busy
#从机信息
1:X 17 Sep 2023 11:54:04.230 * +slave slave 172.17.0.2:6402 172.17.0.2 6402 @ mymaster 172.17.0.3 6400
1:X 17 Sep 2023 11:54:04.231 # Could not rename tmp config file (Device or resource busy)
1:X 17 Sep 2023 11:54:04.231 # WARNING: Sentinel was not able to save the new configuration on disk!!!: Device or resource busy
#其它哨兵
1:X 17 Sep 2023 11:54:05.618 * +sentinel sentinel 2a7262b728e56983b224f9a33c240e65e1da834e 172.17.0.1 26400 @ mymaster 172.17.0.3 6400
1:X 17 Sep 2023 11:54:05.619 # Could not rename tmp config file (Device or resource busy)
1:X 17 Sep 2023 11:54:05.619 # WARNING: Sentinel was not able to save the new configuration on disk!!!: Device or resource busy
Device or resource busy
#其它哨兵
1:X 17 Sep 2023 11:54:05.896 * +sentinel sentinel 3239a0f85a64af380bd852049d3ff54924c8cd09 172.17.0.1 26401 @ mymaster 172.17.0.3 6400
1:X 17 Sep 2023 11:54:05.897 # Could not rename tmp config file (Device or resource busy)
1:X 17 Sep 2023 11:54:05.897 # WARNING: Sentinel was not able to save the new configuration on disk!!!: Device or resource busy

```



进入sentinel 查看详细信息

```
root@hadoop100:/data/sentinel# [root@hadoop100 myredis]# docker exec -it sentinel26402 /bin/bash
root@hadoop100:/data# redis-cli -p 26402
127.0.0.1:26402> info sentinel
# Sentinel
sentinel_masters:1
sentinel_tilt:0
sentinel_running_scripts:0
sentinel_scripts_queue_length:0
sentinel_simulate_failure_flags:0
master0:name=mymaster,status=ok,address=172.17.0.3:6400,slaves=2,sentinels=3

```



#### 模拟master主机DOWN机



master 宕机

```
[root@hadoop100 /]# docker stop redis-master 
redis-master
```



此时内部哨兵重新选取master

6402

```
# 这次是6402被选取为master
127.0.0.1:6402> info replication
# Replication
role:master
connected_slaves:1
slave0:ip=172.17.0.4,port=6401,state=online,offset=273976,lag=1
master_failover_state:no-failover
master_replid:af02ab18fa3a9974b3910acf43e02090cfbe39d4
master_replid2:43b6091b2db7ead3f1802ea5fe74c605746b72ca
master_repl_offset:274111
second_repl_offset:271375
repl_backlog_active:1
repl_backlog_size:1048576
repl_backlog_first_byte_offset:1
repl_backlog_histlen:274111
127.0.0.1:6402> set k5 v5
OK
```



6401 为6402的从机

```
127.0.0.1:6401> info replication
#从机会重连
Error: Server closed the connection
127.0.0.1:6401> info replication
# Replication
role:slave
master_host:172.17.0.2
master_port:6402
master_link_status:up
master_last_io_seconds_ago:1
master_sync_in_progress:0
slave_read_repl_offset:286239
slave_repl_offset:286239
slave_priority:100
slave_read_only:1
replica_announced:1
connected_slaves:0
master_failover_state:no-failover
master_replid:af02ab18fa3a9974b3910acf43e02090cfbe39d4
master_replid2:43b6091b2db7ead3f1802ea5fe74c605746b72ca
master_repl_offset:286239
second_repl_offset:271375
repl_backlog_active:1
repl_backlog_size:1048576
repl_backlog_first_byte_offset:1
repl_backlog_histlen:286239

```



#### 查看日志

```
root@hadoop100:/data# cat sentinel/sentinel26402.log 
#主机宕机了
1:X 17 Sep 2023 12:10:51.803 # +sdown master mymaster 172.17.0.3 6400
#客观下线6400
1:X 17 Sep 2023 12:10:51.867 # +odown master mymaster 172.17.0.3 6400 #quorum 2/2
#一个新的时代 开始重新选举
1:X 17 Sep 2023 12:10:51.867 # +new-epoch 1
1:X 17 Sep 2023 12:10:51.867 # +try-failover master mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:51.869 # Could not rename tmp config file (Device or resource busy)
1:X 17 Sep 2023 12:10:51.869 # WARNING: Sentinel was not able to save the new configuration on disk!!!: Device or resource busy
#这次投票的领导是1d7f800796eaee02e5957968e192a42ccfdeda17
1:X 17 Sep 2023 12:10:51.869 # +vote-for-leader 1d7f800796eaee02e5957968e192a42ccfdeda17 1
1:X 17 Sep 2023 12:10:51.872 # 3239a0f85a64af380bd852049d3ff54924c8cd09 voted for 1d7f800796eaee02e5957968e192a42ccfdeda17 1
1:X 17 Sep 2023 12:10:51.872 # 2a7262b728e56983b224f9a33c240e65e1da834e voted for 1d7f800796eaee02e5957968e192a42ccfdeda17 1
1:X 17 Sep 2023 12:10:51.972 # +elected-leader master mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:51.972 # +failover-state-select-slave master mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:52.025 # +selected-slave slave 172.17.0.2:6402 172.17.0.2 6402 @ mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:52.025 * +failover-state-send-slaveof-noone slave 172.17.0.2:6402 172.17.0.2 6402 @ mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:52.079 * +failover-state-wait-promotion slave 172.17.0.2:6402 172.17.0.2 6402 @ mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:52.494 # Could not rename tmp config file (Device or resource busy)
1:X 17 Sep 2023 12:10:52.494 # WARNING: Sentinel was not able to save the new configuration on disk!!!: Device or resource busy
1:X 17 Sep 2023 12:10:52.494 # +promoted-slave slave 172.17.0.2:6402 172.17.0.2 6402 @ mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:52.494 # +failover-state-reconf-slaves master mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:52.584 * +slave-reconf-sent slave 172.17.0.4:6401 172.17.0.4 6401 @ mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:52.993 # -odown master mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:53.502 * +slave-reconf-inprog slave 172.17.0.4:6401 172.17.0.4 6401 @ mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:53.502 * +slave-reconf-done slave 172.17.0.4:6401 172.17.0.4 6401 @ mymaster 172.17.0.3 6400
1:X 17 Sep 2023 12:10:53.565 # +failover-end master mymaster 172.17.0.3 6400
#选择6402为master
1:X 17 Sep 2023 12:10:53.565 # +switch-master mymaster 172.17.0.3 6400 172.17.0.2 6402
1:X 17 Sep 2023 12:10:53.566 * +slave slave 172.17.0.4:6401 172.17.0.4 6401 @ mymaster 172.17.0.2 6402
1:X 17 Sep 2023 12:10:53.566 * +slave slave 172.17.0.3:6400 172.17.0.3 6400 @ mymaster 172.17.0.2 6402
1:X 17 Sep 2023 12:10:53.589 # Could not rename tmp config file (Device or resource busy)
1:X 17 Sep 2023 12:10:53.589 # WARNING: Sentinel was not able to save the new configuration on disk!!!: Device or resource busy
1:X 17 Sep 2023 12:11:23.582 # +sdown slave 172.17.0.3:6400 172.17.0.3 6400 @ mymaster 172.17.0.2 6402

```



> 原来的master回来  只能当slave了



启动之前的master

```
[root@hadoop100 /]# docker start redis-master 
redis-master

```



6402 查看redis信息  6402仍然是master

```
127.0.0.1:6402> info replication
# Replication
role:master
connected_slaves:2
slave0:ip=172.17.0.4,port=6401,state=online,offset=481983,lag=1
slave1:ip=172.17.0.3,port=6400,state=online,offset=0,lag=0
master_failover_state:no-failover
master_replid:af02ab18fa3a9974b3910acf43e02090cfbe39d4
master_replid2:43b6091b2db7ead3f1802ea5fe74c605746b72ca
master_repl_offset:482118
second_repl_offset:271375
repl_backlog_active:1
repl_backlog_size:1048576
repl_backlog_first_byte_offset:1
repl_backlog_histlen:482118

```



#### 哨兵运行流程

- SDown  主管下线  Subjectively Down

- Odown  客观下线  Objectively Down

- 选取出领导者哨兵 领导哨兵选出兵王   选择领导哨兵采用的Raft算法，大概意思就是先到先得。

- 由兵王（sentinel leader）选出新的master

  

  三个步骤

  - 新王登基
    - redis.conf文件中，优先级slave-priority或者replica-priority最高从节点 数字越小优先级越高。
    - 复制偏移量位置offset最大从节点
    - 最小RunID的从节点
  - 群臣服首
    - 执行 slaveof no one 命令让选择出来的从节点成为新的master 并通过slaveof命令让其它节点成为从节点
    - sentinel leader 会对选举出的新master执行slaveof no one 操作，将其提升为master
    - sentinel leader 向其它slave发送命令，让剩余的slave成为新的master节点的slave
  - 旧主拜服
    - 老master 回来也只能当新master的从节点





## redis集群

> 官网 [Redis cluster specification | Redis](https://redis.io/docs/reference/cluster-spec/)



从redis哨兵到redis集群



![image-20230924204826487](C:\Users\34912\Desktop\笔记\redis-study\imgs\image-20230924204826487.png)



Redis集群是一个提供在多个Redis节点间共享数据的程序集

Redis支持多个Master 每个Master后面又可以支持多个slave

由于Cluster自带Sentinel的故障转移机制， 内置了高可用的支持，**无需再去使用哨兵功能**

客户端与Redis的节点连接，不再需要连接集群中所有的节点，只需要任意连接集群中的一个可用节点即可

**槽位slot**负责分配到各个物理服务节点，由对应的集群来负责维护节点、插槽和数据之间的关系



官网[Redis cluster specification | Redis](https://redis.io/docs/reference/cluster-spec/#key-distribution-model)





Redis**不保证数据强一致性**



实际搭建去看docker文档



### 集群常用操作

> 不在同一个slot槽位下的多键操作支持不好，通识占位符登场

- mset k1 v1 k2 v2 k3 v3

不在同一个slot槽位下的键值无法使用mset mget等多键操作



- 可以通过{}来定义同一个组的概念，使用key中{}内容相同的键值对放到同一个slot槽位中去，对应下图类似 k1 k2 k3都映射为 x ，自然槽位一样
- mset k1{x} v1 k2{x} v2 k3{x} v3





> 集群是否完整才能对外提供服务

- 基本语法
  - cluster-require-full-coverage

![image-20231002145936558](C:\Users\34912\Desktop\笔记\redis-study\imgs\image-20231002145936558.png)





> 槽位数字编码

- 基本语法
  - cluster countkeysinslot
    - 1 该槽位被占用
    - 0 该槽位没占用



> 键名称

- 基本语法
  - cluster keyslot  keyName
  - 查看keyName的slot的槽位



### CRC16校验

> Redis集群有16384个哈希槽，每个key通过CRC16校验后对16384取模来决定放置哪个槽，集群的每个节点负责一部分hash槽





## Spring Boot 集成 Redis

> 总体概述

- jedis                         第一代
- lettuce                     第二代
- RedisTemplate      第三代





### 本地连接Redis常见问题

1. bind配置注释掉
2. 保护模式设置为no
3. Linux系统的防火墙设置   或者  开启端口暴露
4. redis服务器的IP地址和密码是否正确
5. 忘记访问redis的服务器和端口号和auth密码





### 集成Jedis

> jeids Client 是Redis官网推荐的一个面向java客户端，库文件实现了对各类API进行封装调用



#### 操作



##### 建Model



##### 改POM

```xml
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
<!--        引用jedis-->
        <dependency>
            <groupId>redis.clients</groupId>
            <artifactId>jedis</artifactId>
        </dependency>
```



##### 写YML

```properties
server.port=7777

spring.application.name=springBootRedis

```



##### 主启动

```java


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringBootRedisApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootRedisApplication.class, args);
    }

}

```



##### 业务类

```java
package com.example.demo;

import redis.clients.jedis.Jedis;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

/**
 * @author wmt
 * @Title:
 * @Package
 * @Description:
 * @date 2023/10/215:32
 */
public class JedisDemo {
    public static void main(String[] args) {
//        通过Ip地址和Port来获取连接 172.17.0.2
        Jedis jedis = new Jedis("192.168.206.100", 6400);
//        通过密码连接
        jedis.auth("123456");
        //测试连接
        System.out.println(jedis.ping());
        //全查
        Set<String> keys = jedis.keys("*");
        System.out.println(keys);
        // setString
        jedis.set("jedis", "hello_jedis");
        System.out.println(jedis.ttl("jedis"));
        System.out.println(jedis.get("jedis"));
        // setList
        jedis.lpush("jedisList","jedis1", "jedis2", "jedis3");
        // getList
        List<String> jedisList = jedis.lrange("jedisList", 0, -1);
        for (String s : jedisList) {
            System.out.println(s);
        }
        //set
        jedis.sadd("setList", "1", "1", "2", "3");
        //getList
        Set<String> setList = jedis.smembers("setList");
        for (String s : setList) {
            System.out.println(s);
        }
        //移除集合中的列表
        jedis.srem("setList", "1");
        //判断集合中是否存在
        Boolean b = jedis.sismember("setList", "1");
        System.out.println(b);

        //setHash
        jedis.hset("mapName", "name", "wmt");
        // 获取单个
        System.out.println(jedis.hget("mapName", "name"));

        HashMap<String, String> hashMap = new HashMap<>();
        hashMap.put("age", "22");
        hashMap.put("address", "成都");
        // set 多个
        jedis.hmset("hashMap", hashMap);
        // 获取多个
        System.out.println(jedis.hmget("hashMap", "age","address"));

        //zset score 位于排序
        jedis.zadd("zset" , 10,"v1");
        jedis.zadd("zset", 30, "v2");
        jedis.zadd("zset", 20, "v3");
        Set<String> zset = jedis.zrange("zset", 0, -1);
        for (String s : zset) {
            System.out.println(s);
        }

    }
}

```





### 集成lettuce

> lettuce 翻译过来是生菜的意思 为了解决jedis的不足



#### jedis和lettuce的区别

jedis和L ettuce都是Redis的客户端，它们都可以连接Redis服务器，但是在SpringBoot2 .0之后默认都是使用的L ettuce这个客户端连接Redis服务器。因为当使用Jedis客户端连接Redis服务器的时候，每个线程都要拿自己创建的Jedis实例去连接Redis客户端，当有很多个线程的时候，不仅开销大需要反复的创建关闭一个Jedis连接， 而且也是线程不安全的，一个线程通过Jedis实例更改Redis服务器中的数据之后会影响另一个线程;
但是如果使用Lettuce这个客户端连接Redis服务器的时候,就不会出现上面的情况，L ettuce底层使用的是Netty,当有多个线程都需要连接Redis服务器的时候，可以保证只创建一个Lettuce连接， 使所有的线程共享这一个Lettuce连接, 这样可以减少创建关闭一个Lettuce连接时候的开销;而且这种方式也是线程安全的，不会出现-个线程通过L ettuce更改Redis服务器中的数据之后而影响另一个线程的情况;



#### 实际操作



##### 改POM

```
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
<!--        引用lettuce-->
        <dependency>
            <groupId>io.lettuce</groupId>
            <artifactId>lettuce-core</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
```



##### 主业务

```java
package com.example.demo;

import io.lettuce.core.RedisClient;
import io.lettuce.core.RedisURI;
import io.lettuce.core.api.StatefulRedisConnection;
import io.lettuce.core.api.sync.RedisCommands;

import java.util.List;

/**
 * @author wmt
 * @Title:
 * @Package
 * @Description:
 * @date 2023/10/1413:59
 */
public class LettuceDemo {
    public static void main(String[] args) {
        //1, 使用构建器链式编程来builder 我们的RedisURI
        RedisURI uri = RedisURI.builder()
                .redis("192.168.206.100")
                .withPort(6400)
                .withAuthentication("default", "123456")
                .build();
        //2, 创建连接客户端
        RedisClient redisClient = RedisClient.create(uri);
        StatefulRedisConnection connect = redisClient.connect();
        //3,创建操作的command，通过connect
        RedisCommands commands = connect.sync();

        //=====================================
        List keys = commands.keys("*");
        System.out.println(keys);

        List zset = commands.zrange("zset", 0, -1);
        System.out.println(zset);
        //4, 关闭资源
        try {

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connect.close();
            redisClient.shutdown();
        }
    }
}

```





### 集成RedisTemplate

##### POM文件

```xml
<!--        springboot 整合redis-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-redis</artifactId>
        </dependency>
        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-pool2</artifactId>
        </dependency>
<!--        swagger2-->
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger2</artifactId>
            <version>2.9.2</version>
        </dependency>
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger-ui</artifactId>
            <version>2.9.2</version>
        </dependency>
```





#### 连接单机

> swagger2  是一个会根据controller层自动生成的api UI



##### 启动类

```java
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableSwagger2 //  不加这个启动无法访问swagger
@ComponentScan(basePackages = "com.example")
public class SpringBootRedisApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootRedisApplication.class, args);
    }

}
```



##### application 配置

```properties
server.port=7777

spring.application.name=springBootRedis


#=============================log================
logging.level.root=info
logging.level.com.example.demo=info
logging.pattern.console=%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger- %msg%n
logging.file.name=../src/main/resources/redisLog/redis_study.log
logging.pattern.file=%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger- %msg%n


#============================swagger============================
spring.swagger2.enabled=true

#在springboot2.6.X结合swagger2.9. X会提示documentationPluginsBootstrapper空措针异常,
#原因是在springboot2.6.X中将SpringMVC默认路径匹配策略从AntPathMatcher更改为PathPatternParser,
#导致出错，解决办法是matching-strategy切换回之前ant_ path_ matcher

spring.mvc.pathmatch.matching-strategy=ant_path_matcher

#=========================redis 单机===============================
spring.redis.database=0
#修改为真实的IP
spring.redis.host=192.168.206.100
spring.redis.port=6400
spring.redis.password=123456
spring.redis.lettuce.pool.max-active=8
spring.redis.lettuce.pool.max-wait=1ms
spring.redis.lettuce.pool.max-idle=8
spring.redis.lettuce.pool.min-idle=0

```



##### swaggerConfig

```java
@EnableSwagger2
public class SwaggerConfig {
    @Value("${spring.swagger2.enabled}")
    private Boolean enabled;

    @Bean
    public Docket createRestApi(){
        return  new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .enable(enabled)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.example")) //自己的package
                .paths(PathSelectors.any())
                .build();
    }
    public ApiInfo apiInfo(){
        return new ApiInfoBuilder()
                .title("springBoot利用swagger2构造api接口文档"+"\t"+ DateTimeFormatter
                        .ofPattern("yyyy-MM-dd").format(LocalDateTime.now()))
                .description("springBoot + redis整合")
                .version("1.0")
                .termsOfServiceUrl("https://www.baidu.com")
                .build();
    }
}
```



##### RedisConfig

为什么需要配置 redisConfig  因为会出现乱码

![image-20231015161822269](.\imgs\image-20231015161822269.png)

也无法通过正常的key 去获取

![image-20231015162056459](.\imgs\image-20231015162056459.png)



> 原因

键(key) 和值(value) 都是通过Spring提供的Serializer序列化到数据库的。

RedisTemplate默认使用的是JdkSerializationRedisSerializer,

StringRedisTemplate默认使用的是StringRedisSerializer.

KEY被序列化成这样,线上通过KEY去查询对应的VALUE非常不方便,



```java
package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * @author wmt
 * @Title:
 * @Package
 * @Description:
 * @date 2023/10/1515:11
 */
@Configuration
public class RedisConfig {

    @Bean
    public RedisTemplate<String, Object> redisTemplate(LettuceConnectionFactory lettuceConnectionFactory){
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();

        redisTemplate.setConnectionFactory(lettuceConnectionFactory);
        //设置key序列化的方式
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        //设置value的序列化方式json  使用GenericJackson2JsonRedisSerializer 替换默认的序列化
        redisTemplate.setValueSerializer(new GenericJackson2JsonRedisSerializer());

        redisTemplate.setHashKeySerializer(new StringRedisSerializer());
        redisTemplate.setHashValueSerializer(new GenericJackson2JsonRedisSerializer());

        redisTemplate.afterPropertiesSet();
        return redisTemplate;


    }
}
```





##### Service

```java
package com.example.demo.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

/**
 * @author wmt
 * @Title:
 * @Package
 * @Description:
 * @date 2023/10/1515:27
 */
@Service
@Slf4j
public class OrderService {
    public static final String ORDER_KEY = "ord:";
    @Resource
    private RedisTemplate redisTemplate;   // 这个会出现 key 和 value 中文乱码问题
    @Resource
    private StringRedisTemplate stringRedisTemplate;


    // 添加订单
    public void addOrder(){
        int keyId = ThreadLocalRandom.current().nextInt(1000) + 1;
        String serialNo = UUID.randomUUID().toString();

        String key = ORDER_KEY + keyId;
        String value = "pdd订单" + serialNo;

        stringRedisTemplate.opsForValue().set(key, value);

        log.info("key = {}", key);
        log.info("value = {}", value);
    }

    // 获取订单
    public String getOrderById(Integer keyId){
        return (String) stringRedisTemplate.opsForValue().get(ORDER_KEY + keyId);
    }
}

```



为什么 StringRedisTemplate 不会出现乱码问题

下面是源码

```java
public class StringRedisTemplate extends RedisTemplate<String, String> {
    public StringRedisTemplate() {
        this.setKeySerializer(RedisSerializer.string());
        this.setValueSerializer(RedisSerializer.string());
        this.setHashKeySerializer(RedisSerializer.string());
        this.setHashValueSerializer(RedisSerializer.string());
    }
```



因为StringRedisTemplate 自己去set序列化的规则





##### Controller

```java
package com.example.demo.controller;

import com.example.demo.service.OrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author wmt
 * @Title:
 * @Package
 * @Description:
 * @date 2023/10/1515:37
 */
@RestController
@Slf4j
@Api(tags = "订单接口")
public class OrderController {
    @Resource
    private OrderService orderService;
    @ApiOperation("新增订单")
    @PostMapping("/oder/add")
    public void addOder(){
        orderService.addOrder();
    }
    @ApiOperation("通过id获取订单")
    @GetMapping("/order/get/{id}")
    public String getOrderById(@PathVariable Integer id){
        return orderService.getOrderById(id);
    }
}

```



##### 测试

swagger2 测试接口： [Swagger UI](http://localhost:7777/swagger-ui.html#/)

查看redis数据  --raw 支持中文连接

```
redis-cli -a 123456 -p 6400 --raw
```

前提是 通过 StringRedisTemplate来set

![image-20231015163758700](.\imgs\image-20231015163758700.png)



#### 连接集群

- redis集群架构

![image-20230520153221872](.\imgs\image-20230520153221872.png)

>  集群情况  三主三从

```
127.0.0.1:6381> CLUSTER NODES
05077ffab7bbb7a8a03c024c648ac092bbf75689 192.168.206.100:6382@16382 master - 0 1697950794691 11 connected 5461-10922
56cbd2b7aa0ea2072113d6066f9671cdb23fdf47 192.168.206.100:6383@16383 master - 0 1697950796000 12 connected 10923-16383
60ceebe6601db538a4ac64859b61d1c4abe6a3ad 192.168.206.100:6393@16393 slave 56cbd2b7aa0ea2072113d6066f9671cdb23fdf47 0 1697950796730 12 connected
541bb98e6982632c573d12b543a91b39bd149336 192.168.206.100:6391@16391 slave 78ba1e5759efe34a26631a25b0a4400329651e80 0 1697950795000 10 connected
78ba1e5759efe34a26631a25b0a4400329651e80 192.168.206.100:6381@16381 myself,master - 0 1697950791000 10 connected 0-5460
105ceca39e8e16b2795f679d304ce5c02fb836ab 192.168.206.100:6392@16392 slave 05077ffab7bbb7a8a03c024c648ac092bbf75689 0 1697950795708 11 connected

```



redis集群和redis的单机的区别是只有配置文件的改动



##### application配置

```
server.port=7777

spring.application.name=springBootRedis


#=============================log================
logging.level.root=info
logging.level.com.example.demo=info
logging.pattern.console=%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger- %msg%n
logging.file.name=../src/main/resources/redisLog/redis_study.log
logging.pattern.file=%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger- %msg%n


#============================swagger============================
spring.swagger2.enabled=true

#在springboot2.6.X结合swagger2.9. X会提示documentationPluginsBootstrapper空措针异常,
#原因是在springboot2.6.X中将SpringMVC默认路径匹配策略从AntPathMatcher更改为PathPatternParser,
#导致出错，解决办法是matching-strategy切换回之前ant_ path_ matcher

spring.mvc.pathmatch.matching-strategy=ant_path_matcher

#==============================redis 集群============================
spring.redis.password=
#获取失败 最大重定向次数
spring.redis.cluster.max-redirects=3
spring.redis.lettuce.pool.max-active=8
spring.redis.lettuce.pool.max-wait=1ms
spring.redis.lettuce.pool.max-idle=8
spring.redis.lettuce.pool.min-idle=0
spring.redis.cluster.nodes=192.168.206.100:6381,192.168.206.100:6382,192.168.206.100:6383,\
  192.168.206.100:6391,192.168.206.100:6392,192.168.206.100:6393
#支持集群拓扑动态感应刷新，自适应拓扑刷新是否使用所有可用的更新，默认false
spring.redis.lettuce.cluster.refresh.adaptive=true
#定时刷新
spring.redis.lettuce.cluster.refresh.period=2000

```



##### 测试

- -c			         以集群连接
- --raw              支持中文连接
-  -p                   端口号
- -a                     密码 本次集群没有设置密码

```
root@hadoop100:/data# redis-cli -p 6381 -c --raw
127.0.0.1:6381> get ord:607
-> Redirected to slot [6035] located at 192.168.206.100:6382
"pdd订单901b10e8-57a1-4f5e-86fe-3eb9836a10fb"
192.168.206.100:6382> keys *
ord:607
```



##### 故障演示

Redis Cluster 集群部署采用了3主3从拓扑结构，数据读写访问master节点，salve节点负责备份。当master宕机主从却换成功，redis手动ok，but的经典2个bug





模拟停掉一个master  本次停掉微服务为 6381

```
[root@hadoop100 ~]# docker ps
CONTAINER ID   IMAGE          COMMAND                   CREATED        STATUS          PORTS     NAMES
eb8c3de1a261   7614ae9453d1   "docker-entrypoint.s…"   5 months ago   Up 2 seconds              redis-node-6
bf206c586328   7614ae9453d1   "docker-entrypoint.s…"   5 months ago   Up 2 seconds              redis-node-5
098af405c246   7614ae9453d1   "docker-entrypoint.s…"   5 months ago   Up 3 seconds              redis-node-4
e5e7c2a80695   7614ae9453d1   "docker-entrypoint.s…"   5 months ago   Up 13 seconds             redis-node-3
0a6298a72e34   7614ae9453d1   "docker-entrypoint.s…"   5 months ago   Up 13 seconds             redis-node-2
5041b6821468   7614ae9453d1   "docker-entrypoint.s…"   5 months ago   Up 13 seconds             redis-node-1

[root@hadoop100 ~]# docker stop 5041b6821468
5041b6821468
```



查看微服务状态  发现主从切换了也就是 手动ok

```
[root@hadoop100 ~]# docker exec -it redis-node-4 /bin/bash
root@hadoop100:/data# redis-cli -c -p 6391 --raw
127.0.0.1:6391> CLUSTER NODES
05077ffab7bbb7a8a03c024c648ac092bbf75689 192.168.206.100:6382@16382 master - 0 1697953140000 11 connected 5461-10922
541bb98e6982632c573d12b543a91b39bd149336 192.168.206.100:6391@16391 myself,master - 0 1697953137000 13 connected 0-5460
56cbd2b7aa0ea2072113d6066f9671cdb23fdf47 192.168.206.100:6383@16383 master - 0 1697953142337 12 connected 10923-16383
60ceebe6601db538a4ac64859b61d1c4abe6a3ad 192.168.206.100:6393@16393 slave 56cbd2b7aa0ea2072113d6066f9671cdb23fdf47 0 1697953141317 12 connected
105ceca39e8e16b2795f679d304ce5c02fb836ab 192.168.206.100:6392@16392 slave 05077ffab7bbb7a8a03c024c648ac092bbf75689 0 1697953142000 11 connected
78ba1e5759efe34a26631a25b0a4400329651e80 192.168.206.100:6381@16381 master,fail - 1697953088341 1697953084000 10 disconnected

```





###### 错误bug

微服务的运行效果

- Unable to connect to 192.168.206.100:6381] 停掉的服务器是 6381

```
2023-10-22 13:39:38.203 [http-nio-7777-exec-5] ERROR org.apache.catalina.core.ContainerBase.[Tomcat].[localhost].[/].[dispatcherServlet]- Servlet.service() for servlet [dispatcherServlet] in context with path [] threw exception [Request processing failed; nested exception is org.springframework.data.redis.RedisConnectionFailureException: Redis connection failed; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 192.168.206.100:6381] with root cause
java.net.ConnectException: Connection refused: no further information
	at java.base/sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
	at java.base/sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:717)
	at io.netty.channel.socket.nio.NioSocketChannel.doFinishConnect(NioSocketChannel.java:337)
	at io.netty.channel.nio.AbstractNioChannel$AbstractNioUnsafe.finishConnect(AbstractNioChannel.java:334)
	at io.netty.channel.nio.NioEventLoop.processSelectedKey(NioEventLoop.java:776)
	at io.netty.channel.nio.NioEventLoop.processSelectedKeysOptimized(NioEventLoop.java:724)
	at io.netty.channel.nio.NioEventLoop.processSelectedKeys(NioEventLoop.java:650)
	at io.netty.channel.nio.NioEventLoop.run(NioEventLoop.java:562)
	at io.netty.util.concurrent.SingleThreadEventExecutor$4.run(SingleThreadEventExecutor.java:997)
	at io.netty.util.internal.ThreadExecutorMap$2.run(ThreadExecutorMap.java:74)
	at io.netty.util.concurrent.FastThreadLocalRunnable.run(FastThreadLocalRunnable.java:30)
	at java.base/java.lang.Thread.run(Thread.java:844)

```



###### bug原因

SpringBoot 2.X 版本， Redis默认的连接采用lettuce 当Redis集群发生变化后，lettuce默认是不会刷新新节点拓扑





###### 解决方案



1. 排除lettuce采用jedis  不推荐
2. 重写连接工厂实例       极度不推荐
3. 刷新节点集群拓扑动态感知      官网  [Redis Cluster · lettuce-io/lettuce-core Wiki · GitHub](https://github.com/lettuce-io/lettuce-core/wiki/Redis-Cluster#execution-of-commands-on-one-or-multiple-cluster-nodes)

官网解释

```
Refreshing the cluster topology view
The Redis Cluster configuration may change at runtime. New nodes can be added, the master for a specific slot can change. Lettuce handles MOVED and ASK redirects transparently but in case too many commands run into redirects, you should refresh the cluster topology view. The topology is bound to a RedisClusterClient instance. All cluster connections that are created by one RedisClusterClient instance share the same cluster topology view. The view can be updated in three ways:

Either by calling RedisClusterClient.reloadPartitions

Periodic updates in the background based on an interval

Adaptive updates in the background based on persistent disconnects and MOVED/ASK redirections

By default, commands follow -ASK and -MOVED redirects up to 5 times until the command execution is considered to be failed. Background topology updating starts with the first connection obtained through RedisClusterClient.
```

> 翻译

刷新集群拓扑视图

Redis Cluster配置可能会在运行时更改。可以添加新节点，特定插槽的主节点可以更改。Lettuce透明地处理MOVED和ASK重定向，但如果重定向中遇到太多命令，您应该刷新集群拓扑视图。拓扑绑定到RedisClusterClient实例。由一个RedisClusterClient实例创建的所有集群连接共享相同的集群拓扑视图。可以通过三种方式更新视图：

通过调用RedisClusterClient. reload分区

基于间隔的后台定期更新

基于持续断开连接和MOVED/ASK重定向的后台自适应更新

默认情况下，命令跟随-ASK，-MOVED重定向最多5次，直到认为命令执行失败。后台拓扑更新从通过RedisClusterClient获得的第一个连接开始。



修改application配置

```
#==============================redis 集群============================
spring.redis.password=
#获取失败 最大重定向次数
spring.redis.cluster.max-redirects=3
spring.redis.lettuce.pool.max-active=8
spring.redis.lettuce.pool.max-wait=1ms
spring.redis.lettuce.pool.max-idle=8
spring.redis.lettuce.pool.min-idle=0
spring.redis.cluster.nodes=192.168.206.100:6381,192.168.206.100:6382,192.168.206.100:6383,\
  192.168.206.100:6391,192.168.206.100:6392,192.168.206.100:6393
#支持集群拓扑动态感应刷新，自适应拓扑刷新是否使用所有可用的更新，默认false
spring.redis.lettuce.cluster.refresh.adaptive=true
#定时刷新
spring.redis.lettuce.cluster.refresh.period=2000
```





再次测试 现报不能连接6381 然后故障迁移

```
WARN  io.lettuce.core.cluster.topology.DefaultClusterTopologyRefresh- Unable to connect to[192.168.206.100:6381]: Connection refused: no further information: /192.168.206.100:6381
 INFO  com.example.demo.service.OrderService- key = ord:172 INFO  com.example.demo.service.OrderService- value = pdd订单54316306-0fa7-4b01-8d45-f7adc38f878d
```



查看redis数据

```
root@hadoop100:/data# redis-cli -c -p 6391 --raw
127.0.0.1:6391> get ord:172
-> Redirected to slot [6961] located at 192.168.206.100:6382
"pdd订单54316306-0fa7-4b01-8d45-f7adc38f878d"
192.168.206.100:6382> 

```



## Redis 高级篇



技术要求： boot  cloud   docker nginx   juc   jmeter