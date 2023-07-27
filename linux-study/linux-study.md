



## liunx

[TOC]



###  1.liunx 文件

**本笔记使用的是 CentOS 7** 



​	` liunx 系统里面一切皆文件`



在centOS6中默认使用的文件格式是 ext4

在centOS7中默认使用的文件格式是xfs

电脑@名词后面

​					/ 表示在根目录上

​					~表示在/root目录下

​		[] 后面 

​						#表示管理员权限

​						$普通权限

```
[root@hadoop100 /]# cd /root
[root@hadoop100 ~]# ls
```

![image-20230321203131022](..\linux-study\imgs\image-20230321203131022.png)



- **/bin**：
  bin 是 Binaries (二进制文件) 的缩写, 这个目录存放着最经常使用的命令。

- **/boot：**
  这里存放的是启动 Linux 时使用的一些核心文件，包括一些连接文件以及镜像文件。

- **/dev ：**
  dev 是 Device(设备) 的缩写, 该目录下存放的是 Linux 的外部设备，在 Linux 中访问设备的方式和访问文件的方式是相同的。

- **/etc：**
  etc 是 Etcetera(等等) 的缩写,这个目录用来存放所有的系统管理所需要的配置文件和子目录。

- **/home**：
  用户的主目录，在 Linux 中，每个用户都有一个自己的目录，一般该目录名是以用户的账号命名的，如上图中的 alice、bob 和 eve。

- **/lib**：
  lib 是 Library(库) 的缩写这个目录里存放着系统最基本的动态连接共享库，其作用类似于 Windows 里的 DLL 文件。几乎所有的应用程序都需要用到这些共享库。

- **/lost+found**：
  这个目录一般情况下是空的，当系统非法关机后，这里就存放了一些文件。

- **/media**：
  linux 系统会自动识别一些设备，例如U盘、光驱等等，当识别后，Linux 会把识别的设备挂载到这个目录下。

- **/mnt**：
  系统提供该目录是为了让用户临时挂载别的文件系统的，我们可以将光驱挂载在 /mnt/ 上，然后进入该目录就可以查看光驱里的内容了。

- **/opt**：
  opt 是 optional(可选) 的缩写，这是给主机额外安装软件所摆放的目录。比如你安装一个ORACLE数据库则就可以放到这个目录下。默认是空的。

- **/proc**：
  proc 是 Processes(进程) 的缩写，/proc 是一种伪文件系统（也即虚拟文件系统），存储的是当前内核运行状态的一系列特殊文件，这个目录是一个虚拟的目录，它是系统内存的映射，我们可以通过直接访问这个目录来获取系统信息。
  这个目录的内容不在硬盘上而是在内存里，我们也可以直接修改里面的某些文件，比如可以通过下面的命令来屏蔽主机的ping命令，使别人无法ping你的机器：

- **/root**：
  该目录为系统管理员，也称作超级权限者的用户主目录。

- **/sbin**：
  s 就是 Super User 的意思，是 Superuser Binaries (超级用户的二进制文件) 的缩写，这里存放的是系统管理员使用的系统管理程序。

- **/selinux**：
   这个目录是 Redhat/CentOS 所特有的目录，Selinux 是一个安全机制，类似于 windows 的防火墙，但是这套机制比较复杂，这个目录就是存放selinux相关的文件的。

- **/srv**：
   该目录存放一些服务启动之后需要提取的数据。

- **/sys**：

  这是 Linux2.6 内核的一个很大的变化。该目录下安装了 2.6 内核中新出现的一个文件系统 sysfs 。

  sysfs 文件系统集成了下面3种文件系统的信息：针对进程信息的 proc 文件系统、针对设备的 devfs 文件系统以及针对伪终端的 devpts 文件系统。

  该文件系统是内核设备树的一个直观反映。

  当一个内核对象被创建的时候，对应的文件和目录也在内核对象子系统中被创建。

- **/tmp**：
  tmp 是 temporary(临时) 的缩写这个目录是用来存放一些临时文件的。

- **/usr**：
   usr 是 unix shared resources(共享资源) 的缩写，这是一个非常重要的目录，用户的很多应用程序和文件都放在这个目录下，类似于 windows 下的 program files 目录。

- **/usr/bin：**
  系统用户使用的应用程序。

- **/usr/sbin：**
  超级用户使用的比较高级的管理程序和系统守护程序。

- **/usr/src：**
  内核源代码默认的放置目录。

- **/var**：
  var 是 variable(变量) 的缩写，这个目录中存放着在不断扩充着的东西，我们习惯将那些经常被修改的目录放在这个目录下。包括各种日志文件。

- **/run**：
  是一个临时文件系统，存储系统启动以来的信息。当系统重启时，这个目录下的文件应该被删掉或清除。如果你的系统上有 /var/run 目录，应该让它指向 run。



在 Linux 系统中，有几个目录是比较重要的，平时需要注意不要误删除或者随意更改内部文件。

**/etc**： 上边也提到了，这个是系统中的配置文件，如果你更改了该目录下的某个文件可能会导致系统不能启动。

**/bin, /sbin, /usr/bin, /usr/sbin**: 这是系统预设的执行文件的放置目录，比如 **ls** 就是在 **/bin/ls** 目录下的。

值得提出的是 **/bin**、**/usr/bin** 是给系统用户使用的指令（除 root 外的通用用户），而/sbin, /usr/sbin 则是给 root 使用的指令。

**/var**： 这是一个非常重要的目录，系统上跑了很多程序，那么每个程序都会有相应的日志产生，而这些日志就被记录到这个目录下，具体在 /var/log 目录下，另外 mail 的预设放置也是在这里。





Linux常用指令

​			筛查

```
[root@hadoop111 sbin]#  ls | grep service
```



### 2. vi / vim文本编辑器



#### 2.1 什么是vi和vim

vi是Unix操作系统或者类Unix操作系统的文本编辑器

vim是编辑器是从vi发展出来的一个更强大的文本编辑器，可以主动的以字体颜色辨别语法的正确性，方便程序设计，vim和vi完全兼容



#### 2.2 模式之间的转化

一般模式：vim xxx 或者 vi xxx 进入文本 复制和粘贴

编辑模式： 先要在一般模式下 按 i 键进入编辑模式可以对文本进行编辑 按ESC可以退出

命令模式：  先要在一般模式下 输入：或者 /  进行一些对文本的命令操作 



##### 2.21进入编辑模式

|    i    | 当前光标位置之前插入数据（常用） |
| :-----: | :------------------------------: |
|    a    |   当前光标位置之后进入编辑模式   |
|    o    |     向下换行之后进入编辑模式     |
| shift+I |        在当前行头插入数据        |
| shift+A |        在当前行尾插入数据        |
| shift+O |     向上换行之后进入编辑模式     |





#### 2.3vim中常用指令

![view](..\linux-study\imgs\view.jpg)

##### 命令模式

###### ：W 

```
把缓存区的文字写入到文本中
```



###### ：q

```
退出
```



###### :wq

```
保存退出
```



###### :q!

 ```
不保存强行退出
 ```



###### / 输入查找的单词

```
n下一个单词  N上一个单词
:noh 取消高量
```



###### :set nu 显示行号

```
显示行号  关闭行号 :set nonu
```



###### 替换

​		先查找

|  :s/old/new   |    替换当前行匹配到的第一个old为new    |
| :-----------: | :------------------------------------: |
| :s/old/new/g  |         替换所有当前行old为new         |
|  :%s/old/new  | 替换文档中每一行匹配到的第一个old为new |
| :%s/old/new/g |            替换所有old为new            |



##### 一般模式

**操作区分大小写**

###### u

```
撤回操作
```



###### yy

```
复制光标的这一行
yy前面加数字可以复制几行

```

###### y+$

```
如果想复制光标后面的数据
```

###### y+^

```
复制光标前面的数据
```

###### w / b  选单词

```
通过w来选择下一个单词 选中单词的第一个字母
b选中上一个单词
```



###### d 选单词

```
选中单词的最后一个字母
```



###### y+w

```
复制当前光标后面的单词
最好通过w来选则单词
```





###### p

```
粘贴到光标对应的位置
p前面可以加数字可以复制多行
```



###### dd

```
删除当前行
dd前面加数字可以删除多行
```



###### d+w 删除一个单词

```
删除一个单词
```



###### d+方向键 删除一个字母

```
删除一个字母
```



###### x 剪贴

```
x 剪贴当前光标选中的字母 
如果下删除光标前面的字母 开启大写锁定 按X就是删除前面的
```



###### r / R可以替换

```
r选中光标并替换内容
R从光标选中一直往后替换
```



###### shift + ^ 光标跳转行头



###### shift + $ 光标跳转到行尾



###### 1 + G / gg 跳转到页头

```
1 + G注意大写G
```



###### G   跳转到页尾

```
注意大写G
```

###### 数字 +G 指定跳转行数



### 3.网络配置和系统管理操作



#### 3.1 查看IP和网关

win打开CMD

​             输入 ：ipconfig

```
C:\Users\34912> ipconfig
```

Linux

   		输入 ：ifconfig               (interfaceconfig)

```
[root@hadoop100 ~]# ifconfig
```

查看是否有网络链接

ping + IP地址

- 如果以上操作都无法ping通，需要关闭	NetworkManager服务
  - systemctl  stop  NetworkManager  关闭
  - systemctl  disable   NetworkManager   禁用



​      **VMware的三种网络链接方式**

- `桥接模式`

  ​		虚拟机直接连接外面物理网络模式，主机起到了网桥的作用，这种模式下虚拟机可以直接访问外部网络，**并且对外部网络是可见的。**



- ` NAT模式`

  ​		虚拟机和主机构建一个专用网络，并且通过虚拟网络地址转换（NAT）设备对IP进行转换。虚拟机通过共享主机IP可以访问外部网络，**但外部网络无法访问虚拟机**

  

- `仅主机模式`

  ​		虚拟机只与主机共享一个专用网络，**与外部网络无法通信**





#### 配置IP地址

```
[root@hadoop100 /]# vim /etc/sysconfig/network-scripts/ifcfg-ens33

```

打开之后：

```
SER_ONLY="no"
BOOTPROTO="dhcp"
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
IPV6_DEFROUTE="yes"
IPV6_FAILURE_FATAL="no"
IPV6_ADDR_GEN_MODE="stable-privacy"
NAME="ens33"
UUID="09b545b7-2b9f-473f-a204-11817fd09ad9"
DEVICE="ens33"
ONBOOT="yes"
```

变更方式

![image-20230330172437077](..\linux-study\imgs\image-20230330172437077.png)

```
YPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="static"
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
IPV6_DEFROUTE="yes"
IPV6_FAILURE_FATAL="no"
IPV6_ADDR_GEN_MODE="stable-privacy"
NAME="ens33"
UUID="09b545b7-2b9f-473f-a204-11817fd09ad9"
DEVICE="ens33"
ONBOOT="yes"
#IP地址
IPADDR=192.168.206.100
#网关
GATEWAY=192.168.206.2
#域名解析器
DNS1=192.168.206.2
```

​	重启动网络配置

```
[root@hadoop100 /]# service network restart 
```



**怎么测试是否成功，可以去win下去ping一下**



#### 查看或者修改主机名称

##### 查看主机名称

```
oot@hadoop100 /]# hostname
```

更详细的查看

```
[root@hadoop111 ~]# hostnamectl
```



##### 修改主机名称

```
oot@hadoop100 /]# vim /etc/hostname
```

第二种修改主机名称的方式

```
doop100 /]# hostnamectl set-hostname hadoop111
```



#### 修改IP匿名信息

 		 `这个修改更像是电话薄 IP相当于电话  ，后面相当于名称`

Linux中修改IP信息

```
[root@hadoop111 ~]# vim /etc/hosts
```

打开后

​		192.168.206.100  hadoop100

​			原名   					别名

```
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6


192.168.206.100  hadoop100
192.168.206.100  hadoop101
192.168.206.100  hadoop102
192.168.206.100  hadoop103
192.168.206.100  hadoop104                                                                                                                                                    
```





win10中修改IP信息

​			根据下面目录打开hosts

```
C:\Windows\System32\drivers\etc
```



加入

```
192.168.206.100  hadoop100
192.168.206.100  hadoop101
192.168.206.100  hadoop102
192.168.206.100  hadoop103
192.168.206.100  hadoop104       
```



#### 远程登录

打开CMD

```
C:\Users\34912>ssh root@hadoop100

The authenticity of host 'hadoop100 (192.168.206.100)' can't be established.
ECDSA key fingerprint is SHA256:wWz/i1bI9uK5Q+fnuYWw7ga5P/pNalRLjyF8VePWHQc.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes

Warning: Permanently added 'hadoop100,192.168.206.100' (ECDSA) to the list of known hosts.
root@hadoop100's password:
Last login: Thu Mar 30 18:52:42 2023
[root@hadoop100 ~]# ls
anaconda-ks.cfg  initial-setup-ks.cfg  公共  模板  视频  图片  文档  下载  音乐  桌面
[root@hadoop100 ~]#
```



退出远程服务器

```
[root@hadoop100 ~]# exit
登出
```



#### Xshell 7 

操作基本一样

![image-20230331220735429](..\linux-study\imgs\image-20230331220735429.png)



设置简便操作



![image-20230331220828602](..\linux-study\imgs\image-20230331220828602.png)



#### Xftp 7

文件 -》当前会话-》选项 -》 编码 UTF-8

![image-20230331221352893](..\linux-study\imgs\image-20230331221352893.png)



### 4.系统管理

#### 4.1Linux的进程和服务



- 计算机中一个正在执行的程序或者命令，被叫做进程（process）。
- 启动之后一直存在，常驻在内存的进程，一般被叫做服务（service）。



