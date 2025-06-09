# Meta Bind 插件官方示例

这个文件夹包含了 Meta Bind 插件的官方示例，所有示例已翻译为中文。

## 主要示例文件

### 📝 基础示例
- **[Examples.md](Examples.md)** - 核心功能演示，包括：
  - 字段在各处的使用（引用块、信息框等）
  - 嵌套数据绑定
  - 字符串转义
  - Unicode 支持
  - 跨笔记绑定
  - 内联输入字段
  - 模板功能
  - 错误消息示例

### 🔗 API 示例
- **[Meta Bind API.md](Meta%20Bind%20API.md)** - 使用 JS Engine 创建输入字段的 API 示例

### 🚀 高级用例
- **[Advanced Use-Cases.md](Advanced%20Use-Cases.md)** - 高级功能演示：
  - 动态绑定目标更改
  - 从前置元数据生成选项列表

### 📄 其他文件
- **[Other Note.md](Other%20Note.md)** - 用于测试跨笔记同步的辅助文件
- **[Embed Example.md](Embed%20Example.md)** - 嵌入功能示例
- **[O_O 2024 Checklist.md](O_O%202024%20Checklist.md)** - 插件开发检查清单

## 详细功能分类

### 📥 输入字段 (Input Fields)
位置：`Input Fields/` 文件夹

- **文本输入**: 基础文本和文本区域
- **开关**: 布尔值切换
- **选择器**: 单选和多选
- **数字**: 数值输入
- **日期时间**: 日期和时间选择
- **滑块**: 数值范围滑块
- **列表**: 列表管理
- **建议器**: 智能建议输入
- **进度条**: 进度显示
- **编辑器**: 高级编辑功能

### 👁️ 查看字段 (View Fields)
位置：`View Fields/` 文件夹

- **基础查看**: 数据显示和格式化
- **JavaScript 查看**: 动态内容生成
- **跨笔记查看**: 显示其他笔记的数据

### 🔲 按钮 (Buttons)
位置：`Buttons/` 文件夹

- **基础按钮**: 命令执行、链接打开
- **替换按钮**: 动态按钮替换
- **Templater 按钮**: 模板创建
- **导航按钮**: 笔记内导航

### 🎯 高级示例 (Advanced Examples)
位置：`Advanced Examples/` 文件夹

包含复杂的实际应用场景：
- **游戏系统**: D&D 5e 和 PF2e 计算器
- **健康追踪**: 健康数据管理
- **活动追踪**: 日常活动记录
- **复杂计算**: 使用 JS Engine 的高级功能

### 🗂️ 其他功能
位置：`Alternative Metadata Storage/`, `templates/`, `Other/` 文件夹

- **替代存储**: 不同的元数据存储方案
- **模板系统**: 可重用的模板文件
- **辅助资源**: 图片、脚本等支持文件

## 使用说明

1. **开始学习**: 从 `Examples.md` 开始，了解基础语法
2. **深入功能**: 浏览各个子文件夹中的具体功能演示
3. **实际应用**: 参考 `Advanced Examples` 中的复杂示例
4. **API 集成**: 查看 `Meta Bind API.md` 了解编程接口

## 语法快速参考

### 输入字段语法
```
INPUT[类型(参数):绑定目标]
```

### 查看字段语法
```
VIEW[{绑定目标}][显示类型]
```

### 按钮语法
```
BUTTON[按钮ID]
```

或使用 YAML 格式的完整按钮：
```yaml
```meta-bind-button
label: 按钮标签
style: primary/default/destructive
actions:
  - type: 动作类型
    参数: 值
```
```

所有示例都可以直接在 Obsidian 中使用，前提是已安装并启用 Meta Bind 插件。 