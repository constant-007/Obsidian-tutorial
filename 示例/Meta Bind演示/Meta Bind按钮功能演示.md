---
counter: 0
message: ""
isVisible: true
taskCompleted: false
currentTime: ""
---

# Meta Bind按钮功能演示

## 基本按钮操作

### 更新数值按钮

```meta-bind-button
label: 增加计数器
actions:
  - type: updateMetadata
    bindTarget: counter
    evaluate: true
    value: "{counter} + 1"
```

```meta-bind-button
label: 减少计数器
actions:
  - type: updateMetadata
    bindTarget: counter
    evaluate: true
    value: "{counter} - 1"
```

```meta-bind-button
label: 重置计数器
actions:
  - type: updateMetadata
    bindTarget: counter
    evaluate: false
    value: 0
```

当前计数：`VIEW[{counter}]`

### 切换状态按钮

```meta-bind-button
label: 切换可见性
actions:
  - type: updateMetadata
    bindTarget: isVisible
    evaluate: true
    value: "!{isVisible}"
```

```meta-bind-button
label: 完成任务
actions:
  - type: updateMetadata
    bindTarget: taskCompleted
    evaluate: false
    value: true
```

```meta-bind-button
label: 重置任务
actions:
  - type: updateMetadata
    bindTarget: taskCompleted
    evaluate: false
    value: false
```

可见性状态：`VIEW[{isVisible}]`

任务状态：`VIEW[{taskCompleted} ? "✅ 已完成" : "⏳ 进行中"]`

### 设置文本按钮

```meta-bind-button
label: 设置欢迎消息
actions:
  - type: updateMetadata
    bindTarget: message
    evaluate: false
    value: "欢迎使用Meta Bind!"
```

```meta-bind-button
label: 设置完成消息
actions:
  - type: updateMetadata
    bindTarget: message
    evaluate: false
    value: "任务已完成!"
```

```meta-bind-button
label: 清除消息
actions:
  - type: updateMetadata
    bindTarget: message
    evaluate: false
    value: ""
```

当前消息：`VIEW[{message}]`

### JavaScript按钮

```meta-bind-button
label: 获取当前时间
actions:
  - type: inlineJS
    code: |
      const now = new Date();
      const timeString = now.toLocaleString('zh-CN');
      engine.getMetadata(context.file.path).update('currentTime', timeString);
```

```meta-bind-button
label: 显示提示
actions:
  - type: inlineJS
    code: new Notice("Hello from Meta Bind!", 3000);
```

当前时间：`VIEW[{currentTime}]`

### 创建笔记按钮

```meta-bind-button
label: 创建今日笔记
actions:
  - type: createNote
    fileName: "今日笔记 {{date}}"
    folderPath: "Daily Notes"
    openNote: true
```

```meta-bind-button
label: 创建任务笔记
actions:
  - type: createNote
    fileName: "任务-{{date:YYYY-MM-DD}}"
    folderPath: "Tasks"
    openNote: false
```

### 多动作按钮

```meta-bind-button
label: 完成项目
actions:
  - type: updateMetadata
    bindTarget: taskCompleted
    evaluate: false
    value: true
  - type: updateMetadata
    bindTarget: message
    evaluate: false
    value: "项目已完成！"
  - type: inlineJS
    code: new Notice("项目完成，恭喜！", 5000);
```

### 不同样式的按钮

```meta-bind-button
style: primary
label: 主要按钮
actions:
  - type: inlineJS
    code: new Notice("主要按钮被点击", 2000);
```

```meta-bind-button
style: destructive
label: 删除按钮
actions:
  - type: inlineJS
    code: new Notice("危险操作", 2000);
```

```meta-bind-button
style: plain
label: 简单按钮
actions:
  - type: inlineJS
    code: new Notice("简单按钮被点击", 2000);
```

## 按钮参数说明

### style 参数
- `primary` - 主要样式（蓝色）
- `destructive` - 危险样式（红色）
- `plain` - 简单样式
- `default` - 默认样式

### actions 类型
- `updateMetadata` - 更新元数据
- `inlineJS` - 执行JavaScript代码
- `createNote` - 创建新笔记
- `command` - 执行Obsidian命令
- `open` - 打开文件或链接

### updateMetadata 参数
- `bindTarget` - 要更新的属性名
- `evaluate` - 是否计算表达式（true/false）
- `value` - 要设置的值

这些按钮演示了Meta Bind插件的强大交互功能，可以实现复杂的自动化操作。 