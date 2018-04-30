定制参数说明
===================

- [输入法主页](http://rime.im)
- [个性化设置](https://github.com/rime/home/wiki/CustomizationGuide)
- [新输入法定制](https://github.com/rime/home/wiki/RimeWithSchemata)
- [编译指南](http://rime.im/code)


## yaml的几个需要注意的字符
```
当正文用 需要转义为此
"  \"
?  "?"
!  "!"
```


## 文件分布

共享文件夹：默认安装位置，有些权限严格的系统，是只读的，软件升级会丢失此处的文件

- 【中州韻】 /usr/share/rime-data/
- 【小狼毫】 "安裝目錄\data"
- 【鼠鬚管】 "/Library/Input Methods/Squirrel.app/Contents/SharedSupport/"

用户资料夹：使用的文件夹，包括用户的自定义字典。

- 【中州韻】 ~/.config/ibus/rime/
- 【小狼毫】 "%APPDATA%\Rime"
- 【鼠鬚管】 ~/Library/Rime/

其中包括：
- 〔全局設定〕 default.yaml
- 〔發行版設定〕 weasel.yaml
- 〔預設輸入方案副本〕 <方案標識>.schema.yaml
- ※〔安裝信息〕 installation.yaml
- ※〔用戶狀態信息〕 user.yaml
- 編譯輸入方案所產出的二進制文件：
  - 〔Rime 棱鏡〕 <方案標識>.prism.bin
  - 〔Rime 固態詞典〕 <詞典名>.table.bin
  - 〔Rime 反查詞典〕 <詞典名>.reverse.bin
- 記錄用戶寫作習慣的文件：
  - ※〔用戶詞典〕 <詞典名>.userdb.kct
  - ※〔用戶詞典快照〕 <詞典名>.userdb.txt、<詞典名>.userdb.kct.snapshot 見於同步文件夾
- 用戶自己設定的：
  - ※〔用戶對全局設定的定製信息〕 default.custom.yaml
  - ※〔用戶對預設輸入方案的定製信息〕 <方案標識>.custom.yaml
  - ※〔用戶自製輸入方案〕及配套的詞典源文件




## schema语法

```
# Rime schema
# encoding: utf-8
#
# Mongolian CN - 蒙文（回鹘式）
#
# 黑传说 Atlas Jobinson <jobinson99@hotmail.com>
#

schema:
  schema_id: mongolian-cn
  name: Mongolian-cn
  version: "0.1"
  author:
    - 黑传说 Atlas Jobinson <jobinson99@hotmail.com>
  description: |
    蒙文（回鹘式）输入方案。

  dependencies:
    - stroke

switches:	# 用于切换
  - name: ascii_mode	# 中英切换
    reset: 0
    states: [ 中文, 西文 ]
  - name: full_shape	# 全角半角切换
    states: [ 半角, 全角 ]
  - name: simplification	# 简繁转换
    states: [ 漢字, 汉字 ]
  - name: ascii_punct	# 标点
    states: [ 。，, ．， ]

engine:	# 输入法引擎设定
  processors:	# 一、最基本的：处理按键消息
    - ascii_composer	# ※ 处理中西文切换
    - recognizer	# ※ 与match配合，处理符合规则的输入，比如网址
    - key_binder	# ※ 特定条件下，按键绑定到其他按键，比如重定义逗号句号为候选翻页
    - speller	# ※ 拼写处理器，接受字符按键，编辑输入码
    - punctuator	# ※ 句读处理器，将单个字符按键直接映射为文字符号
    - selector	# ※ 选字处理器，处理数字选字键，上下候选定位，换页键
    - navigator	# ※ 处理栏内光标移动键
    - express_editor	# ※ 编辑器，处理空格、回车上屏、回退键等
  segmentors:	# 二、用于连续混合输入，可识别不同内容类型，将输入码分段，比如 输入 2012nian，识别为 2012年
    - ascii_segmentor	# ※ 标识西文段落
    - matcher	# ※ 标识符合特定规则打段落，比如网址
    - abc_segmentor	# ※ 标识常规的文字段落
    - punct_segmentor	# ※ 表示句读段落
    - fallback_segmentor	# ※ 表示其他未标识的段落
  translators:	# 三、翻译特定类型打编码段为一组候选字
    - punct_translator	# ※ 没有其他候选字时，回显输入码
    - table_translator@custom_phrase	# ※ 转换标点符号
    - reverse_lookup_translator	# ※ 反差翻译器，用另一种编码方案查码
    - script_translator	# ※ 脚本翻译器，用于拼音等基于音节表的输入方案
  filters:	# 四、过滤翻译的结果
    - simplifier	# ※ 简繁转换
    - uniquifier	# ※ 过滤重复的候选字，有可能来自简繁转换

- fluid_editor      # ※ 句式編輯器，用於以空格斷詞、回車上屏的【注音】、【語句流】等輸入方案，替換 express_editor
- chord_composer    # ※ 并击处理器，用于【宫保拼音】等多键并击的输入方案
- table_translator  # ※ 碼表翻譯器，用於倉頡、五筆等基於碼表的輸入方案，替換 script_translator

speller:
  alphabet: zyxwvutsrqponmlkjihgfedcba
  delimiter: " '"
  algebra:
    - erase/^xx$/
    - abbrev/^([a-z]).+$/$1/
    - abbrev/^([zcs]h).+$/$1/
    - derive/^([nl])ve$/$1ue/
    - derive/^([jqxy])u/$1v/
    - derive/un$/uen/
    - derive/ui$/uei/
    - derive/iu$/iou/
    - derive/([aeiou])ng$/$1gn/
    - derive/([dtngkhrzcs])o(u|ng)$/$1o/
    - derive/ong$/on/
    - derive/ao$/oa/
    - derive/([iu])a(o|ng?)$/a$1$2/

translator:	# 词典设定
  dictionary: mongolian-cn	# 词典名
  preedit_format:	# 格式
    - xform/([nl])v/$1ü/
    - xform/([nl])ue/$1üe/
    - xform/([jqxy])v/$1u/

custom_phrase:	#
  dictionary: ""
  user_dict: custom_phrase
  db_class: stabledb
  enable_completion: false
  enable_sentence: false
  initial_quality: 1

reverse_lookup:
  dictionary: stroke
  enable_completion: true
  prefix: "`"
  suffix: "'"
  tips: 〔筆畫〕
  preedit_format:
    - xlit/hspnz/一丨丿丶乙/
  comment_format:
    - xform/([nl])v/$1ü/

punctuator:
  import_preset: symbols

key_binder:
  import_preset: default

recognizer:
  import_preset: default
  patterns:
    punct: "^/([0-9]0?|[a-z]+)$"
    reverse_lookup: "`[a-z]*'?$"
```
词典设定
```
# 注意這裏以 --- ... 分別標記出 YAML 文檔的起始與結束位置
# 在 ... 標記之後的部份就不會作 YAML 文檔來解讀

---
name: luna_pinyin
version: "0.9"
sort: by_weight	# 此为按 词频从高到低排序，或 默认按码表(original)
use_preset_vocabulary: true	# 选择是（true）否（false）导入 rime默认预设词汇表（八股文）
...

# 單字
你 ni	# 间隔是制表符（tab）
我 wo
的 de  99%	# 可设定频度值
的 di  1%	# 可同字不同音
地 de  10%	# 可以同一读音，不同字
地 di  90%
目 mu
好 hao

# 詞組
你我
你的
我的
我的天
天地  tian di	# 多音节以空格分割
好天
好好地
目的  mu di
目的地   mu di di


```

全局设定定制：default.custom.yaml

```
patch:
  "一級設定項/二級設定項/三級設定項": 新的設定值
  "另一個設定項": 新的設定值
  "再一個設定項": 新的設定值
  "含列表的設定項/@0": 列表第一個元素新的設定值
  "含列表的設定項/@last": 列表最後一個元素新的設定值
  "含列表的設定項/@before 0": 在列表第一個元素之前插入新的設定值（不建議在補靪中使用）
  "含列表的設定項/@after last": 在列表最後一個元素之後插入新的設定值（不建議在補靪中使用）
  "含列表的設定項/@next": 在列表最後一個元素之後插入新的設定值（不建議在補靪中使用）
  设定:
    新的设定值
```

## 安卓版定制

- default.custom.yaml 用于设定输入法等。
- trime.custom.yaml 用于设定键盘等，注意其用的是 rime-jni生成器，只支持下面方式。
```
patch:
  "一级/二级/三级设定": 设置的值

```

