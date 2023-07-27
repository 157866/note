## Git

[TOC]



是一个免费的开源的分布式版本控制系统，



### 1.1何为版本控制

​					版本控制是一种记录文件内容变化，以便将来查阅特定版本修订情况的系统。

​					版本控制其实最重要的是可以记录文件修改历史记录，从而让用户能够查看历史版本。



### 1.2为什么需要版本控制

个人开发过度到团队合作





### 1.3版本控制工具

> 集中式版本控制  CVS  SVN

版本库是集中存放在中央服务器的，而干活的时候，用的都是自己的电脑，所以要先从中央服务器取得最新的版本，然后开始干活，干完活了，再把自己的活推送给中央服务器。中央服务器就好比是一个图书馆，你要改一本书，必须先从图书馆借出来，然后回到家自己改，改完了，再放回图书馆。



![img](https://pic3.zhimg.com/80/v2-9d93db6c1c5f4782d9f4c9365ea54afa_720w.webp)



集中式版本控制系统最大的缺点就是必须联网才能工作，如果在局域网内还好，带宽够大，速度够快，可如果在互联网上，遇到网速慢的话，可能提交一个10M的文件就需要5分钟。



> 分布式版本控制  Git 

首先，分布式版本控制系统根本没有“中央服务器”，每个人的电脑上都是一个完整的版本库，这样，你工作的时候，就不需要联网了，因为版本库就在你自己的电脑上。既然每个人电脑上都有一个完整的版本库，那多个人如何协作呢？比方说你在自己电脑上改了文件A，你的同事也在他的电脑上改了文件A，这时，你们俩之间只需把各自的修改推送给对方，就可以互相看到对方的修改了。

和集中式版本控制系统相比，分布式版本控制系统的安全性要高很多，因为每个人电脑里都有完整的版本库，某一个人的电脑坏掉了不要紧，随便从其他人那里复制一个就可以了。而集中式版本控制系统的中央服务器要是出了问题，所有人都没法干活了。

在实际使用分布式版本控制系统的时候，其实很少在两人之间的电脑上推送版本库的修改，因为可能你们俩不在一个局域网内，两台电脑互相访问不了，也可能今天你的同事病了，他的电脑压根没有开机。因此，分布式版本控制系统通常也有一台充当“中央服务器”的电脑，但这个服务器的作用仅仅是用来方便“交换”大家的修改，没有它大家也一样干活，只是交换修改不方便而已。



![img](https://pic3.zhimg.com/80/v2-47af0c90eebd830fc1e2dae21f33cc76_720w.webp)



### 1.4git和代码托管中心

代码托管中心是基于网络服务器的远程代码仓库，一般称为**远程库**

> 局域网

GitLab

> 互联网

GitHub（外网）

Gitee 码云（国内网站）



### 2.0 git常规指令



|               指令名称                |      作用      |
| :-----------------------------------: | :------------: |
| git config --global user.name  用户名 |  设置用户签名  |
|  git config --global user.email 邮箱  |  设置用户签名  |
|               git init                |  初始化本地库  |
|              git status               | 查看本地库状态 |
|           git add 文件名称            |  添加到缓冲区  |
|   git commit -m "日志信息"  文件名    |  提交到本地库  |
|              git reflog               |  查看历史记录  |
|        git rest --hard 版本号         |    版本穿梭    |
|                 clear                 |    清空页面    |

说明：首次使用git的时候要设置用户签名，否则无法提交代码，用户签名跟GitHub的或者其他托管代码中心的账号没有任何关系





### 2.1 git基本语法

#### **git init**

```
初始化本地库 第一次想使用git来管理就需要init
```



```

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo
$ git init
Initialized empty Git repository in C:/Users/wmt/Desktop/git-demo/.git/

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ ll
total 0

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ ll -a
total 20
drwxr-xr-x 1 wmt 197121 0 Jan 11 13:53 ./
drwxr-xr-x 1 wmt 197121 0 Jan 11 13:52 ../
drwxr-xr-x 1 wmt 197121 0 Jan 11 13:53 .git/

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$

```

​	ll无法查看隐藏文件

​	ll -a可以查看隐藏文件





#### git status



```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git status
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$

```



#### vim创建文件

 i进入编辑模式   esc退出编辑模式   ：wq保存

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ vim hello.txt

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ cat hello.txt
hello git two

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        hello.txt
        hellow.txt

nothing added to commit but untracked files present (use "git add" to track)

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)

```



####  git add hello.txt

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git add hello.txt
warning: in the working copy of 'hello.txt', LF will be replaced by CRLF the next time Git touches it

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   hello.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        hellow.txt


wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$

```

#### git add --all  目录名称

> 该目录里面的所有文件都会上传

```
34912@DESKTOP-E357TIF MINGW64 ~/Desktop/vue_work (master)
$ git add --all vue_work/
```





#### git rm --cached 文件名

> 去除

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git rm --cached hello.txt
rm 'hello.txt'

```



#### git commit -m "描述版本"  文件名

git commit -m "my frist commit" hello.txt

	> 要提交先add

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git add hello.txt
warning: in the working copy of 'hello.txt', LF will be replaced by CRLF the next time Git touches it

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git commit -m "my frist commit" hello.txt
warning: in the working copy of 'hello.txt', LF will be replaced by CRLF the next time Git touches it
[master (root-commit) f31f195] my frist commit
 1 file changed, 1 insertion(+)
 create mode 100644 hello.txt

```

####  git reflog

查看日志信息

```
$ git reflog
03ad6c9 (HEAD -> master) HEAD@{0}: commit: my next commit
f31f195 HEAD@{1}: commit (initial): my frist commit


```

#### git log

比git reflog更详细

```
$ git log
commit 03ad6c979802f867f0e13921670713e35fd0d971 (HEAD -> master)
Author: wmt <2849569455@qq.com>
Date:   Thu Jan 12 12:55:06 2023 +0800

    my next commit

commit f31f195fbc8ffb1c9febbb2504347e08898e067d
Author: wmt <2849569455@qq.com>
Date:   Thu Jan 12 12:49:54 2023 +0800

    my frist commit

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$


```



#### 修改并提交



```
$ vim hello.txt

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   hello.txt

no changes added to commit (use "git add" and/or "git commit -a")

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git add hello.txt
warning: in the working copy of 'hello.txt', LF will be replaced by CRLF the next time Git touches it

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   hello.txt


wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git commit -m "second commit" hello.txt
warning: in the working copy of 'hello.txt', LF will be replaced by CRLF the next time Git touches it
[master a519744] second commit
 1 file changed, 1 insertion(+), 1 deletion(-)

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)

```



### 2.2 版本穿梭

####  git reset --hard f31f195

> 先通过git reflog 来查看版本号通过 git reset --hard 版本号  来进行穿梭
>
> reset 调整
>
> head 指向

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git reflog
03ad6c9 (HEAD -> master) HEAD@{0}: reset: moving to 03ad6c9
a519744 HEAD@{1}: commit: second commit
03ad6c9 (HEAD -> master) HEAD@{2}: commit: my next commit
f31f195 HEAD@{3}: commit (initial): my frist commit

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git reset --hard f31f195
HEAD is now at f31f195 my frist commit

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git reflog
f31f195 (HEAD -> master) HEAD@{0}: reset: moving to f31f195
03ad6c9 HEAD@{1}: reset: moving to 03ad6c9
a519744 HEAD@{2}: commit: second commit
03ad6c9 HEAD@{3}: commit: my next commit
f31f195 (HEAD -> master) HEAD@{4}: commit (initial): my frist commit

```



### 2.3 分支的好处

同时并行推进多个功能开发，提高开发效率

各个分支在开发过程中，如果有一个分支开发失败也不会影响其他的分支，失败的分支删除重新开始即可



|      命令名称       |            作用            |
| :-----------------: | :------------------------: |
|  git branch 分支名  |          创建分支          |
|    git branch -v    |          查看分支          |
| git checkout 分支名 |          切换分支          |
|  git merge 分支名   | 指定的分支合并到当前分支上 |



#### git branch -v

> 查看分支

```

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git branch -v
* master a519744 second commit

```



#### git branch 分支名称

> 创建hot-fix的分支
>
> git branch hot-fix

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git branch hot-fix

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git branch -v
  hot-fix a519744 second commit
* master  a519744 second commit

```



#### git checkout 分支名称

> 切换分支
>
> git checkout hot-fix

```

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git checkout hot-fix
Switched to branch 'hot-fix'

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (hot-fix)

```



#### git merge hot-fix

> 合并分支
>
> 在当前master分支 去合并hot-fix分支

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git merge hot-fix
Updating a519744..fa9ea62
Fast-forward
 hello.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

```



#### 合并冲突

> 合并冲突产生的原因：
>
> ​		合并冲突时，两个分支在**同一文件的同一个位置**有两套完全不一样的修改，git无法决定需要人为决定新代码内容







> <<<<<<< HEAD 表示当前分支
>
> ​		当前分支代码
>
> ======= 分割
>
> ​		合并分支的代码
>
> ->>>>>> 合并的分支

打开的hello.txt文件夹

```
hello git two   1111111 test
hello git
hello git
hello git
hello git
hello git
hello git
hello git
<<<<<<< HEAD
hello git master test
hello git
=======
hello git
hello git hot-fix test
>>>>>>> hot-fix

```



1. 手动删除多余的代码

```
hello git two   1111111 test
hello git
hello git
hello git
hello git
hello git
hello git
hello git
hello git master test
hello git hot-fix test
```

2. 添加到本地占存区 git add hello.txt

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master|MERGING)
$ git add hello.txt
```

3. 执行提交（注意：此时使用git commit**命令不能带文件名**）

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master|MERGING)
$ git commit -m "merge hot-fix"
[master db344b0] merge hot-fix
---此时发现(master|MERGING)变成了(master)
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$

