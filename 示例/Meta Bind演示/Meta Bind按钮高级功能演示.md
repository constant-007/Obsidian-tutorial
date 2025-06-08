---
counter: 0
task_status: "pending"
current_date: ""
notes_content: ""
---

# Meta Bind按钮高级功能演示

按钮是Meta Bind插件的高级功能，可以执行各种操作，从简单的数值更新到复杂的JavaScript脚本。

## 1. 基础按钮示例

### 计数器按钮
当前计数：`VIEW[{counter}]`

```meta-bind-button
style: primary
label: 增加计数
actions:
  - type: updateMetadata
    bindTarget: counter
    evaluate: true
    value: "{counter} + 1"
```

```meta-bind-button
style: destructive
label: 重置计数
actions:
  - type: updateMetadata
    bindTarget: counter
    evaluate: false
    value: 0
```

## 2. 状态切换按钮

当前状态：`VIEW[{task_status}]`

```meta-bind-button
style: default
label: 切换状态
actions:
  - type: updateMetadata
    bindTarget: task_status
    evaluate: true
    value: "{task_status} == 'pending' ? 'completed' : 'pending'"
```

## 3. 日期时间按钮

当前日期：`VIEW[{current_date}]`

```meta-bind-button
style: primary
label: 设置当前日期
actions:
  - type: updateMetadata
    bindTarget: current_date
    evaluate: true
    value: "moment().format('YYYY-MM-DD')"
```

## 4. 文本插入按钮

```meta-bind-button
style: default
label: 插入时间戳
actions:
  - type: insertIntoNote
    value: "⏰ {{date:YYYY-MM-DD HH:mm:ss}}"
```

```meta-bind-button
style: primary  
label: 插入分隔线
actions:
  - type: insertIntoNote
    value: "\n---\n"
```

## 5. 多步骤按钮

```meta-bind-button
style: primary
label: 完整任务流程
actions:
  - type: updateMetadata
    bindTarget: task_status
    evaluate: false
    value: "in_progress"
  - type: sleep
    ms: 1000
  - type: updateMetadata
    bindTarget: current_date
    evaluate: true
    value: "new Date().toISOString().split('T')[0]"
  - type: insertIntoNote
    value: "\n✅ 任务已开始处理\n"
```

## 6. 条件执行按钮

```meta-bind-button
style: primary
label: 条件操作
actions:
  - type: updateMetadata
    bindTarget: notes_content
    evaluate: true
    value: "{counter} > 5 ? '计数器已超过5' : '计数器还没超过5'"
```

## 7. 创建笔记按钮

```meta-bind-button
style: primary
label: 创建每日笔记
actions:
  - type: createNote
    folder: "每日笔记"
    fileName: "{{date:YYYY-MM-DD}}-日记"
    content: |
      # {{date:YYYY-MM-DD}} 日记
      
      ## 今日计划
      - [ ] 
      
      ## 今日总结
      
      
      ## 明日计划
      - [ ] 
    openNote: true
```

## 8. 命令执行按钮

```meta-bind-button
style: default
label: 打开命令面板
actions:
  - type: command
    command: "command-palette:open"
```

```meta-bind-button
style: primary
label: 切换主题
actions:
  - type: command
    command: "theme:use-dark"
```

## 9. JavaScript按钮（需要启用JS）

```meta-bind-button
style: primary
label: JavaScript示例
actions:
  - type: inlineJS
    code: |
      // 获取当前时间并更新metadata
      const now = new Date();
      const timeString = now.toLocaleTimeString();
      
      // 更新元数据
      context.metadata.current_date = timeString;
      
      // 显示通知
      new Notice(`时间已更新为: ${timeString}`);
      
      return "JavaScript执行完成";
```

## 10. 文件操作按钮

```meta-bind-button
style: default
label: 打开设置
actions:
  - type: open
    link: "设置"
    newTab: false
```

## 11. 替换文本按钮

```meta-bind-button
style: primary
label: 替换示例文本
actions:
  - type: replaceInNote
    fromLine: 0
    toLine: -1
    replacement: "这是新的内容"
    templater: false
```

## 12. 按钮组示例

```meta-bind-button
style: primary
label: 任务管理
actions:
  - type: updateMetadata
    bindTarget: task_status
    evaluate: false
    value: "pending"
```

```meta-bind-button
style: default
label: 开始任务
actions:
  - type: updateMetadata
    bindTarget: task_status
    evaluate: false
    value: "in_progress"
```

```meta-bind-button
style: primary
label: 完成任务
actions:
  - type: updateMetadata
    bindTarget: task_status
    evaluate: false
    value: "completed"
```

## 使用技巧

1. **按钮样式**：
   - `primary`：主要按钮（蓝色）
   - `default`：默认按钮（灰色）
   - `destructive`：危险按钮（红色）

2. **evaluate参数**：
   - `true`：将value作为表达式计算
   - `false`：将value作为字面值使用

3. **组合操作**：按钮可以执行多个连续操作，使用`sleep`添加延迟

4. **错误处理**：复杂操作建议分步骤执行，便于调试

5. **性能考虑**：避免在JavaScript中执行耗时操作

这些按钮演示了Meta Bind的强大功能，可以根据实际需求进行定制和扩展。 