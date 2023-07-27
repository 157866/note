#  JAVA_线程

- 线程

> 线程是操作系统能够进行运算调度的最小单位，它被包含在进程中，是进程中的实际运作单位



- 进程

> 进程是程序的基本执行实体



- 什么是多线程?

> 有了多线程,我们就可以让程序同时做多件事情



- 多线程的作用?

>  提高效率



- 多线程的应用场景?

> 只要你想让多个事情同时运行就需要用到多线程比如:软件中的耗时操作、所有的聊天软件、所有的服务器



- 并发

> 在同一时刻，有多个指令在单个CPU上交替执行



- 并行

> 在同一时刻，有多个指令在CPU上同时执行



## 多线程实现的方式



### 继承 Thread类的方式

>  无返回值

```
public class MyThread extends Thread{
//    多线程第一种启动方法
//    重写run方法
//    创建对象启动线程

    @Override
    public void run() {
        for (int i = 0; i < 100; i++) {
            System.out.println(getName() + "my is thread");
        }
    }
}
class Test{
    public static void main(String[] args) {
        // 开启线程
        MyThread t1 = new MyThread();
        t1.setName("线程1");
        t1.start();
        
        MyThread t2 = new MyThread();
        t2.setName("线程2");
        t2.start();
    }
}
```



### 实现Runnable接口



>  无返回值

```

public class MyRunnable implements Runnable{
 /*
 * 多线程第二种启动方式
 * 自己自定义一个类实现Runnable接口
 * 重写里面的run方法
 * 创建自己的类对象
 * 创建Thread类的对象 开启线程
 * */

    @Override
    public void run() {
        for (int i = 0; i < 20; i++) {
//            获取线程的对象  
            Thread thread = Thread.currentThread();
            System.out.println( thread.getName() + "my is runnable");
        }
    }
}
class Test1{
    public static void main(String[] args) {
        MyRunnable myRunnable = new MyRunnable();
//      创建线程1
        Thread t1 = new Thread(myRunnable);
        t1.setName("t1");
        t1.start();

//       创建线程2
        Thread t2 = new Thread(myRunnable);
        t2.setName("t2");
        t2.start();
    }
}
```



### 实现 Callable接口

```
public class MyThreadReturn implements Callable {
    /*
     *多线程第三种实现方式
     * 特点：有返回值
     *
     * 创建一个类实现Callable接口
     * 重写call 是有返回值的
     * 创建实现了Callable接口的对象  表示多线程执行的任务
     * 创建FutureTask的对象 拿来管理多线程运行结果
     * */
    @Override
    public Object call() throws Exception {
//        1~100的累加
        int sum = 0;
        for (int i = 0; i <= 100; i++) {
            sum += i;
        }
        return sum;
    }

}

class Test3{
    public static void main(String[] args) throws ExecutionException, InterruptedException {
//        创建多线程需要执行的任务
        MyThreadReturn myThreadReturn = new MyThreadReturn();
//        管理返回的结果
        FutureTask<Integer> integerFutureTask = new FutureTask<Integer>(myThreadReturn);
//        创建线程并启动
        Thread thread = new Thread(integerFutureTask);
        thread.start();
//        获取返回值
        System.out.println(integerFutureTask.get());
    }
}
```



### 小总结

![image-20230529192808807](..\java_线程\imgs\image-20230529192808807.png)





### 常用方法

![image-20230529193058164](..\java_线程\imgs\image-20230529193058164.png)



join不是静态



### 线程的生命周期

  

![image-20230529215018627](..\java_线程\imgs\image-20230529215018627.png)



### 同步代码块

把操作共享数据的代码锁起来

```
格式

synchronized （锁）{

操作代码块

}

```





特点1:

> 锁默认打开，有一个线程进去了，锁自动关闭

特点2:

> 里面的代码全部执行完毕，线程出来，锁自动打开



实现三个线程抢票

> ThreadLock类实现了 Runnable接口