```



>  结果

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ cat hello.txt
hello git two   1111111 test
hello git
hello git
hello git
hello git
hello git
hello git
hello git
hello git master tes
hello git hot-fix test

```





### 3.0团队合作

#### git remote -v

> 查看别名

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git remote -v

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$
```



#### git remote add 别名  原名

> 创建别名



```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git remote add git-demo https://github.com/157866/git-demo.git

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git remote -v
git-demo        https://github.com/157866/git-demo.git (fetch)
git-demo        https://github.com/157866/git-demo.git (push)
```



#### git remote remove  名称

> 删除别名

```
34912@DESKTOP-E357TIF MINGW64 ~/Desktop/vue_work (master)
$ git remote remove vue-work
```



#### git push 别名 分支

> 第一次提交需要配置

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git config --global http.sslVerify false

```



```
$ git push git-demo master
warning: ----------------- SECURITY WARNING ----------------
warning: | TLS certificate verification has been disabled! |
warning: ---------------------------------------------------
warning: HTTPS connections may not be secure. See https://aka.ms/gcm/tlsverify for more information.
warning: ----------------- SECURITY WARNING ----------------
warning: | TLS certificate verification has been disabled! |
warning: ---------------------------------------------------
warning: HTTPS connections may not be secure. See https://aka.ms/gcm/tlsverify for more information.
warning: ----------------- SECURITY WARNING ----------------
warning: | TLS certificate verification has been disabled! |
warning: ---------------------------------------------------
warning: HTTPS connections may not be secure. See https://aka.ms/gcm/tlsverify for more information.
warning: ----------------- SECURITY WARNING ----------------
warning: | TLS certificate verification has been disabled! |
warning: ---------------------------------------------------
warning: HTTPS connections may not be secure. See https://aka.ms/gcm/tlsverify for more information.
Enumerating objects: 24, done.
Counting objects: 100% (24/24), done.
Delta compression using up to 12 threads
Compressing objects: 100% (19/19), done.
Writing objects: 100% (24/24), 1.98 KiB | 507.00 KiB/s, done.
Total 24 (delta 3), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (3/3), done.
To https://github.com/157866/git-demo.git
 * [new branch]      master -> master


```





