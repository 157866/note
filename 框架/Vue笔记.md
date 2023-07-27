# Vue

# 1. 概述

## 1.1. Vue概述

**vue地址：https://cn.vuejs.org/**

```html
<!-- 开发环境版本，包含了有帮助的命令行警告 -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
```

```html
<!-- 生产环境版本，优化了尺寸和速度 -->
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
```

```html
<!-- Vue在线引入-->
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
```



Vue (读音/vju/, 类似于view)是一套用于构建用户界面的**渐进式框架**，发布于2014年2月。与其它大型框架不同的是，Vue被设计为可以自底向上逐层应用。**Vue的核心库只关注视图层**，不仅易于上手，还便于与第三方库(如: vue-router: 跳转，vue-resource: 通信，vuex:管理)或既有项目整合。

**SOC原则：关注点分离原则**

## 1.2. 前端知识体系

想要成为真正的“互联网Java全栈工程师”还有很长的一段路要走，其中“我大前端”是绕不开的一门必修课。本阶段课程的主要目的就是带领我Java后台程序员认识前端、了解前端、掌握前端,为实现成为“互联网Java全栈工程师”再向前迈进一步。

## 1.3. 前端三要素

- HTML (结构) :超文本标记语言(Hyper Text Markup Language) ，决定网页的结构和内容
- CSS (表现) :层叠样式表(Cascading Style sheets) ，设定网页的表现样式
- JavaScript (行为) :是一种弱类型脚本语言，其源代码不需经过编译，而是由浏览器解释运行,用于控制网页的行为

## 1.4. 表现层（CSS）

CSS层叠样式表是**一门标记语言**,并不是编程语言，因此不可以自定义变量，不可以引用等，换句话说就是不具备任何语法支持，它主要缺陷如下:

- 语法不够强大，比如无法嵌套书写，导致模块化开发中需要写很多重复的选择器;
- 没有变量和合理的样式复用机制，使得逻辑上相关的属性值必须以字面量的形式重复输出，导致难以维护;

这就导致了我们在工作中无端增加了许多工作量。为了解决这个问题，前端开发人员会使用一种称之为 [**CSS预处理器**] 的工具，提供CSS缺失的样式层复用机制、减少冗余代码，提高样式代码的可维护性。大大提高了前端在样式上的开发效率。（例如页面在不同的时候有不同的需求，淘宝在双11和618的样式就会不一样）

## 1.5. CSS预处理器

CSS预处理器定义了一种新的语言，其基本思想是，用一种**专门的编程语言**，为CSS增加了一些编程的特性，将CSS作为目标生成文件,然后开发者就只要使用这种语言进行CSS的编码工作。转化成通俗易懂的话来说就是“**用一种专门的编程语言,进行Web页面样式设计，再通过编译器转化为正常的CSS文件，以供项目使用**”
常用的CSS预处理器有哪些

- **SASS**:基于Ruby,通过服务端处理，功能强大。解析效率高。需要学习Ruby语言，上手难度高于LESS。
- **LESS**:基于NodeJS,通过客户端处理，使用简单。功能比SASS简单，解析效率也低于SASS,但在实际开发中足够了，所以我们后台人员如果需要的话，建议使用LESS。

## 1.6. 行为层（JavaScript）

JavaScript一门弱类型脚本语言，其源代码在发往客户端运行之前不需经过编译，而是将文本格式的字符代码发送给浏览器由浏览器解释运行。
 Native原生JS开发
 原生JS开发，也就是让我们按照[ECMAScript] 标准的开发方式，简称是ES,特点是所有浏览器都支持。截止到当前博客发布时间，ES 标准已发布如下版本:

- ES3
- ES4 (内部,未征式发布)
- ES5 (全浏览器支持)
- ES6 (常用，当前主流版本: webpack打包成为ES5支持! )
- ES7
- ES8
- ES9 (草案阶段)

区别就是逐步增加新特性。

## 1.7. TypeScript

