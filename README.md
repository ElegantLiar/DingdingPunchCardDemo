
## 起因

月底接到通知，晚餐补助由签到改成钉钉打卡。

作为一名技术人员，不甘于寂寞的研究了一发钉钉远程打卡..

源于我的正直，我并未在实际工作中使用，仅作为研究实现了一发

![素材0.gif](https://upload-images.jianshu.io/upload_images/1770896-2852c9503cb2a7e3.gif?imageMogr2/auto-orient/strip)

## 工具
- mac （虚拟器）
- Xcode
- 一台装有钉钉的iPhone 

## 关于坐标
- 原始坐标：手机上获取到的是原始的GPS坐标 —— WGS-84。
- 火星坐标：我大天朝自己加了飘逸搞的一套加密坐标，中国国测局 —— GCJ-02：谷歌、高德。
- 百度加密坐标：在火星坐标的基础上再次飘逸后的加密坐标 —— BD-09：百度。

## 原理
做过地图定位相关App的童鞋都应该了解Xcode - 工具栏 - Debug - Simulate Location

它的作用是用于虚拟定位，以便于不用亲临其地模拟到达某个坐标。

同时钉钉打卡定位打卡的原理，是基于你是否到达了以公司地理坐标为圆心的某个圆。在此范围内，员工可进行打卡。

我们需要做的是使用百度、高德或者谷歌地图获取到打卡位置的GPS坐标，然后使用算法转换成iPhone所需要的坐标WGS-84。

然后在Simulate Location使用这个打卡坐标模拟打卡。



## 实现步骤 （使用高德定位为例）
1. 使用[高德](http://lbs.amap.com/console/show/picker)获取公司（以天安门所在点为例）所在点的地理坐标
![素材1.jpeg](https://upload-images.jianshu.io/upload_images/1770896-423e26f1357fe6d9.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


2. 116.397477,39.908692为高德获取到天安门的坐标，使用[飘逸算法](https://github.com/googollee/eviltransform)进行坐标转换
3. 步骤2中的飘逸算法，在我给出的demo中已给出iOS版本的转换方式
![素材2.jpeg](https://upload-images.jianshu.io/upload_images/1770896-da282df05776833c.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![素材3.jpeg](https://upload-images.jianshu.io/upload_images/1770896-d890000c0565a927.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4. 修改start.gpx中的对应经纬度
![素材4.jpeg](https://upload-images.jianshu.io/upload_images/1770896-6d4ec5f4601927bb.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

5. 连接真机，运行项目，Xcode - 工具栏 - Debug - Simulate Location，点击start
![素材5.png](https://upload-images.jianshu.io/upload_images/1770896-85d8bb2dded76d0c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

6. 打开钉钉，远程打卡you get ~
![素材6.jpeg](https://upload-images.jianshu.io/upload_images/1770896-7b0bf81e6be4fff2.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