#### 4.2 service服务管理

**小 tips**  **daemon（守护进程） 守护进程和服务是同一个意思  在Linux中服务后面都会加一个d**

- **CentOS 6** 的服务操作

  - 基础语法

    - service  服务名称 start / stop / restart / status

      

   	查看系统服务

```
[root@hadoop111 /]# ls /etc/init.d
functions  netconsole  network  README
```



#### 4.3systemctl （CentOS 7）

-  基础语法
  - systemctl   start / stop / restart / status   服务名称
- 经验技巧
  - 查看服务的方法 ：  /usr/lib/systemd/system

```linux
[root@hadoop100 /]# cd /usr/lib/systemd/system
[root@hadoop100 system]# pwd
/usr/lib/systemd/system
[root@hadoop100 system]# ls -al
总用量 1544
drwxr-xr-x. 27 root root 20480 3月  19 20:01 .
drwxr-xr-x. 13 root root  4096 3月  19 20:00 ..
-rw-r--r--.  1 root root   275 10月  2 2020 abrt-ccpp.service
-rw-r--r--.  1 root root   380 10月  2 2020 abrtd.service
-rw-r--r--.  1 root root   361 10月  2 2020 abrt-oops.service
-rw-r--r--.  1 root root   266 10月  2 2020 abrt-pstoreoops.service
-rw-r--r--.  1 root root   262 10月  2 2020 abrt-vmcore.service
-rw-r--r--.  1 root root   311 10月  2 2020 abrt-xorg.service
-rw-r--r--.  1 root root   729 4月   1 2020 accounts-daemon.service
-rw-r--r--.  1 root root   569 8月   6 2019 alsa-restore.service
-rw-r--r--.  1 root root   465 8月   6 2019 alsa-state.service
-rw-r--r--.  1 root root   682 10月  2 2020 anaconda-direct.service
-rw-r--r--.  1 root root   185 10月  2 2020 anaconda-nm-config.service
```



##### 服务自启动

```
[root@hadoop100 system]# setup
```



点击运行工具



![image-20230401110652039](..\linux-study\imgs\image-20230401110652039.png)



选中之后空格可以取消或者选中

![image-20230401110618130](..\linux-study\imgs\image-20230401110618130.png)



#### 4.4 系统运行级别



Linux系统有7个运行级别(runlevel)：

- 运行级别0：系统停机状态，系统默认运行级别不能设为0，否则不能正常启动
- 运行级别1：单用户工作状态，root权限，用于系统维护，禁止远程登录
- 运行级别2：多用户状态(没有NFS)
- 运行级别3：完全的多用户状态(有NFS)，登录后进入控制台命令行模式
- 运行级别4：系统未使用，保留
- 运行级别5：X11控制台，登录后进入图形GUI模式
- 运行级别6：系统正常关闭并重启，默认运行级别不能设为6，否则不能正常启动



##### CentOS 7 简化 运行级别

- multi-user.target: analogous to runlevel 3 (多用户有网，无图形界面)

- graphical.target: analogous to runlevel 5 (多用户有网，有图形界面）

  - 查看当前级别	

    ```
    [root@hadoop100 /]# systemctl get-default 
    graphical.target
    ```
    
  - 设置当前级别
  
  ```
  [root@hadoop100 /]# systemctl set-default TARGET.target (这里的TARGET 换成multi-user或者graphical)
  ```
  
  

查看运行级别文档书


```
[root@hadoop100 /]# vim /etc/inittab 
```



- 切换运行级别

  - 进入运行级别3  （大黑屏）

    - 和CTRL+ALT+F2 到 F6  一样的操作

    ```
    [root@hadoop100 /]# init 3
    ```

  - 进入运行级别5 （ui图像画界面）

    - 和CTRL+ALT+F1  一样的操作

    ```
    [root@hadoop100 /]# init 5
    ```

  

  ##### 4.5查看和管理服务级别

  可以通过 目录4.3下的服务自启动来开关

  ```
  [root@hadoop100 ~]# chkconfig --list
  
  注：该输出结果只显示 SysV 服务，并不包含
  原生 systemd 服务。SysV 配置数据
  可能被原生 systemd 配置覆盖。 
  
        要列出 systemd 服务，请执行 'systemctl list-unit-files'。
        查看在具体 target 启用的服务请执行
        'systemctl list-dependencies [target]'。
  
  netconsole     	0:关	1:关	2:关	3:关	4:关	5:关	6:关
  network        	0:关	1:关	2:开	3:开	4:开	5:开	6:关
  ```



###### 关闭或者打开所有权限



- chkconfig network off   关闭
- chkconfig network on  开启

```
[root@hadoop100 ~]# chkconfig network off
[root@hadoop100 ~]# chkconfig --list

注：该输出结果只显示 SysV 服务，并不包含
原生 systemd 服务。SysV 配置数据
可能被原生 systemd 配置覆盖。 

      要列出 systemd 服务，请执行 'systemctl list-unit-files'。
      查看在具体 target 启用的服务请执行
      'systemctl list-dependencies [target]'。

netconsole     	0:关	1:关	2:关	3:关	4:关	5:关	6:关
network        	0:关	1:关	2:关	3:关	4:关	5:关	6:关
[root@hadoop100 ~]# chkconfig network on
[root@hadoop100 ~]# chkconfig --list

注：该输出结果只显示 SysV 服务，并不包含
原生 systemd 服务。SysV 配置数据
可能被原生 systemd 配置覆盖。 

      要列出 systemd 服务，请执行 'systemctl list-unit-files'。
      查看在具体 target 启用的服务请执行
      'systemctl list-dependencies [target]'。

netconsole     	0:关	1:关	2:关	3:关	4:关	5:关	6:关
network        	0:关	1:关	2:开	3:开	4:开	5:开	6:关

```

###### 指定打开或关闭

- chkconfig --level 3 network off
- chkconfig --level 3 network on

```
[root@hadoop100 ~]# chkconfig --level 3 network off
```



###### 操作服务自启动



-  systemctl status NetworkManager
  - preset: enabled  预设开机自启动

```
[root@hadoop100 ~]# systemctl status NetworkManager
● NetworkManager.service - Network Manager
   Loaded: loaded (/usr/lib/systemd/system/NetworkManager.service; enabled; vendor preset: enabled)
   Active: active (running) since 六 2023-04-01 10:18:04 CST; 6h ago
     Docs: man:NetworkManager(8)
 Main PID: 768 (NetworkManager)
   CGroup: /system.slice/NetworkManager.service
           └─768 /usr/sbin/NetworkManager --no-daemon

```

- systemctl dsiable Network Manager   关闭开机自启动

```
[root@hadoop100 ~]# systemctl dsiable Network Manager
```





- systemctl list-unit-files     查看所有服务启动状态
  - status
    - static 静态 根据其它服务的启动来
    - disabled  开机不启动
    - enabled   开机启动

```
root@hadoop100 ~]# systemctl list-unit-files 

proc-sys-fs-binfmt_misc.mount                 static  
run-vmblock\x2dfuse.mount                     disabled
abrt-oops.service                             enabled 
```





###### 操作防火墙

- 查看防火墙状态
- Cent OS 6 的防火墙  iptables
- Cent OS 7 的防火墙  firewalld

```
[root@hadoop100 ~]# systemctl status firewalld
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor preset: enabled)
   Active: active (running) since 六 2023-04-01 10:18:04 CST; 7h ago
     Docs: man:firewalld(1)
 Main PID: 730 (firewalld)
   CGroup: /system.slice/firewalld.service
           └─730 /usr/bin/python2 -Es /usr/sbin/firewalld --nofork --nopid

```



- 打开 关闭防火墙 
  -   systemctl stop firewalld
  - systemctl start firewalld

​				加不加.service 都是一样的

```
[root@hadoop100 ~]# systemctl stop firewalld.service 
[root@hadoop100 ~]# systemctl start firewalld.service 
```



- 打开 关闭 开机自启防火墙
  - systemctl disable firewalld  关闭开机自启
  - systemctl enable firewalld.service    关闭开机自启

```
[root@hadoop100 ~]# systemctl disable firewalld
[root@hadoop100 ~]# systemctl enable firewalld.service 
```



###### 关机重启

-  shutdown  关机默认一分钟后执行  
- shutdown -c 取消关机
- shutdown  now 现在关机
- shutdown  17.50 定时关机

```
[root@hadoop100 ~]# shutdown 
[root@hadoop100 ~]# shutdown -c
```



- 基本语法

1. sync														功能描述：将数据从内存同步到硬盘中
2. halt												         功能描述：停机，关系统， 但不断电
  3. poweroff										        功能描述：关机， 断电
4. reboot                                                    功能描述： 重启， 等同于 showdown -r now
  5. shutdown 【选项】  时间

| 选项 |        功能         |
| :--: | :-----------------: |
|  -h  |     相当于关机      |
|  -H  | 停机， 相当于--halt |
|  -r  |  -r = reboot  重启  |

| 时间 |               功能               |
| :--: | :------------------------------: |
| now  |             立刻关机             |
| 时间 | 等待多久关机后关机（单位是分钟） |



###  5.常用基本命令

Shell可以看作是一个命令解释器，为我们提供了交互式的文本控制台界面。我们可以通过终端控制台来输入命令，由shell进行解释并最终交给内核执行。本章就将分类介绍常用的基本shell命令。

#### 5.1 帮助命令

#####  5.1.1man获取帮助信息

- 基本语法
  - man[命令或配置文件]   						（功能描述：获得帮助信息）
  - man  man

```
[root@hadoop100 ~]# man shutdown
```



##### 5.1.2 help获取shell的内置命令的帮助信息

一部分基础功能的系统命令是直接内嵌在shell中的，系统加载启动之后会随着shell 一起加载，常驻系统内存中。这部分命令被称为“内置(built-in) 命令”;相应的其它命令被称为“外部命令”。

- 基本语法

  - help 命令											功能描述：获取shell内置命令和帮助信息
  - 命令 --help 										功能描述：获取帮助信息

- 案例实操

  - 查看cd命令的操作信息

  ```
  [root@hadoop100 ~]# help cd
  [root@hadoop100 ~]# cd --help 
  ```

或者

- 基本语法

  - type 命令                                              功能描述：判断是内嵌还是外部命令

- 案例实操

  - 查看cd的类型

  ```
  [root@hadoop100 ~]# type cd
  cd 是 shell 内嵌
  [root@hadoop100 ~]# type ls
  ls 是 `ls --color=auto' 的别名
  [root@hadoop100 ~]# 
  
  ```



##### 5.1.3查看操作历史记录

```
 [root@hadoop100 ~]# history 
```



##### 5.1.4常用快捷键

| 常用快捷键 |                   功能                    |
| :--------: | :---------------------------------------: |
|  CTRL + c  |                 停止进程                  |
|  CTRL + l  | 清屏幕， 等同于clear ，彻底清屏是： reset |
|    TAB     |         提示， 更重要的是防止敲错         |
|   上下键   |             查找执行过的命令              |
|            |                                           |
|            |                                           |



#### 5.2文件目录类

##### 5.2.1 pwd 显示工作目录的绝对路径

pwd -》 point working directory  打印工作目录

- 基本语法

  - pwd														详细信息：显示工作目录的绝对路径

- 案例实例

  - 显示工作目录的绝对路径

    ```
    [root@hadoop100 ~]# pwd
    /root
    ```

  - 相对路径     当前路径 /root/桌面

    - cd ../视频  							可以../代替/root

  - 绝对路径       绝对路径是以/根目录开始的

    - cd /root/桌面

  - cd - 来回跳转根目录和当前目录

##### 5.2.2 ls 列出目录的内容

ls -》  list   列出目录内容

- 基本语法

  - ls [选择]  [目录或者是文件]

- 选项说明

  | 选项 |                        功能                        |
  | :--: | :------------------------------------------------: |
  |  -a  |              显示全部文件包括隐藏文件              |
  |  -l  | 长数据串列出，包含文件的属性与权限等数据；等价于ll |



##### 5.2.3 创建或删除目录

- 创建目录

  - mkdir   目录名称  								无/就是在当前目录下创建
  - mkdir  /目录名称                                  根目录下创建
  - mkdir -p  /name/name                        可以创建多个目录

  ```
  [root@hadoop100 /]# mkdir -p /a/b/c
  [root@hadoop100 /]# ls /a/b/
  c
  
  ```

- 删除目录

  - rmdir    目录名称                                   如果该目录里面为空可以直接删除否则看下面
  - rmdir -p    /a/b/c                                  如果b里面和a里面没有其它目录那么直接删除a/b/c
    - 注意创建可以加上/根目录  删除不能带上根目录/

```
[root@hadoop100 /]# mkdir -p /a/b/c
[root@hadoop100 /]# ls
a  bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@hadoop100 /]# rmdir -p a/b/c
[root@hadoop100 /]# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

```



##### 5.2.4 创建或删除文件

- 基本语法

  - touch   文件名称                                     可以不带后缀名称默认就是文本文件   touch（触摸）
  - 实际案例

  ```
  [root@hadoop100 wmt]# touch text.txt
  ```

  - vim    文件名称                                        也可以使用vim去创建文件 

  ```
  [root@hadoop100 wmt]# vim text.txt
  ```

  

##### 5.2.5 cp复制文件

- 基本语法

  -  cp 目标文件  路径                                     cp后面如果是目录直接复制，是文件就会覆盖
  - 实际案例

  ```
  [root@hadoop100 ~]# cp initial-setup-ks.cfg /wmt
  [root@hadoop100 /]# ls wmt
  initial-setup-ks.cfg  text.txt
  
  #覆盖
  [root@hadoop100 ~]# cp initial-setup-ks.cfg /wmt/text.txt
  cp：是否覆盖"/wmt/text.txt"？ y
  
  ```

  - 递归复制
  - cp -r 目标文件 路径                                       会复制该文件夹里面的所有的文件

  ```
  [root@hadoop100 /]# cp -r wmt /taget
  ```

  

查看别名 

```
[root@hadoop100 ~]# alias

