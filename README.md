
## 起因

月底接到通知，晚餐补助由签到改成钉钉打卡。

作为一名技术人员，不甘于寂寞的研究了一发钉钉远程打卡..

源于我的正(dan)直(xiao)，我并未在实际工作中使用，仅作为研究实现了一发

![素材0.gif](https://upload-images.jianshu.io/upload_images/1770896-2852c9503cb2a7e3.gif?imageMogr2/auto-orient/strip)

## 工具
- 一台mac （虚拟器）
- Xcode
- 一台iPhone 

## 关于坐标
>这里普及一下坐标系统： 目前我们经常接触的无非就是**原始坐标**，**火星坐标**，**二次加密坐标**。

>*   原始坐标：手机上获取到的是原始的GPS坐标 —— **WGS-84**。
>*   火星坐标：我大天朝自己加了飘逸搞的一套加密坐标，中国国测局（和GFW一样的傻屌组织）—— **GCJ-02**：**谷歌**、**高德**。
>*   百度加密坐标：在火星坐标的基础上再次飘逸后的加密坐标 —— **BD-09**：**百度**。

> 在遥远的东方，有一个天朝。 天朝有一个测绘局，发明了一种把美国卫星的GPS的地球坐标，进行偏移的算法，计算后，得出了一个火星坐标。 为了让火星坐标能正确的显示，又给每部导航软件加入了这个算法，可以在大家的地图上还原位置。并且给每部导航收费。美其名国家安全。而且这个算法看上去很牛B的样子，还不可逆。 所以，只有这个国家的人都在用错误的坐标。正宗的掩耳盗铃。 民用卫星精度都已经让你出身冷汗了，何况军用卫星。打仗估值也不会用中国的电子地图吧。 只可惜各种LBS应用，都是个麻烦事哦。

>还好黄天不负有心人，终于经过大家的模拟，计算，基本还原了[飘逸算法](https://github.com/googollee/eviltransform.git)。
>

## 原理
做过地图定位相关App的童鞋都应该了解**Xcode - 工具栏 - Debug - Simulate Location**

它的作用是用于虚拟定位，以便于不用亲临其地模拟到达某个坐标。

同时钉钉打卡定位打卡的原理，是基于你是否到达了以公司地理坐标为圆心的某个圆。在此范围内，员工可进行打卡。

我们需要做的是使用百度、高德或者谷歌地图获取到打卡位置的GPS坐标，然后使用算法转换成iPhone所需要的坐标WGS-84。

然后在Simulate Location使用这个打卡坐标模拟打卡。



## 实现步骤 （使用高德定位为例）
1. 使用[高德](http://lbs.amap.com/console/show/picker)获取公司（以天安门所在点为例）所在点的地理坐标
![素材1.jpeg](https://upload-images.jianshu.io/upload_images/1770896-423e26f1357fe6d9.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


2. `116.397477,39.908692`为高德获取到天安门的坐标，使用[飘逸算法](https://github.com/googollee/eviltransform)进行坐标转换
3. **步骤2**中的飘逸算法，在我给出的[demo](https://github.com/Abeautifulliar/DingdingPunchCardDemo)中已给出iOS版本的转换方式
如下图所示
![素材2.jpeg](https://upload-images.jianshu.io/upload_images/1770896-da282df05776833c.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![素材3.jpeg](https://upload-images.jianshu.io/upload_images/1770896-d890000c0565a927.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4. 修改**start.gpx**中的对应经纬度 
`<wpt lat="39.908692" lon="116.397477">`

![素材4.jpeg](https://upload-images.jianshu.io/upload_images/1770896-6d4ec5f4601927bb.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

5. 连接真机，运行项目，**Xcode - 工具栏 - Debug - Simulate Location**，点击**start**，如下图所示
![素材5.png](https://upload-images.jianshu.io/upload_images/1770896-85d8bb2dded76d0c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

6. 打开钉钉，远程打卡you get ~
![素材6.jpeg](https://upload-images.jianshu.io/upload_images/1770896-7b0bf81e6be4fff2.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

*****
整个远程打卡的流程到此就结束了，当开启模拟定位之后，你会发现所有APP的定位均换成了这个定位，不用担心，当结束项目之后稍等一下就会回到准确的定位。

>补充说明以下几点
>1.**如果没有结束工程就拔掉数据线，定位会一直是模拟定位，可能需要重启手机恢复一下**
>2.**WiFi打卡**需要修改一下所用WiFi的**WiFi名和公司WiFi名一致**
>3.**关于坐标**段落的文献引用于其他作者

### [demo地址](https://github.com/Abeautifulliar/DingdingPunchCardDemo)
有不明白的在评论中回复即可，对你有帮助的话麻烦star一下哦