```java
public class ThreadLock implements Runnable {
     int carId = 0;
    //    锁对象，唯一的 所以加static 或者使用.class也是唯一的
   //    ctrl + alt +m 抽取一个方法

    @Override
    public void run() {
        while (true){
            synchronized (ThreadLock.class){
                carId++;
                if (carId > 100){
                    break;
                }
                try {
                    Thread.sleep(10);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                System.out.println(Thread.currentThread().getName() + "买票了"+ carId);

            }

        }

    }

}
```



> 实现的第二种方法  把方法抽出来

```java

public class ThreadLock implements Runnable {
     int carId = 0;
    //    锁对象，唯一的 所以加static 或者使用.class也是唯一的
   //    ctrl + alt +m 抽取一个方法

    @Override
    public void run() {
        while (true){
            synchronized (ThreadLock.class){
                if (extracted()) break;

            }

        }

    }

    private boolean extracted() {
        carId++;
        if (carId > 100){
            return true;
        }
        try {
            Thread.sleep(10);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println(Thread.currentThread().getName() + "买票了"+ carId);
        return false;
    }

}


```





> 测试类

```java
class Test{
    public static void main(String[] args) {
        ThreadLock threadLock = new ThreadLock();
        Thread t1 = new Thread(threadLock);
        t1.setName("t1");
        Thread t2 = new Thread(threadLock);
        t2.setName("t2");
        Thread t3 = new Thread(threadLock);
        t3.setName("t3");
        t1.start();
        t2.start();
        t3.start();
    }
}
```





### Lock锁

> 什么是Lock锁

虽然我们可以理解同步代码块和同步方法的锁对象问题,但是我们并没有直接看到在哪里加上了锁，在哪里释放了锁，为了更清晰的表达如何加锁和释放锁，JDK5以后提供了一个新的锁对象Lock



> Lock性质

Lock实现提供比使用synchronized方法和语句可以获得更广泛的锁定操作，Lock中提供了获得锁和释放锁的方法
void lock():获得锁
手动上锁、手动释放锁
void unlock():释放锁

Lock是接口不能直接实例化，这里采用它的实现类ReentrantLock来实例化
ReentrantLock的构造方法
ReentrantLock():创建一个ReentrantLock的实例



- 实际操作

```
//快捷操作CTRL + alt + t 选择代码块快速使用if try 包裹
public class Lock_ implements Runnable{
    static int carID = 0;
//    实现Lock接口
    static Lock lock = new ReentrantLock();
    @Override
    public void run() {
        while (true){
//            上锁
            try {
                lock.lock();
                if (carID == 100){
                    break;
                }
                carID++;
                System.out.println(Thread.currentThread().getName() + "=" + carID);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
//                释放锁 锁要及用及还
                lock.unlock();
            }
        }
    }
}

class Test3{
    public static void main(String[] args) {
        Lock_ lock_1 = new Lock_();
        Lock_ lock_2 = new Lock_();
        Lock_ lock_3 = new Lock_();

        Thread t1 = new Thread(lock_1);
        t1.setName("窗口一");
        Thread t2 = new Thread(lock_2);
        t2.setName("窗口二");
        Thread t3 = new Thread(lock_3);
        t3.setName("窗口三");

        t1.start();
        t2.start();
        t3.start();
    }
}
```





### 死锁



> 死锁是一个错误的

注意不要写2个不一样的锁嵌套使用

案例