```



##### 5.2.6 rm删除文件或目录

- 基本语法

  - rm [选择] deleteFile 
    - rm  -rf  /*      					入门到入狱
  - 选项说明白

  | 选项 |               功能               |
  | :--: | :------------------------------: |
  |  -r  |    递归删除目录里面的所有内容    |
  |  -f  | 强制删除操作，并且不提示是否删除 |
  |  -v  |           显示执行过程           |

  - 实际操作

  ```
  [root@hadoop100 /]# rm -r wmt02
  rm：是否进入目录"wmt02"? y
  rm：是否进入目录"wmt02/wmt"? y
  rm：是否删除普通文件 "wmt02/wmt/initial-setup-ks.cfg"？y
  rm：是否删除普通文件 "wmt02/wmt/text.txt"？y
  rm：是否进入目录"wmt02/wmt/wmt"? y
  rm：是否删除普通文件 "wmt02/wmt/wmt/initial-setup-ks.cfg"？y
  rm：是否删除普通文件 "wmt02/wmt/wmt/text.txt"？y
  rm：是否删除目录 "wmt02/wmt/wmt"？y
  rm：是否删除目录 "wmt02/wmt"？y
  rm：是否删除目录 "wmt02"？y
  [root@hadoop100 /]# 
  
  ```

  - rm   -f    ./*                                           ./* 解释  当前文件夹下的所有文件

  ```
  [root@hadoop100 wmt]# rm -f ./*
  ```

  



##### 5.2.7 mv移动文件与目录或重命名

- 基础操作

  - mv oldNameFlie 	newNanemFlie                                         重命名
  - mv   /temp/moveflie/targetFolder                                          移动

- 实际案例

  ```Linux
  #重命名
  [root@hadoop100 ~]# mv initial-setup-ks.cfg newNaem.cfg
  
  #移动
  [root@hadoop100 ~]# mv newNaem.cfg /wmt
  
  #移动并且重命名
  
  [root@hadoop100 ~]# mv newNaem.cfg /wmt/新的文件名
  ```



##### 5.2.8 cat查看文件内容

查看文件内容从第一行开始显示

- 基本语法

  - cat [选项]  要查看的文件

- 选项说明

  -  -n                                                          显示所有行包括空格行并且显示行号

- 案例实操

  ```
  
  [root@hadoop100 ~]# cat newNaem.cfg 
  
  [root@hadoop100 ~]# cat -n newNaem.cfg 
  
  ```



##### 5.2.9more 文件内容分屏查看器

more指令是一个基于VI编辑器的文本过滤器，它以全屏幕的方式按页显示文本文件白内容。more 指令中内置了若干快捷键，详见操作说明。



- 基本语法

  - more 要查看的文件

  - 操作说明

    |      操作       |              功能说明              |
    | :-------------: | :--------------------------------: |
    | space（空白键） |            代表向下翻页            |
    |      Enter      |            表示下翻一行            |
    |        q        | 代表立即离开more，不在显示文件内容 |
    |     CTRL+F      |            向下滚动一屏            |
    |     CTRL+B      |             返回上一屏             |
    |        =        |            输出当前行号            |
    |       :f        |        输出文件名和当前行号        |

    



##### 5.2.10 less 分屏显示文件内容

less指令用来分屏查看文件内容，它的功能与more指令类似，但是比more指令更加强大，支持各种显示终端。less 指令在显示文件内容时，并不是一次将整个文件加载之后才显示，而是根据显示需要加载内容，对于显示大型文件具有较高的效率。



- 基本语法

  - less     查看的文件
  - 操作说明

  |   操作   |              功能说明              |
  | :------: | :--------------------------------: |
  |   空格   |              向下翻页              |
  | pageDown |            向下翻动一页            |
  |  pageUp  |            向上翻动一页            |
  |  /字串   | 向下查找   n向下翻找    N向上翻找  |
  |  ？字串  | 向上查找    n向下翻找    N向上翻找 |
  |    q     |              离开less              |



##### 5.2.11 echo

echo输出内容到控制台

- 基本语法

  - echo [选项]  [输出内容]

    - 选项：

      - -e  支持反斜杠转换

| 控制字符 |        作用         |
| :------: | :-----------------: |
|   \\\    |        输出\        |
|    \n    |        换行         |
|    \t    | 制表符，也就是Tab键 |

​        

##### 5.2.12 > 输出重定向  >>追加

- 基本语法

  - ls -l    >    文件                                                              列表内容覆盖写入文件中
  - ls - al  >>    文件                                                            列表内容追加进文件中
  - cat 文件1  >    文件2                                                     把文件1覆盖掉文件2
  - echo "内容"   >>  文件                                                  把内容追加进入文件中

- 实际操作

  - 将ls -l 写入到target

  ```
  [root@hadoop100 wmt]# ls -l > target
  [root@hadoop100 wmt]# ls
  initial-setup-ks.cfg  newNaem.cfg  target  text.txt  wmt
  [root@hadoop100 wmt]# cat target
  总用量 12
  -rw-r--r--. 1 root root 1727 4月   3 11:15 initial-setup-ks.cfg
  -rw-r--r--. 1 root root 1727 3月  19 21:59 newNaem.cfg
  -rw-r--r--. 1 root root    0 4月   3 19:48 target
  -rw-r--r--. 1 root root 1727 4月   3 11:21 text.txt
  drwxr-xr-x. 2 root root  
  ```

  - 将ls - al  追加到 target

  ```
  [root@hadoop100 wmt]# ls -al >> target
  [root@hadoop100 wmt]# cat target 
  总用量 12
  -rw-r--r--. 1 root root 1727 4月   3 11:15 initial-setup-ks.cfg
  省略
  drwxr-xr-x. 2 root root    6 4月   3 17:49 wmt
  总用量 16
  drwxr-xr-x.  3 root root   94 4月   3 19:48 .
  dr-xr-xr-x. 18 root root  235 4月   3 17:42 ..
  省略
  drwxr-xr-x.  2 root root    6 4月   3 17:49 wmt
  ```

  - cat 文件1  >    文件2      

  ```
  [root@hadoop100 wmt]# cat initial-setup-ks.cfg  > target
  [root@hadoop100 wmt]# cat target
  #version=DEVEL
  # X Window System configuration information
  xconfig  --startxonboot
  # License agreement
  eula --agreed
  # System authorization information
  auth --enableshadow --passalgo=sha512
  # Use CDROM installation media
  cdrom
  
  ```

  - echo "内容"   >>  文件    

  ```
  [root@hadoop100 wmt]# echo -e "hello \n world" >> target
  [root@hadoop100 wmt]# cat target 
  hello 
   world
  
  ```



##### 5.2.13  haed 显示文件头部

haed用于显示文件开头部分内容，默认情况下的head显示文件前10行的内容

- 基本语法

  - head   文件                                           查看文件前10行内容
  - head -n 5  文件                                     查看文件前5行内容

- 实际操作

  ```
  #默认显示10行
  [root@hadoop100 wmt]# head initial-setup-ks.cfg 
  
  #显示1行
  [root@hadoop100 wmt]# head -n 1 initial-setup-ks.cfg 
  #version=DEVEL
  
  ```

  

#####  5.2.14tail 输出文件尾部内容



tail 用于显示文件末尾部分内容，默认情况下的head显示文件后10行的内容

- 基本语法
  - tail 文件                                           查看文件后10行内容
  - tail -n 5  文件                                   查看文件后5行内容
  - tail    -f  文件                                    实时跟踪文件所有的更新
    - tail    -f  文件  会进入一个线程   CTRL +S 是暂停    CTRL +Q是继续    CTRL +C 退出
- 选择说明



|    选项    |                功能                |
| :--------: | :--------------------------------: |
| -n  <行数> |        输出文件末尾n行内容         |
|    - f     | 显示文件最新追加内容，监视文件变化 |

- 实际操作

```
[root@hadoop100 wmt]# tail -f  target
```



##### 5.2.15 ln软链接

软链接也称为符号链接，类似于windows 里的快捷方式，有自己的数据块，主要存放了链接其他文件的路径。



- 基本语法

  - ln -s [目录或者源文件]  [目标文件或者目录]
  - 实际操作

  ```
  [root@hadoop100 /]# ln -s /wmt /root/folder
  [root@hadoop100 /]# cd -
  /root
  [root@hadoop100 ~]# ls
  anaconda-ks.cfg  folder  公共  模板  视频  图片  文档  下载  音乐  桌面
  [root@hadoop100 ~]# ls folder/
  wmt
  
  ```

  - 查看文件具体路径

    - pwd展示软链接路径
    - pwd -P 展示真正的路径    P是大写

    ```
    [root@hadoop100 folder]# ll
    总用量 0
    lrwxrwxrwx. 1 root root 4 4月   5 20:01 wmt -> /wmt
    
    [root@hadoop100 wmt]# pwd
    /root/folder/wmt
    [root@hadoop100 wmt]# pwd -P
    /wmt
    
    ```

  - 进入真实路径 cd -P   大写P

  ```
  adoop100 wmt]# pwd
  /root/folder/wmt
  [root@hadoop100 wmt]# cd -P /root/folder/wmt
  [root@hadoop100 wmt]# pwd
  /wmt
  
  ```

- 经验技巧

  - 删除软链接   rm -rf 软链接名称                    而不是rm -rf 软链接名称/
  - **删除软链接   rm -rf 软链接名称 /                  会把软链接对应的真实目录下内容删掉**
  - 查询：通过ll就可以查看属性第一个是l，尾部会有位置指向



###### ln硬链接

和软链接的区别是软连接存的是地址    硬链接指向的是原地址    硬链接只能指向文件不能指向地址

- 基本语法
  - ln /文件    /文件



##### 5.2.16 history

- 基本操作

  - history  [数字]
  - 实际操作

  ```
  #显示一条
  [root@hadoop100 wmt]# history 1
    388  history 1
  ```

  - ！数字                  重复指令

    ```
    [root@hadoop100 wmt]# !388
    history 1
      388  history 1
    388  history 1
    
    ```

  - history -c        清空指令

  ```
  [root@hadoop100 wmt]# history -c
  [root@hadoop100 wmt]# his
  bash: his: 未找到命令...
  [root@hadoop100 wmt]# history 
      1  his
      2  history 
  
  ```



#### 5.3时间日期类



##### 5.3.1 显示当前时间

- 基本语法
  - date [+%字母]                                   显示当前时间
  - 实际操作

```
[root@hadoop100 wmt]# date 
2023年 04月 05日 星期三 20:40:11 CST
[root@hadoop100 wmt]# date +%Y
2023
[root@hadoop100 wmt]# date +%m
04
[root@hadoop100 wmt]# date +%d
05
[root@hadoop100 wmt]# date +%H
20
[root@hadoop100 wmt]# date +%M
47
[root@hadoop100 wmt]# date +%S
20
[root@hadoop100 wmt]# date +%T
20:40:58
[root@hadoop100 wmt]# date +%Y-%m-%d%H:%M:%S
2023-04-0520:43:59
[root@hadoop100 wmt]# date +%s
1680699264

