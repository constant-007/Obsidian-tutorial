# Meta Bind 插件演示文档

欢迎来到 Meta Bind 插件的完整演示文档！这里包含了 Meta Bind 插件的所有功能示例和实际应用场景。

## 📚 文档结构

### 1. [Meta Bind插件完整功能演示](Meta%20Bind插件完整功能演示.md)
**主要演示文件** - 包含 Meta Bind 插件的所有基础和高级功能

- 🔧 基础输入字段（文本、数字、切换等）
- 📝 文本输入与文本区域
- 🎛️ 选择器与下拉菜单
- 📅 日期与时间选择器
- 📊 滑块与数字输入
- 🔘 按钮与动作
- 👁️ VIEW字段显示
- 🔗 高级绑定功能
- 🎨 样式与自定义
- 💼 复杂示例场景

### 2. [Meta Bind按钮高级功能演示](Meta%20Bind按钮高级功能演示.md)
**按钮专门演示** - 深入展示按钮的各种功能

- 🔘 基础按钮示例
- ⚡ 多动作按钮
- 💻 JavaScript 按钮
- 🔀 条件按钮
- 📝 文本处理按钮
- 📁 文件操作按钮
- ⏰ 延时和睡眠按钮
- 🎯 实际应用示例

### 3. [Meta Bind实际应用场景](Meta%20Bind实际应用场景.md)
**实际应用模板** - 提供可直接使用的生活和工作模板

- 📚 学习管理系统
- 💼 项目管理系统
- 📊 个人效率追踪
- 🎯 目标追踪系统
- 📖 阅读跟踪器
- 💰 财务管理器
- 🏃‍♂️ 健康追踪器
- 🎨 创意项目管理

## 🚀 快速开始

### Meta Bind 基础语法

#### 输入字段
```
INPUT[字段类型:绑定目标]
INPUT[字段类型(参数):绑定目标]
```

#### 显示字段
```
VIEW[显示类型:绑定目标]
VIEW[显示类型:表达式]
```

#### 按钮
```
```meta-bind-button
style: primary|default|destructive|plain
label: 按钮文本
id: 按钮ID
action:
  type: 动作类型
  # 其他参数...
```

## 📝 支持的输入字段类型

| 字段类型 | 用途 | 示例 |
|---------|------|------|
| `text` | 单行文本输入 | `INPUT[text:title]` |
| `textArea` | 多行文本输入 | `INPUT[textArea:description]` |
| `number` | 数字输入 | `INPUT[number:age]` |
| `toggle` | 开关切换 | `INPUT[toggle:completed]` |
| `select` | 下拉选择 | `INPUT[select(option(A), option(B)):choice]` |
| `multiSelect` | 多选 | `INPUT[multiSelect(option(A), option(B)):tags]` |
| `slider` | 滑块 | `INPUT[slider(minValue(0), maxValue(100)):progress]` |
| `date` | 日期选择 | `INPUT[date:dueDate]` |
| `time` | 时间选择 | `INPUT[time:reminderTime]` |
| `dateTime` | 日期时间 | `INPUT[dateTime:meetingTime]` |

## 🎛️ 常用参数

| 参数 | 用途 | 示例 |
|------|------|------|
| `placeholder()` | 占位符文本 | `placeholder(请输入姓名)` |
| `defaultValue()` | 默认值 | `defaultValue(默认文本)` |
| `minValue()` | 最小值 | `minValue(0)` |
| `maxValue()` | 最大值 | `maxValue(100)` |
| `stepSize()` | 步长 | `stepSize(5)` |
| `option()` | 选项 | `option(选项1), option(选项2)` |
| `class()` | CSS类 | `class(custom-style)` |

## 🔗 绑定目标语法

| 绑定类型 | 语法 | 说明 |
|---------|------|------|
| 本地属性 | `property` | 绑定到当前文件的 frontmatter |
| 跨文件绑定 | `OtherFile#property` | 绑定到其他文件的属性 |
| 内存绑定 | `memory^property` | 临时存储，重启后丢失 |
| 全局内存 | `globalMemory^property` | 全局临时存储 |

## 👁️ VIEW 字段类型

| 类型 | 用途 | 示例 |
|------|------|------|
| `text` | 显示文本 | `VIEW[text:title]` |
| `math` | 数学计算 | `VIEW[math:progress > 50 ? "进行中" : "未开始"]` |
| `link` | 显示链接 | `VIEW[link:url]` |
| `image` | 显示图片 | `VIEW[image:imagePath]` |

## 🔘 按钮动作类型

| 动作类型 | 用途 | 说明 |
|---------|------|------|
| `updateMetadata` | 更新元数据 | 修改 frontmatter 属性 |
| `command` | 执行命令 | 运行 Obsidian 命令 |
| `inlineJS` | 内联JavaScript | 执行 JavaScript 代码 |
| `createNote` | 创建笔记 | 创建新的笔记文件 |
| `insertIntoNote` | 插入内容 | 向笔记插入文本 |
| `open` | 打开文件 | 打开指定文件或链接 |

## 💡 使用技巧

### 1. 条件显示
使用 `hidden` 参数根据条件显示/隐藏元素：
```
VIEW[text(hidden(completed != true)):提醒文本][任务未完成！]
```

### 2. 数学表达式
在 `VIEW[math:]` 中使用 JavaScript 表达式：
```
VIEW[math:progress > 80 ? "接近完成" : "进行中"]
```

### 3. 按钮组合
多个按钮可以组合显示：
```
BUTTON[button1, button2, button3]
```

### 4. 样式定制
使用 CSS 类自定义样式：
```
INPUT[text(class(custom-input)):title]
```

## 🎯 实际应用建议

1. **学习管理**：使用进度条追踪课程完成情况
2. **项目管理**：结合日期选择器和状态切换管理项目
3. **习惯追踪**：使用切换按钮记录每日习惯
4. **数据分析**：利用数学表达式计算统计数据
5. **自动化**：使用按钮自动化重复性任务

## 🛠️ 故障排除

### 常见问题

1. **[META_BIND_ERROR]** - 检查语法是否正确
2. **绑定不生效** - 确认属性名称拼写正确
3. **按钮不显示** - 检查按钮 ID 是否匹配
4. **样式不生效** - 确认 CSS 类已定义

### 调试技巧

1. 使用简单的 `INPUT[text:test]` 测试基础功能
2. 检查 frontmatter 中是否正确创建了属性
3. 使用 `VIEW[text:property]` 验证绑定是否工作
4. 在开发者工具中检查 CSS 类是否应用

## 📖 延伸阅读

- [Meta Bind 官方文档](https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/)
- [Obsidian 社区论坛](https://forum.obsidian.md/)
- [Meta Bind GitHub 仓库](https://github.com/mProjectsCode/obsidian-meta-bind-plugin)

---

**注意**：所有示例都已使用正确的 Meta Bind 语法编写，可以直接在安装了 Meta Bind 插件的 Obsidian 中使用。如果遇到问题，请检查插件版本和语法格式。 