```
public class DieLock implements Runnable{
    static Lock lock1 = new ReentrantLock();
    static Lock lock2 = new ReentrantLock();
    @Override
    public void run() {
        while (true) {
            if (Thread.currentThread().getName().equals("A线程")) {

                try {
                    lock1.lock();
                    System.out.println(Thread.currentThread().getName() + "拿到了" + "锁1");
                    //            锁2
                    try {
                        lock2.lock();
                        System.out.println(Thread.currentThread().getName() + "拿到了" + "锁2");
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        lock2.unlock();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    lock1.unlock();
                }

            }else if (Thread.currentThread().getName().equals("B线程")) {
    //            锁2
                try {
                    lock2.lock();
                    System.out.println(Thread.currentThread().getName() + "拿到了" + "锁2");
                    try {
                        lock1.lock();
                        System.out.println(Thread.currentThread().getName() + "拿到了" + "锁1");
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        lock1.unlock();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    lock2.unlock();
                }


            }
        }


    }
}

class Test4{
    public static void main(String[] args) {
        DieLock dieLock1 = new DieLock();
        DieLock dieLock2 = new DieLock();
        Thread thread1 = new Thread(dieLock1);
        thread1.setName("A线程");
        Thread thread2 = new Thread(dieLock2);
        thread2.setName("B线程");
        thread1.start();
        thread2.start();
    }
}
```



### 生产者和消费者（等待唤醒机制）

生产者消费者模式是一个十分经典的多线程协作的模式



![image-20230530101106941](..\java_线程\imgs\image-20230530101106941.png)





- 实例操作



> 生产者

```java
public class Producer implements Callable {

    @Override
    public Object call() throws Exception {
        while (true){
            //            开启锁
            synchronized (Middle.lock){

                try {
                    if (Middle.messages == 0){
                        break;
                    }else {
                        if (Middle.stats == 0){
                            //生产消息
                            Middle.stats = Middle.HAVE;
                            System.out.println( Thread.currentThread().getName() + "生产了一个消息" );
                            Middle.lock.notifyAll();
                        }else {
                            Middle.lock.wait();
                        }
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            }
        return null;
    }
}

```



> 消费者

```java

public class Consumer implements Runnable{
    
    @Override
    public void run() {
        while (true){
            //            开启锁
          synchronized (Middle.lock){
              try {
//            判断是否还有消息
                  if (Middle.messages == 0){
                      break;
                  }else {
//                判断现在是否还存在消息
                      if (Middle.stats == 0) {
//                        没有消息等待
                          Middle.lock.wait();

                      }else {
                          //                    消费消息
                          Thread thread = Thread.currentThread();
                          Middle.messages--;
                          System.out.println(thread.getName() + "消费了消息还剩" + Middle.messages);
//                        修改状态
                          Middle.stats = Middle.NO_HAVE;
//                       唤醒生产者 唤醒所有的线程
                          Middle.lock.notifyAll();

                      }
                  }
              }catch (InterruptedException i){
                  i.getMessage();
              }
          }

        }
    }
}

```



> 中间界

```java
public class Middle {
//    10条消息
    static int messages = 10;
//    0 表示没有消息  1表示有消息
    static final int HAVE = 1;
    static final int NO_HAVE = 0;
    static int stats = NO_HAVE;

    static Object lock = new Object();
}

```



> 测试

```java
public class Test {
    public static void main(String[] args) {
        Consumer consumer = new Consumer();
        Producer producer = new Producer();
        FutureTask<Object> objectFutureTask = new FutureTask<Object>(producer);
        Thread t1 = new Thread(objectFutureTask, "生产者");
        Thread t2 = new Thread(consumer,"消费者");
        t1.start();
        t2.start();

    }
}

```



### 等待唤醒机制（阻塞队列方式实现）

![image-20230530133640287](..\java_线程\imgs\image-20230530133640287.png)



> 阻塞队列的基础结构



![image-20230530133845277](..\java_线程\imgs\image-20230530133845277.png)





- 实际操作

> Consumer 类 消费者

```java
public class Consumer implements Runnable{
    ArrayBlockingQueue queue ;

    public Consumer(ArrayBlockingQueue queue){
        this.queue = queue;
    }

    @Override
    public void run() {
        while (true){
            try {
                String messages = (String) queue.take();
                //sout语句不在锁中
                System.out.println("收到队列的消息=" + messages);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

    }
}

```



> Producer 生产者