```





|          操作          |                             功能                             |
| :--------------------: | :----------------------------------------------------------: |
|        date +%s        |                          显示时间戳                          |
|        date +%Y        |                          获取当前年                          |
|        date +%m        |                          获取当前月                          |
|        date +%d        |                          获取当前天                          |
|        date +%H        |                         获取当前小时                         |
|        date +%M        |                         获取当前分钟                         |
|        date +%S        |                          获取当前秒                          |
|        date +%T        |                     获取当前时间详细到秒                     |
| date +%Y-%m-%d%H:%M:%S | 自定义显示时间格式不能有空格（2023-04-0520:43:59） 除非加""就可以用空格了 |



##### 5.3.2显示非当前时间

- 基本语法
  - date -d "1 day ago"                                              功能描述：显示前一天
  - date -d "-1 day ago"                                             功能描述：显示明天
- 实际操作

```
#当前时间
[root@hadoop100 wmt]# date
2023年 04月 05日 星期三 21:01:30 CST
#显示昨天
[root@hadoop100 wmt]# date -d "1 day ago"
2023年 04月 04日 星期二 21:00:32 CST
#显示明天
[root@hadoop100 wmt]# date -d "-1 day ago"
2023年 04月 06日 星期四 21:01:53 CST
```



##### 5.3.3设置系统时间

- 基础语法

  - date -s  "字符串时间"

  - 实际操作

    ```
    [root@hadoop100 wmt]# date -s"2011-11-11 21:13:10"
    2011年 11月 11日 星期五 21:13:10 CST
    ```

- 同步时间

  - 语法  ntpdate  [选项]

  ```
  [root@hadoop100 wmt]# ntpdate 202.112.29.82
   5 Apr 21:11:51 ntpdate[6660]: adjust time server 202.112.29.82 offset 0.004079 sec
  
  ```

  

##### 5.3.4 cal 查看日历

- 基本语法

  - cal [选项] -m  时间

    ```
    [root@hadoop100 wmt]# cal 
          四月 2023     
    日 一 二 三 四 五 六
                       1
     2  3  4  5  6  7  8
     9 10 11 12 13 14 15
    16 17 18 19 20 21 22
    23 24 25 26 27 28 29
    30
    [root@hadoop100 wmt]# cal -3
          三月 2023             四月 2023             五月 2023     
    日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六
              1  2  3  4                     1      1  2  3  4  5  6
     5  6  7  8  9 10 11   2  3  4  5  6  7  8   7  8  9 10 11 12 13
    12 13 14 15 16 17 18   9 10 11 12 13 14 15  14 15 16 17 18 19 20
    19 20 21 22 23 24 25  16 17 18 19 20 21 22  21 22 23 24 25 26 27
    26 27 28 29 30 31     23 24 25 26 27 28 29  28 29 30 31         
                          30     
    ```


#### 5.4用户管理



##### 5.4.1 useradd新增用户

操作权限必须是root以管理员身份

- 基本语法 

  - useradd 用户名称                                                                 功能描述：添加新用户
  - useradd -g 组名 用户名                                                        功能描述：添加新用户到某组

- 实际操作

  ```
  [root@hadoop100 ~]# useradd wangmengtao
  [root@hadoop100 ~]# ll /home
  总用量 0
  drwx------. 3 wangmengtao wangmengtao 78 4月   6 09:36 wangmengtao
  drwx------. 3 wmt         wmt         78 3月  19 19:55 wmt
  ```

##### 5.4.2 password 设置用户密码

- 基本语法
  
  - password 用户名                                                                           功能描述：设置用户密码
  
- 实例操作
  - 设置用户名密码
    - root 权限可以限制身份强度的限制
  
  ```
  [root@hadoop100 home]# ls
  demo  wmt
  [root@hadoop100 home]# passwd demo 
  更改用户 demo 的密码 。  wmt123456
  新的 密码：
  无效的密码： 密码少于 8 个字符
  重新输入新的 密码：
  ```
  
- 使用Xshell去链接demo

  - 主机：必须为ip地址

  ![image-20230407105231781](..\linux-study\imgs\image-20230407105231781.png)



##### 5.4.3  id   查看用户是否存在

- 基本语法

  - id   用户名称
  - 实际操作

  ```
  [root@hadoop100 ~]# id demo
  uid=1002(demo) gid=1002(demo) 组=1002(demo)
  ```



##### 5.4.4 查看创建那些用户

-  tail -n 3  /etc/passwd

  - 重1000开始的才是自己创建的普通用户

  ```
  [root@hadoop100 ~]# tail -n 3 /etc/passwd
  wmt:x:1000:1000:wmt:/home/wmt:/bin/bash
  wangmengtao:x:1001:1001::/home/wangmengtao:/bin/bash
  demo:x:1002:1002::/home/demo:/bin/bash
  
  ```



##### 5.4.5  su 切换用户

- 基本语法

  - su  用户名称                                                          功能解释switch user   用户名

  - 实际操作                                                      

  - exit                                                                         相当于是嵌套，层层退出

    - cd ~                                                                   跳转到/home 目录

    ```
    [root@hadoop100 ~]# su demo
    [demo@hadoop100 root]$ cd ~
    [demo@hadoop100 ~]$ pwd
    /home/demo
    [demo@hadoop100 ~]$ su wmt
    密码：
    [wmt@hadoop100 demo]$ cd /
    [wmt@hadoop100 /]$ pwd
    /
    [wmt@hadoop100 /]$ cd ~
    [wmt@hadoop100 ~]$ pwd
    /home/wmt
    [wmt@hadoop100 ~]$ exit
    exit
    [demo@hadoop100 ~]$ exit
    exit
    
    ```



##### 5.4.6 who 查看用户

- 查看当前用户是谁

  - who am i                                                      分开是查看最外面的用户
  - whoami                                                         查看当前用户
  - 实际操作

  ```
  [demo@hadoop100 root]$ who am i
  root     pts/1        2023-04-09 13:34 (192.168.206.1)
  [demo@hadoop100 root]$ whoami
  demo
  ```

  

##### 5.4.7 sudo 设置普通用户短暂的root权限

- 基本语法

  - 先设置   vim /etc/sudoers                                        开启权限

    - sudoers配置文件

      ```linux
      ## Allow root to run any commands anywhere 
      root    ALL=(ALL)       ALL
      
      wmt     ALL=(ALL)       ALL
      
      ```

      

  - sudo    [指令]                                                             功能解释： 指令为需要开启权限的指令

    - 实际操作

      ```
      
      [wmt@hadoop100 root]$ ls
      ls: 无法打开目录.: 权限不够
      
      [root@hadoop100 ~]# vim /etc/sudoers
      [root@hadoop100 ~]# su wmt
      [wmt@hadoop100 root]$ ls
      ls: 无法打开目录.: 权限不够
      [wmt@hadoop100 root]$ sudo ls
      
      我们信任您已经从系统管理员那里了解了日常注意事项。
      总结起来无外乎这三点：
      
          #1) 尊重别人的隐私。
          #2) 输入前要先考虑(后果和风险)。
          #3) 权力越大，责任越大。
      
      [sudo] wmt 的密码：
      anaconda-ks.cfg  folder  公共  模板  视频  图片  文档  下载  音乐  桌面
      [wmt@hadoop100 root]$ 
      ```

      



##### 5.4.8 userdel删除用户

- 基本命令
  - userdel    用户名称  [-r]													功能解释  -r 删除用户的时候并且把home下对应的文件夹删除

```
[root@hadoop100 home]# ls
demo  wangmengtao  wmt
[root@hadoop100 home]# userdel wangmengtao 
[root@hadoop100 home]# ls
demo  wangmengtao  wmt
[root@hadoop100 home]# rm -rf wangmengtao/
[root@hadoop100 home]# ls
demo  wmt
[root@hadoop100 home]# userdel demo -r
[root@hadoop100 home]# ls
wmt

```



##### 5.4.9 设置分组

- 基本语法

  - usermod -g  组名  用户名称                                                   功能解释：把用户分组

  

#### 5.5 用户组

每个用户都有一个用户组，系统可以对一个用户组中的所有用户进行集中管理。不同Linux系统对用户组的规定有所不同，

如Linux下的用户属于与它同名的用户组，这个用户组在创建用户时同时创建。

用户组的管理涉及用户组的添加、删除和修改。组的增加、删除和修改实际上就是对/etc/group文件的更新。





- 基本语法
  - groupadd    组名                                                                      功能解释：创建组名
  - tail -n 1 /etc/group                                                                  功能解释：查看组名
  - usermod -g  组名  用户名称                                                    功能解释：把用户分组    -g     -group



```
[root@hadoop100 home]# ls
david  tony  wmt

[root@hadoop100 home]# groupadd team
[root@hadoop100 home]#  tail -n 1 /etc/group
team:x:1003:
[root@hadoop100 home]# usermod -g team david 
[root@hadoop100 home]# usermod -g team tony 

[root@hadoop100 home]# id david
uid=1001(david) gid=1003(team) 组=1003(team)
[root@hadoop100 home]# id tony
uid=1002(tony) gid=1003(team) 组=1003(team)

```



- 给组重命名
  - 基本语法
  - groupmod -n newNaem   oldName
  - 实际案例

```
[root@hadoop100 ~]# groupmod -n newTeam team
[root@hadoop100 ~]# tail -n 1 /etc/group
newTeam:x:1003:
```



- 删除组

  - 基本语法
  -  groupdel 组名称

  ```
  [root@hadoop100 ~]# groupdel david 
  [root@hadoop100 ~]# groupdel tony 
  
  ```

  



#### 5.6 文件权限管理

##### 5.6.1文件属性

Linux系统中不仅是对用户与组根据UID,GID进行了管理，还对Linux系统中的文件，按照用户与组进行分类，针对不同的群体进行了权限管理，用他来确定谁能通过何种方式对文件和目录进行访问和操作。



如同所示：

![img](..\linux-study\imgs\20181230195451513.jpg)

上面图片简写为ugo                     user             group              other

1. 0 首位表示类型
   1. `- `：是指可以用txt直接打开
   2. d ：为文件目录
   3. l ：为文件链接
   4. c ：字符类型的设备文件
   5. b ： 块设备文件
2. 第1-3确定属主（该文件的属有者）拥有该文件的权限 -user
3. 第4-6确定属组（所有者的同组用户）拥有该文件的权限-group
4. 第7-9确定其它用户拥有该文件的权限 -others



![img](..\linux-study\imgs\watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2x2ODU0OTUxMA==,size_16,color_FFFFFF,t_70)



- 文件类型
  - `- `：是指可以用txt直接打开
  - d ：为文件目录
  - l ：为文件链接
  - c ：字符类型的设备文件
  - b ： 块设备文件



**rwx作用文件和目录的不同解释**

- 作用到文件：
  - r代表read  可读可查看
  - w代表write ，可以修改，但是不代表可以删除该文件，删除一个文件的前提是该文件在的目录有写的权限，才能删除
  - x代表execute，代表可被系统执行
- 作用到目录
  - r代表read  可读取ls查看目录内容
  - w代表write ，可以修改，目录内创建+删除+重署名
  - x代表execute，可以进入该目录



- 实际案例

![image-20230409213223528](..\linux-study\imgs\image-20230409213223528.png)



1. 如果查看到是文件: 链接数指的是硬链接个数。

   

2. 如果查看的是文件夹: 链接数指的是子文件夹个数。



##### 5.6.2 chmod 改变权限

- 基本语法
  - 第一种方式
    - chmod[{ugoa} {+-=} {rwx}] 文件或者目录
  - 第二种方式
    - chmod [421]  文件或者目录
  - 目录下的所有文件都改变权限
    - chmod [421]  -R 文件或者目录
  - 经验技巧
    - u：所有者   g：所有组   o：其他人    a：所有人
    - 4：可读   2：可写   1： 可执行                      采用的二进制   111 代表的就是7

```
#第一种方式
[root@hadoop100 tony]# ll
总用量 4
-rw-------. 1 root root 1679 4月   9 21:40 anaconda-ks.cfg
[root@hadoop100 tony]# chmod o=rwx anaconda-ks.cfg 
[root@hadoop100 tony]# ll
总用量 4
-rw----rwx. 1 root root 1679 4月   9 21:40 anaconda-ks.cfg
#第二种方式
[root@hadoop100 tony]# chmod 777 anaconda-ks.cfg 
[root@hadoop100 tony]# ll
总用量 4
-rwxrwxrwx. 1 root root 1679 4月   9 21:40 anaconda-ks.cfg

```



##### 5.6.3 chown 修改所有者

- 基本语法

  - chown  [选项]   所有者      文件
  - 选项
    - -R   递归修改文件所有者
  - 实际操作

  ```
  [root@hadoop100 ~]# ll /home/tony/
  -rwxrwxrwx. 1 root root 1679 3月  19 20:07 anaconda-ks.cfg
  
  [root@hadoop100 ~]# chown tony /home/tony/anaconda-ks.cfg 
  
  [root@hadoop100 ~]# ll /home/tony/
  -rwxrwxrwx. 1 tony root 1679 4月   9 21:40 anaconda-ks.cfg
  
  ```



##### 5.6.4 chgrp 修改所有组

- 基本语法

  - chgrp  组名  文件名称           

  - 实际案例

    ```
    [root@hadoop100 tony]# ll
    -rwx------. 1 tony root 1679 4月   9 21:40 anaconda-ks.cfg
    
    [root@hadoop100 tony]# chgrp newteam anaconda-ks.cfg 
    
    [root@hadoop100 tony]# ll
    -rwx------. 1 tony newteam 1679 4月   9 21:40 anaconda-ks.cfg
    
    ```

    



#### 5.7 搜索查找类

##### 5.7.1find查找文件或者目录

find指令将从指令目录向下递归遍历其各个子目录，将满足条件的文件显示在终端

- 基本语法

  - find [搜索范围选项] [选择]
  - 选择说明

  |      选择       |                 功能                 |
  | :-------------: | :----------------------------------: |
  | -name<查询方式> |   按照指定的文件名查找模式查找文件   |
  |  -user<用户名>  |      查找属于指定用户名所有文件      |
  | -size<文件大小> | 按照指定的文件大小查找文件，单位为： |
  |                 |         b------块（512字节）         |
  |                 |             c-------字节             |
  |                 |        w----------字（2字节）        |
  |                 |          k-----------千字节          |
  |                 |        M---------------兆字节        |
  |                 |       G----------------吉字节        |

##### 5.7.2 locate快速定位文件路径

locate指令利用事先建立的系统中所有文件名称及路径的locate数据库实现快速定位给定的文件。Locate 指令无需遍历整个文件系统，查询速度较快。为了保证查询结果的准确度，管理员必须定期更新locate时刻。



- 基本语法

  - locate 文件名或者目录

    - 实际操作

    ```
    [root@hadoop100 home]# locate wmt
    /wmt
    ```

    

  - 实际经验

    - locate实际使用前 需要先执行一下 updatedb

    ```
    [root@hadoop100 home]# updatedb 
    ```

- 查看命令的路径

  - 基本语法

  - whereis   指令

    - 实际操作

    ```
    [root@hadoop100 home]# whereis sudo
    
    ```

    

##### 5.7.3 grep 过滤查找及“|”管道符

管道符，“|”，表示将前一个命令的处理结果输出传递给后面的命令处理。

- 基本语法

  - grep选项   查找内容  源文件

- 选项说明

  - -n       显示匹配和行号

- 实际案例

  ```
  [root@hadoop100 桌面]# grep -n boot initial-setup-ks.cfg 
  3:xconfig  --startxonboot
  12:# Run the Setup Agent on first boot
  ```

  

- 基本语法

  - wc word count  单词计数         返回如下
  - 行数         单词数量             内存大小
  - 实际操作

  ```
  [root@hadoop100 桌面]# grep -n boot initial-setup-ks.cfg | wc
        7      27     287
  #   行数   单词数量   内存大小
  
  ```



#### 5.8压缩和解压类

##### 5.8.1gzip / gunzip 压缩

- 基本语法

  - gzip      文件                                                  功能描述：压缩文件，只能将文件压缩为*.gz文件
  - gunzip  文件 .gz                                            功能描述：解压缩文件命令

- 经验技巧

  1. 只能压缩文件不能压缩目录
  2. 不保留原来的文件
  3. 同时多个文件就会产生多个压缩包

- 案例实操

  - gzip压缩

  ````
  -rw-r--r--. 1 root root 1740 3月  29 08:26 initial-setup-ks.cfg
  #压缩变小了
  [root@hadoop100 桌面]# gzip initial-setup-ks.cfg 
  
  -rw-r--r--. 1 root root 1005 3月  29 08:26 initial-setup-ks.cfg.gz
  
  ````
  - gunzip

  ```
  [root@hadoop100 桌面]# gunzip initial-setup-ks.cfg.gz 
  ```

  

##### 5.8.2 zip / unzip 压缩

- 基本语法

  - zip [选择] 压缩后的名字.zip   将要压缩的内容                            功能描述：压缩文件和目录的命令
  - unzip  [选择] xxx.zip                                                                      功能描述：解压文件

- 选择说明

  | zip选项 |   功能   |
  | :-----: | :------: |
  |   -r    | 压缩目录 |

  |  unzip选项  |            功能            |
  | :---------: | :------------------------: |
  | -d 《目录》 | 指定压缩后的文件存放的目录 |



- 经验技巧

  ​	zip压缩命令在window/Linux系统都是通用，可以压缩目录且保留源文件。

  ​	

  - 实际案例 zip

  ```
  [root@hadoop100 桌面]# zip myinit.zip initial-setup-ks.cfg 
    adding: initial-setup-ks.cfg (deflated 44%)
  [root@hadoop100 桌面]# ll
  -rw-r--r--. 1 root root 1740 3月  29 08:26 initial-setup-ks.cfg
  -rw-r--r--. 1 root root 1156 4月  10 21:46 myinit.zip
  
  ```

  - 实际案例 unzip   -d 解压到根目录

  ```
  [root@hadoop100 桌面]# unzip -d / myinit.zip 
  Archive:  myinit.zip
    inflating: /initial-setup-ks.cfg 
  ```



##### 5.8.3 tar 打包

- 基本语法
  - tar[选项] xxx.tar.gz将要打包进去的内容                               功能描述：打包目录，压缩后的文件格式.tar.gz
- 选项说明

| 选项 |        功能        |
| :--: | :----------------: |
|  -c  |  产生.tar打包文件  |
|  -v  |    显示详细信息    |
|  -f  | 指定压缩后的文件名 |
|  -z  |    打包同时压缩    |
|  -x  |    解包.tar文件    |
|  -C  |   解压到指定目录   |

- 实际操作

```
[root@hadoop100 study]# touch testTar

