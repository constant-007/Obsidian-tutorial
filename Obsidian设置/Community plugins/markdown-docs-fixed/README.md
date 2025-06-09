# Obsidian Meta Bind Plugin 完整文档

这是 Obsidian Meta Bind Plugin 的完整markdown格式文档，按照官方网站的正确目录结构组织。

## 📚 文档结构

### 📖 指南 (Guides)

#### 基础指南
- [安装指南](guides/installation.md)
- [示例教程](guides/examples.md)
- [样式和CSS](guides/stylingAndCSS.md)
- [Obsidian Publish](guides/obsidianPublish.md)

#### 🔧 功能和概念 (Features and Concepts)
- [输入字段](guides/features-and-concepts/inputFields.md)
- [输入字段模板](guides/features-and-concepts/templates.md)
- [视图字段](guides/features-and-concepts/viewFields.md)
- [按钮](guides/features-and-concepts/buttons.md)
- [Meta Bind嵌入](guides/features-and-concepts/metaBindEmbed.md)
- [绑定目标](guides/features-and-concepts/bindTargets.md)

#### ⚡ 高级 (Advanced)
- [API](guides/advanced/api.md)
- [高级用例](guides/advanced/advancedUseCases.md)
- [自定义MathJS](guides/advanced/customMathJS.md)

### 📋 参考文档 (Reference)

#### 输入字段 (Input Fields)
包含所有可用的输入字段类型：

- [toggle](reference/inputFields/toggle.md) - 切换字段
- [slider](reference/inputFields/slider.md) - 滑块字段
- [text](reference/inputFields/text.md) - 文本字段
- [textArea](reference/inputFields/textArea.md) - 多行文本字段
- [select](reference/inputFields/select.md) - 下拉选择字段
- [multiSelect](reference/inputFields/multiSelect.md) - 多选字段
- [date](reference/inputFields/date.md) - 日期字段
- [time](reference/inputFields/time.md) - 时间字段
- [datePicker](reference/inputFields/datePicker.md) - 日期选择器
- [number](reference/inputFields/number.md) - 数字字段
- [suggester](reference/inputFields/suggester.md) - 建议字段
- [editor](reference/inputFields/editor.md) - 编辑器字段
- [imageSuggester](reference/inputFields/imageSuggester.md) - 图像建议字段
- [progressBar](reference/inputFields/progressBar.md) - 进度条字段
- [inlineSelect](reference/inputFields/inlineSelect.md) - 内联选择字段
- [list](reference/inputFields/list.md) - 列表字段
- [listSuggester](reference/inputFields/listSuggester.md) - 列表建议字段
- [inlineListSuggester](reference/inputFields/inlineListSuggester.md) - 内联列表建议字段
- [inlineList](reference/inputFields/inlineList.md) - 内联列表字段
- [imageListSuggester](reference/inputFields/imageListSuggester.md) - 图像列表建议字段
- [dateTime](reference/inputFields/dateTime.md) - 日期时间字段

#### 输入字段参数 (Input Field Arguments)
包含所有输入字段参数的详细说明：

- [addLabels](reference/inputFieldArguments/addLabels.md) - 控制是否为滑块或进度条添加标签显示
- [class](reference/inputFieldArguments/class.md) - 为字段添加自定义CSS类名
- [defaultValue](reference/inputFieldArguments/defaultValue.md) - 设置字段的默认值
- [maxValue](reference/inputFieldArguments/maxValue.md) - 设置数值字段的最大允许值
- [minValue](reference/inputFieldArguments/minValue.md) - 设置数值字段的最小允许值
- [stepSize](reference/inputFieldArguments/stepSize.md) - 设置滑块或进度条的步长
- [title](reference/inputFieldArguments/title.md) - 为字段设置标题
- [showcase](reference/inputFieldArguments/showcase.md) - 在文档中展示字段示例
- [placeholder](reference/inputFieldArguments/placeholder.md) - 为输入字段设置占位符文本
- [onValue](reference/inputFieldArguments/onValue.md) - 设置切换字段开启状态的值
- [offValue](reference/inputFieldArguments/offValue.md) - 设置切换字段关闭状态的值
- [option](reference/inputFieldArguments/option.md) - 为选择类字段添加选项
- [optionQuery](reference/inputFieldArguments/optionQuery.md) - 为建议类字段设置选项查询
- [useLinks](reference/inputFieldArguments/useLinks.md) - 控制是否使用链接格式
- [limit](reference/inputFieldArguments/limit.md) - 设置字段值的字符或项目限制
- [allowOther](reference/inputFieldArguments/allowOther.md) - 允许用户输入其他选项

#### 视图字段 (View Fields)
包含所有视图字段类型：