TypeScript是一种由微软开发的自由和开源的编程语言。它是JavaScript的一个超集，而且本质上向这个语言添加了可选的静态类型和基于类的面向对象编程。由安德斯海尔斯伯格(C#、Delphi、TypeScript 之父; .NET 创立者)主导。
该语言的特点就是除了具备ES的特性之外还纳入了许多不在标准范围内的新特性，所以会导致很多浏览器不能直接支持TypeScript语法，需要编译后(编译成JS)才能被浏览器正确执行。

## 1.8. JavaScript框架

- **jQuery**: 大家熟知的JavaScript框架，优点是简化了DOM操作，缺点是**DOM操作太频繁**,影响前端性能;在前端眼里使用它仅仅是为了兼容IE6、7、8;
- **Angular**: Google收购的前端框架，由一群Java程序员开发，其特点是将后台的MVC模式搬到了前端并增加了**模块化开发的理念**，与微软合作，采用TypeScript语法开发;对后台程序员友好，对前端程序员不太友好;最大的缺点是版本迭代不合理(如: 1代-> 2代，除了名字，基本就是两个东西;截止发表博客时已推出了Angular6)
- **React**: Facebook出品，一款高性能的JS前端框架;特点是提出了新概念[虚拟DOM]用于**减少真实DOM操作**，在内存中模拟DOM操作，有效的提升了前端渲染效率;缺点是使用复杂，因为需要额外学习一门[JSX] 语言;
- **Vue**:一款渐进式JavaScript框架，所谓渐进式就是逐步实现新特性的意思，如实现模块化开发、路由、状态管理等新特性。其**特点是综合了Angular (模块化)和React (虚拟DOM)的优点**;
- **Axios** :前端通信框架;因为Vue 的边界很明确，就是为了处理DOM,所以并不具备通信能力，此时就需要额外使用一个通信框架与服务器交互;当然也可以直接选择使用jQuery提供的AJAX通信功能;

前端三大框架：**Angular、React、Vue**

## 1.9. UI框架

- Ant-Design:阿里巴巴出品，基于React的UI框架
- ElementUI、 iview、 ice: 饿了么出品，基于Vue的UI框架
- Bootstrap: Twitter推出的一个用于前端开发的开源工具包
- AmazeUI:又叫"妹子UI"，一款HTML5跨屏前端框架.

JavaScript 构建工具

- Babel: JS编译工具，主要用于浏览器不支持的ES新特性，比如用于编译TypeScript
- WebPack: 模块打包器，主要作用是打包、压缩、合并及按序加载
  注：以上知识点将WebApp开发所需技能全部梳理完毕

## 1.10. 三端合一

**混合开发（Hybid App）**

主要目的是实现一套代码三端统一(PC、Android:.apk、iOS:.ipa )并能备够调用到底层件(如:传感器、GPS、 摄像头等)，打包方式主要有以下两种:

- 云打包: HBuild -> HBuildX， DCloud出品; API Cloud
- 本地打包: Cordova (前身是PhoneGap)

## 1.11. 后端技术

前端人员为了方便开发也需要掌握一定的后端技术， 但我们Java后台人员知道后台知识体系极其庞大复杂，所以为了方便前端人员开发后台应用，就出现了NodeJS这样的技术。
 
 NodeJS的作者已经声称放弃NodeJS (说是架构做的不好再加上笨重的node_ modules，可能让作者不爽了吧)，开始开发全新架构的Deno
 
 既然是后台技术，那肯定也需要框架和项目管理工具，NodeJS 框架及项目管理工具如下:

- Express: NodeJS框架
- Koa: Express简化版
- NPM:项目综合管理工具，类似于Maven
- YARN: NPM的替代方案，类似于Maven和Gradle的关系

# 2. MVVM

## 2.1. 什么是MVVM

MVVM (Model-View-ViewModel) 是一种**软件架构设计模式**，由微软WPF (用于替代WinForm，以前就是用这个技术开发桌面应用程序的)和Silverlight (类似于Java Applet,简单点说就是在浏览器上运行的WPF)的架构师Ken Cooper和Ted Peters 开发，是一种简化用户界面的**事件驱动编程方式**。由John Gossman (同样也是WPF和Silverlight的架构师)于2005年在他的博客上发表。

MVVM 源自于经典的 MVC (ModI-View-Controller) 模式。MVVM的核心是ViewModel层，负责转换Model中的数据对象来让数据变得更容易管理和使用，其作用如下:

- 该层向上与视图层进行双向数据绑定
- 向下与Model层通过接口请求进行数据交互

 ![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20201013151911651.png#pic_center) 

## 2.2. 为什么要使用MVVM

MVVM模式和MVC模式一样，主要目的是分离视图(View)和模型(Model),有几大好处：

- **低耦合**:视图(View)可以独立于Model变化和修改,一个ViewModel可以绑定到不同的View上，当View变化的时候Model可以不变，当Model变化的时候View也可以不变。
- **可复用**:你可以把一些视图逻辑放在一个ViewModel里面，让很多View重用这段视图逻辑。
- **独立开发**:开发人员可以专注于业务逻辑和数据的开发(ViewModel),设计人员可以专注于页面设计。
- **可测试**:界面素来是比较难于测试的，而现在测试可以针对ViewModel来写。

## 2.3. Vue 是 MVVM 模式的实现者

 ![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20201013152027623.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center) 

- Model : 模型层，在这里表示JavaScript对象
- View : 视图层,在这里表示DOM (HTML操作的元素)
- ViewModel : 连接视图和数据的中间件，Vue.js就是MVVM中的ViewModel层的实现者在MVVM架构中，是不允许数据和视图直接通信的，只能通过ViewModel来通信，而ViewModel就是定义了一个Observer观察者

**ViewModel 能够观察到数据的变化，并对视图对应的内容进行更新**

**ViewModel 能够监听到视图的变化，并能够通知数据发生改变**

Vue.js 就是一个MVVM的实现者，他的核心就是实现了**DOM监听**与**数据绑定**

## 为什么要使用Vue.js

●轻量级，体积小是一个重要指标。Vue.js 压缩后有只有20多kb (Angular 压缩后56kb+ ,
React压缩后44kb+ )
●移动优先。更适合移动端，比如移动端的Touch事件
●易上手，学习曲线平稳,文档齐全
●吸取了Angular (模块化)和React (虚拟DOM)的长处，并拥有自己独特的功能，如:计算属性
●开源，社区活跃度高

# 3. 第一个 Vue 程序

 代码 demo1.html 初入门之绑定数据 

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="app">
    {{message}}
</div>
<script>
    let vm = new Vue({
        el: "#app",
        data: {
            message: "hello,vue"
        }
    });
</script>
</body>
</html>

```

 现在数据和 DOM 已经被建立了关联，所有东西都是**响应式的**。 

 注意不再和 HTML 直接交互了。一个 Vue 应用会将其挂载到一个 DOM 元素上 (对于这个例子是 `#app`) 然后对其进行完全控制。那个 HTML 是我们的入口，但其余都会发生在新创建的 Vue 实例内部。 

  **v-bind语法**

```htnl
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<!--View 层-->
<div id="app">
    <!--4、元素获取 vue 中的数据-->
<!--    {{message}}-->
    <span v-bind:title="message">
        鼠标悬停几秒可查看绑定的信息
    </span>
</div>
<!--1、导入 vue.js -->
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
<script>
    var vm = new Vue({
        // 2、绑定 app 元素
        el: "#app",
        // Model 层
        // 3、插入数据，键值对
        data: {
            message: "hello,vue"
        }
    });
</script>
</body>
</html>

```

打开页面查看

![在这里插入图片描述](https://img-blog.csdnimg.cn/2020101409323761.png#pic_center)
发现 使用 v-bind: 也可以把变量绑定到元素上

v-bind` attribute 被称为指令。指令带有前缀 `v-`，以表示它们是 Vue 提供的特殊 attribute。可能你已经猜到了，它们会在渲染的 DOM 上应用特殊的响应式行为。在这里，该指令的意思是：“将这个元素节点的 `title` attribute 和 Vue 实例的 `message`property 保持一致”。 

 如果你再次打开浏览器的 JavaScript 控制台，输入 `app2.message = '新消息'`，就会再一次看到这个绑定了 `title` attribute 的 HTML 已经进行了更新。 

**v-if/v-else语法**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="app">
    <h1 v-if="ok">Yes</h1>
    <h1 v-else>No</h1>
</div>
<script>
    let vm = new Vue({
        el: "#app",
        data: {
            ok: true
        }
    });
</script>
</body>
</html>

```

**v-else-if语句**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="app">
     <ul>
        <!--类似于java 的 foreach ，
        从 items 中遍历出的每一项命名为 item-->
        <li v-for="item in items">{{item.message}}</li>
     </ul>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
<script>
    var vm = new Vue({
        el: "#app",
        data: {
            items: [
                {message: "test-1"},
                {message: "test-2"},
                {message: "test-3"}
            ]
        }
    });
</script>
</body>
</html>

```

  **for循环获取数据** 

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="app">
    <li v-for="item in items">
        {{item.message}}
    </li>
</div>
<script>
    let vm = new Vue({
        el: "#app",
        data:{
            items:[
                {message:"java"},
                {message: "前端"}
            ]
        }
    });
</script>
</body>
</html>

```

  **v-on 指令** 

用 `v-on` 指令添加一个事件监听器 ，并在触发时运行一些 JavaScript 代码。 

注意：方法必须定义在Vue的Methods的对象中

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="app">
    <button v-on:click="sayHi()">click me</button>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
<script>
    var vm = new Vue({
        el: "#app",
        data: {
            message: "Hi!!!"
        },
        // 定义方法注意一定要加 S
        methods: {
            // 冒号前是方法名
            sayHi: function (){
                alert(this.message);
            }
        }
    });
</script>
</body>
</html>
```

## 什么是数据双向绑定？

vue是一个mvvm框架，即**数据双向绑定，即当数据发生变化的时候，视图也就发生变化，当视图发生变化的时候，数据也会跟着同步变化**。这也算是vue的精髓之处了。

值得注意的是，我们所说的数据双向绑定，一定是对于UI控件来说的，非UI控件不会涉及到数据双向绑定。 单向数据绑定是使用状态管理工具（如redux）的前提。如果我们使用vuex，那么数据流也是单项的，这时就会和双向数据绑定有冲突，我们可以这么解决

##  为什么要实现数据的双向绑定

在vue中，如果使用vuex，实际上数据还是单向的，之所以说是数据双向绑定，这是用的UI控件来说，对于我们处理表单，vue的双向数据绑定用起来就特别舒服了。

**即两者并不互斥， 在全局性数据流使用单项，方便跟踪； 局部性数据流使用双向，简单易操作。**

## 表单中使用双向数据绑定

可以用 **v-model** 指令在表单 < input >、< textarea > 及 < select > 元素上创建双向数据绑定。它会根据控件类型自动选取正确的方法来更新元素。尽管有些神奇，但 v-model 本质上不过是语法糖。它负责监听用户的输入事件以更新数据，并对一些极端场景进行一些特殊处理。

注意：v-model会忽略所有表单元素value checked selected 特性的初始值而且总是将Vue示例的数据作为来源，

**数据绑定v-model**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="app">
    数据双向绑定示例：<input type="text" v-model="message">{{message}}
</div>
<script>
    let vm = new Vue({
        el: "#app",
        data: {
            message: ""
        },
    });
</script>
</body>
</html>
```

### 输入框

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<<div id="app">
    <!--双向绑定：
        data 中的 message 既和输入框的 message 绑定
            又和 p 标签中的 message 绑定-->
    <span>输入文本：</span><input type="text" v-model="message">
    <p><span>输入的文本：</span><span>{{message}}</span></p>
</div>
<script>
    var vm = new Vue({
        el: "#app",
        data: {
            message: ""
        }
    });
</script>
</body>
</html>

```

直接在输入框中输入

![在这里插入图片描述](https://img-blog.csdnimg.cn/20201014104519976.png#pic_center)

### 单选框

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<<div id="app">
    性别：
    <input type="radio" name="sex" value="male" v-model="sex"> 男
    <input type="radio" name="sex" value="female" v-model="sex"> 女

    <p>选中了：{{sex}}</p>
</div>
<script>
    var vm = new Vue({
        el: "#app",
        data: {
            sex:""
        }
    });
</script>
</body>
</html>

```

打开页面

![在这里插入图片描述](https://img-blog.csdnimg.cn/20201014105237641.png#pic_center)
这里绑定的是单选框的 **Value**

### 多选框

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="app">
    <input type="checkbox" id="jack" value="Jack" v-model="checkedNames">
    <label for="jack">杰克</label>
    <input type="checkbox" id="john" value="John" v-model="checkedNames">
    <label for="john">约翰</label>
    <input type="checkbox" id="mike" value="Mike" v-model="checkedNames">
    <label for="mike">麦克</label>
    <br>
    <span>Checked names: {{ checkedNames }}</span>
</div>
<script>
    var vm = new Vue({
        el: "#app",
        data: {
            checkedNames: []
        }
    });
</script>
</body>
</html>

```

 ![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20201014105901665.png#pic_center) 

###  下拉框

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="app">
下拉框：
<select v-model="selected">
    <option value="" disabled>-请选择-</option>
    <option value="aaa">AA</option>
    <option value="bbb">BB</option>
    <option value="ccc">CC</option>
</select>
<p>选中 ： {{selected}}</p>
</div>
<script>
    var vm = new Vue({
        el: "#app",
        data: {
            selected : ""
        }
    });
</script>
</body>
</html>

```

 ![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20201014113945582.png#pic_center) 

# 组件

## 概述

- 组件是可复用的Vue实例，说白了就是一组可以重复使用的模板，跟JSTL的自定义标签、Thymeleaf的th:fragment 等框架有着异曲同工之妙。通常一个应用会以一棵嵌套的组件树的形式来组织:
   注意:在实际开发中，我们并不会用以下方式开发组件，而是采用vue-cli创建.vue模板文件的方式开发，以下方法只是为了让大家理解什么是组件。
  Vue.component()方法注册组件

![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20200619091459336.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L29rRm9ycmVzdDI3,size_16,color_FFFFFF,t_70#pic_center) 

## 组件

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="app">
   <xain></xain>
    <xain></xain>
</div>
<script>
    // 定义组件
    Vue.component("xain",{
        template: '<li>AA</li>'
    });

    var vm = new Vue({
        el: "#app"
    });
</script>
</body>
</html>
```

## 通过Data传递数据

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="app">
    <!--  利用 v-for 把 items 的元素取出，
          再通过 v-bind 绑定数据: 把 item1 绑定在了 item2 上-->
    <xain v-for="item in items" v-bind:item="item"></xain>
</div>
<script>
    // 定义组件
    Vue.component("xain",{
        // 通过 item2 接收 item1 数据
        props: ['item'],
        template: '<li>{{item}}</li>'
    });

    var vm = new Vue({
        el: "#app",
        data: {
            items: ["AAA","BBB","CCC"]
        }
    });
</script>
</body>
</html>

```

注意：传值给组中的值用：props

# Axios 异步通信

## 概述

Axios 是一个开源的可以用在浏览器端和 NodeJS 的异步通信框架，它的主要作用就是实现 AJAX 异步通信，其功能特点如下：

- 从浏览器中创建 XMLHttpRequests
- 从 node.js 创建 http 请求
- 支持 Promise API
- 拦截请求和响应
- 转换请求数据和响应数据
- 取消请求
- 自动转换 JSON 数据
- 客户端支持防御 XSRF（跨站请求伪造）
-  GitHub: https://github.com/ axios/axios
- 中文文档: http://www.axios-js.com/ 

## 为什么要使用 Axios

由于 Vue.js 是一个 视图层框架 并且作者（尤雨溪）严格准守 SoC （关注度分离原则），所以 Vue.js 并不包含 AJAX 的通信功能，Vue推荐使用 Axios 框架，尽量不适用 JQuery，因为它会频繁的操作 DOM

# Vue的生命周期

官方文档: https://cn.vuejs.org/v2/guide/instance.html#生 命周期图示
Vue实例有一个完整的生命周期，也就是从开始创建、初始化数据、编译模板、挂载DOM、渲染→更新→渲染、卸载等一系列过程，我们称这是Vue的生命周期。通俗说就是Vue实例从创建到销毁的过程，就是生命周期。
在Vue的整个生命周期中，它提供了一系列的事件，可以让我们在事件触发时注册JS方法,可以让我们用自己注册的JS方法控制整个大局，在这些事件响应方法中的this直接指向的是Vue的实例。
 ![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20201014152745531.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center) 

## 第一个 Axios 

```html
<!-- axios 的包-->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
```

 在实际开发中，大多使用的是 JSON 格式数据， 

```html
{
  "name":"wmt",
  "age":18
}

```

```html
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

</head>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/axios/0.21.1/axios.js"></script>
<body>
<div id="box">
    {{info.name}}
    {{info.age}}
</div>

</body>
<script>
    var vm= new Vue({
        el: '#box',
        data(){
            return{
                info:{
                    name:null,
                    age:null
                }
            }
        },
        mounted(){
            axios.get('../vueTest/test.json').then(request=>(this.info=request.data));
        }
    });
</script>
</html>
```

打开页面，打开开发者工具

可以发现 Axios 和 AJax 一样是异步的通信
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201014153606232.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center)
也可以看到已经获取到了数据
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201014153709470.png#pic_center)

 获得的 Json 渲染到页面 

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
    <!-- axios 的包-->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div id="vue">
    <!--    需要渲染的字段名 -->
    <div>{{info.name}}</div>
    <div>{{info.address}}</div>
    <div>{{info.address.city}}</div>
    <div v-for="link in info.links">
        <span>{{link.name}}</span> :
        <a v-bind:href="link.url">{{link.url}}</a>
    </div>
</div>

<script>
    var vm = new Vue({
        el: "#vue",
        // 有冒号、大括号的 data 是属性
        data: {},
        // 没有冒号的是方法
        // 这里使用的 data 方法，不要搞混
        data(){
            return{
                // 请求的返回参数,这里需要写上需要返回的字段名，不需要写值，所以都写 null
                // 这里的键可以比传入的 Json 中的少
                // 但是如果写了，就必须和获得的 Json 键的名字一样
                info: {
                    name: null,
                    address: {
                        city: null,
                        country: null
                    },
                    links: [
                        {
                            name: null,
                            url: null
                        }
                    ]
                }
            }
        },
        // 钩子函数，在主流程执行过程中间执行的方法
        mounted(){
            // 这边把 上面 return 中的 info 值和返回的 data 数据绑定，以便返回给视图渲染
            axios.get('../data.json').then(response=>(this.info=response.data));
        }
    });
</script>
</body>
</html>

```

页面
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201014154932832.png#pic_center)

## 解决闪烁问题

上面那个 Demo 写好，在刷新页面的时候会发现，最开始出现的是模板，过一会儿后数据才出来
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201015084241646.png#pic_center)

这样对用户不太友好，对数据也不安全，所以用如下方法解决

在 HTML 上方写一个 < style >< /style >

```html
<style>
    [v-cloak]{
        display: none;
    }
</style>
```

# 计算属性（VUE相比Angular和React的特性）

 计算属性的重点突出在属性两个字上(属性是名词)，首先它是个属性其次这个属性有计算的能力(计算是动词)，这里的计算就是个函数;简单点说，它就是一个能够将计算结果缓存起来的属性(将行为转化成了静态的属性)，仅此而已;可以想象为**缓存**!

- 计算属性 ： 把计算出来的结果，保存在属性中。

- 好处 ：在内存中运行，虚拟 DOM

  

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="vue">
    <!-- 调用方法 -->
    <p>currentTime1 : {{currentTime1()}}</p>
    <!-- 调用属性 -->
    <p>currentTime2 : {{currentTime2}}</p>
</div>
<script>
    var vm = new Vue({
        el: "#vue",
        data: {
            message: "hello."
        },
        methods: {
            currentTime1: function (){
                // 返回当前时间戳
                return Date.now();
            }
        },
        // 计算属性
        computed: {
            // 方法名不能一样
            currentTime2: function (){
                // 返回当前时间戳
                return Date.now();
            }
        }
    });
</script>
</body>
</html>

```

- **体验区别**

  打开页面、打开开发者模式、使用控制台

1. 调用的时候普通方法是调用方法名 ； 计算属性调用时是属性名
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20201015091251947.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center)
2. 普通函数调用一次执行一次 ； 计算属性把计算完的结果，当成属性，存在内存中
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20201015091604594.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center)

- **什么时候计算属性会改变**

  修改计算属性中的方法

  ```html
  // 计算属性
     computed: {
          // 方法名不能一样
          currentTime2: function (){
              // 返回当前时间戳
              return Date.now() +"  | "+this.message;
          }
      }
  ```

打开页面、打开开发者模式、使用控制台

![在这里插入图片描述](https://img-blog.csdnimg.cn/20201015092210563.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center)
所以只要计算属性方法体中有数据发生改变，计算属性就会改变。

# 内容分发— slot

在Vue.js中我们使用 元素作为承载分发内容的出口，作者称其为插槽，可以应用在组合组件的场景中;
这里穿插以下vue的语法缩写
v:bind: 可以缩写为一个:
v-on: 可以缩写为一个@ 

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div>//原来的模式
    <p>书籍列表</p>
    <ul>
        <li>AAA</li>
        <li>BBB</li>
        <li>CCC</li>
    </ul>
</div>
————————————————————————————————
<div id="vue">//现在的模式
    <list>
        <!--绑定插槽 : 使用 slot 属性绑定，引号里的值，必须和下面的 name 属性一样-->
        <!--绑定数据 : 冒号后面是组件中定义的值
                      引号里面是 data 数据的字段值
                      不能混淆-->
        <list-title slot="list-title" :title="list_title"></list-title>
        <list-items slot="list-items" v-for="item in list_items" :item="item"></list-items>
    </list>
</div>
<script>
    Vue.component("list",{//定义插槽
        template:
            '<div>\
                <slot name="list-title"></slot>\
                <ul>\
                    <slot name="list-items"></slot>\
                </ul>\
            </div>'
    });

    Vue.component("list-title",{// 定义数据，插入插槽
        props: ['title'],
        template: '<div>{{title}}</div>'
    });

    Vue.component("list-items",{// 定义数据，插入插槽
        props: ['item'],
        template: '<li>{{item}}</li>'
    });

    var vm = new Vue({
        el: "#vue",
        data: {
            list_title: "标题————",
            list_items:["AA","BBB","CCCC"]
        }
    });
</script>

</body>
</html>

```

```
绑定插槽 : 使用 slot 属性绑定，引号里的值，必须和下面的 name 属性一样
绑定数据 : 冒号后面是组件中定义的值,引号里面是 data 数据的字段值不能混淆
```

 ![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20201015100651719.png#pic_center) 

# 定义事件

 通过以上代码不难发现，数据项在Vue的实例中，但删除操作要在组件中完成，那么组件如何才能删除Vue实例中的数据呢?此时就涉及到参数传递与事件分发了，Vue为我们提供了自定义事件的功能很好的帮助我们解决了这个问题;使用this.$emit(‘自定义事件名’,参数)

 流程图 

 ![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20201015110208323.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center) 

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--1.导入vue.js-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
</head>
<body>
<div id="app">
    <todo>
        <todo-title slot="todo-title" v-bind:title="title"></todo-title>
        <todo-items slot="todo-items" v-for="(item,i) in todoItems"
                    v-bind:item="item" v-bind:index="i"
                    v-on:remove="removeItem(i)">
        </todo-items>
    </todo>
</div>
<script>
    //slot 插槽 这个组件要定义在前面不然出不来数据
    Vue.component("todo", {
        template: '<div>\
                <slot name="todo-title"></slot>\
                <ul>\
                <slot name="todo-items"></slot>\
                </ul>\
                <div>'
    });
    Vue.component("todo-title", {
        //属性
        props: ['title'],
        template: '<div>{{title}}</div>'
    });
    Vue.component("todo-items", {
        props: ['item', 'index'],
        template: '<li>{{index}}-{{item}}<button style="margin: 5px" @click="remove">删除</button></li>',
        methods: {
            remove: function (index) {
                // this.$emit('事件',参数) 自定义事件分发（远程调用方法）
                 // 把这里的 remove 方法和 上面的 diyremove 事件绑定
                
                this.$emit('remove', index)
            }
        },
    });
    let vm = new Vue({
        el: "#app",
        data: {
            //标题
            title: "图书馆系列图书",
            //列表
            todoItems: ['三国演义','红楼梦','西游记','水浒传']
        },
        methods: {
            removeItem: function (index) {
                // 一次删除一个元素
                this.todoItems.splice(index, 1)
                console.log("删除了" + this.todoItems[index] + "OK")
            }
        },
    });
</script>
</body>
</html>
```

通过 `this.$emit("自定义事件名",参数)` 让组件调用事件

```html
<!--数据绑定 ：把 items 中的每一项元素遍历出来命名为 item 再和下面的 item 绑定-->
<!--事件绑定 ：自定义一个名为 diyremove 的事件，先和vue对象中的 removeItem 方法绑定再去到组件中的 remove 和 diyremove 事件绑定-->
<!--注意 : 属性值都要小写，大写不生效，也不会报错 ； 在自定义事件绑定方法的时候 v-on 不能缩写-->
<list-items slot="list-items" v-for="(item,index) in l_items" :item="item" :index="index" v-on:diyre
```

vue实例和vue组件里面的变量都是局部变量，只能通过前端进行传递值

vue组件的核心是属性，属性是规约

vue.component:定义一个组件

props：传参

methodds/this.$emit：远程调用vue方法

# Vue-cli

##  什么是vue-cli

vue-cli 官方提供的一个脚手架,用于快速生成一个 vue 的项目模板;

预先定义好的目录结构及基础代码，就好比咱们在创建 Maven 项目时可以选择创建一个骨架项目，这个骨架项目就是脚手架,我们的开发更加的快速;

主要功能：

- 统一的目录结构
- 本地调试
- 热部署
- 单元测试
- 集成打包上线

## 需要的环境

- Node.js : http://nodejs.cn/download/

- Git : https://git-scm.com/downloads

- 安装 Node.js

- 查看是否安装成功

  cmd 下输入 node -v,查看是否能够正确打印出版本号即可!

- 安装 Node.js 淘宝镜像加速器（cnpm）

```xml
（CMD 命令）-g 就是全局安装
 npm install cnpm -g 
 # 或使用如下语句解决 npm 速度慢的问题
 npm install 
```

 ![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20201015142200905.png#pic_center) 

装vue-cli

```html
（CMD 命令）
cnpm install vue-cli -g
（CMD 命令）
# 测试是否安装成功
# 查看可以基于哪些模板创建 vue 应用程序，通常我们选择 webpack
vue list
```

**说明:**
1、**Project name**：项目名称，默认 回车 即可

2、**Project description**：项目描述，默认 回车 即可

3、**Author**：项目作者，默认 回车 即可

4、**Vue build** ：编译，选择第一个

5、**Install vue-router**：是否安装 vue-router，选择 n 不安装（后期需要再手动添加）

6、**Use ESLint to lint your code**：是否使用 ESLint 做代码检查，选择 n 不安装（后期需要再手动添加）

7、**Set up unit tests**：单元测试相关，选择 n 不安装（后期需要再手动添加）

8、**Setup e2e tests with Nightwatch**：单元测试相关，选择 n 不安装（后期需要再手动添加）

9、**Should we run npm install for you after the project has been created**：创建完成后直接初始化，选择 n，我们手动执行;运行结果!

**生成的文件**
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020101514351269.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center)

初始化并运行myvue项目

```html
（CMD 命令）
# 进入文件夹
cd myvue
# 安装环境
npm install 
# 启动项目
npm run dev
# 停止 ctrl + c
```

![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20200622163745319.png#pic_center) 

 输入npm run dev 后 进入localhost:8080 

![在这里插入图片描述](https://img-blog.csdnimg.cn/20201015145046853.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center)

# Webpack

## 什么是webpack

webpack可以看做是**静态模块打包机**：它做的事情是，分析你的项目结构，找到JavaScript模块以及其它的一些浏览器不能直接运行的拓展语言（Scss，TypeScript等），并将其打包为合适的格式以供浏览器使用。

本质上，webpack是一个现代JavaScript应用程序的静态模块打包器(module bundler)。当webpack处理应用程序时，它会递归地构建一个依赖关系图(dependency graph),其中包含应用程序需要的每个模块，然后将所有这些模块打包成一个或多个bundle.
 Webpack是当下最热门的前端资源模块化管理和打包工具，它可以将许多松散耦合的模块按照依赖和规则打包成符合生产环境部署的前端资源。还可以将按需加载的模块进行代码分离，等到实际需要时再异步加载。通过loader转换，任何形式的资源都可以当做模块，比如CommonsJS、AMD、ES6、 CSS、JSON、CoffeeScript、LESS等;
 伴随着移动互联网的大潮，当今越来越多的网站已经从网页模式进化到了WebApp模式。它们运行在现代浏览器里，使用HTML5、CSS3、ES6 等新的技术来开发丰富的功能，网页已经不仅仅是完成浏览器的基本需求; WebApp通常是一个SPA (单页面应用) ，每一个视图通过异步的方式加载，这导致页面初始化和使用过程中会加载越来越多的JS代码，这给前端的开发流程和资源组织带来了巨大挑战。
 前端开发和其他开发工作的主要区别，首先是前端基于多语言、多层次的编码和组织工作，其次前端产品的交付是基于浏览器的，这些资源是通过增量加载的方式运行到浏览器端，如何在开发环境组织好这些碎片化的代码和资源，并且保证他们在浏览器端快速、优雅的加载和更新，就需要一个模块化系统，这个理想中的模块化系统是前端工程师多年来一直探索的难题。

## 为什么要使用webpack

如今的很多网页其实可以看做是功能丰富的应用，它们拥有着复杂的JavaScript代码和一大堆依赖包。为了简化开发的复杂度，前端社区涌现出了很多好的实践方法

1. 模块化，让我们可以把复杂的程序细化为小的文件;

2. 类似于TypeScript这种在JavaScript基础上拓展的开发语言：使我们能够实现目前版本的JavaScript不能直接使用的特性，并且之后还能能装换为JavaScript文件使浏览器可以识别；

3. scss，less等CSS预处理器

   ……
   这些改进确实大大的提高了我们的开发效率，但是利用它们开发的文件往往需要进行额外的处理才能让浏览器识别,而手动处理又是非常繁琐的，这就为WebPack类的工具的出现提供了需求。

## 模块化的演进

### Script标签

```html
	<script src = "module1.js"></script>
	<script src = "module2.js"></script>
	<script src = "module3.js"></script>
```

这是最原始的JavaScript文件加载方式，如果把每一个文件看做是一个模块，那么他们的接口通常是暴露在全局作用域下，也就是定义在window对象中，不同模块的调用都是一个作用域。
  这种原始的加载方式暴露了一些显而易见的弊端：

- 全局作用域下容易造成变量冲突
- 文件只能按照``的书写顺序进行加载
- 开发人员必须主观解决模块和代码库的依赖关系
- 在大型项目中各种资源难以管理，长期积累的问题导致代码库混乱不堪

### **CommonsJS**

------

服务器端的NodeJS遵循CommonsJS规范，该规范核心思想是允许模块通过require方法来同步加载所需依赖的其它模块，然后通过exports或module.exports来导出需要暴露的接口。

```javascript
require("module");
require("../module.js");
export.doStuff = function(){};
module.exports = someValue;
```

**优点：**

- 服务器端模块便于重用
- NPM中已经有超过45万个可以使用的模块包
- 简单易用

**缺点：**

- 同步的模块加载方式不适合在浏览器环境中，同步意味着阻塞加载，浏览器资源是异步加载的
- 不能非阻塞的并行加载多个模块

**实现：**

- 服务端的NodeJS
- •Browserify，浏览器端的CommonsJS实现，可以使用NPM的模块，但是编译打包后的文件体积较大
- modules-webmake，类似Browserify，但不如Browserify灵活
- wreq，Browserify的前身

### **AMD**

------

Asynchronous Module Definition规范其实主要一个主要接口define(id?,dependencies?,factory);它要在声明模块的时候指定所有的依赖dependencies，并且还要当做形参传到factory中，对于依赖的模块提前执行。

```javascript
define("module",["dep1","dep2"],functian(d1,d2){
	return someExportedValue;
});
require（["module","../file.js"],function(module，file){});
```

**优点**

- 适合在浏览器环境中异步加载模块
- 可以并行加载多个模块

**缺点**

- 提高了开发成本，代码的阅读和书写比较困难，模块定义方式的语义不畅
- 不符合通用的模块化思维方式，是一种妥协的实现

实现

- RequireJS
- curl

### **CMD**

------

Commons Module Definition规范和AMD很相似，尽保持简单，并与CommonsJS和NodeJS的Modules规范保持了很大的兼容性。

```javascript
define(function(require,exports,module){
	var $=require("jquery");
	var Spinning = require("./spinning");
	exports.doSomething = ...;
	module.exports=...;
});
```

**优点：**

- 依赖就近，延迟执行
- 可以很容易在NodeJS中运行缺点
- 依赖SPM打包，模块的加载逻辑偏重

**实现**

- Sea.js
- coolie

### ES6模块

------

EcmaScript 6标准增加了JavaScript语言层面的模块体系定义。ES 6模块的设计思想， 是尽量静态化， 使编译时就能确定模块的依赖关系， 以及输入和输出的变量。Commons JS和AMD模块，都只能在运行时确定这些东西。

```javascript
import "jquery"
export function doStuff(){}
module "localModule"{}
```

**优点**

- 容易进行静态分析
- 面向未来的EcmaScript标准

**缺点**

- 原生浏览器端还没有实现该标准
- 全新的命令，新版的Node JS才支持

**实现**

- Babel

**大家期望的模块**
  系统可以兼容多种模块风格， 尽量可以利用已有的代码， 不仅仅只是JavaScript模块化， 还有CSS、图片、字体等资源也需要模块化。

## 安装 Webpack

WebPack是一款模块加载器兼打包工具， 它能把各种资源， 如JS、JSX、ES 6、SASS、LESS、图片等都作为模块来处理和使用。

**安装命令**

```html
（CMD 命令）
npm install webpack -g 
npm install webpack-cli -g 
```

**测试是否安装成功**

```html
webpack -v
webpack-cli -v
```

## 配置

创建 webpack.config.js 配置文件

- entry：入口文件， 指定Web Pack用哪个文件作为项目的入口

- output：输出， 指定WebPack把处理完成的文件放置到指定路径

- module：模块， 用于处理各种类型的文件

- plugins：插件， 如：热更新、代码重用等

- resolve：设置路径指向

- watch：监听， 用于设置文件改动后直接打包

  ```yaml
  module.exports = {
  	entry:"",
  	output:{
  		path:"",
  		filename:""
  	},
  	module:{
  		loaders:[
  			{test:/\.js$/,;\loade:""}
  		]
  	},
  	plugins:{},
  	resolve:{},
  	watch:true
  }
  ```

# 使用webpack

1. 创建项目（创建一个空文件夹，用idea打开）
2. 创建一个名为modules的目录，用于放置JS模块等资源文件
3. 在modules下创建模块文件，如hello.js，用于编写JS模块相关代码

```js
//暴露一个方法
exports.sayHi = function() {
    document.write("<h1>狂神说ES6</h1>")
}
```

1. 在modules下创建一个名为main.js的入口文件，用于打包时设置entry属性

```js
//require 导入一个模块，就可以调用这个模块中的方法了
var hello = require("./hello");
hello.sayHi();
```

1. 在项目目录下创建webpack.config.js配置文件，使用webpack命令打包

```js
module.exports = {
	entry:"./modules/main.js",
	output:{
		filename:"./js/bundle.js"
	}

}
```

1. 在项目目录下创建HTML页面，如index.html，导入webpack打包后的JS文件

```html
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>狂神说Java</title>
    </head>
    <body>
        <script src="dist/js/bundle.js"></script>
    </body>
</html>
```

 在idea命令台输入webpack命令（idea要设置管理员启动） 

 ![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20200623085600641.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L29rRm9ycmVzdDI3,size_16,color_FFFFFF,t_70#pic_center) 

完成上述操作之后会在主目录生成一个dist文件 生成的js文件夹路径为/dist/js/bundle.js
在主目录创建index.html 导入bundle.jsl

```html
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="dist/js/bundle.js"></script>
</head>

<body>
</body>
</html>
```

1. 实际效果如图
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200623085852753.png#pic_center)

#  vue-router

## 说明

Vue Router是Vue.js官方的路由管理器（路径跳转）。它和Vue.js的核心深度集成，让构建单页面应用变得易如反掌。包含的功能有:

1. 嵌套的路由/视图表
2. 模块化的、基于组件的路由配置
3. 路由参数、查询、通配符
4. 基于Vue.js过渡系统的视图过渡效果
5. 细粒度的导航控制
6. 带有自动激活的CSS class的链接
7. HTML5历史模式或hash模式，在IE9中自动降级
8. 自定义的滚动条行为

## 安装

基于第一个vue-cli进行测试学习

cmd 进入 myvue 目录，并执行

```javascript
npm install vue-router --save-dev 
安装完之后去node_modules路径看看是否有vue-router信息 有的话则表明安装成功
```

## 使用

1. 清理代码

   删除 src 目录下的图片、components 目录下的组件

   修改 App.vue

   ```html
   <template>
     <div id="app">
     </div>
   </template>
   <script>
   export default {
     name: "App"
   }
   </script>
   <style>
   #app {
     font-family: 'Avenir', Helvetica, Arial, sans-serif;
     -webkit-font-smoothing: antialiased;
     -moz-osx-font-smoothing: grayscale;
     text-align: center;
     color: #2c3e50;
     margin-top: 60px;
   }
   </style>
   ```

1. 启动项目

2. 修改 App.vue

   ```html
   <template>
     <div id="app">
       <h1>ES6</h1>
     </div>
   </template>
   12345
   ```

   发现项目自动 Bulid ，页面自动刷新

   这就是 Vue 的热部署

在 components 中新建一个 Vue 组件 ：Content.vue

```html
<template>
  <h1>Content</h1>
</template>
<script>
export default {
  name: "Content"
}
</script>
<!-- 加上 scoped 表示只会在当前组件生效 -->
<style scoped>
</style>
```

在 components 中新建一个 Vue 组件 ：Main.vue

```html
<template>
  <h1>首页</h1>
</template>
<script>
export default {
  name: "main"
}
</script>
<style scoped>
</style>
```

在 src 下新建一个包（router），在该包中新建一个文件：index.js

```javascript
// 导入文件
import Vue from "vue";
import VueRouter from "vue-router";
// 导入组件
import Content from "../components/Content";
import Main from "../components/Main";

// 安装路由
Vue.use(VueRouter);

// 配置导出路由
export default new VueRouter({
  routes: [
    {
      // 类似于 @RequestMapping 接收一个请求，返回一个页面
      // 路由的路径
      path: '/content',
      // 配置名称
      name: 'content',
      // 跳转的组件
      component: Content
    },
    {
      // 路由的路径
      path: '/main',
      // 配置名称
      name: 'Main',
      // 跳转的组件
      component: Main
    }
  ]
});
```

修改 main.js

```javascript
import Vue from 'vue'
import App from './App'
// 导入 vue-router 的路由配置
// 这里是写在 index.js 文件中的所以导入该文件
// 因为文件名是 index 会自动扫描该文件，所以index可省
// 注意！！ 这里必须写 router ，写错前端页面就报错
import router from "./router/index";

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  // 配置路由,上面的组件名
  router,
  components: { App },
  template: '<App/>'
})
```

修改 App.vue 中的 template 部分

```html
<template>
  <div id="app">
    <h1>呵呵</h1>
    <!--跳转链接，点击链接显示对应内容-->
    <!--类似于原来的 <a></a> ;
        to 类似于原来的 href,后面的值就是配置的路由-->
    <router-link to="/main">首页</router-link>
    <router-link to="/content">内容页</router-link>
    <!--展示视图，理解为用于展示上面两个链接对应内容的区域-->
    <router-view></router-view>
  </div>
</template>
```

# Vue+ElementUI

 创建一个名为 hello-vue 的工程 vue init webpack hello-vue 

先在 CMD 下进入需要创建的目录

安装 vue-router、element-ui、sass-loader、node-sass 四个插件

```javascript
# 进入工程目录
cd hello-vue
# 安装 vue-router
npm install vue-router --save-dev
# 安装 element-ui
npm i element-ui -S
# 安装依赖
npm install
# 安装 SASS 加载器
cnpm install sass-loader node-sass --save-dev
# 启动测试
npm run dev	
```

  创建成功后用idea打开，并删除净东西 创建views和router文件夹用来存放视图和路由
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200623143803994.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L29rRm9ycmVzdDI3,size_16,color_FFFFFF,t_70#pic_center) 

 在 views 包下新建一个视图组件：Main.vue 

```html
<template>
  <h1>首页</h1>
</template>
<script>
  export default {
    name: "Main"
  }
</script>
<style scoped>
</style>
```

  在views中创建Login.vue视图组件 

```html
<template>
  <div>
    <el-form ref="loginForm" :model="form" :rules="rules" label-width="80px" class="login-box">
      <h3 class="login-title">欢迎登录</h3>
      <el-form-item label="账号" prop="username">
        <el-input type="text" placeholder="请输入账号" v-model="form.username"/>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input type="password" placeholder="请输入密码" v-model="form.password"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" v-on:click="onSubmit('loginForm')">登录</el-button>
      </el-form-item>
    </el-form>

    <el-dialog
      title="温馨提示"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="handleClose">
      <span>请输入账号和密码</span>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
  export default {
    name: "Login",
    data() {
      return {
        form: {
          username: '',
          password: ''
        },

        // 表单验证，需要在 el-form-item 元素中增加 prop 属性
        rules: {
          username: [
            {required: true, message: '账号不可为空', trigger: 'blur'}
          ],
          password: [
            {required: true, message: '密码不可为空', trigger: 'blur'}
          ]
        },

        // 对话框显示和隐藏
        dialogVisible: false
      }
    },
    methods: {
      onSubmit(formName) {
        // 为表单绑定验证功能
        this.$refs[formName].validate((valid) => {
          if (valid) {
            // 使用 vue-router 路由到指定页面，该方式称之为编程式导航
            this.$router.push("/main");
          } else {
            this.dialogVisible = true;
            return false;
          }
        });
      }
    }
  }
</script>

<style lang="scss" scoped>
  .login-box {
    border: 1px solid #DCDFE6;
    width: 350px;
    margin: 180px auto;
    padding: 35px 35px 15px 35px;
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    box-shadow: 0 0 25px #909399;
  }

  .login-title {
    text-align: center;
    margin: 0 auto 40px auto;
    color: #303133;
  }
</style>
```

 创建路由,在 router 目录下创建一个名为 index.js 的 vue-router 路由配置文件 

```jsp
//导入vue
import Vue from 'vue';
import VueRouter from 'vue-router';
//导入组件
import Main from "../views/Main";
import Login from "../views/Login";
//使用
Vue.use(VueRouter);
//导出
export default new VueRouter({
  routes: [
    {
      //登录页
      path: '/main',
      component: Main
    },
    //首页
    {
      path: '/login',
      component: Login
    },
  ]


})
```

 在main.js中配置相关main.js main.js是index.html调用的 所以基本上所有东西都导出到这一定不要忘记扫描路由配置并将其用到new Vue中 

```vue
import Vue from 'vue'
import App from './App'
import VueRouter from "vue-router";
//扫描路由配置
import router from "./router"
//导入elementUI
import ElementUI from "element-ui"
//导入element css
import 'element-ui/lib/theme-chalk/index.css'
//使用
Vue.use(VueRouter)
Vue.use(ElementUI)
Vue.config.productionTip = false
new Vue({
  el: '#app',
  router,
  render: h => h(App),//ElementUI规定这样使用
})
```

 在App.vue中配置显示视图 

```vue
<template>
  <div id="app">
    <!--展示视图-->
    <router-view></router-view>
  </div>
</template>
<script>
  export default {
    name: 'App',
  }
</script>
```

  最后效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200623144127374.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L29rRm9ycmVzdDI3,size_16,color_FFFFFF,t_70#pic_center) 

 如果出现错误: 可能是因为sass-loader的版本过高导致的编译错误，当前最高版本是8.0.2，需要退回到7.3.1 ；去package.json文件里面的 "sass-loader"的版本更换成7.3.1，然后重新cnpm install就可以了； 

#  路由嵌套

 套路由又称子路由，在实际应用中，通常由多层嵌套的组件组合而成，例如：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201016104914179.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center) 

1. 在 views 中新建一个 user包

2. 在 user 包下，新建 List.vue

   ```vue
   <template>
     <h1>用户列表</h1>
   </template>
   <script>
     export default {
       name: "UserList"
     }
   </script>
   <style scoped>
   </style>
   ```

3.在 user 包下，新建 Profile.vue 

```vue
<template>
  <h1>个人信息</h1>
</template>
<script>
  export default {
    name: "UserProfile"
  }
</script>
<style scoped>
</style>
```

4.修改 Main.vue ，添加一个侧边栏 

```vue
<template>
    <div>
      <el-container>
        <el-aside width="200px">
          <el-menu :default-openeds="['1']">
            <el-submenu index="1">
              <template slot="title"><i class="el-icon-caret-right"></i>用户管理</template>
              <el-menu-item-group>
                <el-menu-item index="1-1">
                <!--插入的地方-->
                  <router-link to="/user/profile">个人信息</router-link>
                </el-menu-item>
                <el-menu-item index="1-2">
                <!--插入的地方-->
                  <router-link to="/user/list">用户列表</router-link>
                </el-menu-item>
              </el-menu-item-group>
            </el-submenu>
            <el-submenu index="2">
              <template slot="title"><i class="el-icon-caret-right"></i>内容管理</template>
              <el-menu-item-group>
                <el-menu-item index="2-1">分类管理</el-menu-item>
                <el-menu-item index="2-2">内容列表</el-menu-item>
              </el-menu-item-group>
            </el-submenu>
          </el-menu>
        </el-aside>

        <el-container>
          <el-header style="text-align: right; font-size: 12px">
            <el-dropdown>
              <i class="el-icon-setting" style="margin-right: 15px"></i>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item>个人信息</el-dropdown-item>
                <el-dropdown-item>退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </el-header>
          <el-main>
          <!--在这里展示视图-->
            <router-view />
          </el-main>
        </el-container>
      </el-container>
    </div>
</template>
<script>
    export default {
        name: "Main"
    }
</script>
<style scoped lang="scss">
  .el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
  }
  .el-aside {
    color: #333;
  }
</style>
```

5.配置嵌套路由修改 router 目录下的 index.js 路由配置文件，使用children放入main中写入子模块， 

```vue
//导入vue
import Vue from 'vue';
import VueRouter from 'vue-router';
//导入组件
import Main from "../views/Main";
import Login from "../views/Login";
//导入子模块
import UserList from "../views/user/List";
import UserProfile from "../views/user/Profile";

//使用
Vue.use(VueRouter);
//导出
export default new VueRouter({
  routes: [
    {
      //登录页
      path: '/main',
      component: Main,
      //  写入子模块
      children: [
        {
          path: '/user/profile',
          component: UserProfile,
        }, {
          path: '/user/list',
          component: UserList,
        },
      ]
    },
    //首页
    {
      path: '/login',
      component: Login

    },
  ]
})
```

在 Main.vue 中插入路由链接，展示视图
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201016114332485.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center)



![在这里插入图片描述](https://img-blog.csdnimg.cn/20201016114551572.png#pic_center)

- **修改路由的模式**

  有两种模式 ：1、hash ：路径中有 # ； 2、history ：路径中不带 #

  修改文件 index.js
  ![在这里插入图片描述](https://img-blog.csdnimg.cn/202010161237010.png#pic_center)

打开页面
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201016114421462.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ0OTgzOA==,size_16,color_FFFFFF,t_70#pic_center)

# 参数传递及重定向

## 通过route传参

1、 修改路由配置, 主要是router下的index.js中的 path 属性中增加了 :id 这样的占位符

```javascript
{
	path: '/user/profile/:id', 
	name:'UserProfile', 
	component: UserProfile
}
```

2、传递参数
 此时我们在Main.vue中的route-link位置处 to 改为了 :to，是为了将这一属性当成对象使用，注意 router-link 中的 name 属性名称 一定要和 路由中的 name 属性名称 匹配，因为这样 Vue 才能找到对应的路由路径；

```vue
<!--name是组件的名字 params是传的参数 如果要传参数的话就需要用v:bind:来绑定-->
<router-link :to="{name:'UserProfile',params:{id:1}}">个人信息</router-link>
```

3.在要展示的组件Profile.vue中接收参数 使用 {{$route.params.id}}来接收
Profile.vue 部分代码

```vue
<template>
  <!--  所有的元素必须在根节点下-->
  <div>
    <h1>个人信息</h1>
    {{$route.params.id}}
  </div>
</template>
```



**通过 props 传参取值方式 使用props 减少耦合**
1、修改路由配置 , 主要在router下的index.js中的路由属性中增加了 props: true 属性

```vue
{
	path: '/user/profile/:id', 
	name:'UserProfile', 
	component: UserProfile, 
	props: true
}

```

2、传递参数和之前一样 在Main.vue中修改route-link地址

```vue
<!--name是组件的名字 params是传的参数 如果要传参数的话就需要用v:bind:来绑定-->
<router-link :to="{name:'UserProfile',params:{id:1}}">个人信息</router-link>

```

3、在Profile.vue接收参数为目标组件增加 props 属性
Profile.vue

```vue
<template>
  <div>
    个人信息
    {{ id }}
  </div>
</template>
<script>
    export default {
      props: ['id'],
      name: "UserProfile"
    }
</script>
<style scoped>
</style>


```

 ![å¨è¿éæå¥å¾çæè¿°](https://img-blog.csdnimg.cn/20200624140100715.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L29rRm9ycmVzdDI3,size_16,color_FFFFFF,t_70#pic_center) 

## 

组件重定向
 重定向的意思大家都明白，但 Vue 中的重定向是作用在路径不同但组件相同的情况下，比如：
在router下面index.js的配置

```vue
{
  path: '/main',
  name: 'Main',
  component: Main
},
{
  path: '/goHome',
  redirect: '/main'
}

```

 说明：这里定义了两个路径，一个是 /main ，一个是 /goHome，其中 /goHome 重定向到了 /main 路径，由此可以看出重定向不需要定义组件；

 使用的话，只需要在Main.vue设置对应路径即可；

```vue
<el-menu-item index="1-3">
    <router-link to="/goHome">回到首页</router-link>
</el-menu-item>
```

# 404 和 路由钩子

路由模式有两种

hash：路径带 # 符号，如 http://localhost/#/login
history：路径不带 # 符号，如 http://localhost/login
修改路由配置，代码如下：

```vue
export default new Router({
  mode: 'history',
  routes: [
  ]
});
```

 1.创建一个NotFound.vue视图组件
NotFound.vue 

```vue
<template>
    <div>
      <h1>404,你的页面走丢了</h1>
    </div>
</template>
<script>
    export default {
        name: "NotFound"
    }
</script>
<style scoped>
</style>
```

2.修改路由配置index.js

```vue
import NotFound from '../views/NotFound'
{
   path: '*',
   component: NotFound
}

```

3.效果图

![img](https://img-blog.csdnimg.cn/20200624142229445.png) 

## 路由钩子与异步请

beforeRouteEnter：在进入路由前执行
beforeRouteLeave：在离开路由前执行

在Profile.vue中写

```vue
  export default {
    name: "UserProfile",
    beforeRouteEnter: (to, from, next) => {
      console.log("准备进入个人信息页");
      next();
    },
    beforeRouteLeave: (to, from, next) => {
      console.log("准备离开个人信息页");
      next();
    }
  }
```


参数说明：
to：路由将要跳转的路径信息
from：路径跳转前的路径信息
next：路由的控制参数
next() 跳入下一个页面
next(’/path’) 改变路由的跳转方向，使其跳到另一个路由
next(false) 返回原来的页面
next((vm)=>{}) 仅在 beforeRouteEnter 中可用，vm 是组件实例

**在钩子函数中使用异步请求**
1、安装 Axios

```cue
cnpm install --save vue-axios
```


2、main.js引用 Axios

```vue
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios, axios)
```


3、准备数据 ： 只有我们的 static 目录下的文件是可以被访问到的，所以我们就把静态文件放入该目录下。
数据和之前用的json数据一样 需要的去上述axios例子里

```vue
// 静态数据存放的位置
static/mock/data.json


{
  "name": "呵呵",
  "url": "https://blog.csdn.net/weixin_44449838",
  "page": 123,
  "isNonProfit": true,
  "address": {
    "street": "塔克拉玛干沙漠",
    "city": "新疆",
    "country": "中国"
  },
  "links": [
    {
      "name": "Google",
      "url": "http://www.google.com"
    },
    {
      "name": "Baidu",
      "url": "http://www.baidu.com"
    }
  ]
}
```


4.在 beforeRouteEnter 中进行异步请求
Profile.vue

```vue
  export default {
    //第二种取值方式
    // props:['id'],
    name: "UserProfile",
    //钩子函数 过滤器
    beforeRouteEnter: (to, from, next) => {
      //加载数据
      console.log("进入路由之前")
      next(vm => {
        //进入路由之前执行getData方法
        vm.getData()
      });
    },
    beforeRouteLeave: (to, from, next) => {
      console.log("离开路由之前")
      next();
    },
    //axios
    methods: {
      getData: function () {
        this.axios({
          method: 'get',
          url: 'http://localhost:8080/static/mock/data.json'
        }).then(function (response) {
          console.log(response)
        })
      }
    }
  }
```



5.路由钩子和axios结合图

 <img src="https://img-blog.csdnimg.cn/20200624143534392.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L29rRm9ycmVzdDI3,size_16,color_FFFFFF,t_70#pic_center" alt="å¨è¿éæå¥å¾çæè¿°" style="zoom:200%;" /> 



## 前端怎么转换json

```html
JSON.stringify(对象)
```