#打包
[root@hadoop100 study]# tar -cvzf test.tar.gz testTar 
testTar
[root@hadoop100 study]# ll
总用量 16
-rw-r--r--. 1 root root    13 4月  11 14:27 testTar
-rw-r--r--. 1 root root 10240 4月  11 14:27 test.tar.gz
# 解包
[root@hadoop100 study]# tar -xzvf  tar.tar.gz  
testTar

```



#### 5.9硬盘查看和分区类

- 基本操作

  -  yum install 安装的插件名称

    ```
    [root@hadoop100 ~]# yum install tree
    ```

  - 实际经验  当yum 命令报异常可以执行下面2句试试

  ```
    642  rm -f /etc/yum.repos.d/*
    643  wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
  
  ```

- 基本操作

  - tree  [-N]  目录                                            -N可以显示中文

  ```
  [root@hadoop100 ~]# tree study
  tree study/
  study/
  ├── newTestTar.tar.gz
  └── testTar
  
  ```

  

##### 5.9.1du查看文件和目录占用磁盘空间

du: disk usage        磁盘占用情况

- 基本语法

  - du   目录 / 文件                                                  显示目录下每个子目录的磁盘使用情况

- 选项说明

  |     选项      |                  功能                  |
  | :-----------: | :------------------------------------: |
  |      -h       |       human以人类更能看懂的展示        |
  |      -a       |   不仅查看目录的大小还查看文件的大小   |
  |      -c       | 显示所有的文件和子目录大小后，显示总和 |
  |      -s       |               只显示总和               |
  | --max-depth=n |      指定统计子目录的深层为第n层       |

- 实际操作

```
[root@hadoop100 ~]# du -ah
```



 

##### 5.9.2 df 查看磁盘空间使用情况

df ： disk free

- 基本语法
  - df 选项                                   功能描述： 列出文件系统的整体磁盘的使用量，检测文件系统的磁盘空间占用情况
- 选项说明
  - -h                                                                以人类比较容易的阅读方式展示
- 实际案例

```
[root@hadoop100 桌面]# df -h
文件系统        容量  已用  可用 已用% 挂载点
devtmpfs        2.0G     0  2.0G    0% /dev
tmpfs           2.0G     0  2.0G    0% /dev/shm
tmpfs           2.0G   13M  2.0G    1% /run
tmpfs           2.0G     0  2.0G    0% /sys/fs/cgroup
/dev/sda2        16G  5.1G   11G   33% /
```



- free -h                    查看内存

```
[root@hadoop100 桌面]# free -h
              total        used        free      shared  buff/cache   available
Mem:           3.8G        913M        1.5G         33M        1.4G        2.7G
Swap:          3.7G          0B        3.7G

```





##### 5.9.3lsblk 查看设备挂载情况

- 基本语法
  - lsblk  [-f]               list block                                           功能描述：查看设备挂载情况
  - -f                               显示文件使用的类型
- 实际操作

```
[root@hadoop100 桌面]# lsblk 
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0   20G  0 disk 
├─sda1   8:1    0  671M  0 part /boot
├─sda2   8:2    0 15.6G  0 part /
└─sda3   8:3    0  3.7G  0 part [SWAP]
sr0     11:0    1  4.4G  0 rom  /run/media/root/CentOS 7 x86_64
# 上面的为光盘光驱
```



##### 5.9.4mount / umount  挂载和卸载

对于Linux用户来讲，不论有几个分区，分别分给哪一个目录使用，它总归就是一个根目录、一个独立且唯--的文件结构。
Linux中每个分区都是用来组成整个文件系统的一部分，它在用一种叫做“挂载”的处理方法，它整个文件系统中包含了一整套的文件和目录，并将一个分区和一个目录联系起来，要载入的那个分区将使它的存储空间在这个目录下获得。

- 挂载前准备（必须要有光盘或者已经连接镜像文件）

  ![image-20230413221446882](..\linux-study\imgs\image-20230413221446882.png)

- 基本语法

  - mount[-t vfstype] [-o options] device dir                               功能描述：挂载设备
  - umount 设备文件名或者挂载点                                                 功能描述：卸载设备

- 参数说明
  - -t vfstype                      指定文件系统类型，通常不需要指定。mount会自动选择正确的类型。常用类型有:
    - 光盘或光盘镜像: iso9660	
      DOS fat16文件系统:msdos
      Windows 9x fat32文件系统: vfat
      Windows NT ntfs文件系统: ntfs
      Mount Windows文件网络共享: smbfs
      UNIX(LINUX)文件网络共享: nfs
  - -o options                    主要用来描述设备或档案的挂接方式。常用的参数有:
    - loop:用来把一个文件当成硬盘分区挂接上系统
      ro:采用只读方式挂接设备
      rw:采用读写方式挂接设备
      iocharset:指定访问文件系统所用字符集
  - device                                      要挂载的（mount）的设备
  - dir                                           设备在系统上的挂接点（mount point）



- 实际操作

```
[root@hadoop100 桌面]# lsblk -f
NAME   FSTYPE  LABEL           UUID                                 MOUNTPOINT
sda                                                                 
├─sda1 xfs                     e790f5a3-9df1-4465-9e89-3729797ce09c /boot
├─sda2 xfs                     dc9885f0-e239-4fba-baf2-02795564c04f /
└─sda3 swap                    ab22da79-6e71-4150-ac19-a43163f12485 [SWAP]
sr0    iso9660 CentOS 7 x86_64 2020-11-04-11-36-43-00               /run/media/root/CentOS 7 x86_64
#取消挂载
[root@hadoop100 桌面]# umount /run/media/root/CentOS\ 7\ x86_64 
#开始挂载
[root@hadoop100 dev]# mount /dev/cdrom /mnt/cdrom/
mount: /dev/sr0 写保护，将以只读方式挂载
[root@hadoop100 dev]# lsblk 
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0   20G  0 disk 
├─sda1   8:1    0  671M  0 part /boot
├─sda2   8:2    0 15.6G  0 part /
└─sda3   8:3    0  3.7G  0 part [SWAP]
sr0     11:0    1  4.4G  0 rom  /mnt/cdrom

```



###### 设置开启自动挂载

```
[root@hadoop100 dev]# vim /etc/fstab 

```

打开后： 

```
#
# /etc/fstab
# Created by anaconda on Sun Mar 19 19:54:03 2023
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#                                                        第一个0是权限等级1为最大      第二个0是1就开启自检
UUID=dc9885f0-e239-4fba-baf2-02795564c04f /                       xfs     defaults        0 0
UUID=e790f5a3-9df1-4465-9e89-3729797ce09c /boot                   xfs     defaults        0 0
UUID=ab22da79-6e71-4150-ac19-a43163f12485 swap                    swap    defaults        0 0
#插入挂载自启动 然后重启就出现问题   打不开图形化界面需要取消挂载
/edv/cdrom                                /mnt/cdrom              iso9660 defaults        0 0
                                                                                                   
```



##### 5.9.5 fdisk 分区

- 基本语法
  - fdisk -l                                                                                    功能详情：查看磁盘分区详情
  - fdisk 硬盘设备名                                                                   功能描述：对新增硬盘进行分区操作
- 实际操作

```
[root@hadoop100 dev]# fdisk -l

磁盘 /dev/sda：21.5 GB, 21474836480 字节，41943040 个扇区
Units = 扇区 of 1 * 512 = 512 bytes
扇区大小(逻辑/物理)：512 字节 / 512 字节
I/O 大小(最小/最佳)：512 字节 / 512 字节
磁盘标签类型：dos
磁盘标识符：0x000ca1a1

   设备 Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048     1376255      687104   83  Linux
/dev/sda2         1376256    34131967    16377856   83  Linux
/dev/sda3        34131968    41943039     3905536   82  Linux swap / Solaris

```

```
[root@hadoop100 dev]# fdisk /dev/sdb
#之后全默认  系统无法分辨这个分区
NAME   FSTYPE  LABEL           UUID                                 MOUNTPOINT
sdb                                                                 
└─sdb1                                                              

```

- 基础语法
  - mkfs -t xfs 硬盘路径

```
[root@hadoop100 etc]# mkfs -t xfs /dev/sdb1
NAME   FSTYPE  LABEL           UUID                                 MOUNTPOINT
sdb                                                                 
└─sdb1 xfs                     e25b8ac9-0c14-46bf-ade7-5dae70370973 

```



##### 5.9.6 mount /umount

```
#挂载
[root@hadoop100 home]# mount /dev/sdb1 /home/wmt
[root@hadoop100 home]# df -h
文件系统        容量  已用  可用 已用% 挂载点
/dev/sdb1        10G   33M   10G    1% /home/wmt
#取消挂载    之前挂载在sdb1的文件会消失
[root@hadoop100 ~]# umount /home/wmt 
```



#### 5.10 进程管理

进程是正在执行的一个程序或命令，每一个进程都是一个运行的实体，都有自己的地址空间，并占用一定的系统资源。



##### 5.10.1 ps查看当前系统进程

​		ps：process   status   进程状态

- 基本语法
  - ps aux | grep  xxx                                                          功能描述：查看系统中所有进程
  - ps -ef | grep  xxx                                                           功能描述：可以查看父子进程之间的关系

- 选项说明
  - -命令 是UNIX 风格                         直接字母是BSD风格

| 选项 |                   功能                   |
| :--: | :--------------------------------------: |
|  a   |        列表带有终端的所有用户进程        |
|  x   | 列出当前用户的进程，也包括没有终端的进程 |
|  u   |          面向用户友好的展示方式          |
|  -e  |               列出所有进程               |
|  -u  |        列出某个用户关联的所有进程        |
|  -f  |          显示完整格式的进程列表          |

- 实际操作

```
[root@hadoop100 /]# ps aux
USER        PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root          1  0.0  0.1 128392  7024 ?        Ss   18:32   0:01 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
root          2  0.0  0.0      0     0 ?        S    18:32   0:00 [kthreadd]

[root@hadoop100 /]# ps -ef
UID         PID   PPID  C STIME TTY          TIME CMD
root          1      0  0 18:32 ?        00:00:02 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
root          2      0  0 18:32 ?        00:00:00 [kthreadd]
root          4      2  0 18:32 ?        00:00:00 [kworker/0:0H]

```

-  ps aux 中：

  PID:进程的ID号

  %CPU:该进程占用CPU资源的百分比，占用越高，进程越耗费资源;

  %MEM:该进程占用物理内存的百分比，占用越高，进程越耗费资源; 

  VSZ:该进程占用虚拟内存的大小，单位KB;

  RSS:该进程占用实际物理内存的大小，单位KB; 

  TTY:该进程是在哪个终端中运行的。对于CentOS 来说，tty1 是图形化终端，tty2-tty6是本地的字符界面终端。pts/0-255 代表虚拟终端。

  STAT:进程状态。常见的状态有: R:运行状态、S:睡眠状态、T:暂停状态、Z:僵尸状态、s:包含子进程、l:多线程、+:前台显示，< 高优先级， N低优先级

  START:该进程的启动时间

  TIME:该进程占用CPU的运算时间，注意不是系统时间

  COMMAND:产生此进程的命令名

  

- ps -ef 中：

  PID:进程ID

  PPID:父进程ID     PPID为0 指的是之前的init

  C: CPU用于计算执行优先级的因子。数值越大，表明进程是CPU密集型运算,执行优先级会降低;数值越小，表明进程是I/O密集型运算，执行优先级会提高

  STIME:进程启动的时间

  TTY:完整的终端名称

  TIME: CPU时间

  CMD:启动进程所用的命令和参数

  

- **经验技巧**
  如果想查看进程的CPU占用率和内存占用率，可以使用aux;
  如果想查看进程的父进程ID可以使用ef;





##### 5.10.2 kill终止进程

- 基本语法
  - kill [选项] 进程号                                                  功能描述：通过进程号杀手进程
  - killall 进程名称                         功能描述：通过进程名称杀死进程，也支持通配符，这在系统因系统负荷过大而变得很慢时很有用

- 选项说明
  - -9                                                     表示强迫进程立即停止
- 实际操作

```
[root@hadoop100 /]# ps aux | grep sshd
root       1053  0.0  0.1 112900  4308 ?        Ss   18:32   0:00 /usr/sbin/sshd -D
root       4996  0.0  0.1 160988  5648 ?        Ss   20:45   0:00 sshd: root@pts/1
root       5087  0.0  0.1 160988  5584 ?        Ss   20:50   0:00 sshd: wmt [priv]
wmt        5091  0.0  0.0 160988  2376 ?        S    20:50   0:00 sshd: wmt@pts/2
root       5233  0.0  0.0 112824   976 pts/0    R+   21:00   0:00 grep --color=auto sshd
[root@hadoop100 /]# kill 5091
[root@hadoop100 /]# ps aux | grep sshd
root       1053  0.0  0.1 112900  4308 ?        Ss   18:32   0:00 /usr/sbin/sshd -D
root       4996  0.0  0.1 160988  5648 ?        Ss   20:45   0:00 sshd: root@pts/1
root       5250  0.0  0.0 112828   976 pts/0    R+   21:00   0:00 grep --color=auto sshd
```



##### 5.10.3pstree 查看进程树

安装pstree：

```
[root@hadoop100 /]# yum -y install  psmisc
```

- 基本语法
  - pstree [选项]
- 选项说明
  - -p                                                              功能描述：显示进程的PID
  - -u                                                              功能描述：显示进程所属用户

##### 5.10.4top实时监控系统进程状态

- 基本命令 

  - top [选项]

- 选项说明

  |  选项   |                             功能                             |
  | :-----: | :----------------------------------------------------------: |
  | -d 秒数 | 指定 top 命令每隔几秒更新，默认是3秒在top命令的交互模式当中执行的命令 |
  |   -i    |              使用top不显示任何闲置或者僵死进程               |
  |   -p    |        通过指定监控进程的ID来仅仅监控某一个进程的状态        |





- 操作说明

| 操作 |        功能        |
| :--: | :----------------: |
|  u   |  查看指定用户进程  |
|  k   |      杀死进程      |
|  P   | 以cpu使用效率排序  |
|  M   | 以内存使用频率排序 |



#####  netstat 显示网络状态和端口占用信息

- 基本语法

  - netstat -anp |    进程号                                             功能描述：查看该进程网络信息
  - netstat  -nlp| grep    端口号                                     功能描述：查看网络端口占用情况      

- 选项说明

  | 选项 |                         功能                         |
  | :--: | :--------------------------------------------------: |
  |  -a  | 显示所有正在监听（listen）和未监听的套接字（socket） |
  |  -n  |          拒绝显示别名，能显示数字全显示数字          |
  |  -l  |               仅列出在监听的服务器状态               |
  |  -p  |                表示显示那个进程在调用                |

- 实际操作

```
[root@hadoop100 ~]# netstat -anp | grep sshd
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1095/sshd           
tcp6       0      0 :::22                   :::*                    LISTEN      1095/sshd           
unix  3      [ ]         STREAM     CONNECTED     26626    1095/sshd     
```



#### 5.11 crontab 系统定时任务



##### 5.11.1 crontab 服务管理

1. 重新启动crond服务

```
[root@hadoop100 ~]# systemctl restart crond.service 
```





##### 5.11.2 定时任务设置

- crontab [选项]



- 选项说明

| 选项 |             功能              |
| :--: | :---------------------------: |
|  -e  |     编辑 crontab 定时任务     |
|  -l  |       查询crontab 任务        |
|  -r  | 删除当前用户所有的crontab任务 |



- 实际操作

```
[root@hadoop100 ~]# crontab -l
no crontab for root
```



```
[root@hadoop100 ~]# crontab -e
```

​	进入crontab编辑页面，会打开vim编辑你的工作

​                  *********执行的任务

|    项目     |        含义        |           范围            |
| :---------: | :----------------: | :-----------------------: |
| 第一个“ * ” |  一小时的第几分钟  |           0-59            |
| 第二个“ * ” | 一天中的第几个小时 |           0-23            |
| 第三个“ * ” |  一个月中的第几天  |           1-31            |
| 第四个“ * ” |  一年中的第几个月  |           1-12            |
| 第五个“ * ” |   一周中的星期几   | 0-7  （0和7都代表星期日） |



特殊符号



| 特殊符号 |                             含义                             |
| :------: | :----------------------------------------------------------: |
|    *     | *代表任何时间。比如第一个“ * ”就代表一小时中每分钟都执行一次的意思 |
|    ，    | 代表连续的时间范围。比如 “0  8，12，16命令”， 代表在每天的8点0分，12点0分，16点0分都执行一次命令 |
|    -     | 代表连续的时间范围。比如“05 * * 1-6命令”，代表周一到周六的凌晨5点0分执行命令 . |
|   */n    | 代表每隔多久执行一次。比如“*/10 * * * * 命令”，代表每隔10分钟就执行一遍命令< |



