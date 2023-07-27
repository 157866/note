# Java集合



## 集合的理解



> 结合的理解和好处

前面我们保存多个数据使用的是数组，那数组有哪些不足的地方，我们分析一下。

- 数组

  1. 长度开始时必须指定，而且一旦指定，不能更改
  2. 保存的必须为同一类型的元素
  3. 使用数组进行增加元素的示意代码-比较麻烦

- 集合

  1. 可以动态保存任意多个对象，使用比较方便！

  2. 提供一些列方便的操作对象的方法：add，remove，set，get等

  3. 使用集合添加，删除新元素的示意代码-简洁了

     



## 集合框架体系

> java的集合类很多，主要分为两大类。如图：

Collection_.java





> 单列集合 

- Collection接口下有两个重要的子接口，他们实现的子类都是单列集合

  - Set

  - List

    

![image-20230526092129965](..\java_集合\imgs\image-20230526092129965.png)

- 举例

```java
 ArrayList arrayList = new ArrayList();
 arrayList.add("list");
```







> 双列集合

Map接口实现子类 是双列集合，存放的K-V

![image-20230525120741578](C:\Users\34912\Desktop\java_集合\imgs\image-20230525120741578.png)



- 举例

```java
 HashMap hashMap = new HashMap();
 hashMap.put("name", "wmt");
```



## Collcetion接口和常用方法

- Collcetion接口**实现类**的特点

```java
public interface Collection<E> extends Iterable<E> 
```



1. collection实现子类可以存放多个元素，每个元素可以是Object
2. 有些Collection的实现类，可以存放重复的元素，有些不可以
3. 有些Collection的实现类，有些是有序的(List),有些不是有序(Set)
4. Collection接口没有直接的实现子类，是通过它的子接口Set和List来实现的



> 本次用 Collection接口常用方法，以实现子类ArrayList来演示 

1. add： 添加单个元素
2. remove：删除指定元素
3. contains： 查找元素是否存在
4. size：获取元素个数
5. isEmpty： 判断是否为空
6. clear：清空
7. addAll：添加多个元素
8. containsAll：查找多个元素是否都存在
9. removeAll：删除多个元素



- 实际操作

```java
  public static void main(String[] args) {
        List list = new ArrayList();

//        1. add： 添加单个元素
        list.add("jack");
//        有个自动装箱的过程10会成为Integer类型 list.add(new Integer(10));
        list.add(10);
//        自动装箱 list.add(new Boolean(true));
        list.add(true);
        list.add("test");
        System.out.println(list);

//        2. remove：删除指定元素
        list.remove(0); //删除第一个元素
        list.remove(Integer.valueOf(10));
        list.remove(Boolean.valueOf(true));
        System.out.println(list);

//        3. contains： 查找元素是否存在
        System.out.println(list.contains("test"));//true

//        4. size：获取元素个数
        System.out.println(list.size());//1
//        5. isEmpty： 判断是否为空
        System.out.println(list.isEmpty());//False
//        6. clear：清空
        list.clear();
        System.out.println("是否为空" + list.isEmpty());//true
//        7. addAll：添加多个元素
        ArrayList arrayList = new ArrayList();
        arrayList.add("java");
        arrayList.add("html");
        arrayList.add("redis");
        list.addAll(arrayList);
        System.out.println(list);
//        8. containsAll：查找多个元素是否都存在
        System.out.println("查找多个元素" + list.containsAll(arrayList));
//        9. removeAll：删除多个元素
        System.out.println("全部删除" + list.removeAll(arrayList));


    }
```





## Iterator(迭代器)

Collection 的第一种遍历方式iterator

>  继承关系

![image-20230526092129965](..\java_集合\imgs\image-20230526092129965.png)



1. Iterator对象称为迭代器，主要用于遍历Collection集合中的元素。
2. 所有实现了Collection接口的集合类都有一个iterator()方法，用以返回一个实现了Iterator接口的对象，即可以返回一个迭代器。
3. Iterator的结构.[看一张图]
4. Iterator仅用于遍历集合，Iterator 本身并不存放对象。



> 迭代器的执行原理

<img src="..\java_集合\imgs\image-20230525162643554.png" alt="image-20230525162643554" style="zoom:80%;" />

