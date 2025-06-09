# Meta Bind 插件官方示例

这个文件夹包含了 Meta Bind 插件的官方示例，**所有示例已完全翻译为中文**。

## 翻译完成状态 ✅

### 📝 主要示例文件 (已翻译)
- ✅ **[Examples.md](Examples.md)** - 核心功能演示，包括：
  - 字段在各处的使用（引用块、信息框等）
  - 嵌套数据绑定
  - 字符串转义
  - Unicode 支持
  - 跨笔记绑定
  - 内联输入字段
  - 模板功能
  - 错误消息示例

### 🔗 API 示例 (已翻译)
- ✅ **[Meta Bind API.md](Meta%20Bind%20API.md)** - 使用 JS Engine 创建输入字段的 API 示例

### 🚀 高级用例 (已翻译)
- ✅ **[Advanced Use-Cases.md](Advanced%20Use-Cases.md)** - 高级功能演示：
  - 动态绑定目标更改
  - 从前置元数据生成选项列表

### 📄 其他核心文件 (已翻译)
- ✅ **[Other Note.md](Other%20Note.md)** - 用于测试跨笔记同步的辅助文件
- ✅ **[Embed Example.md](Embed%20Example.md)** - 嵌入功能示例
- ⚠️ **[O_O 2024 Checklist.md](O_O%202024%20Checklist.md)** - 插件开发检查清单 (保持英文)

## 详细功能分类

### 📥 输入字段 (Input Fields) - 已完全翻译 ✅
位置：`Input Fields/` 文件夹

- ✅ **[Text.md](Input%20Fields/Text.md)** - 文本输入和文本区域
- ✅ **[Toggle.md](Input%20Fields/Toggle.md)** - 布尔值切换
- ✅ **[Select and Multi Select.md](Input%20Fields/Select%20and%20Multi%20Select.md)** - 单选和多选
- ✅ **[Number.md](Input%20Fields/Number.md)** - 数值输入
- ✅ **[Date and Time.md](Input%20Fields/Date%20and%20Time.md)** - 日期和时间选择
- ✅ **[Slider.md](Input%20Fields/Slider.md)** - 数值范围滑块
- ✅ **[List.md](Input%20Fields/List.md)** - 列表管理
- ✅ **[Suggester.md](Input%20Fields/Suggester.md)** - 智能建议输入
- ✅ **[Progress Bar.md](Input%20Fields/Progress%20Bar.md)** - 进度条显示
- ✅ **[Editor.md](Input%20Fields/Editor.md)** - 高级编辑功能
- ✅ **[Inline Select.md](Input%20Fields/Inline%20Select.md)** - 内联选择器
- ✅ **[Image Suggester.md](Input%20Fields/Image%20Suggester.md)** - 图片建议器

### 👁️ 查看字段 (View Fields) - 已完全翻译 ✅
位置：`View Fields/` 文件夹

- ✅ **[View Field.md](View%20Fields/View%20Field.md)** - 基础查看、数据显示和格式化
- ✅ **[JS View Field.md](View%20Fields/JS%20View%20Field.md)** - JavaScript 动态内容生成
- ✅ **[Other Note.md](View%20Fields/Other%20Note.md)** - 跨笔记数据查看

### 🔲 按钮 (Buttons) - 已完全翻译 ✅
位置：`Buttons/` 文件夹

- ✅ **[Button Example.md](Buttons/Button%20Example.md)** - 基础按钮、命令执行、链接打开
- ✅ **[Replace Buttons.md](Buttons/Replace%20Buttons.md)** - 动态按钮替换功能
- ✅ **[Templater Buttons.md](Buttons/Templater%20Buttons.md)** - Templater 模板按钮
- ✅ **[In Note Navigation.md](Buttons/In%20Note%20Navigation.md)** - 笔记内导航按钮

### 🎯 高级示例 (Advanced Examples) - 部分翻译 ⚠️
位置：`Advanced Examples/` 文件夹

包含复杂的实际应用场景：
- ✅ **[Health Tracker.md](Advanced%20Examples/Health%20Tracker.md)** - 健康数据管理
- ✅ **[Activity Tracker.md](Advanced%20Examples/Activity%20Tracker.md)** - 活动追踪记录
- ⚠️ **游戏系统**: D&D 5e 和 PF2e 计算器 (保持英文，包含复杂规则)
- ⚠️ **[Using JS Engine for Complex things.md](Advanced%20Examples/Using%20JS%20Engine%20for%20Complex%20things.md)** - 复杂 JS 功能 (技术性内容)

### 🗂️ 其他功能 - 已翻译 ✅
位置：`Alternative Metadata Storage/`, `templates/`, `Other/` 文件夹

- ✅ **[Alternative Metadata Storage.md](Alternative%20Metadata%20Storage/Alternative%20Metadata%20Storage.md)** - 替代元数据存储方案
- ✅ **[Test Template.md](templates/Test%20Template.md)** - 测试模板文件
- 📁 **templates/templater/** - Templater 相关模板 (保持英文)
- 📁 **Other/** - 图片、脚本等支持文件

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

## 注意事项

- ✅ **核心功能示例** 已完全翻译为中文
- ✅ **基础和中级功能** 全部支持中文说明
- ⚠️ **高级游戏规则计算器** 保持英文，因为涉及专业术语
- ⚠️ **技术性API文档** 部分保持英文，便于开发者参考

所有翻译过的示例都可以直接在 Obsidian 中使用，前提是已安装并启用 Meta Bind 插件。 