####  git pull 别名 分支

注意：

​		push是将本地库的代码提交到远程库，如果本地库的代码和远程库的代码不一致，push操作会被拒绝的，也就是说要想push成功，必须保证本地库的代码比远程库的代码要高！因此一个成熟的程序员在修改本地的代码之前，一定会查看本地库和远程库的区别，**如果代码很落后了记着一定要先pull在修改在提交在推送！**



> 从服务器拉去代码更新到本地库
>
> git pull git-demo master
>
> git pull 	别名 	 分支

```
wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-demo (master)
$ git pull git-demo master
From https://github.com/157866/git-demo
 * branch            master     -> FETCH_HEAD
Updating db344b0..c7b9619
Fast-forward
 hello.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

```



#### git clone 链接

> 公开项目克隆不需要登陆
>
> $ git clone https://github.com/157866/git-demo.git
>
> 小结： clone会做的操作   1. 拉取代码  2. 初始化本地库 3. 创建别名

```

wmt@DESKTOP-LP70K01 MINGW64 ~/Desktop/git-clone
$ git clone https://github.com/157866/git-demo.git
Cloning into 'git-demo'...
remote: Enumerating objects: 27, done.
remote: Counting objects: 100% (27/27), done.
remote: Compressing objects: 100% (19/19), done.
remote: Total 27 (delta 4), reused 23 (delta 3), pack-reused 0
Receiving objects: 100% (27/27), done.
Resolving deltas: 100% (4/4), done.

```