```java
 public static void main(String[] args) {
        ArrayList arrayList = new ArrayList();
        arrayList.add("wmt");
        arrayList.add(10);
        arrayList.add(true);
        arrayList.add("a");
     //        获取迭代器
        Iterator iterator = arrayList.iterator();
 //        iterator.hasNext()判断是否还有下一个元素
        while (iterator.hasNext()){
//         iterator.next()指针下移 将下移后的集合位置上的元素返回
            System.out.println(iterator.next());
        }
//        在whil循环后，这时这个迭代器指向的是最后一个元素，如果继续取会报异常NoSuchElementException
//        快捷键 生成will循环itit
//        快捷键显示所有的CTRL+j
             
//        如果需要再次遍历我们需要重置迭代器
        iterator = arrayList.iterator();
        while (iterator.hasNext()) {
            Object next =  iterator.next();
            System.out.println("第二次遍历" + next);
        }
    }
```



## 集合增强for

Collection中的第二种遍历方式 for循环增强

增强for循环，可以代替iterator迭代器， 特点:增强for就是简化版的iterator，本质一样，只能用于遍历集合或数组。

- 基本语法

  ```
  for(元素类型 元素名 : 集合或者数组名){
  	访问元素
  }
  ```

  

- 实际操作

```java
    public static void main(String[] args) {
        ArrayList arrayList = new ArrayList();
        arrayList.add("java");
        arrayList.add("html");
        arrayList.add("redis");

     //    增强for循环遍历集合
        for(Object data : arrayList){
            System.out.println(data);
        }
  //        增强for序号遍历数组
        int[] num = {1, 2, 3, 4, 5};
        for(Object n : num){
            System.out.println(n);
        }
    }
```



## List 接口和常用方法

> List接口基本简绍

1. List集合类中元素有序(即添加顺序和取出顺序一致)、 且可重复。

2. List集合中的每个元素都有其对应的顺序索引， 即支持索引。

3. List容器中的元素都对应一 个整数型的序号记载其在容器中的位置， 可以根据序号存取容器中的元素。





> List 接口的常用方法

1. void add(int index, Object ele)                       在index 位置插入ele元素
2. boolean addAll(int index, Collection eles)    从index位置开始将eles元素添加进来
3. Object get(int index)                                        获取指定index的元素
4. int indexOf(Object obj)                                    返回obj 在集合首次出现的位置
5. int lastIndexOf(Object obj)                             返回obj 在集合末尾出现的位置
6. Object remove(int index)                               移除指定index位置的元素 并返回此元素
7. Object set(int index, Object ele)                   设置指定index位置的元素为ele 相当于替换
8. List subList(int fromIndex, int toIndex)       返回从formIndex到toIndex位置的子集合



- 实际操作

```
  public static void main(String[] args) {
        List list = new ArrayList();
        list.add("wmt");
        list.add("jack");
        list.add("王五 ");
//        1. void add(int index, Object ele)                       在index 位置插入ele元素
        list.add(1, "张三");
        System.out.println(list);
//        2. boolean addAll(int index, Collection eles)    从index位置开始将eles元素添加进来
        list.addAll(1, list);
        System.out.println("list" + list);
//        3. Object get(int index)                                        获取指定index的元素
        Object index2 = list.get(2);
        System.out.println(index2);
//        4. int indexOf(Object obj)                                    返回obj 在集合首次出现的位置
        int i = list.indexOf("jack");
        System.out.println("集合首次出现" + i);
//        5. int lastIndexOf(Object obj)                             返回obj 在集合末尾出现的位置
        System.out.println("元素最后一次出现的位置" + list.lastIndexOf("王五")); //最后一个在元素的末尾则为-1
//        6. Object remove(int index)                               移除指定index位置的元素 并返回此元素
        list.remove(1);
        System.out.println("remove" + list);
//        7. Object set(int index, Object ele)                   设置指定index位置的元素为ele 相当于替换
        list.set(0, "王孟涛");
//        8. List subList(int fromIndex, int toIndex)       返回从formIndex到toIndex位置的子集合
        List list1 = list.subList(0, 3);
        System.out.println("裁剪集合生成新的集合"+ list1);
    }
```







### ArrayList注意事项

1. permits all elements, including null , ArrayList可以加入null,并且多个
2. ArrayList是由数组来实现数据存储的
3. ArrayList基本等同于Vector，除了ArrayList是线程不安全(执行效率高)看源码.在多线程情况下，不建议使用ArrayList



- 实际操作

> 没有关键 synchronized

