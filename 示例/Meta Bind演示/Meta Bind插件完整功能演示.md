---
courseName: ""
instructor: ""
completed: false
progress: 0
---

# Meta Bind插件完整功能演示

## 基础输入字段

### 文本输入
课程名称：`INPUT[text:courseName]`

### 切换开关
是否完成：`INPUT[toggle:completed]`

### 数字输入
完成进度：`INPUT[number:progress]`

## 显示值

当前课程：`VIEW[{courseName}]`
完成状态：`VIEW[{completed}]`
进度：`VIEW[{progress}]` 