#### 3.1 团队内合作

项目 >> setting  >> collaborators  >> 添加合作

![image-20230228204141394](.\imgs\gitee学习.png)



#### 3.2跨团队合作

搜索别人的项目>> fork 别人的项目



修改之后请求合并代码

![image-20230301201925607](.\imgs\image-20230301201925607.png)



不懂详情请看25级[25_尚硅谷_Git_GitHub_跨团队协作_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1vy4y1s7k6/?p=25&spm_id_from=pageDriver&vd_source=47fac834feccf2c84a782019aa120b81)



#### 3.3 SSH免密登录

1. 添加ssh免密登录

> ssh-keygen -t rsa -C 2849569455@qq.com 
>
> -t rsa 加密方式
>
> -C 加密对象

```

34912@DESKTOP-E357TIF MINGW64 ~/Desktop/gitee-study/git-demo (master)
$ ssh-keygen -t rsa -C 2849569455@qq.com
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/34912/.ssh/id_rsa):
Created directory '/c/Users/34912/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /c/Users/34912/.ssh/id_rsa
Your public key has been saved in /c/Users/34912/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:iOqDczcxudWLjA7xZentzwvxMG5tuvOKmUZ7wf7/fNw 2849569455@qq.com
The key's randomart image is:
+---[RSA 3072]----+
|                 |
|                 |
|                 |
|     . o         |
|  . ..=oS        |
|   +++oo+*       |
| .o .O.+=o+    ..|
|o.o.= =*==   .  E|
| o.+.o+.=B*o..o. |
+----[SHA256]-----+


```

2. 查看加密密钥

> C:\Users\34912\.ssh 
>
> 用户下的.ssh 复制里面的id_rsa.pub





3. 在GitHub添加免密登录

![image-20230301203610736](.\imgs\image-20230301203610736.png)



> 免密登录
>
> git push git@github.com:157866/git-demo.git master
>
> git push ssh免密链接

<img src=".\imgs\image-20230301205024236.png" alt="image-20230301205024236" style="zoom:70%;" />