```java
// ArrayList 是线程不安全的，可以看源码没有synchronized
private void add(E e, Object[] elementData, int s) {
        if (s == elementData.length)
            elementData = grow();
        elementData[s] = e;
        size = s + 1;
    }
```





### ArrayList底层结构和源码分析

> transient  表示瞬间短暂的，表示该属性不会被序列化 



1) ArrayList中维护了一个Object类型的数组elementData. [debug看源码]transient Object[] elementData;

2)当创建对象时，如果使用的是无参构造器，则初始elementData容量为0 (jdk7是10)

3)当添加元素时:先判断是否需要扩容，如果需要扩容，则调用grow方法，否则直接添加元素到合适位置

4)如果使用的是无参构造器，如果第一次添加， 需要扩容的话，则扩容elementData为10,如果需要再次扩容的话，则扩容elementData为1.5倍。

5)如果使用的是指定容量的构造器，则初始elementData容量为指定大小，如果需要扩容，则直接扩容elementData为1.5倍。



### vector底层结构和源码分析

> 单列矩阵

1. Vector底层也是一个对象数组， protected Object[] elementData;
2. Vector是线程同步的，即线程安全，Vector类的操作方法带有synchronized
3. 在开发中，需要线程同步安全，考虑使用 Vector
4. 扩容无参构造默认10然后就开始二倍扩容，如果指定大小，则每次指定大小扩容2倍



```java
public synchronized void setSize(int newSize) {
    modCount++;
    if (newSize > elementData.length)
        grow(newSize);
    final Object[] es = elementData;
    for (int to = elementCount, i = newSize; i < to; i++)
        es[i] = null;
    elementCount = newSize;
}
```



>  ArrayList和Vector做比较

![image-20230525210852115](..\java_集合\imgs\image-20230525210852115.png)





### LinkedList底层结构和源码分析

1. LinkedList实现了双向链表和双端队列特点

2. 可以添加任意元素(元素可以重复)，包括null

3. 线程不安全，没有实现同步



- LinkedList的底层机制

1. LinkedList底层维护了一个双向链表
2. LinkedList中维护了两个属性first和last分别指向首节点和尾节点
3. 每个节点(Node对象) ,里面又维护了prev、next、 item三个属性，其中通过prev指向前一个，通过next指向后一个节点。 最终实现双向链表。
4. 所以LinkedList的元素的添加和删除，不是通过数组完成的，相对来说效率较高。
5. remove 删除默认删除第一个



> ArrayList和LinkedLIst的比较

![image-20230526102316133](..\java_集合\imgs\image-20230526102316133.png)



- 实际操作

```java

public class LinkedList {
    public static void main(String[] args) {
//        模拟一个简单的双向链表
        Node node1 = new Node("张三");
        Node node2 = new Node("李四");
        Node node3 = new Node("王五");
//        张三 》》 李四 》》 王五
        node1.next = node2;
        node2.next = node3;
//        王五 》》 李四 》》 张三
        node3.pre = node2;
        node2.pre = node1;

        Node first = node1;  //双向链表的头节点
        Node last = node3;   //双向链表的尾点

//        从头遍历
        while (true){
            if (first == null){
                break;
            }
            System.out.println(first);
            first = first.next;
        }

        System.out.println("===========================");
        //        从尾到头
        while (true){
            if (last == null){
                break;
            }
            System.out.println(last);
            last = last.pre;
        }

//        添加数据到双向链表
        Node wmt = new Node("wmt");
//        把wmt插入到李四和王五中间 
//        只需要修改他们的指向就好了
        wmt.next = node3;
        wmt.pre = node2;
        node2.next = wmt;
        node3.pre = wmt;
//        重新设置初始地点
        first = node1;
        System.out.println("===============================");
        //        从头遍历
        while (true){
            if (first == null){
                break;
            }
            System.out.println(first);
            first = first.next;
        }

    }
}

class Node{
    public Object item;
    public Node next;  //指向下一个
    public Node pre;   //指向上一个

    public Node(Object item) {
        this.item = item;
    }

    @Override
    public String toString() {
        return "Node{" +
                "item=" + item +
                '}';
    }
}
```



## Set接口和常用方法

1. 无序(添加和取出的顺序不一致)

2. 没有索引

3. 不允许重复元素，所以最多包含一个null

4. 实际实现的是hashMap

   

- set的常用方法