```java
public class Producer implements Runnable{

    ArrayBlockingQueue queue ;

    public Producer(ArrayBlockingQueue queue){
        this.queue = queue;
    }

    @Override
    public void run() {
        while (true) {
            try {
                queue.put("队列消息");
                System.out.println("发送了一条消息");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

```



> 测试

```java
public class Test {
    public static void main(String[] args) {
//        利用队列来完成生产者和消费者   等待唤醒机制
//        生产者和消费者必须在一个队列中
        ArrayBlockingQueue<Object> objects = new ArrayBlockingQueue<>(1);
        Thread t1 = new Thread(new Consumer(objects));
        Thread t2 = new Thread(new Producer(objects));

        t1.start();
        t2.start();

    }
}
```





### 线程的七大状态



> 实际是没有运行状态的因为线程抢到了执行器jvm就不管了，会把线程叫给操作系统来管理

![image-20230530145650849](..\java_线程\imgs\image-20230530145650849.png)





### 小练习

>       一共有1000张电影票,可以在两个窗口领取,假设每次领取的时间为3000毫秒,
>       要求:请用多线程模拟卖票过程并打印剩余电影票的数量

```java

public class Ticket implements Runnable{
    /*
     * 一共有1000张电影票,可以在两个窗口领取,假设每次领取的时间为3000毫秒,
     * 要求:请用多线程模拟卖票过程并打印剩余电影票的数量
     * */


    static int carNumber = 1000;

    static Lock lock = new ReentrantLock();

    @Override
    public void run() {
        while (true){
            try {
                lock.lock();
                if (carNumber == 0){
                    break;
                }else {
                    Thread thread = Thread.currentThread();
                    Thread.sleep(1000);
                    System.out.println(thread.getName() + "出售了" + carNumber);
                    carNumber--;
               }
            } catch (InterruptedException e) {
                e.printStackTrace();
            } finally {
                lock.unlock();
            }

        }
    }


}

class Test{
    public static void main(String[] args) {
         Thread t1 = new Thread(new Ticket());
         Thread t2 = new Thread(new Ticket());
         t1.start();
         t2.start();
    }
}
```





> 有100份礼品,两人同时发送，当剩下的礼品小于10份的时候则不再送出。
> 利用多线程模拟该过程并将线程的名字和礼物的剩余数量打印出来.

```
public class Gift implements Runnable{
//    有100份礼品,两人同时发送，当剩下的礼品小于10份的时候则不再送出。
//利用多线程模拟该过程并将线程的名字和礼物的剩余数量打印出来.

    static int giftNumber = 100;

    static Lock lock = new ReentrantLock();

    @Override
    public void run() {
        while (true){
            try {
                lock.lock();
                if (giftNumber < 10){
                    break;
                }else {
                    System.out.println(Thread.currentThread().getName() + "送出礼物" + giftNumber);
                    giftNumber--;
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                lock.unlock();
            }


        }
    }
}

class Test2{
    public static void main(String[] args) {
        Thread t1 = new Thread(new Gift());
        Thread t2 = new Thread(new Gift());

        t1.start();
        t2.start();

    }
}
```





> 同时开启两个线程，共同获取1-100之间的所有数字。
> 要求:将输出所有的奇数。

```java

public class OldNumber implements Callable {
    //    同时开启两个线程，共同获取1-100之间的所有数字。
    //    要求:将输出所有的奇数。
    static Lock lock = new ReentrantLock();

    @Override
    public Object call() throws Exception {
            for (int i = 0; i < 100; i++) {
                try {
                    lock.lock();
                    if (i%2 == 0){
                        continue;
                    }else {
                        System.out.println(Thread.currentThread() + "当前奇数为" + i);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    System.out.println("关闭锁");
                    lock.unlock();
                }
            }

        return "ok";
    }


}

class Test3{
    public static void main(String[] args) {
        Thread t1 = new Thread(new FutureTask<>(new OldNumber()));
        Thread t2 = new Thread(new FutureTask<>(new OldNumber()));
        t1.start();
        t2.start();
    }
}
```