- [math](reference/viewFields/math.md) - 用于显示数学表达式和计算的视图字段
- [text](reference/viewFields/text.md) - 用于显示文本内容的视图字段
- [link](reference/viewFields/link.md) - 用于显示可点击链接的视图字段
- [image](reference/viewFields/image.md) - 用于显示图像的视图字段

#### 视图字段参数 (View Field Arguments)
包含所有视图字段参数：

- [renderMarkdown](reference/viewFieldArguments/renderMarkdown.md) - 控制是否渲染Markdown内容
- [hidden](reference/viewFieldArguments/hidden.md) - 控制字段是否隐藏
- [class](reference/viewFieldArguments/class.md) - 为视图字段添加自定义CSS类名

#### 按钮动作 (Button Actions)
包含所有按钮动作类型：

- [command](reference/buttonActions/command.md) - 执行Obsidian命令
- [createNote](reference/buttonActions/createNote.md) - 创建新笔记
- [inlineJS](reference/buttonActions/inlineJS.md) - 运行内联JavaScript代码
- [input](reference/buttonActions/input.md) - 输入操作
- [insertIntoNote](reference/buttonActions/insertIntoNote.md) - 插入内容到笔记
- [open](reference/buttonActions/open.md) - 打开文件或链接
- [regexpReplaceInNote](reference/buttonActions/regexpReplaceInNote.md) - 正则表达式替换
- [replaceInNote](reference/buttonActions/replaceInNote.md) - 文本替换
- [replaceSelf](reference/buttonActions/replaceSelf.md) - 替换按钮本身
- [runJavaScript](reference/buttonActions/runJavaScript.md) - 运行JavaScript文件
- [runTemplaterFile](reference/buttonActions/runTemplaterFile.md) - 运行Templater文件
- [sleep](reference/buttonActions/sleep.md) - 延时操作
- [templaterCreateNote](reference/buttonActions/templaterCreateNote.md) - 通过Templater创建笔记
- [updateMetadata](reference/buttonActions/updateMetadata.md) - 更新元数据

### 🔧 API参考 (API Reference)

- [API概览](api/README.md)

#### 枚举 (Enumerations)
- [BindTargetStorageType](api/enumerations/BindTargetStorageType.md)
- [ButtonActionType](api/enumerations/ButtonActionType.md)
- [ButtonClickType](api/enumerations/ButtonClickType.md)
- [ButtonStyleType](api/enumerations/ButtonStyleType.md)
- [FieldType](api/enumerations/FieldType.md)
- [InputFieldArgumentType](api/enumerations/InputFieldArgumentType.md)
- [InputFieldType](api/enumerations/InputFieldType.md)
- [RenderChildType](api/enumerations/RenderChildType.md)
- [ViewFieldArgumentType](api/enumerations/ViewFieldArgumentType.md)
- [ViewFieldType](api/enumerations/ViewFieldType.md)

#### 类 (Classes)
- [ButtonClickContext](api/classes/ButtonClickContext.md)
- [FieldMountable](api/classes/FieldMountable.md)
- [Mountable](api/classes/Mountable.md)
- [NotePosition](api/classes/NotePosition.md)
- [ObsAPI](api/classes/ObsAPI.md)