和List接口一样，Set接口也是Collection的子接口，因此，常用方法和Collection接口一样。



- set 接口的遍历

1. 可以使用迭代器iterator
2. 增强for
3. 不可以使用索引方式来获取



   

> hashSet 底层机制说明

分析HashSet底层是HashMap，HashMap底层是（数组 + 链表 + 红黑树）



```Java
public class HashSetStructure {
    public static void main(String[] args) {
//        模拟一个HashSet的底层，（hashMap的底层结构）
            Node[] table = new Node [15];
            Node node1 =  new Node("张三", null);
            table[2] = node1; // 将对象插入到数组中
            Node node2 =  new Node("李四", null);
            node1.next = node2;// 将李四挂载到张三下的next
            Node node3 =  new Node("王五", null);
            node2.next = node3;// 将王五挂载到李四下的next
    }
}

class Node{ // 结点，存储数据，可以指向下一个节点，从而成为链表
    public Object item;
    public Node next;

    public Node(Object item, Node next) {
        this.item = item;
        this.next = next;
    }
}
```



> 结论张三的next指向李四   李四的next指向王五    这样就形成了链表

当链表长度到达8个 table数组的长度超过64会变成红黑树

![image-20230526111613086](..\java_集合\imgs\image-20230526111613086.png)



### hashSet扩容机制



1. HashSet底层是HashMap （数组+ 链表 + 红黑树）
2. 添加一个元素时，先得到hash值-会转成->索引值
3. 找到存储数据表table ,看这个索引位置是否已经存放的有元素
4. 如果没有，直接加入
5. 如果有，调用equals比较，如果相同，就放弃添加，如果不相同，则添加到最后
6. 在Java8中，如果一条链表的元素个数到达TREEIFY THRESHOLD(默认是8)，**并且table的大小**>=MIN TREEIFY CAPACITY(默认64),就会进行树化(红黑树)**，否则还是按照数组扩容机制**

7. HashSet底层是HashMap,第一次添加时，tabLe数组扩容到16,临界值(threshold)是16* 加载因子(loadFactor)是0.75 = 12如果table数组使用到了临界值12,就会扩容到16★2 = 32,新的临界值就是32*0.75 = 24， 依次类推（**注意扩容是2倍临界值是目前容量乘以0.75）**
8. 如何让数据在一个链表上  hash值一样  内容不一样 就可以在一个链表上



得到key对应的hash值

```
return (key == null) ? 0 : (h = key.hashCode()) ^ (h >>> 16);
```



> 结论先比较hashCode在比较equals 所以都需要重写 必须都一样就放弃追加

如果hashCode相同在比较equals如果都相同就放弃添加

如果hashCode相同equals不同就在后面追加



- equals和hashcode的关系

1. 如果equals为true，hashcode一定相等； 

2. 如果equals为false，hashcode不一定不相等；

3. 如果hashcode值相等，equals不一定相等；

4. 如果hashcode值不等，equals一定不等；



- 实际案例

```java

public class HashSetExercise {
    public static void main(String[] args) {
        Set set = new HashSet();
        set.add(new User("wmt", 18));
        set.add(new User("www", 28));
        set.add(new User("wmt", 18));

        System.out.println(set);
    }

}
class User{
    private String name;
    private int age;

    public User(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return age == user.age && Objects.equals(name, user.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, age);
    }
}
```



### linkedHashSet

- linkedHashSet说明

1. LinkedHashSet是HashSet的子类

2. LinkedHashSet底层是一个LinkedHashMap,底层维护了一个数组+双向链表 (LinkedHashMap是hashMap的子类)

3. LinkedHashSet根据元素的hashCode值来决定元素的存储位置，同时使用链表维护元素的次序(图)，这使得元素看起来是以插入顺序保存的。

4. LinkedHashSet不允许添重复元素

5. 在LinkedHastSet 中维护了一个hash表和双向链表( LinkedHashSet有head和tail )

6. 每一个节点有pre和next属性,这样可以形成双向链表

7. 在添加一个元素时，先求hash值， 在求索引，确定该元素在hashtable的位置，然后将添加的元素加入到双向链表(如果已经存在，不添加[原则和hashset一样])tail.next = newElement //简单指定  newElement.pre = tailtail = newEelment;

8. 这样的话，我们遍历LinkedHashSet也能确保插入顺序和遍历顺序一致

   