## 线程池



> 线程池主要核心原理



1. 创建一个池子，池子是空的
2. 提交任务时，池子会创建新的线程池对象，任务执行完毕，线程归还给池子，下回再提交任务时，不需要创建新的线程，直接复用已有的线程即可。
3. 如果提加任务时，池子中没有空闲的线程，也无法创建新的线程，任务就会排队等待。





> 线程池代码实现

1. 创建线程池

2. 提交任务
3. 所有的任务全部执行完成，关闭线程



![image-20230605113205127](C:\Users\34912\Desktop\java_线程\imgs\image-20230605113205127.png)



- 实际操作

  1. 创建无上限线程池

  ```java
  public class ThreadPool {
      public static void main(String[] args) {
          //    创建线程池无上限的线程池 实际是int的上限2亿
          ExecutorService pool1 = Executors.newCachedThreadPool();
  
          //        提交任务
          pool1.submit(new MyRunnable());
          pool1.submit(new MyRunnable());
  
          //销毁线程
          pool1.shutdown();
      }
  
  }
  
  ```

   

  2. 创建线程操作

  ```java
  public class MyRunnable implements Runnable{
      @Override
      public void run() {
          for (int i = 0; i < 100; i++) {
              System.out.println(Thread.currentThread().getName() + "------" + i);
          }
      }
  }
  
  ```

- 创建有上限的连接池

  1. 创建线程池

```java
public class MyNewFixedThreadPool {
    public static void main(String[] args) {
//        创建有限制的线程池 线程数量为2
        ExecutorService fixedThreadPool = Executors.newFixedThreadPool(2);
//        提交任务
        fixedThreadPool.submit(new MyRunnable());
        fixedThreadPool.submit(new MyRunnable());
        fixedThreadPool.submit(new MyRunnable());
//        关闭线程
        fixedThreadPool.shutdown();
    }
}

```



2. 创建线程操作

```java
public class MyRunnable implements Runnable{
    @Override
    public void run() {
        for (int i = 0; i < 100; i++) {
            System.out.println(Thread.currentThread().getName() + "------" + i);
        }
    }
}

```





## 自定义线程池



> 任务拒绝策略

![image-20230605121604854](..\java_线程\imgs\image-20230605121604854.png)



> 线程池不会按照提交顺序执行

提交任务最开始会往线程池中



- 自定义线程池

```java
public class CustomPool {
//    public ThreadPoolExecutor(int corePoolSize,    核心线程数量不能小于0
//                              int maximumPoolSize, 最大线程数量不能小于0，最大数量>=核心线程数量
//                              long keepAliveTime,  空闲线程最大存活时间
//                              TimeUnit unit,       时间单位
//                              BlockingQueue<Runnable> workQueue,  任务队列
//                              ThreadFactory threadFactory,        创建线程工厂
//                              RejectedExecutionHandler handler    任务拒绝策略
//                              ) {
    public static void main(String[] args) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(3, // 核心线程数量为3
                6,                            // 最大线程为6 临时线程 = 最大线程 - 核心线程
                60,                           // 空闲线程存活60单位由下面决定
                TimeUnit.SECONDS,             // 单位为秒
                new ArrayBlockingQueue<>(3),  // 任务队列长度为3个
                Executors.defaultThreadFactory(), // 创建线程工厂
                new ThreadPoolExecutor.AbortPolicy()  // 任务拒绝策略
        );
//        提交任务
        threadPoolExecutor.submit(new MyRunnable());
        threadPoolExecutor.submit(new MyRunnable());
        threadPoolExecutor.submit(new MyRunnable());
        threadPoolExecutor.submit(new MyRunnable());
        threadPoolExecutor.submit(new MyRunnable());
        threadPoolExecutor.submit(new MyRunnable());
        threadPoolExecutor.submit(new MyRunnable());

//        关闭链接池
        threadPoolExecutor.shutdown();
    }
```

