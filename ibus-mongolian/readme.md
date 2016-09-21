蒙文输入法之ibus Mongolian input table for IBus
==============================

## 说明

共有两份方案
- mongolian-unicode-cn 
- mongolian-cyrillic

## linux下使用

### 一、 依赖软件

- ibus 输入法框架
- ibus-table-createdb 生成码表工具
- unifont 字体


依赖软件安装

```
sudo apt-get install ibus ibus-table-createdb unifont
```

### 二、蒙文 回鹘式

#### 安装

```
sh ./mn-cn/install.sh
```
#### 定制

1. 码表定制：打开 ./mn-cn/mongolian-unicode-cn.txt，根据说明修改
2. 重新打包并重新部署 'sh ./mn-cn/install.sh'

#### 卸载

```
sh ./mn-cn/unstall.sh
```

### 三、蒙文 西里尔式

#### 安装

```
sh ./nm-mn/install.sh
```

#### 定制

1. 码表定制：打开 ./mn-mn/mongolian-cyrillic.txt，根据说明修改
2. 重新打包并重新部署 'sh ./mn-mn/install.sh'

#### 卸载

```
sh ./mn-mn/unstall.sh
```
## todo

1. 定制词库
2. 输入提示
3. 竖排化候选词