#### 接口 (Interfaces)
- [BindTargetDeclaration](api/interfaces/BindTargetDeclaration.md)
- [ButtonActionMap](api/interfaces/ButtonActionMap.md)
- [ButtonConfig](api/interfaces/ButtonConfig.md)
- [ButtonContext](api/interfaces/ButtonContext.md)
- [ButtonDeclaration](api/interfaces/ButtonDeclaration.md)
- [ButtonGroupDeclaration](api/interfaces/ButtonGroupDeclaration.md)
- [ButtonGroupOptions](api/interfaces/ButtonGroupOptions.md)
- [ButtonOptions](api/interfaces/ButtonOptions.md)
- [CommandButtonAction](api/interfaces/CommandButtonAction.md)
- [ComponentLike](api/interfaces/ComponentLike.md)
- [CreateNoteButtonAction](api/interfaces/CreateNoteButtonAction.md)
- [EmbedOptions](api/interfaces/EmbedOptions.md)
- [FieldDeclaration](api/interfaces/FieldDeclaration.md)
- [FieldOptionMap](api/interfaces/FieldOptionMap.md)
- [InlineJSButtonAction](api/interfaces/InlineJSButtonAction.md)
- [InputButtonAction](api/interfaces/InputButtonAction.md)
- [InputFieldDeclaration](api/interfaces/InputFieldDeclaration.md)
- [InputFieldOptions](api/interfaces/InputFieldOptions.md)
- [InsertIntoNoteButtonAction](api/interfaces/InsertIntoNoteButtonAction.md)
- [JSButtonAction](api/interfaces/JSButtonAction.md)
- [JsViewFieldBindTargetMapping](api/interfaces/JsViewFieldBindTargetMapping.md)
- [JsViewFieldDeclaration](api/interfaces/JsViewFieldDeclaration.md)
- [JsViewFieldOptions](api/interfaces/JsViewFieldOptions.md)
- [LinePosition](api/interfaces/LinePosition.md)
- [OpenButtonAction](api/interfaces/OpenButtonAction.md)
- [PartialUnvalidatedInputFieldDeclaration](api/interfaces/PartialUnvalidatedInputFieldDeclaration.md)
- [PartialUnvalidatedJsViewFieldDeclaration](api/interfaces/PartialUnvalidatedJsViewFieldDeclaration.md)
- [PartialUnvalidatedViewFieldDeclaration](api/interfaces/PartialUnvalidatedViewFieldDeclaration.md)
- [RegexpReplaceInNoteButtonAction](api/interfaces/RegexpReplaceInNoteButtonAction.md)
- [ReplaceInNoteButtonAction](api/interfaces/ReplaceInNoteButtonAction.md)
- [ReplaceSelfButtonAction](api/interfaces/ReplaceSelfButtonAction.md)
- [RunTemplaterFileButtonAction](api/interfaces/RunTemplaterFileButtonAction.md)
- [SimpleButtonGroupDeclaration](api/interfaces/SimpleButtonGroupDeclaration.md)
- [SimpleFieldArgument](api/interfaces/SimpleFieldArgument.md)
- [SimpleInputFieldDeclaration](api/interfaces/SimpleInputFieldDeclaration.md)
- [SimpleJsViewFieldBindTargetMapping](api/interfaces/SimpleJsViewFieldBindTargetMapping.md)
- [SimpleJsViewFieldDeclaration](api/interfaces/SimpleJsViewFieldDeclaration.md)
- [SimplePropAccess](api/interfaces/SimplePropAccess.md)
- [SimpleViewFieldDeclaration](api/interfaces/SimpleViewFieldDeclaration.md)
- [SleepButtonAction](api/interfaces/SleepButtonAction.md)
- [TableOptions](api/interfaces/TableOptions.md)
- [TemplaterCreateNoteButtonAction](api/interfaces/TemplaterCreateNoteButtonAction.md)
- [UnvalidatedBindTargetDeclaration](api/interfaces/UnvalidatedBindTargetDeclaration.md)
- [UnvalidatedFieldArgument](api/interfaces/UnvalidatedFieldArgument.md)
- [UnvalidatedInputFieldDeclaration](api/interfaces/UnvalidatedInputFieldDeclaration.md)
- [UnvalidatedJsViewFieldBindTargetMapping](api/interfaces/UnvalidatedJsViewFieldBindTargetMapping.md)
- [UnvalidatedJsViewFieldDeclaration](api/interfaces/UnvalidatedJsViewFieldDeclaration.md)
- [UnvalidatedPropAccess](api/interfaces/UnvalidatedPropAccess.md)
- [UnvalidatedViewFieldDeclaration](api/interfaces/UnvalidatedViewFieldDeclaration.md)
- [UpdateMetadataButtonAction](api/interfaces/UpdateMetadataButtonAction.md)
- [ViewFieldDeclaration](api/interfaces/ViewFieldDeclaration.md)
- [ViewFieldOptions](api/interfaces/ViewFieldOptions.md)

#### 类型别名 (Type Aliases)
- [ButtonAction](api/type-aliases/ButtonAction.md)
- [InlineFieldType](api/type-aliases/InlineFieldType.md)

#### 变量 (Variables)
- [EMBED_MAX_DEPTH](api/variables/EMBED_MAX_DEPTH.md)

## 📊 文档统计

- **总文件数**: 包含完整的输入字段、参数、视图字段、按钮动作和API参考
- **目录结构**: 按照官方网站的sidebar配置正确组织
- **格式**: 标准Markdown格式，支持所有编辑器

## 🔄 文档更新

本文档是从 [官方文档网站](https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/) 自动转换生成的，目录结构与官方网站完全一致。

## 📝 关于转换

- 原始文档使用 Astro + Starlight 构建
- 严格按照 astro.config.mjs 中的sidebar配置组织目录
- 正确分离了Features and Concepts和Advanced章节
- TypeDoc生成的API文档已完整转换
- MDX文件已转换为标准markdown格式

## 🔗 相关链接

- [插件源码](https://github.com/mProjectsCode/obsidian-meta-bind-plugin)
- [官方文档](https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/)
- [Obsidian 社区](https://obsidian.md/)

---
*文档生成时间：2024年12月19日*