- 运行流程

  - 添加第一次的时候，直接 将数组table扩容到 16 存放的节点类型是 LinkedHashMap$Enter(父类是HashMap$Node)

    

    ```
        static class Entry<K,V> extends HashMap.Node<K,V> {
    // before指向是前一个元素   after指向的是下一个    
            Entry<K,V> before, after;
            Entry(int hash, K key, V value, Node<K,V> next) {
                super(hash, key, value, next);
            }
        }
    ```

扩容和Hashset一样



### treeSet

1. 使用无参构造创建TreeSet还是无序的
2. 如果需要排序 使用TreeSet 提供的一个构造器，可以传入一个比较器Comparator

3. TreeSet的底层是TreeMap 



> 排序的方法

```
 public static void main(String[] args) {
       TreeSet treeSet = new TreeSet(new Comparator() {
           @Override
           public int compare(Object o1, Object o2) {
//               如果按照长度比较
                 return ((String) o2).length() - ((String) o1).length();
//                 按照字母排序compareTo是字符串比较的一个方法 
//               return ((String) o2).compareTo((String) o1);
           }
       });
        treeSet.add("c");
        treeSet.add("aca");
        treeSet.add("dd");
        treeSet.add("basd");
        System.out.println(treeSet);

    }
```





```
  Comparator<? super K> cpr = comparator;  //外面的匿名类赋值给cpr
        if (cpr != null) {
            do {
                parent = t;
                cmp = cpr.compare(key, t.key);
                if (cmp < 0)   //通过大于小于0来排序
                    t = t.left;
                else if (cmp > 0)
                    t = t.right;
                else           //如果相当就直接退出不会再插入相同的数据
                    return t.setValue(value);
            } while (t != null);
        }
```





## Map接口和常用方法



> 这里讲的是jdk8的Map接口特点

1) Map与Collection并列存在。用于保存具有映射关系的数据:Key-Value
2) Map中的key和value 可以是任何引用类型的数据，会封装到HashMap$Node对象中
3) Map中的key不允许重复，原因和HashSet一样，前面分析过源码.如果重复了就相当于替换
4) Map中的value可以重复
5) Map的key可以为null, value也可以为null，注意key为null,只能有一个，value为null可以多个.
6)常用String类作为Map的key
7) key和value之间存在单向一对一关系，即通过指定的key总能找到对应的value8) Map存放数据的key-value示意图，一对k-v是放在一个Node中的， 有因为Node实现了Entry 接口，有些书上也说一对k v就是一个Entry(如图) 



![image-20230526190759564](..\java_集合\imgs\image-20230526190759564.png)



```
// k-v 最后是HashMap$Node node = newNode(hash, key, value, null);
// k-v为了方便程序员的遍历，还会创建EntrySet 集合，该集合存放的元素的类型Entry, 而一个Entry对象就有k,V //EntrySet<Entry<K,V>> 即: transient Set<Map . Entry<K,V>> entrySet;
//当把HashMap$Node 对象存放到entrySet 就方便我们的遍历,因为Map.Enter提供了2个重要的方法 getKEy getValue
```



- 实际操作

  ```
      @SuppressWarnings({"all"})
      public static void main(String[] args) {
          Map map = new HashMap();
          map.put("no1","wmt");
          map.put("no2","王");
          map.put("no1","王孟涛");
          System.out.println(map);
  //        map提供的entrySet 这里的元素不是存在entrySet里面而是指向的是HashMap$Node
          Set set = map.entrySet();
          for (Object o :set) {
              Map.Entry entry = (Map.Entry) o;
              System.out.println(entry.getKey());
          }
  
  
      }
  ```

  

- transient 解释

```
// 1、变量被transient修饰，变量将不会被序列化
//2、transient关键字只能修饰变量，而不能修饰方法和类。
//3、被static关键字修饰的变量不参与序列化，一个静态static变量不管是否被transient修饰，均不能被序列化。
//4、final变量值参与序列化，final transient同时修饰变量，final不会影响transient，一样不会参与序列化
```



### Map常用方法

1. put:添加

2. remove:根据键删除映射关系

3. get:根据键获取值

4. size:获取元素个数

5. isEmpty:判断个数是否为0

6. clear:清除

7. containsKey:查找键是否存在



### Map的六大遍历方法

> 使用增强for  迭代器 

