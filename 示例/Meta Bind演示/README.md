# Meta Bind演示文件索引

欢迎使用Meta Bind演示文件集合！这些文件展示了Meta Bind插件的各种功能和实际应用场景。

## 📁 文件说明

### 1. [Meta Bind插件完整功能演示.md](./Meta%20Bind插件完整功能演示.md)
展示Meta Bind的核心功能，包括：
- 基础输入字段（文本、数字、切换、下拉选择等）
- 高级输入类型（滑块、日期选择器、多选等）
- VIEW字段显示功能
- 跨文件绑定和内存绑定
- 样式自定义

### 2. [Meta Bind按钮高级功能演示.md](./Meta%20Bind按钮高级功能演示.md)
专门展示按钮功能，包括：
- 基础按钮操作
- 多步骤按钮
- JavaScript按钮
- 条件执行按钮
- 文件操作按钮

### 3. [Meta Bind实际应用场景.md](./Meta%20Bind实际应用场景.md)
实际应用模板和场景，包括：
- 学习管理系统
- 项目管理系统
- 个人效率追踪
- 目标追踪系统
- 阅读/财务/健康追踪器

## 🔧 语法快速参考

### INPUT字段语法
```
INPUT[fieldType:bindTarget]
INPUT[fieldType(arguments):bindTarget]
```

**示例：**
- 文本输入：`INPUT[text:username]`
- 数字输入：`INPUT[number:age]`
- 切换开关：`INPUT[toggle:completed]`
- 滑块：`INPUT[slider(minValue(0), maxValue(100)):progress]`
- 下拉选择：`INPUT[inlineSelect(option(选项1), option(选项2)):choice]`

### VIEW字段语法
```
VIEW[{bindTarget}]                    // 显示属性值
VIEW[expression]                      // 数学表达式或计算
VIEW[{a} * {b}:writeTarget]          // 计算并保存结果到writeTarget
```

**示例：**
- 显示文本：`VIEW[{username}]`
- 数学计算：`VIEW[{value1} + {value2}]`
- 条件显示：`VIEW[{completed} ? "完成" : "未完成"]`

### 按钮语法
```
```meta-bind-button
style: primary|default|destructive
label: 按钮文字
actions:
  - type: updateMetadata
    bindTarget: target
    evaluate: true|false
    value: "新值或表达式"
```
```

### 绑定目标语法
- 本文件属性：`propertyName`
- 其他文件属性：`FileName#propertyName`
- 内存存储：`memory^variableName`

## 📋 常用参数

### INPUT字段参数
- `minValue(数值)`：最小值
- `maxValue(数值)`：最大值
- `stepSize(数值)`：步长
- `placeholder(文本)`：占位符
- `option(值, 显示文本)`：选项
- `class(样式类)`：CSS样式类
- `title(标题)`：字段标题

### VIEW字段参数
- `hidden`：隐藏字段
- `renderMarkdown`：渲染Markdown
- `class(样式类)`：CSS样式类

### 按钮操作类型
- `updateMetadata`：更新元数据
- `insertIntoNote`：插入文本
- `createNote`：创建笔记
- `command`：执行命令
- `inlineJS`：JavaScript代码
- `sleep`：延时

## 🎯 使用技巧

### 1. 条件表达式
Meta Bind支持JavaScript风格的条件表达式：
```
{value} > 10 ? "大于10" : "小于等于10"
{status} == "completed" ? "✅" : "⏳"
```

### 2. 数学计算
支持基本数学运算和函数：
```
{value1} + {value2}
Math.round({value} * 100) / 100
Math.max({a}, {b}, {c})
```

### 3. 数组操作
```
{tags}.length                    // 数组长度
{list}.includes("item")          // 包含检查
```

### 4. 日期操作
```
moment().format('YYYY-MM-DD')    // 当前日期
new Date().toISOString().split('T')[0]  // ISO日期
```

## ⚠️ 注意事项

1. **frontmatter必需**：所有绑定的属性必须在文件开头的frontmatter中定义
2. **实时更新**：VIEW字段会实时更新，无需刷新页面
3. **跨文件限制**：跨文件绑定需要目标文件处于打开状态
4. **内存绑定**：使用`memory^`的数据不会保存到文件中
5. **JavaScript安全**：JavaScript功能默认关闭，需要在设置中启用

## 🔧 故障排除

### 常见错误

**1. [META_BIND_ERROR]**
- 检查frontmatter中是否定义了绑定的属性
- 确认语法正确，特别是花括号`{}`的使用

**2. VIEW字段不更新**
- 确保引用的属性存在于frontmatter中
- 检查绑定目标语法是否正确

**3. 按钮无响应**
- 检查按钮语法格式
- 确认actions数组正确缩进
- 验证bindTarget是否存在

**4. 跨文件绑定失效**
- 确保目标文件已打开
- 检查文件名和属性名拼写

### 调试技巧

1. **简化测试**：从简单的字段开始，逐步增加复杂性
2. **检查frontmatter**：确保所有属性都有初始值
3. **使用控制台**：按F12查看浏览器控制台错误
4. **重新加载**：有时需要重新打开笔记

## 📚 更多资源

- [Meta Bind官方文档](https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/)
- [Obsidian社区论坛](https://forum.obsidian.md/)
- [Meta Bind GitHub](https://github.com/mProjectsCode/obsidian-meta-bind-plugin)

---

开始探索这些演示文件，发现Meta Bind的强大功能吧！如果遇到问题，请参考上述故障排除指南或查阅官方文档。 