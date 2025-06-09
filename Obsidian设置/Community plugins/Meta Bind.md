# Meta Bind：强大的数据绑定和交互式表单插件

Meta Bind 是一个功能强大的 Obsidian 插件，允许您在笔记中创建交互式输入字段、视图字段和按钮，实现数据绑定和动态内容展示。

## 🌟 主要功能

### 输入字段（Input Fields）
Meta Bind 提供了丰富的输入字段类型，让您可以在笔记中创建各种交互式表单元素：

- **toggle** - 切换开关，用于布尔值选择
- **slider** - 滑块，用于数值范围选择
- **text** - 文本输入框
- **textArea** - 多行文本输入区域
- **select** - 下拉选择框
- **multiSelect** - 多选框
- **date** - 日期选择器
- **time** - 时间选择器
- **number** - 数字输入框
- **suggester** - 智能建议输入框
- **progressBar** - 进度条显示

### 视图字段（View Fields）
用于展示和计算数据的只读字段：

- **math** - 数学表达式计算和显示
- **text** - 文本内容展示
- **link** - 可点击链接展示
- **image** - 图像展示

### 按钮（Buttons）
创建可执行各种操作的交互式按钮：

- **command** - 执行 Obsidian 命令
- **createNote** - 创建新笔记
- **inlineJS** - 运行内联 JavaScript 代码
- **updateMetadata** - 更新笔记元数据
- **insertIntoNote** - 插入内容到笔记
- **open** - 打开文件或链接

## 📝 使用场景

### 1. 数据跟踪和管理
- 创建个人习惯追踪器
- 制作项目进度表
- 建立评分系统

### 2. 动态内容生成
- 根据输入自动计算结果
- 创建交互式模板
- 实现条件内容显示

### 3. 工作流自动化
- 快速创建标准格式笔记
- 批量处理文件操作
- 自动化重复任务

## 🔧 基本语法

### 输入字段语法
```markdown
`INPUT[type:bindTarget]`
`INPUT[text:frontmatter.title]`
`INPUT[slider(minValue(0), maxValue(100)):frontmatter.score]`
```

### 视图字段语法
```markdown
`VIEW[type:bindTarget]`
`VIEW[text:frontmatter.title]`
`VIEW[math:frontmatter.score * 2]`
```

### 按钮语法
```markdown
`BUTTON[label, action]`
`BUTTON[保存, updateMetadata]`
```

## 🎯 绑定目标（Bind Targets）

Meta Bind 支持多种数据绑定目标：

- **frontmatter** - YAML 前置元数据
- **content** - 笔记内容
- **global** - 全局变量
- **local** - 局部变量

## 🎨 样式自定义

插件支持通过 CSS 类名自定义样式：

```markdown
`INPUT[text(class(my-custom-style)):frontmatter.title]`
```

然后在 CSS 片段中定义样式：

```css
.my-custom-style {
    background-color: #f0f0f0;
    border-radius: 5px;
    padding: 10px;
}
```

## 📚 学习资源

### 快速开始
1. 通过 Obsidian 社区插件浏览器安装 Meta Bind
2. 使用 `Meta Bind: Open playground` 命令打开演示场
3. 在演示场中试验各种字段类型
4. 查看示例库了解更多用法

### 官方文档
- [安装指南](Meta%20Bind/guides/installation.md)
- [示例教程](Meta%20Bind/guides/examples.md)
- [完整文档](Meta%20Bind/README.md)

### 进阶用法
- [自定义 MathJS](Meta%20Bind/guides/advanced/customMathJS.md)
- [API 文档](Meta%20Bind/api/README.md)
- [高级用例](Meta%20Bind/guides/advanced/advancedUseCases.md)

## 💡 实际应用示例

### 个人评分系统
```markdown
# 电影评分

电影名称：`INPUT[text:frontmatter.movie_name]`
评分：`INPUT[slider(minValue(1), maxValue(10)):frontmatter.rating]`
推荐指数：`VIEW[math:frontmatter.rating * 10]`%

`BUTTON[保存评分, updateMetadata]`
```

### 项目进度追踪
```markdown
# 项目进度

项目状态：`INPUT[select(option(planning), option(in-progress), option(completed)):frontmatter.status]`
完成度：`INPUT[slider(minValue(0), maxValue(100)):frontmatter.progress]`
进度条：`VIEW[progressBar:frontmatter.progress]`

`BUTTON[更新进度, updateMetadata]`
```

## 🔗 相关链接

- [插件 GitHub 仓库](https://github.com/mProjectsCode/obsidian-meta-bind-plugin)
- [官方文档网站](https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/)
- [Obsidian 社区插件页面](https://obsidian.md/plugins?search=meta%20bind)

---

Meta Bind 插件为 Obsidian 用户提供了强大的数据绑定和交互功能，让静态的 Markdown 文档变得生动和智能。无论是简单的数据记录还是复杂的工作流自动化，Meta Bind 都能为您提供所需的工具。