```
 @SuppressWarnings({"all"})
    public static void main(String[] args) {
        Map map = new HashMap();
        map.put("no1" , "韩立");
        map.put("no2" , "历飞雨");
        map.put("no3" , "张铁");
        map.put("no4" , "万小山");
// 获取key的set集合 set集合的遍历方式iteration 和 增强for
        Set set = map.keySet();
//        增强for循环
        for (Object o :set) {
            System.out.println(map.get(o));
        }
//      iteration 迭代器
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            Object next =  iterator.next();
            System.out.println(map.get(next));

        }

//        获取value值 返回结果为Collection 可以使用三种遍历
        Collection values = map.values();
//        增强for
        for (Object o :values) {
            System.out.println("增强for" + o);
        }
//      迭代器 iteration
        Iterator iterator1 = values.iterator();
        while (iterator1.hasNext()) {
            Object next =  iterator1.next();
             Map.Entry entry = (Map.Entry) next;
            System.out.println(entry.getKey() + " " + entry.getValue());

        }

// 获取到entrySet 来获取k -v
        Set entrySet = map.entrySet();
        for (Object entry :entrySet) {
//            把entrySet转换成Entry
            Map.Entry entry1 =(Map.Entry) entry;
            System.out.println(entry1.getKey() + " " + entry1.getValue());


        }

    }
```



### hashMap小结

1. Map接的常用实现类: HashMap、Hashtable和Properties。

2. HashMap是Map接口使用频率最高的实现类。

3. HashMap是以key-val对的方式来存储数据

