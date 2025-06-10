---
editUrl: false
next: false
prev: false
title: "ButtonActionMap"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:132](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L132)

按钮动作映射接口，将动作类型映射到其对应的动作接口。

## 属性

### command

> **command**: [`CommandButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/commandbuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:133](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L133)

命令按钮动作，用于执行Obsidian命令。

***

### createNote

> **createNote**: [`CreateNoteButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/createnotebuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:140](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L140)

创建笔记按钮动作，用于创建新的笔记文件。

***

### inlineJS

> **inlineJS**: [`InlineJSButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/inlinejsbuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:145](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L145)

内联JavaScript按钮动作，用于执行内联JavaScript代码。

***

### input

> **input**: [`InputButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/inputbuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:136](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L136)

输入按钮动作，用于在当前焦点元素中插入文本。

***

### insertIntoNote

> **insertIntoNote**: [`InsertIntoNoteButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/insertintonotebuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:144](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L144)

插入到笔记按钮动作，用于在笔记的指定行插入内容。

***

### js

> **js**: [`JSButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/jsbuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:134](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L134)

JavaScript文件按钮动作，用于执行外部JavaScript文件。

***

### open

> **open**: [`OpenButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/openbuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:135](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L135)

打开按钮动作，用于打开文件或URL链接。

***

### regexpReplaceInNote

> **regexpReplaceInNote**: [`RegexpReplaceInNoteButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/regexpreplaceinnotebuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:143](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L143)

正则表达式替换笔记内容按钮动作，用于使用正则表达式替换笔记中的内容。

***

### replaceInNote

> **replaceInNote**: [`ReplaceInNoteButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/replaceinnotebuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:141](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L141)

替换笔记内容按钮动作，用于替换笔记中指定行范围的内容。

***

### replaceSelf

> **replaceSelf**: [`ReplaceSelfButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/replaceselfbuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:142](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L142)

替换自身按钮动作，用于将按钮自身替换为指定内容。

***

### runTemplaterFile

> **runTemplaterFile**: [`RunTemplaterFileButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/runtemplaterfilebuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:146](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L146)

运行Templater文件按钮动作，用于执行Templater模板文件。

***

### sleep

> **sleep**: [`SleepButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/sleepbuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:137](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L137)

延时按钮动作，用于在动作序列中添加延迟。

***

### templaterCreateNote

> **templaterCreateNote**: [`TemplaterCreateNoteButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/templatercreatenotebuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:138](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L138)

Templater创建笔记按钮动作，用于通过Templater模板创建新笔记。

***

### updateMetadata

> **updateMetadata**: [`UpdateMetadataButtonAction`](/obsidian-meta-bind-plugin-docs/api/interfaces/updatemetadatabuttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:139](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L139)

更新元数据按钮动作，用于修改笔记的元数据。