- 实际操作

```
[root@hadoop100 ~]# crontab -l
*/1 * * * * echo "hello crontab " >> /root/hello

```





### 6.软件包管理



#### 6.1 RPM



##### 6.1.1 RPM概述

RPM ( RedHat Package Manager)，RedHat软件包管理工具，类似windows 里面的setup.exe是Linux这系列操作系统里面的打包安装工具，它虽然是RedHat的标志，但理念是通用的。
RPM包的名称格式4
Apache-1 .3.23-11.i386.rpm

“apache"软件名称

“13.23-11”软件的版本号，主版本和此版本

“i386”是软件所运行的硬件平台，Intel 32位处理器的统称

“rpm”文件扩展名，代表RPM包



##### 6.1.2 rpm -qa 查询

- 基本语法
  - rpm -qa                                                                   功能描述：查询所安装的所有rpm软件包
- 经验技巧
  - 由于软件包比较多，一般会采用过滤，rpm -qa | grep  rpm 软件包
- 实际操作

```
[root@hadoop100 ~]# rpm -qa | grep firefox
firefox-68.10.0-1.el7.centos.x86_64
```



##### 6.1.3 rpm -e 卸载

- 基本语法
  - rpm -e   RPM软件包                                                      功能描述：卸载软件包
  - rpm -e --nodeps 软件包                                                功能描述：不检查依赖直接卸载 ，可能会影响软件使用



- 实际操作

```
[root@hadoop100 ~]# rpm -qa firefox
firefox-68.10.0-1.el7.centos.x86_64
[root@hadoop100 ~]# rpm -e firefox
```



##### 6.1.4 rpm -ivh 安装

- 基本语法
  - rpm -ivh  完整包名
- 选项说明

|  名称   |          功能          |
| :-----: | :--------------------: |
|   -i    |      -install下载      |
|   -v    | -verbose，显示详细信息 |
|   -h    |    -hash 显示进度条    |
| -nodeps |    安装前不检查依赖    |



- 实际操作

```
[root@hadoop100 Packages]# ls | grep firefox
firefox-68.10.0-1.el7.centos.x86_64.rpm
[root@hadoop100 Packages]# rpm -ivh firefox-68.10.0-1.el7.centos.x86_64.rpm
```



#### 6.2 YUM仓库配置

##### 6.2.1 YUM概述

YUM (全称为Yellow dog Updater, Modified)是一个在Fedora和RedHat以及CentOS中的Shell 前端软件包管理器。基于RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软件包，无须繁琐地一-次次下载、安装，



##### 6.2.2 YUM常用命令

- 基本语法

  - yum [选项] [参数]

- 选项说明

  | 选项 |        说明        |
  | :--: | :----------------: |
  |  -y  | 无视风险继续安装 🐶 |



- 参数说明

  |     参数     |             功能              |
  | :----------: | :---------------------------: |
  |   install    |         安装rpm软件包         |
  |    update    |         更新rpm软件包         |
  | check-update | 检查是否可有用的更新rpm软件包 |
  |    remove    |      删除指定的rpm软件包      |
  |     list     |        显示软件包信息         |
  |    clear     |       清除yum过期的缓存       |
  |   deplist    |  显示yum软件包的所有依赖关系  |



- 实际操作

  ```
  [root@hadoop100 Packages]# yum list | grep firefox
  firefox.x86_64                              68.10.0-1.el7.centos       @anaconda
  firefox.i686                                102.9.0-3.el7.centos       updates  
  firefox.x86_64                              102.9.0-3.el7.centos       updates  
  [root@hadoop100 Packages]# yum remove firefox
  删除:
    firefox.x86_64 0:68.10.0-1.el7.centos                                                                    完毕！
  [root@hadoop100 Packages]# yum list | grep firefox
  firefox.i686                                102.9.0-3.el7.centos       updates  
  firefox.x86_64                              102.9.0-3.el7.centos       updates  
  [root@hadoop100 Packages]# yum -y install firefox
  ```



##### 6.2.3 YUM 配置数据源

1. 安装wget

```
yum install -y wget
```

2. 备份

```
cd /etc/yum.repos.d/
mv CentOS-Base.repo CentOS-Base.repo.back
```

3.下载alias镜像

```
wget -O CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
```

4. 重新加载yum

```
yum clean all
yum makecache
```



### 7.克隆虚拟机



 #### 7.1 克隆

1. 从现有虚拟机(关机状态)克隆出新虚拟机，右键选择管理=>>克隆

![image-20230416170233152](..\linux-study\imgs\image-20230416170233152.png)

2.创建完整克隆

![image-20230416170718036](..\linux-study\imgs\image-20230416170718036.png)



重新配置IP地址

```
[root@hadoop100 ~]# vim /etc/sysconfig/network-scripts/ifcfg-ens33 
```



 重启动IP地址

```
[root@hadoop100 ~]# systemctl restart network
```



配置用户名称

```
[root@hadoop100 ~]# hostnamectl set-hostname hadoop101
```





## shell

Shell是一个命令行解释器，它接收应用程序/用户命令，然后调用操作系统内核。

![image-20230416175714176](..\linux-study\imgs\image-20230416175714176.png)

Redhat 的centOS7 shell的解析器就是bash



### 1.0 shell脚本

- 脚本格式

  - 脚本以#!/bin/bash 开头      指定脚本解析器  bash 可以简写sh

    ```
    lrwxrwxrwx. 1 root root          4 3月  19 19:55 sh -> bash
    ```

​	

- 第一个脚本：hello world

  - 需求：创建一个shell脚本，输出hello world
  - 实例案例：

  ```
  #编写hello.th
  #!/bin/bash
  echo "hello, world"                  
  ```

  

- 启动脚本
- 基本语法
  - bash   脚本路径                          父子shell  启动脚本后可能影响不到父shell
  - sh        脚本路径                         父子shell   启动脚本后可能影响不到父shell
  - ./ 脚本名称                                    需要开启x权限    没有父子shell的限制  
  - source   脚本路径                          没有父子shell的限制  
  - . 脚本路径                                           是. 命令   没有父子shell的限制  

```
[root@hadoop100 shell_script]# sh /shell_script/hello.th 
hello, world

```



- 第二种方式 常用

  - 开启权限     开启文本的执行权力

     ```
    [root@hadoop100 shell_script]# chmod u+x hello.th 
    
    [root@hadoop100 shell_script]# ll
    -rwxr--r--. 1 root root 32 4月  17 11:23 hello.th
    
    ```

  - 直接运行该文本

    - 相对路径需要加 ./

    ```
    [root@hadoop100 shell_script]# ./hello.th 
    hello, world
    ```

    

  什么是父子shell

  原因：

  1. 前bash和sh都是在当前shell中打开一个子shell来执行脚本内容，当脚本内容结束，则子shell关闭，回到父shell中。

  

  2. 第三种，也就是使用在脚本路径前加“ . ”或者source 的方式，可以使脚本内容在当前shell里执行，而无需打开子shel!这也是为什么我们每次要修改完/etc/profile文件以后，需要source一下的原因。

  

  3. 开子shell与不开子shell的区别就在于，环境变量的继承关系，如在子shell中设置的当前变量，父shell 是不可见的。

  ```
  [root@hadoop100 shell_script]# ps -f
  #只有一个-bash
  UID         PID   PPID  C STIME TTY          TIME CMD
  root       2472   2466  0 10:57 pts/1    00:00:00 -bash
  root       3603   2472  0 12:01 pts/1    00:00:00 ps -f
  #开启一个自bash 2472 
  [root@hadoop100 shell_script]# bash
  [root@hadoop100 shell_script]# ps -f
  UID         PID   PPID  C STIME TTY          TIME CMD
  root       2472   2466  0 10:57 pts/1    00:00:00 -bash
  root       3604   2472  1 12:01 pts/1    00:00:00 bash
  root       3637   3604  0 12:01 pts/1    00:00:00 ps -f
  #运行脚本
  [root@hadoop100 shell_script]# bash hello.th 
  hello, world
  #退出自shell
  [root@hadoop100 shell_script]# exit
  exit
  [root@hadoop100 shell_script]# 
  
  
  ```