4. key不能重复，但是是值可以重复,允许使用null键和nul(值。

5. 如果添加相同的key，则会覆盖原来的key-val ,等同于修改.(key不会替换， val会替换)

6. 与HashSet一样，不保证映射的顺序，因为底层是以hash表的方式来存储的.（jdk8的hashMap的底层 数组+ 链表+ 红黑树）

7. HashMap没有实现同步，因此是线程不安全的，方法没有做同步互斥操作，没有sychronize

> 底层扩容机制

1. HashMap底层维护了Node类型的数组table,默认为null

2. 当创建对象时，将加载因子(loadfactor)初始化为0.75.

3. 当添加key-val时，通过key的哈希值得到在table的索引。然后判断该索引处是否有元素，如果没有元素直接添加。如果该索引处有元素，继续判断该元素的key和准备加入的key相是否等，如果相等，则直接替换val;如果不相等需要判断是树结构还是链表结构，做出相应处理。如果添加时发现容量不够，则需要扩容。
4. 第1次添加，则需要扩容table容量为16,临界值(threshold)为12 (16*0.75)

5. 以后再扩容，则需要扩容table容量为原来的2倍(32),临界值为原来的2倍，即24,依次类推

6. 在Java8中，如果一条链表的元素个数超过TREEIFY THRESHOLD(默认是8 )，并且able的大小>= MIN TREEIFY CAPACITY(默认64),就会进行树化(红黑树)



### hashMap的死循环

如果存在hash冲突，最惨的情况，就是所有发元素都定位到同一个位置，形成一个长长的链表，这样get一个值，最坏的情况是需要遍历所有的节点，性能会变成O(n) 

>  O代表

在计算机科学中，O 表示时间复杂度的上界，表示算法的运行时间的增长率。它描述了算法在最坏情况下所需执行的基本操作数与输入大小之间的关系。O 记号通常用于衡量算法的效率和性能，它是一种渐进分析方法，即随着输入规模的增大，算法的运行时间会趋向于一个上界。

具体来说，如果算法的运行时间的增长率是 O(f(n))，那么它的运行时间最多是 f(n) 的某个常数倍，即在最坏情况下，算法的运行时间不会超过 f(n)。这里的 n 表示输入规模，f(n) 是一个函数，表示算法的运行时间与输入规模之间的关系。

例如，如果一个算法的时间复杂度是 O(n)，那么它的运行时间最多是输入规模的线性函数，即在最坏情况下，算法的运行时间不会超过输入规模的某个常数倍。如果一个算法的时间复杂度是 O(n^2)，那么它的运行时间最多是输入规模的平方函数，即在最坏情况下，算法的运行时间不会超过输入规模的平方的某个常数倍。



> n

其中 n 是哈希表中键值对的数量。



因为hashMap不支持线程安全，如果有2个线程对hashMap进行操作正好操作的一个链表，当两个节点互相引用，当数组该位置get寻找对应的key时，就会发生死循环，所以并发就要使用concurrentHashMap，因为hashMap根本就不支持多线程。



#### ConcurrentHashMap

ConcurrentHashMap支持并发 jdk1.7segment都是一个hahsEntry<kv>[] table tbael中的元素本质是是一个hashEntry的单向列表，  jdk1.8 中	取消了segment 直接采用transient  volatile  hahsEntry<k,v>[] tbale来保存数据采用table数组元素做为锁，从而实现对每一行数据进行加锁，进一步减少并发冲突。

jdk1.7底层是数组+ 单向链表  jdk1.8变成了 数组+单向链表+红黑树。ConcurrentHashMap的加载因子是0.75，但是在数据量过大或者运气不佳的时候，如果还是采用单向链表，那么查询某个节点的时间复杂度为O(n)，因此，对于个数超过8的列表，jdk1.8中采用了红黑树的结构，那么查询的时间复杂度可以降低到O(logN),可以降低性能。



### 怎么解决hash冲突

哈希冲突是指在哈希表中，不同的键值对被映射到了同一个哈希桶中，这会导致查找、插入、删除等操作的效率降低。为了解决哈希冲突，通常有以下几种方法：

1. 链表法（Separate Chaining）：在哈希桶中维护一个链表，将哈希冲突的键值对存储在链表中，可以避免冲突，但是当链表长度过长时，会降低查询效率。
2. 开放地址法（Open Addressing）：在哈希桶中查找空闲位置，将哈希冲突的键值对存储在空闲位置中，可以避免链表过长的问题，但是需要解决冲突时需要进行多次探测，增加了时间复杂度。
3. 拉链法（Cuckoo Hashing）：使用多个哈希函数，将键值对存储在多个哈希桶中，可以避免链表过长和探测次数过多的问题，但是需要维护多个哈希桶，增加了空间复杂度。
4. 建立公共溢出区（Overflow Area）：当哈希冲突发生时，将键值对存储在公共溢出区中，可以避免链表过长和探测次数过多的问题，但是需要维护公共溢出区，增加了空间复杂度。

不同的哈希表实现会采用不同的哈希冲突解决方法，具体的选择取决于实际应用场景和性能需求。



> 什么是hash桶

哈希桶可以使用链表、红黑树等数据结构来实现。在哈希表中，每个哈希桶存储一组键值对。当发生哈希冲突时，可以将冲突的键值对存储在同一个哈希桶中。如果哈希桶中的键值对数量比较少，可以使用链表来存储；如果键值对数量比较多，可以使用红黑树来存储，这样可以提高查找、插入和删除操作的效率。

在链表实现中，每个哈希桶存储一个链表，链表中的每个节点表示一个键值对。当发生哈希冲突时，新的键值对会被插入到链表的末尾。在查找、插入和删除操作时，需要遍历链表，直到找到对应的键值对。

在红黑树实现中，每个哈希桶存储一棵红黑树，树中的每个节点表示一个键值对。当发生哈希冲突时，新的键值对会被插入到红黑树中。在查找、插入和删除操作时，可以使用红黑树的高效算法，减少遍历的次数，提高操作效率。



### hashTable

1. 存放的元素是键值对:即K-V

2. hashtable的键和值都不能为null,否则会抛出NullPointerException

3. hashTable使用方法基本上和HashMap一样

4. hashTable是线程安全的(synchronized), hashMap是线程不安全的



> hashTable底层

HashTable$Entry                           $Entry 是什么意思代表在HashTable类中的一个Entry类

```
    this(11, 0.75f);
```



初始扩容为 11   扩容英子为0.75   每次扩容为2倍+1



![image-20230527142535477](..\java_集合\imgs\image-20230527142535477.png)







### properties

![image-20230525120741578](..\java_集合\imgs\image-20230525120741578.png)

1. Properties类继承自Hashtable类并且实现了Map接口，也是使用一种键值对的形式来保存数据。

2. 他的使用特点和Hashtable类似

3. Properties还可以用于从xxx.properties文件中，加载数据到Properties类对象，并进行读取和修改
   说明:工作后xx.properties文件通常作为配置文件，这个知识点在I0流举例,有兴趣可先看文章
4. 他的父类是HashTable所以键和值都不能为null,否则会抛出NullPointerException

https://www.cnblogs.com/xudong-bupt/p/3758136.html



```
    public static void main(String[] args) throws IOException {
        InputStream fileInputStream = new BufferedInputStream(new FileInputStream("D:\\javaProjec\\Collection_project\\src\\java\\com\\wmt\\map\\a.properties"));
//        创建properties的集合
        Properties properties = new Properties();
        //load这个方法可以从.properties属性文件对应的文件输入流中，加载属性列表到Properties类对象
        properties.load(fileInputStream);
//        获取properties中的元素并且返回一个迭代器
        Iterator<String> iterator = properties.stringPropertyNames().iterator();
        //遍历集合
        while (iterator.hasNext()) {
            String next =  iterator.next();
            System.out.println("key=" + properties.getProperty(next));
        }
        fileInputStream.close();

        //保存属性到b.properties文件
        FileOutputStream fileOutputStream = new FileOutputStream("b.properties"); //true表示开启追加
        properties.setProperty("user" , "王孟涛");
        properties.setProperty("password" , "abc");
//        　这个方法将Properties类对象的属性列表保存到输出流中
//        如果comments不为空，保存后的属性文件第一行会是#comments,表示注释信息；如果为空则没有注释信息
        properties.store(fileOutputStream, "the new file");
//        释放资源
        fileOutputStream.close();



    }
```





### TreeMap

treeMap的底层是hashMap

可以通过comparaator来排序

1第一次添加，把k-v封装到Entry对象， 放入root

```java
    public static void main(String[] args) {
//        默认的构造器 无序 key无重复
//        TreeMap treeMap = new TreeMap();
//        按照长度排序如果长度一样则覆盖  return {人界篇=时间道主, 凡人修仙=韩老魔}
//        TreeMap treeMap = new TreeMap(Comparator.comparingInt(o -> ((String) o).length()));

//        TreeMap treeMap = new TreeMap(new Comparator() {
//            @Override
//            public int compare(Object o1, Object o2) {
//                return ((String)o1).length() - ((String)o2).length() ;
//            }
//        });

//        TreeMap treeMap = new TreeMap((o1, o2) -> ((String)o1).length() - ((String)o2).length());
        TreeMap treeMap = new TreeMap(Comparator.comparingInt(o -> ((String) o).length()));
        treeMap.put("凡人修仙", "韩立");
        treeMap.put("凡人修仙", "韩老魔");
        treeMap.put("人界篇", "历飞雨");
        treeMap.put("灵界篇", "大眼神君");
        treeMap.put("仙界篇", "时间道主");
        System.out.println(treeMap);
    }
```



## Collections工具类

Collections是一个操作Set、List 和Map等集合的工具类

Collections中提供了-系列静态的方法对集合元素进行排序、查询和修改等操作

- 排序操作: (均为static方法)

  1. reverse(List):反转List中元素的顺序

  2. shuffle(List):对List集合元素进行随机排序

  3. sort(List):根据元素的自然顺序对指定List集合元素按升序排序

  4. sort(List, Comparator): 根据指定的Comparator产生的顺序对List集合元素进行排序

  5. swap(List, int, int): 将指定list集合中的i处元素和i处元素进行交换
  6. Object max(Collection):根据元素的自然顺序，返回给定集合中的最大元素
  7. Object max(Collection, Comparator): 根据Comparator指定的顺序，返回给定集合中的最大元素
  8. Object min(Collection)
  9. Object min(Collection, Comparator)int frequency(Collection, Object): 返回指定集合中指定元素的出现次数
  10. void copy(List dest,List src):将src中的内容复制到dest中
  11. boolean replaceAll(List list, Object oldVal, Object newVal):使用新值替换List对象的所有旧值



## 开发的时候如何选择集合的实现类

- 先选择存储的类型 是单列还是双列
  - 单列 Collection 接口
    - 允许重复list
      - 增删多：LinkedList   底层是一个双向链表
      - 查该多：ArrayList    底层是Object的可变数组
    - 不允许重复set
      -  无序 ： HashSet  底层是HashMap 维护的是一个哈希表 即： 数组+链表+红黑树
      -  有序 : TreeSet
      - 插入和取出一致 LinkedHashSet  维护的是一个数组+双向链表
  - 一组键值对
    - 键无序 HashMap   底层是哈希表  jdk7是数组+链表  jdk8是数组+链表+红黑树
    - 键有序 TreeMap
    - 键插入或者取出一致 LinkeHashMap 
    - 读取文件 properties