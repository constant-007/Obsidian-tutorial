这是Obsidian第三方插件社区中排名第三四位的插件，不过个人感觉这插件有点低不成，高不就，作用不算很大。当然也可能是我没开发好，如果各位大佬有什么比较实用的玩法可以在评论区分享一下呀

这个插件是官方的[[Core plugins#23. Templates|Templates]]插件加强版，使用它可以完全平替官方Templates插件。且Templater支持完整的JavaScript API，有编程基础的用户可以用它实现许多复杂逻辑

如前所说，个人暂时没发现有什么很大用处。这插件应该主要是用来自动化一些重复性工作。以下是Templater的一些社区，感兴趣的小伙伴可以看看有什么能激发你灵感，做一些有用的Templater模板：


1. Templater插件官方文档：[Introduction - Templater](https://silentvoid13.github.io/Templater/)
2. 其他用户分享的模板：[SilentVoid13/Templater Templates Showcase · Discussions](https://github.com/SilentVoid13/Templater/discussions/categories/templates-showcase)


> [!tip] 温馨提示
> 不会编程的小伙伴可以用AI[氛围编程](https://www.aiexplorernote.com/article/cursor-basics)来编写复杂Templater模板哦

下面是Templater插件设置项的介绍：



### Template folder location (模板文件夹位置)

指定存放模板文件的文件夹路径。

Templater 会从此文件夹中加载可用的模板文件（通常是 `.md` 格式）。您需要在这里设置一个您库中的文件夹，例如 "Templates"，用来统一存放和管理您所有的 Templater 模板。

### Internal variables and functions (内部变量和函数)

提示 Templater 提供了内置变量和函数供模板使用。

这不是一个可配置的选项，而是一段说明性文字。它告知用户 Templater 内置了丰富的预定义变量和函数（通过全局的 `tp` 对象进行访问），可用于在模板中实现动态内容生成和复杂逻辑。具体可用的变量和函数列表，建议查阅插件官方文档（通过描述中的 `documentation` 链接）。

### Syntax highlighting on desktop (桌面端语法高亮)

在桌面版 Obsidian 的编辑模式下为 Templater 命令启用语法高亮。

如果开启此选项，当您在桌面版 Obsidian 中编辑模板文件或包含 Templater 命令（如 `<% ... %>` 或 `<%= ... %>`）的笔记时，这些特殊的模板标记及其内部的 JavaScript 代码会以不同的颜色或样式显示。这有助于提高代码的可读性，方便您区分模板代码和普通 Markdown 内容，也更易于编写和检查模板。

### Syntax highlighting on mobile (移动端语法高亮)

在移动版 Obsidian 的编辑模式下为 Templater 命令启用语法高亮。

与桌面端功能类似，开启后，在 Obsidian 移动应用中编辑时，Templater 的命令也会有语法高亮效果。但请注意描述中的警告：“Use with caution: this may break live preview on mobile platforms.” 这意味着在移动设备上开启此功能有可能会导致实时预览模式出现显示问题或兼容性问题，建议谨慎使用。

### Automatic jump to cursor (自动跳转到光标位置)

插入模板后，自动将编辑光标跳转到模板内由 `<% tp.file.cursor() %>` 命令指定的位置。

如果开启此选项，并且您在模板中使用了 `<% tp.file.cursor() %>` 这个动态命令，那么在模板成功插入到笔记后，编辑器的光标会自动移动到该命令在模板中所在的位置。这非常有用，例如，您可以将光标命令放在模板内容的末尾或某个需要用户立即开始输入的地方。描述中还提到，您也可以为手动触发 `tp.file.cursor()` 功能设置一个快捷键。

### Trigger Templater on new file creation (在新文件创建时触发 Templater)

在新文件创建时，若该文件符合您预设的规则，则 Templater 会自动处理并应用模板到该新文件。

启用此功能后，Templater 会监听所有新文件的创建事件。如果新创建的文件匹配了您在 Templater 设置下方（截图中未完全显示的部分）“文件夹模板 (Folder templates)”或“文件正则表达式模板 (File regex template)”部分所定义的规则，Templater 就会自动运行，并替换该新文件内容中找到的所有 Templater 命令。这使得 Templater 能够与核心的日记插件、Calendar 插件、Review 插件、Note Refactor 插件等其他会自动创建新文件的插件良好兼容，实现新笔记内容的自动化填充。请务必确保已正确设置相应的文件夹规则或正则表达式规则，此功能才能按预期工作。同时，请注意描述中的警告：如果新创建的文件包含未知或不安全的内容，自动执行其内的 Templater 命令可能存在风险，需确保新文件内容的来源是安全的。


