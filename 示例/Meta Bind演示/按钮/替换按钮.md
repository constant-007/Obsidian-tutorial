### 两个替换相同文本的按钮

other
text
tada

```meta-bind-button
label: 在笔记中替换
hidden: false
class: ""
tooltip: ""
id: ""
style: default
action:
  type: "replaceInNote"
  fromLine: 3
  toLine: 5
  replacement: "some\ntext\nwow"
```

```meta-bind-button
label: 在笔记中替换其他
hidden: false
class: ""
tooltip: ""
id: ""
style: default
action:
  type: "replaceInNote"
  fromLine: 3
  toLine: 5
  replacement: "other\ntext\ntada"
```

### 在文件中插入文本

在此行下方插入:

```meta-bind-button
label: 插入文本
hidden: false
class: ""
tooltip: ""
id: ""
style: default
action:
  type: "insertIntoNote"
  line: 38
  value: "i am inserted"
```

```meta-bind-button
label: 移除插入的行
hidden: false
class: ""
tooltip: ""
id: ""
style: default
action:
  type: "regexpReplaceInNote"
  regexp: "Insert below this line:\n(i am inserted\n)+"
  replacement: "Insert below this line:\n"
```

### 替换自身的按钮

```meta-bind-button
label: 替换自身
hidden: false
class: ""
tooltip: ""
id: ""
style: default
action:
  type: "replaceSelf"
  replacement: "i am no longer a button\n\nnice"
```

### 使用正则表达式重新创建上面按钮的按钮

```meta-bind-button
label: 用正则表达式重新创建按钮
hidden: false
class: ""
tooltip: ""
id: ""
style: default
action:
  type: "regexpReplaceInNote"
  regexp: "i am no longer a button\\s+nice\n"
  replacement: |
    ```meta-bind-button
    label: 替换自身
    hidden: false
    class: ""
    tooltip: ""
    id: ""
    style: default
    action:
      type: "replaceSelf"
      replacement: "i am no longer a button\n\nnice"
    ```
```