```

34912@DESKTOP-E357TIF MINGW64 ~/Desktop/gitee-study/git-demo (master)
$ git push git@github.com:157866/git-demo.git master
The authenticity of host 'github.com (127.0.0.1)' can't be established.
ECDSA key fingerprint is SHA256:p2QAMXNIC1TJYWeIOttrVc98/R1BUFWu3/LiyKgUfQM.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'github.com' (ECDSA) to the list of known hosts.
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 4 threads
Compressing objects: 100% (8/8), done.
Writing objects: 100% (8/8), 255.71 KiB | 918.00 KiB/s, done.
Total 8 (delta 3), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (3/3), completed with 2 local objects.
To github.com:157866/git-demo.git
   6d578c4..cf1407f  master -> master

```



### IDEA 集成Git



#### 配置Git忽略文件

> 为什么要忽略这些文件？ 
>
> ​		与项目的实际功能无关，不参与项目的运行。把它忽略可以屏蔽掉IDEA中的差异



> 怎么忽略？
>
> ​		创建忽略文件规则  XXXX.ignore(前缀随便取，建议是git.ignore)

>  git.ignore配置文件
>
> 配置路径C:/Users/34912/git.ignore

```

# Compiled class file
*.class

# Log file
*.log

# BlueJ files
*.ctxt

# Mobile Tools for Java (J2ME)
.mtj.tmp/# Package Files #
*.jar
*.war
*.nar
*.ear
*.zip
*.tar.gz
*.rar

hs_err_pid*

.classpath
.project
.settings
target
.idea
*.iml
```



**使用配置**

> 路径C:/Users/34912/.gitconfig

```
[filter "lfs"]
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
[user]
	name = 157866
	email = 2849569455@qq.com
[core]
	excludesfile = C:/Users/34912/git.ignore

```



#### 定位Git程序

![image-20230301211248355](.\imgs\image-20230301211248355.png)



使用Git管理IDEA里面的项目



![image-20230302111307656](.\imgs\image-20230302111307656.png)



> 如何通过IDEA查看版本

![image-20230302112716450](.\imgs\image-20230302112716450.png)



```
下方;
	黄色的书签当前IDEA的位置
	绿色的书签表示当前分支
	紫色的书签表示当前路径
```

![image-20230302112820308](.\imgs\image-20230302112820308.png)

> 如何切换版本

![image-20230302113048486](.\imgs\image-20230302113048486.png)



#### 创建分支&切换分支

​	![image-20230302114553129](.\imgs\image-20230302114553129.png)

或者： 二选其一

![image-20230302114811960](.\imgs\image-20230302114811960.png)





切换分支

![image-20230302115131600](.\imgs\image-20230302115131600.png)



#### 合并分支

##### 正常合并



> 在当前master分支下合并hot-fix分支

![image-20230302115853672](.\imgs\image-20230302115853672.png) 



##### 冲突合并



> 正常合并的步骤出现的合并冲突

![image-20230303161036951](.\imgs\image-20230303161036951.png)





#### IDEA登录GitHub

> 第一种正常登录使用账号和密码登录

![image-20230303202517749](.\imgs\image-20230303202517749.png)



> 第二种使用token来登录

![image-20230303202502755](.\imgs\image-20230303202502755.png)



如何获取token

![image-20230303202832916](.\imgs\image-20230303202832916.png)



#### IDEA分享项目到GitHub

![image-20230303204024047](.\imgs\image-20230303204024047.png)





![image-20230303204104976](.\imgs\image-20230303204104976.png)



##### 自定义远程链接

![image-20230303205022871](.\imgs\image-20230303205022871.png)





#### pull拉取远程库到本地库

​	右键点击项目，可以将远程库的内容pull到本地仓库。

​	**快捷键 CTRL+T**





#### clone到本地

从远程仓库clone到本地

![image-20230304104111670](.\imgs\image-20230304104111670.png)



### 国内代码托管中心码云



#### 码云账号注册与登录

[登录 - Gitee.com](https://gitee.com/login)



#### IDEA集成Gitee

![image-20230304151146240](.\imgs\image-20230304151146240.png)



登录Gitee

​	账号是邮箱

![image-20230304152130538](.\imgs\image-20230304152130538.png)



其余操作跟GitHub一样



### 码云复制GitHub

![image-20230304153800071](.\imgs\image-20230304153800071.png)





### GitLab