### 2.0 变量



#### 2.1 系统预定变量

- 常用系统变量

  ​	$HOME, $PWD, $SHELL,$USER 等

- 案例实操

  - 查看系统变量的值

  ```
  [root@hadoop100 shell_script]# cat hello.th 
  #!/bin/bash
  echo "$HOME"                    #输出结果 /root
  echo "$USER"                    #输出结果 root
  echo "$SHELL"                   #输出结果 /bin/bash
  echo "$PWD"                     #输出结果 /shell_script
  ```

- 查看全局变量

  - env                                                                       只能看见系统的全局变量    environment简写env 
  - printenv   变量名称全大写  不需要$                 打印该变量



- 查看全局变量和函数
  - set



#### 2.2自定义环境变量

##### 2.2.1 定义局部变量

- 基本语法
  - 定义变量：变量名=变量值， **注意，=号前后不能有空格**
  - 撤销变量：unset  变量名        **可以在任何子目录下撤销变量**
  - 声明静态变量：redonly 变量，注意不能unset
  - 变量名称尽量小写 我大写会出问题不知道为什么



- 变量定义规则

  (1)变量名称可以由字母、数字和下划线组成，但是不能以数字开头，环境变量名建议大写。

  (2)等号两侧不能有空格

  (3)在bash中，变量默认类型都是字符串类型，无法直接进行数值运算。

  (4)变量的值如果有空格，需要使用双引号或单引号括起来。



- 实际技巧
  - 我发现在子bash里面定义的局部变量只能子bash可以访问，注意创建变量的位置

- 实际操作
  - 这种方式定义的变量为局部变量

```
[root@hadoop100 ~]# echo $my_var

[root@hadoop100 ~]# my_var=hello

[root@hadoop100 ~]# set | grep my_var
my_var=hello

[root@hadoop100 ~]# echo $my_var
hello
#局部变量的证明
[root@hadoop100 ~]# bash
[root@hadoop100 ~]# ps -f
UID         PID   PPID  C STIME TTY          TIME CMD
root       3394   3390  0 20:28 pts/1    00:00:00 -bash
root       3518   3394  1 20:36 pts/1    00:00:00 bash
root       3551   3518  0 20:36 pts/1    00:00:00 ps -f
[root@hadoop100 ~]# echo $my_var

[root@hadoop100 ~]# exit
exit
[root@hadoop100 ~]# ps -f
UID         PID   PPID  C STIME TTY          TIME CMD
root       3394   3390  0 20:28 pts/1    00:00:00 -bash
root       3553   3394  0 20:36 pts/1    00:00:00 ps -f
[root@hadoop100 ~]# echo $my_var 
hello

#声明静态变量
[root@hadoop100 shell_script]# readonly a=1
[root@hadoop100 shell_script]# echo $a
1
[root@hadoop100 shell_script]# a=12
bash: a: 只读变量
```



##### 2.2.2 提升作用域

- 基本语法
  - export 变量名



- 经验提示
  - **在子bash中修改变量 只能作用于子bash中不会影响到外部的bash**
- 实际操作

```
[root@hadoop100 ~]# ps -f
UID         PID   PPID  C STIME TTY          TIME CMD
root       3394   3390  0 20:28 pts/1    00:00:00 -bash
root       3604   3394  0 20:41 pts/1    00:00:00 ps -f
[root@hadoop100 ~]# echo $my_var 
hello
[root@hadoop100 ~]# bash
[root@hadoop100 ~]# ps -f
UID         PID   PPID  C STIME TTY          TIME CMD
root       3394   3390  0 20:28 pts/1    00:00:00 -bash
root       3606   3394  0 20:41 pts/1    00:00:00 bash
root       3639   3606  0 20:41 pts/1    00:00:00 ps -f
[root@hadoop100 ~]# echo $my_var

[root@hadoop100 ~]# exit
exit
[root@hadoop100 ~]# ps -f
UID         PID   PPID  C STIME TTY          TIME CMD
root       3394   3390  0 20:28 pts/1    00:00:00 -bash
root       3652   3394  0 20:42 pts/1    00:00:00 ps -f
#提升作用域
[root@hadoop100 ~]# export my_var
[root@hadoop100 ~]# bash
[root@hadoop100 ~]# ps -f
UID         PID   PPID  C STIME TTY          TIME CMD
root       3394   3390  0 20:28 pts/1    00:00:00 -bash
root       3657   3394  0 20:42 pts/1    00:00:00 bash
root       3686   3657  0 20:42 pts/1    00:00:00 ps -f
[root@hadoop100 ~]# echo $my_var 
hello

```

- 作用域的展示
  - my-var 为全局作用域
  -  new_var 为子bash的作用域

```
[root@hadoop100 shell_script]# ps -f
UID         PID   PPID  C STIME TTY          TIME CMD
root       3394   3390  0 20:28 pts/1    00:00:00 -bash
root       4182   3394  0 21:09 pts/1    00:00:00 ps -f
[root@hadoop100 shell_script]# echo $my_var 
hello
[root@hadoop100 shell_script]# bash
[root@hadoop100 shell_script]# new_var="我是子bash中的局部变量"
[root@hadoop100 shell_script]# ps -f
UID         PID   PPID  C STIME TTY          TIME CMD
root       3394   3390  0 20:28 pts/1    00:00:00 -bash
root       4198   3394  0 21:10 pts/1    00:00:00 bash
root       4226   4198  0 21:10 pts/1    00:00:00 ps -f
[root@hadoop100 shell_script]# vim hello.th 
[root@hadoop100 shell_script]# ./hello.th 
hello, world
hello

[root@hadoop100 shell_script]# source hello.th 
hello, world
hello
我是子bash中的局部变量
[root@hadoop100 shell_script]# exit 
exit
[root@hadoop100 shell_script]# ps -f
UID         PID   PPID  C STIME TTY          TIME CMD
root       3394   3390  0 20:28 pts/1    00:00:00 -bash
root       4256   3394  0 21:12 pts/1    00:00:00 ps -f
[root@hadoop100 shell_script]# ./hello.th 
hello, world
hello

[root@hadoop100 shell_script]# . hello.th 
hello, world
hello
我是子bash中的局部变量

#提升作用域的方法
[root@hadoop100 shell_script]# ps -f
UID         PID   PPID  C STIME TTY          TIME CMD
root       3394   3390  0 20:28 pts/1    00:00:00 -bash
root       4356   3394  0 21:19 pts/1    00:00:00 ps -f
[root@hadoop100 shell_script]# export new_var
[root@hadoop100 shell_script]# ./hello.th 
hello, world
hello
我是子bash中的局部变量
[root@hadoop100 shell_script]# bash
[root@hadoop100 shell_script]# ./hello.th 
hello, world
hello
我是子bash中的局部变量

            
```



 hello.th 中的配置

```
#!/bin/bash
echo "hello, world"
echo $my_var
echo $new_var
~  
```



#### 2.3 特殊变量

##### 2.3.1$n

- 基本语法

  $n  功能描述: n为数字，$0 代表该脚本名称，$1-$9代表第一 到第九个参数， 十以上的参数，十以上的参数需要用大括号包含，如${10})  



- 实际操作

  - 编写shell脚本  “ ' ' ” 单引号会把$n当初字符串解析

  ```
  #!/bin/bash
  echo '===================$n==========================='
  echo script name: $0
  echo 1parame: $1
  echo 2parame: $2
  
  ```
  - 开启权限

    ```
    [root@hadoop100 shell_script]# chmod u+x parameter.sh 
    ```

  - 运行脚本

    ```
    [root@hadoop100 shell_script]# ./parameter.sh abc efg
    ===================$n===========================
    script name: ./parameter.sh
    1parame: abc
    2parame: efg
    
    ```

    

##### 2.3.2 $#

- 基本语法

  - $#                      功能描述: 获取所有输入参数个数，常用于循环，判断参数的个数是否正确以及加强脚本的健壮性。

  

- 实际操作

  - 编写shell脚本

  ```
  #!/bin/bash
  echo '===================$n==========================='
  echo script name: $0
  echo 1parame: $1
  echo 2parame: $2
  echo '===================$#==========================='
  echo parame number: $#
  
  ```

  - 测试

  ```
  
  [root@hadoop100 shell_script]# ./parameter.sh 
  ===================$n===========================
  script name: ./parameter.sh
  1parame:
  2parame:
  ===================$#===========================
  parame number: 0
  
  [root@hadoop100 shell_script]# ./parameter.sh abc aa
  ===================$n===========================
  script name: ./parameter.sh
  1parame: abc
  2parame: aa
  ===================$#===========================
  parame number: 2
  
  ```



##### 2.2.3 $* / $@




- 基本语法

  - $*                                     功能描述:  这个变量代表命令行中所有的参数，**$*把所有的参数看成一一个整体**
  - $@                                    功能描述:  这个变量也代表命令行中所有的参数,**不过$@把每个参数区分对待**

- 实际操作

  ```
  [root@hadoop100 shell_script]# cat parameter.sh 
  #!/bin/bash
  echo '===================$n==========================='
  echo script name: $0
  echo 1parame: $1
  echo 2parame: $2
  echo '===================$#==========================='
  echo parame number: $#
  echo '===================$*==========================='
  echo $*
  echo '===================$@==========================='
  echo $@
  
  
  [root@hadoop100 shell_script]# ./parameter.sh a b
  ===================$n===========================
  script name: ./parameter.sh
  1parame: a
  2parame: b
  ===================$#===========================
  parame number: 2
  ===================$*===========================
  a b
  ===================$@===========================
  a b
  
  ```



##### 2.2.4 $?

* 基本语法

  * $?            功能描述:最后一次执行的命令的返回状态。如果这个变量的值为0，证明上一个命令正确执行;如果这个变量的值为非0 (具体是哪个数，由命令自己来决定)，则证明上一一个命令执行不正确了

* 实际操作

  ```
  #上面语句正常运行则为0
  [root@hadoop100 shell_script]# echo $?
  0      
  
  [root@hadoop100 shell_script]# paramter.sh
  bash: paramter.sh: 未找到命令...
  [root@hadoop100 shell_script]# echo $?
  127
  
  ```



### 3.0 运算符

- 基本语法

  - "$((运算式))"   或 "$[运算式]"

- 实际案例

  - （2+3）*4

  ```
  [root@hadoop100 shell_script]# echo "$(((3+4)*4))"
  28
  
  ```

- 小案例

  - add.sh  完成两数相加

  ```
  [root@hadoop100 shell_script]# ./add.sh 20 30
  sum= 50
  
  [root@hadoop100 shell_script]# cat add.sh 
  
  #!/bin/bash
  sum=$[$1 + $2]
  echo sum= $sum
  ```



### 4.0 条件判断

- 基本语法
  - test condition
  - [ condition ]                                                                 **注意：前后要有空格**



- 实际案例                                     0为ture         1为false

```

[root@hadoop100 shell_script]# a=hello
[root@hadoop100 shell_script]# test $a = hello
[root@hadoop100 shell_script]# echo $?
0

[root@hadoop100 shell_script]# a=linux
[root@hadoop100 shell_script]# test $a = hello
[root@hadoop100 shell_script]# echo $?
1

```



- 简写方式                           注意[  ] 前后都要有空格        等于前后也要有空格
  - 实际技巧  [    ] 为false           [字符串]     为true

```
[root@hadoop100 shell_script]# [ $a = linux ]
[root@hadoop100 shell_script]# echo $?
0

```

##### 4.2常用的条件判断

- 两个整数比较
  

-eq等于(equal)               																-ne不等于(not equal) 

-lt小于(less than)																			-le 小于等于(less equal) 

-gt大于(greater than) 	   															-ge大于等于(greater equal)



注:如果是字符串之间的比较，用等号“=”判断相等;用“!=”判断不等。



- 按照文件权限进行判断、

  -r有读的权限(read) 
  
  -w有写的权限(write)
  
  -x .有执行的权限(execute) 
  
- 按照文件类型进行判断
  
    -e文件存在( existence) 
    
    -f文件存在并且是一个常规的文件(file) 
    
    -d文件存在并且是一个目录(directory) 



- 实际操作举例

```
[root@hadoop100 shell_script]# echo $?
0
```



- 多条件判断

  - &&表示前一条命令成功才运行下一条语句，||表示上一条语句执行失败之后才执行一条语句
  - && 可以简写为 -a （and）                            || 可以简写为-o （or）

      ```
      [root@hadoop100 ~]# [  ] && echo ok || echo NOok
      NOok
      [root@hadoop100 ~]# [ wmt ] && echo ok || echo NOok
      ok
      ```
  
  
  
    ```
  
  #加上if判断
  [root@hadoop100 shell_script]# a=20
  [root@hadoop100 shell_script]# if [ $a -gt 18 ] && [ $a -lt 36 ]; then echo ok;fi
  ok
  #简写
  [root@hadoop100 shell_script]# if [ $a -gt 18 -a $a -lt 36 ]; then echo ok;fi
  ok
    ```



### 5.0 流程控制



#### 5.1 if判断

