蒙文输入法之rime Mongolian input table for Rime
==============================

## 说明

共有两份方案

- mongolian-unicode-cn 文件夹名为 mn-cn
- mongolian-cyrillic 文件夹名为 mn-mn

## 一、 linux下使用

### 1.1 依赖软件

- ibus 输入法框架
- ibus-rime 输入法框架
- unifont 字体

依赖软件安装
```
sudo apt-get install ibus ibus-rime unifont
sudo chown `whoami` ~/.config/ibus/rime
```

### 1.2 蒙文 回鹘式

#### 1.2.1 安装

```
cd ./mn-cn && ./linux-install.sh
```

修改 `~/.config/ibus/rime/default.custom.yaml` 在schema_list，如下添加最后一行（注意缩进！）：
```
patch:
  schema_list:
    - schema: mongolian-cn
```

注：如果`~/.config/ibus/rime/`没有default.custom.yaml这个文件，则可直接复制 `./mn-cn/default.custom.yaml`直接复制进去。

#### 1.2.2 定制

通过快捷键 `Ctrl+`` 或 `F4` 切换输入法。

1. 码表定制：打开 `./mn-cn/mongolian-cn.dict.yaml`，根据说明修改
2. 设置定制：打开 `./mn-cn/mongolian-cn.schema.yaml`，根据需要修改
3. 重新打包并重新部署 './mn-cn/linux-install.sh'

### 1.3 蒙文 西里尔式

#### 1.3.1 安装

```
cd ./mn-mn && ./linux-install.sh
```

修改 `~/.config/ibus/rime/default.custom.yaml` 在schema_list，如下添加最后一行（注意缩进！）：
```
patch:
  schema_list:
    - schema: mongolian-mn
```

注：如果`~/.config/ibus/rime/`没有default.custom.yaml这个文件，则可直接复制 `./mn-mn/default.custom.yaml`直接复制进去。

#### 1.3.2 定制

通过快捷键 `Ctrl+\`` 或 `F4` 切换输入法。

1. 码表定制：打开 `./mn-mn/mongolian-mn.dict.yaml`，根据说明修改
2. 设置定制：打开 `./mn-mn/mongolian-mn.schema.yaml`，根据需要修改
3. 重新打包并重新部署 './mn-mn/linux-install.sh'

## 二、 macos下使用

### 1. 全新安装

如果您不想使用任何rime输入法，可用此法安装

#### 1.1 蒙文 回鹘式

##### 1.1.1 安装

```
cd ./mn-cn && ./macos-install.sh
```
##### 1.1.2 完全卸载

```
./macos-unstall.sh
```

### 1.2 蒙文 西里尔式

##### 1.2.1 安装

```
cd ./mn-mn && ./macos-install.sh
```
##### 1.2.2 完全卸载

```
./macos-unstall.sh
```

### 2. 纳入rime架构方式安装

如果您使用了rime的其他输入法，可用此法安装

#### 2.1 依赖软件

- squirrel 输入法框架
- unifont 字体

安装依赖

直接[下载](http://dl.bintray.com/lotem/rime/Squirrel-0.9.26.2.zip)安装，或者通过homebrew的，可

```
brew cask install squirrel
```
#### 2.2 蒙文 回鹘式

##### 2.2.1 安装

```
cp -R mongolian-cn.dict.yaml ~/Library/Rime/
cp -R mongolian-cn.schema.yaml ~/Library/Rime/
```

修改 `~/Library/Rime/default.custom.yaml` 在schema_list，如下添加最后一行（注意缩进！）：
```
patch:
  schema_list:
    - schema: mongolian-cn
```

注：如果`~/Library/Rime/`没有default.custom.yaml这个文件，则可直接复制 `./mn-cn/default.custom.yaml`直接复制进去。

#### 2.2.2 定制

通过快捷键 `Ctrl+`` 或 `F4` 切换输入法。

1. 码表定制：打开 `./mn-cn/mongolian-cn.dict.yaml`，根据说明修改
2. 设置定制：打开 `./mn-cn/mongolian-cn.schema.yaml`，根据需要修改
3. 重新打包并重新部署 './mn-cn/macos-install.sh'

#### 2.3 蒙文 西里尔式

##### 2.3.1 安装

```
cp -R mongolian-mn.dict.yaml ~/Library/Rime/
cp -R mongolian-mn.schema.yaml ~/Library/Rime/
```

修改 `~/Library/Rime/default.custom.yaml` 在schema_list，如下添加最后一行（注意缩进！）：
```
patch:
  schema_list:
    - schema: mongolian-mn
```

注：如果`~/Library/Rime/`没有default.custom.yaml这个文件，则可直接复制 `./mn-mn/default.custom.yaml`直接复制进去。

##### 2.3.2 定制

通过快捷键 `Ctrl+`` 或 `F4` 切换输入法。

1. 码表定制：打开 `./mn-mn/mongolian-mn.dict.yaml`，根据说明修改
2. 设置定制：打开 `./mn-mn/mongolian-mn.schema.yaml`，根据需要修改
3. 重新打包并重新部署 'sudo sh ./mn-mn/macos-install.sh'

## 三、 编译

注：目前打包的app里面没有 输入法，需要手工复制进去（default.yaml default.custom.yaml mongolian-cn.schema.yaml mongolian-cn.dict.yaml）。


### 1. linux 编译

编译环境：
- cmake 
- git
- boost

源码
```
git clone --recursive https://github.com/rime/squirrel.git
```
依赖和编译
```
make deps
make
make install
```

把rime-mongolian/mn-cn下的蒙文输入法设定复制到编译目录下
```
cp ./mn-cn/{default.yaml,mongolian-cn.dict.yaml,mongolian-cn.schema.yaml} ~/.config/ibus/rime/
```

### 2. macosx 编译 

编译环境
```
brew install cmake git boost
```
源码
```
git clone --recursive https://github.com/rime/squirrel.git
```

依赖和编译
```
make deps
make
make install
```

把rime-mongolian/mn-cn下的蒙文输入法设定复制到编译目录下
```
cp ./mn-cn/{default.yaml,mongolian-cn.dict.yaml,mongolian-cn.schema.yaml} ~/Library/Rime/
```

## 四、 todo

1. 定制词库
2. 输入提示
3. 竖排化候选词
