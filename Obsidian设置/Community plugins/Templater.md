这是Obsidian第三方插件社区中排名第三四位的插件，不过个人感觉这插件有点低不成，高不就，作用不算很大。当然也可能是我没开发好，如果各位大佬有什么比较实用的玩法可以在评论区分享一下呀

这个插件是官方的[[Core plugins#23. Templates|Templates]]插件加强版，使用它可以完全平替官方Templates插件。且Templater支持完整的JavaScript API，有编程基础的用户可以用它实现许多复杂逻辑

如前所说，个人暂时没发现有什么很大用处。这插件应该主要是用来自动化一些重复性工作。以下是Templater的一些社区，感兴趣的小伙伴可以看看有什么能激发你灵感，做一些有用的Templater模板：


1. Templater插件官方文档：[Introduction - Templater](https://silentvoid13.github.io/Templater/)
2. 其他用户分享的模板：[SilentVoid13/Templater Templates Showcase · Discussions](https://github.com/SilentVoid13/Templater/discussions/categories/templates-showcase)


> [!tip] 温馨提示
> 不会编程的小伙伴可以用AI[氛围编程](https://www.aiexplorernote.com/article/cursor-basics)来编写复杂Templater模板哦

下面是Templater插件设置项的介绍：

![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/obsidian-templater-settings-1.jpg)

### Template folder location

指定存放模板文件的文件夹路径。Templater 会从此文件夹中加载可用的模板文件。你需要在这里设置一个您库中的文件夹，例如 "Templates"，用来统一存放和管理您所有的 Templater 模板

### Internal variables and functions

提示 Templater 提供了内置变量和函数供模板使用。这不是一个可配置的选项，而是一段说明性文字。它告知用户 Templater 内置了丰富的预定义变量和函数（通过全局的 `tp` 对象进行访问），可用于在模板中实现动态内容生成和复杂逻辑。具体可用的变量和函数列表，建议查阅插件官方文档

### Syntax highlighting on desktop

在桌面版 Obsidian 的编辑模式下为 Templater 命令启用语法高亮。如果开启此选项，当你在桌面版 Obsidian 中编辑模板文件或包含 Templater 命令（如 `<% ... %>` 或 `<%= ... %>`）的笔记时，这些特殊的模板标记及其内部的 JavaScript 代码会以不同的颜色或样式显示。这有助于提高代码的可读性，方便你区分模板代码和普通 Markdown 内容，也更易于编写和检查模板

### Syntax highlighting on mobile

在移动版 Obsidian 的编辑模式下为 Templater 命令启用语法高亮。与桌面端功能类似，开启后，在 Obsidian 移动应用中编辑时，Templater 的命令也会有语法高亮效果

### Automatic jump to cursor

自动跳转到光标位置。插入模板后，自动将编辑光标跳转到模板内由 `<% tp.file.cursor() %>` 命令指定的位置。如果开启此选项，并且你在模板中使用了 `<% tp.file.cursor() %>` 这个动态命令，那么在模板成功插入到笔记后，编辑器的光标会自动移动到该命令在模板中所在的位置

### Trigger Templater on new file creation

在新文件创建时，若该文件符合你预设的规则，则 Templater 会自动处理并应用模板到该新文件。启用此功能后，Templater 会监听所有新文件的创建事件。如果新创建的文件匹配了你在 Templater 设置下方）“文件夹模板 (Folder templates)”或“文件正则表达式模板 (File regex template)”部分所定义的规则，Templater 就会自动运行，并替换该新文件内容中找到的所有 Templater 命令。这使得 Templater 能够与核心的[[Core plugins#5. Daily notes|日记插件]]等其他会自动创建新文件的插件良好兼容，实现新笔记内容的自动化填充

### Folder templates

为特定文件夹配置默认模板，当在这些文件夹中创建新空文件时自动应用指定模板。这个功能区域允许你定义基于文件夹的模板应用规则。当一个**新的空文件**在某个你已指定规则的文件夹中被创建时，Templater 会自动使用你为该文件夹关联的模板文件来填充这个新创建的文件。系统会使用最深层（即最具体）的路径匹配规则。例如，如果你为 `Journal/Daily/` 设置了模板A，为 `Journal/` 设置了模板B，那么在 `Journal/Daily/` 中创建新文件会使用模板A。你也可以为库的根目录 (`/`) 定义一个全局的默认模板

### Enable folder templates

开启或关闭文件夹模板的自动应用功能。当此选项启用后，Templater 将会根据您在下方（通过 "Add new folder template" 按钮）定义的“文件夹 -> 模板文件”的对应规则列表进行工作。注意，此选项与下方的“文件正则表达式模板 (File regex templates)”功能是**互斥的**；启用其中一个会自动禁用另一个

### File regex templates

允许使用正则表达式来匹配新创建的空文件名或路径，并自动应用相应的模板。这个功能区域允许你定义基于正则表达式的模板应用规则。当一个**新的空文件**被创建，并且其完整路径或文件名匹配了你定义的某个正则表达式时，Templater 会使用与该正则表达式关联的模板文件来填充这个新文件。规则会按照列表中的顺序从上到下进行匹配，**第一个成功匹配的规则会被采用**，因此规则的排列顺序非常重要

### Enable file regex templates

启用文件正则表达式模板，开启或关闭文件正则表达式模板的自动应用功能。

当此选项启用后，Templater 将会根据你在下方定义的“正则表达式 -> 模板文件”的对应规则列表进行工作。注意，此选项与上方的“文件夹模板 (Folder templates)”功能是**互斥的**；启用其中一个会自动禁用另一个

### Template hotkeys

模板快捷键 - 功能区。允许你为特定的模板文件绑定一个自定义的键盘快捷键。这个功能让你可以为那些经常使用的模板文件指定一个独有的快捷键。设置完成后，你只需在编辑笔记时按下对应的快捷键，就可以快速地将该模板的内容插入到当前光标位置，或者（如果模板是一个动态命令类型的模板）直接执行该模板。你需要在下方的输入框中输入模板文件的路径（相对于模板文件夹的路径，或完整路径），然后通过旁边的按钮来设置和绑定快捷键

### Startup templates

启动模板 - 功能区。配置在 Templater 插件（通常是 Obsidian 启动时）自动执行的模板。

启动模板是一种特殊的模板，它们会在 Templater 插件加载并开始运行时自动执行一次。与普通模板不同，这些启动模板通常**不用于向笔记中输出任何内容**。它们的主要用途是执行一些初始化任务，例如，设置一些全局变量、注册事件监听器（即“添加对 Obsidian 事件的挂钩”），或者运行一些需要在 Obsidian 启动后立即执行的脚本逻辑。你需要在下方的输入框中（示例为 `Example: folder1/template_file`）指定要作为启动模板的模板文件路径，然后通过 "Add new startup template" 按钮添加。

### User script functions (用户脚本函数 - 功能区)

配置用于存放自定义 JavaScript 函数文件的文件夹，这些函数可在 Templater 模板中通过 `tp.user` 对象进行调用。

这个功能区允许你通过编写自己的 JavaScript 模块来扩展 Templater 的功能。你可以在指定的文件夹中创建 `.js` 文件，在这些文件中定义函数并导出它们，然后在任何 Templater 模板中通过 `tp.user.你的函数名()` 的方式来调用这些自定义函数。这对于封装常用逻辑、复杂的计算或与外部 API 的交互非常有用。

### Script files folder location (脚本文件文件夹位置)

指定存放用户自定义 JavaScript 脚本文件的文件夹路径。

您需要在这里设置一个您库中的文件夹，Templater 会从这个文件夹中加载所有的 `.js` 文件作为 CommonJS 模块，以便您在模板中使用其中导出的函数。这个文件夹需要从您的库根目录可以访问到。更详细的说明可以查阅插件的官方文档。图示中的搜索框示例为 `Example: folder1/folder2`，而其下方有一行灰色小字（截图中为 "No user scripts folder set"）会显示当前是否已设置脚本文件夹。

### User script intellisense (用户脚本智能提示)

决定在模板编辑器中如何为用户脚本函数提供代码智能提示（如函数描述、参数列表和返回值）。

此设置控制当您在 Templater 模板中输入并调用用户脚本函数时，Obsidian 编辑器（如果支持）如何显示这些函数的提示信息。例如，它可以显示函数的用途说明、需要的参数以及函数会返回什么类型的值。如果脚本中的 JSDoc 注释不符合特定格式，或者此设置配置为不显示某些信息，那么相关的提示可能不会完整渲染出来。图中下拉框显示的当前选项是 "Render method description, parameters list, and return"，意味着会尝试显示包括方法描述、参数列表和返回值的完整提示。

### User system command functions (用户系统命令函数 - 功能区)

允许创建能调用操作系统级别命令的用户函数。

这是一个高级且需要谨慎使用的功能区域，它赋予了 Templater 执行本地计算机上系统命令的能力，通常是通过你定义的用户脚本函数来实现。

### Enable user system command functions (启用用户系统命令函数)

开启或关闭执行操作系统级别命令的用户函数功能。

只有当此选项启用后，您才能在 Templater 的用户脚本中创建并调用那些能够执行操作系统命令的函数。描述中附有非常重要的**警告**：“Warning: It can be dangerous to execute arbitrary system commands from untrusted sources. Only run system commands that you understand, from trusted sources.” 这强调了执行来自不可信来源的任意系统命令具有潜在危险性，您应该只运行那些您完全理解并且来源绝对可靠的系统命令，以避免安全风险。