- 基本语法

  - 单分支

    ```
    if [ 条件判断式 ];then
    	程序
    fi
    
    
    if [ 条件判断式 ]
    then
    	程序
    fi

    
    ```
    
  - 多分支
  
    ```
      #基本语法
      if [ 条件判断式 ]
      then
      	程序
    elif[ 条件判断式 ]
      then
    	程序
      else
        	程序
      fi	
      
        #实际操作
      [root@hadoop100 shell_script]# ./if_age.sh 40
      中年
      [root@hadoop100 shell_script]# ./if_age.sh 25
      青年
      [root@hadoop100 shell_script]# cat if_age.sh 
      #!/bin/bash
    
      if [ $1 -lt 18 ]
      then
      	echo  少年
    
      elif [ $1 -le 25 -a $1 -ge 18 ]
      then	
      	echo 青年
      elif [ $1 -gt 25 -a $1 -lt 50 ]
      then	
      	echo 中年
      else
      	echo 老年  
      fi
    ```
  
    





- 实际操作  

    #!/bin/bash
    
    if [ $1 = wmt ]
    then
            echo welcome,wmt
    else
            echo erro
    fi                
    ```
      
    运行
      
    ```
    [root@hadoop100 shell_script]# ./if.sh 
    ./if.sh: 第 3 行:[: =: 期待一元表达式
    erro
    [root@hadoop100 shell_script]# ./if.sh wmt
    welcome,wmt
    
    ```
      
    解决报错
      
    ```
    #!/bin/bash
    
    if [ "$1"x = "wmt"x ]
    then
            echo welcome,wmt
    else
            echo erro
    fi
             
    
    ```
    
    ```


​    

#### 5.2 case语句

- 基本语法

  ```
  case $变量名 in
  值1)
  	如果变量的值等于值1，则执行程序1
  ;;
  值2)
  	如果变量的值等于值2，则执行程序2
  ;;
  *)
  	如果变量的值都不等于以上值，则执行此语句
  ;;
  esac
  ```

- 实际操作

````
#使用case方式来判断

case $2 in
18 )
	echo 18
;;
50 )
	echo 50
;;
* ) 
	echo  默认default
;;
esac 
````



#### 5.3for 循环

- 基本语法

  ```
  for ((初始值;循环判断条件;变量变化))
  do
  	程序
  done
  ```

- 实际操作

  - sum=$[ $sum + $i ]               赋值不需要$  使用需要加$

```
#!/bin/bash
sum=0
for((i=1;i<=100;i++))
do
         sum=$[ $sum + $i ]
done
echo $sum


[root@hadoop100 shell_script]# ./for.sh 
5050

```



- 基本语法2

  ```
  for 变量 in 值1,值2,值3 .....
  do
  	程序
  done
  ```

  

- 实际操作

  ```
  for os in linux, window, macos;
  do
          echo $os
  done
  
  ```

  ```
  #!/bin/bash
  sum=0
  for i in (1..100);
  do
           sum=$[ $sum + $i ]
  done
  echo $sum
  ```

  

#### 5.4while

- 基本语法

  ```
  while [ 条件判断 ]
  do 
  	程序
  done
  ```

- 实际操作

  ```
  a=1
  while [ $a -le $1 ]
  do
          sum=$[ $sum + $a ]          #$sum必须第一个才可以不知道为什么
          a=$[ $a + 1 ]
  done
  echo $sum
  
  ```

- let 的简化写法

```
while [ $a -le $1 ]
do
        let sum+=a
        let a++
done
echo $sum

```



### 6.0 read读取控制台输入

- 基本语法

  - read [选项] 参数
  - 选项声明
    - -p                                           指定读取值时的提示符
    - -t                                            指定读取值等待的时间（秒）如果：不加表示一直等待
  - 参数
    - 变量 ：           指定读取值的变量名称

- 实际案例

  ```
  #!/bin/bash
  read -t 10 -p "输入名称"  name
  echo "welcome, $name "                            
  ```





### 7.0 函数

#### 7.1系统函数

- 基本语法
  
- $( 系统命令)
  
- 小Tisp

  - 注意不能有空格要有空格必须要有单引号    函数在shell脚本中使用需要加$( )

  ```
  #!/bin/bash
  filename="$1"_log_$(date +%s)
  echo    $filename               
  ```

##### 7.1.1 basename

- 基本语法
  - basename [string / pathname] [suffix](功能描述: basename 命令会删掉所有的前缀包括最后一个(“/') 字符，然后将字符串显示出来。
    - basename可以理解为取路径里的文件名称
  - 选项: 
    - suffix为后缀,如果suffix被指定了,basename会将pathname或string中的suffix去掉。



- 实际案例
  - /shell_script/wmt_log.txt  去掉前面的路径和后缀

```
[root@hadoop100 shell_script]# basename /shell_script/wmt_log.txt .txt
wmt_log

```



##### 7.1.2dirname

- 基本语法
  - dirname       文件绝对路径
    - (功能描述 :    从给定的包含绝对路径的文件名中去除文件名(非目录的部分)，然后返回剩下的路径( 目录的部分) dirname可以理解为取文件路径的绝对路径名称。

  

- 实际案例

  - 获取绝对路径

  ```
  #!/bin/bash
  echo '===================$n==========================='
  echo script name: $(basename $0 .sh)
  cd $(dirname $0)
  echo path: $(pwd) 
  
  ```

  



### 7.2 自定义函数

- 基本语法

   []表示可选择

  ```
  [ funcation ] funname [( )]
  {
  	Action
  	[returm int;]
  }
  ```



- 经验技巧
  1. 必须在调用函数地方之前，先声明函数，shell脚本是逐行运行。不会像其它语言一样先编译。
     2. 函数返回值，只能通过$?系统变量获得，可以显示加: return 返回，如果不加，将以最后一条命 令运行结果，作为返回值。return 后跟数值n(0-255)



- 实际操作

```
[root@hadoop100 shell_script]# cat fun_test.sh 
#!/bin/bash
function sum(){
	sum=$[ $1 + $2 ]
	echo "和为"$sum
}

read -p "请输入一个整数 " a

read -p "请输入一个整数 " b

sum $a $b

[root@hadoop100 shell_script]# ./fun_test.sh 
请输入一个整数 15
请输入一个整数 25
和为40

```



替换return的方法

```
#!/bin/bash
function add(){
        sum=$[$1 + $2]
        echo $sum           #当return用  return 后跟数值n(0-255)
}

read -p "请输入一个整数 " a

read -p "请输入一个整数 " b

s=$(add $a $b)
echo "和为" $s

```





### 8.0 正则表达式

​    	正则表达式使用单个字符串来描述、匹配一系列符合某个语法规则的字符串。在很多文本编辑器里，正则表达式通常被用来检索、替换那些符合某个模式的文本。在Linux 中，grep,sed,awk等文本处理工具都支持通过正则表达式进行模式匹配。



#### 8.1 常规匹配

一种不包含特殊字符的正则表达式匹配它自己，列如：

```
[root@hadoop111 sbin]#  ls | grep service
```



#### 8.2 常用特殊字符

- 特殊字符： ^

  ^匹配一行的开头， 例如：

  ```
  [root@hadoop111 sbin]#  ls | grep ^e
  ```

- 特殊字符：$

  $匹配一行的结束，例如：

  ```
  [root@hadoop111 sbin]#  ls | grep t$
  ```

- 特殊字符：^$

  ^$匹配空行     -n显示行号

  ```
  [root@hadoop111 sbin]#  ls | grep -n ^$
  ```

- 特殊字符：.

  ​	. 匹配一个任意的字符，例如：

  ```
  [root@hadoop111 sbin]#  ls | grep r..b
  ```

  ​    比如： roob rait

- 特殊字符：*

  *不单独使用，他和上一个字符连用，表示匹配上一个字符0次或多次，例如：

  ```
  [root@hadoop111 sbin]#  ls | grep r*b
  ```

  比如：rob  roob rooob

- 特殊字符：.*

  匹配任意字符串，例如：

  ```
  [root@hadoop111 sbin]#  ls | grep ^r.*b$
  ```

- 字符区间（中括号）： []

  1.  []表示匹配某个范围内的一个字符，例如：
  2. [6,8]                                 匹配6和8
  3. [0-9]                                 匹配一个0到9的数字
  4. [0-9]*                               匹配任意长度的数字字符串
  5. [a-z]                                  匹配一个a到z之间的字符
  6. [a-z]*                                匹配任意长度的字母字符串
  7. [a-c,e-f]                             匹配a-c或者e-f之间的任意字符

- 实际操作

  ```
  [root@hadoop100 shell_script]# cat daily_archive.sh | grep e[i,x]*t
  	exit
  
  ```

- 实际经验

  - 如果要筛选 $                   则需要转义 \并且加上单引号

  ```
  [root@hadoop100 shell_script]# cat daily_archive.sh | grep '\$'
  ```

  匹配手机号

  ```
  [root@hadoop100 shell_script]#  echo "13518452343" | grep -E ^1[34578][0-9]{9}$
  13518452343
  
  ```



### 9.0 文本处理工具

#### 9.1cut

cut的工作就是“剪”，具体的说就是在文件中负责剪切数据用的。cut命令从文件的每一行剪切字节、字符和字段并将这些字节、字符和字段输出。



- 基本语法

  - cut   [选项参数]  fliename
  - 说明默认分隔符是制表符

- 选项说明

  | 选项参数 |                      功能                      |
  | :------: | :--------------------------------------------: |
  |    -f    |                列号，提取第几列                |
  |    -d    | 分隔符，按照指定分隔符分割列，默认是制表符”\t“ |
  |    -c    |    按字符进行切割，后加n表示第几列 比如-c 1    |

- 实际案例

  

  1. 按照 空格分割 第一列

```
[root@hadoop100 shell_script]# cat cut.txt | cut -d " " -f 1 cut.txt 
1
a
```

2. 按照 空格分割 第一列和第二列

```
[root@hadoop100 shell_script]# cat cut.txt | cut -d " " -f 1,2 cut.txt 
1 2
a b
```

3. 分割三列之前                       之后是3-

```
[root@hadoop100 shell_script]# cat cut.txt  | cut -d " " -f -3 cut.txt 
1 2
a b

```



#### 9.2awk

一个强大的文本分析工具，把文件逐行的读入，以空格为默认分隔符将每行切片，切开的部分再进行分析处理。



- 基本语法

  - awk [选项参数] '/pattern1/{action1}  /pattern2/{action2}  ....' filename
  - pattern: 表示awk 在数据查找中的内容，就是匹配模式
  - action： 在找到匹配内容时所执行的一系列命令

- 选项参数

  

| 选项参数 |         说明         |
| :------: | :------------------: |
|    -F    |  指定输入文件分隔符  |
|    -v    | 赋值一个用户定义变量 |

- 实际操作
  - 不使用awk操作比较复杂

```
[root@hadoop100 shell_script]# cat /etc/passwd | grep ^root
root:x:0:0:root:/root:/bin/bash
[root@hadoop100 shell_script]# cat /etc/passwd | grep ^root | cut -d ":" -f 7
/bin/bash
```

- 使用awk 获取第第7列分割

```
[root@hadoop100 shell_script]# cat /etc/passwd | awk -F ":" '/^root/{print $7}'
/bin/bash

```

- 使用awk 获取第6列和第7列并且以，分割

```
[root@hadoop100 shell_script]# cat /etc/passwd | awk -F ":" '/^root/{print $6","$7}'
/root,/bin/bash
```

- 在文件前后添加行
  - BEGIN 在文件筛选前                                                 BEGIN  {prin"   "}
  - END在文件结束时间                                                  END{print "    "}

```
[root@hadoop100 shell_script]# cat /etc/passwd | awk -F ":" 'BEGIN{print "user","shell"}{print $1","$7}END{print "END of flie"}'
user shell
xiaohong,/bin/bash
xiaolan,/bin/bash
END of flie

```



- awk -v  让所有打印出来的行号加一

```
[root@hadoop100 shell_script]# cat /etc/passwd | awk -F ":" -v i=1 '{print $3+i}'
1
2

```

##### 9.2.1 awk 内置命令



|   变量   |                  说明                  |
| :------: | :------------------------------------: |
| FILENAME |                文件名称                |
|    NR    |          已读的记录数（行号）          |
|    NF    | 浏览记录的域的个数（切割后，列的个数） |



- 案例实操

  - 统计passwd文件名，每行的行号，每行的列数

  ```
  [root@hadoop100 shell_script]#  awk -F ":" '{print "文件名称：" FILENAME , "行号:" NR , "列数"NF}' /etc/passwd
  文件名称：/etc/passwd 行号:1 列数7
  
  ```
  - 显示空行

  ```
  [root@hadoop100 shell_script]# ifconfig | awk '/^$/ {print "行号" NR}'
  行号9
  行号18
  
  ```





### 10综合应用案例

#### 10.1归档文件



自动归档

```
#!/bin/bash

#首先判断参数是否为一个

if [ $# -ne 1 ]
then
        echo "参数错误，应该输入一个参数为归档名称"
        exit
fi

#从参数中获取目录名称
if [ -d $1 ]
then
        echo
else
        echo
        echo"目录不存在"
        exit
fi

DIR_NAME=$(basename $1)
DIR_PATH=$(cd $(dirname $1); pwd)

# 获取当前日期
DATE=$(date +%y%m%d)

#定义归档名称
FILE=archive_${DIR_NAME}_$DATE.tar.gz
DEST=/root/archive/$FILE

# 开始归档

echo "开始归档..."
echo

tar -czf $DEST $DIR_PATH/$DIR_NAME

if [ $? -eq 0 ]
then
        echo "档成功"
        echo "归档文件为" $DEST
else
        echo"归档错误"
        echo
fi

exit   
```



- 启动定时任务
  - 0 2 * * * /shell_script/daily_archive.sh  /root/archive                  每天2点运行一次

```
[root@hadoop100 shell_script]# crontab -l
0 2 * * * /shell_script/daily_archive.sh  /root/archive

```





####  redis自动归档

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





