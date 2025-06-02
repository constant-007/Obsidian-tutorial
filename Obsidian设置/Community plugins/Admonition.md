

**Admonition 插件的主要功能和作用：**

1. **突出显示信息**：通过独特的样式、颜色和图标，让特定类型的文本内容从普通笔记中脱颖而出，吸引读者的注意力。
2. **内容分类**：为不同性质的信息块赋予明确的类型，如 `note` (笔记/注释)、`warning` (警告)、`tip` (技巧)、`danger` (危险)、`info` (信息)、`bug` (缺陷)、`example` (示例)、`quote` (引言) 等。
3. **增强可读性和结构感**：使长篇笔记的结构更清晰，重点内容更容易被读者快速捕捉和理解。
4. **高度可定制**：插件通常自带多种预设的 admonition 类型，并且允许用户创建自己专属的类型，包括自定义标题、图标、颜色等。

**如何使用 Admonition (基本语法)：**

Admonition 通常使用 Markdown 的代码块语法，并在代码块的起始标记后加上特定的类型声明。

基本结构如下：

Markdown

````
```ad-<类型名称>
title: 可选的自定义标题
collapse: 可选的折叠状态 (open, closed, 或 none)
icon: 可选的自定义图标名称
color: 可选的自定义颜色 (十六进制代码或RGB值)

这里是 admonition 的主要内容。
内容可以有多行。
也可以包含 Markdown 的其他格式，比如 **加粗**、*斜体*、链接等。
````

**参数说明：**

- `` `ad-<类型名称>` ``: 这是必需的。`<类型名称>` 是你想要使用的 admonition 类型，例如 `note`, `warning`, `info`, `tip`, `abstract`, `todo`, `danger`, `bug`, `example`, `faq`, `quote` 等 (插件会自带一些预设类型)。
- `title:` (可选): 如果你希望 admonition 有一个不同于默认类型名称的标题，可以在这里指定。如果省略，标题通常就是类型名称（例如 "Note", "Warning"）。
- `collapse:` (可选): 控制 admonition 内容是否可折叠以及默认的折叠状态。
    - `collapse: open` 或 `collapse: true`: 内容默认展开，但用户可以点击标题将其折叠。
    - `collapse: closed`: 内容默认折叠，用户需要点击标题才能展开。
    - `collapse: none` 或不写此参数: 内容始终展开，不可折叠。
- `icon:` (可选): 替换该 admonition 类型的默认图标。通常可以使用 Font Awesome 或 RPG Awesome 图标库中的图标名称（具体支持哪些以及如何使用，需要查看插件的详细说明或设置）。
- `color:` (可选): 覆盖该 admonition 类型的默认强调色（通常是左边框和标题背景色）。可以指定一个十六进制颜色代码 (如 `#FF0000`) 或 RGB 值 (如 `rgb(255, 0, 0)`)。

**一些预设类型及其常见用途示例：**

1. **信息 (Info)**：提供一般性信息或上下文。
    
    Markdown
    
    ````
    ```ad-info
    title: 关于本项目
    这是一个提供项目背景信息的 admonition。
    ````
    
2. **提示 (Tip)**：给出有用的建议或技巧。
    
    Markdown
    
    ````
    ```ad-tip
    title: 小技巧
    collapse: open
    使用快捷键 `Ctrl/Cmd + P` 可以快速打开命令面板！
    ````
    
3. **警告 (Warning)**：提醒用户注意潜在的问题或需要谨慎操作的地方。
    
    Markdown
    
    ````
    ```ad-warning
    title: 注意事项
    在执行此操作前，请确保已备份所有重要数据。
    ````
    
4. **危险/错误 (Danger/Error/Bug)**：指出严重错误、危险操作或已知的缺陷。
    
    Markdown
    
    ````
    ```ad-danger
    title: 危险操作
    请勿随意修改系统核心文件，可能导致系统崩溃！
    ````
    
    Markdown
    
    ````
    ```ad-bug
    title: 已知问题
    当前版本在处理超大附件时可能会出现卡顿。
    ````
    
5. **笔记/注释 (Note/Abstract/Summary/TLDR)**：用于补充说明、摘要或重点概括。
    
    Markdown
    
    ````
    ```ad-note
    这只是一些补充的想法。
    ````
    
    Markdown
    
    ````
    ```ad-abstract
    title: 内容概要
    本文主要讨论了 Admonition 插件的安装和基本用法。
    ````
    
6. **示例 (Example)**：展示代码示例或其他类型的例子。
    
    Markdown
    
    ````
    ```ad-example
    title: Python 代码示例
    ```python
    def hello():
        print("Hello, Admonition!")
    hello()
    ````
    
7. **引言 (Quote)**：引用他人的话或文章段落。
    
    Markdown
    
    ````
    ```ad-quote
    title: 名人名言
    > 学如逆水行舟，不进则退。
    ````
    

**自定义 Admonition 类型：**

除了使用预设的类型，这个插件最强大的功能之一就是允许你在插件的设置中创建**全新的、完全自定义的 admonition 类型**。你可以为你的自定义类型指定：

- 唯一的类型名称 (在代码块中使用，如 `ad-mycustomtype`)。
- 默认显示的标题。
- 默认的图标 (通常可以从 Font Awesome, RPG Awesome 等图标库选择，或者使用自定义的SVG图标)。
- 默认的强调颜色。

**好处总结：**

- **提升视觉效果**：让你的笔记不再单调，重点更突出。
- **优化阅读体验**：帮助读者快速识别不同性质的信息块。
- **强化信息层级**：通过醒目的样式强调关键内容。
- **保持一致性**：通过自定义类型，可以在所有笔记中对同类信息使用统一的视觉风格。

## 设置项介绍

以下是admonition插件的设置项介绍


![[Pasted image 20250510170634.png]]


**Admonition Settings (Admonition 设置)**

1. **Export Custom Types as CSS (将自定义类型导出为CSS)**
    
    - **描述**："Export a CSS snippet for custom callout types." (为自定义 callout 类型导出一个 CSS 代码片段。)
    - **图标**：一个下载图标。
    - **功能**：这个功能允许你将你在 Admonition 插件中创建的**所有自定义 admonition 类型**的样式定义导出为一个单独的 CSS 文件。这个 CSS 文件可以作为一个 CSS 代码片段（snippet）在 Obsidian 中使用，或者用于其他地方。这对于备份你的自定义样式、在不同的库之间共享样式，或者在你希望禁用 Admonition 插件但仍保留这些自定义 callout 样式时非常有用。Obsidian 后来也内置了 Callouts 功能，这个导出可能有助于将 Admonition 的自定义类型转换为与内置 Callouts 兼容的 CSS。
2. **Export Custom Types as JSON (将自定义类型导出为JSON)**
    
    - **描述**："Choose custom types to export as a JSON file that you can then share with other users." (选择要导出为 JSON 文件的自定义类型，然后你可以与其他用户共享。)
    - **按钮**："Download All" (全部下载)，"Select & Download" (选择并下载)
    - **功能**：允许你将你创建的自定义 admonition 类型的**配置信息**（包括类型名称、图标、颜色、默认标题等）导出为一个 JSON 文件。
        - **Download All**：导出所有自定义类型。
        - **Select & Download**：允许你选择特定的自定义类型进行导出。
    - **作用**：这个 JSON 文件可以方便地与他人共享你的 admonition 设置，或者在你自己的不同 Obsidian 库之间迁移这些自定义类型。其他人或你自己可以通过下面的 "Import Admonition(s)" 功能导入这个 JSON 文件来快速应用相同的自定义类型。
3. **Use CSS Snippet for Custom Callouts (为自定义 Callout 使用 CSS 代码片段)**
    
    - **描述**："Instead of managing it internally, Admonitions will maintain a CSS snippet to enable your custom types for callouts." (Admonitions 将维护一个 CSS 代码片段来启用你的自定义 callout 类型，而不是在内部管理它。)
    - **状态**：图片中此选项的开关为**关闭**状态。
    - **功能**：这是一个比较高级的选项，涉及到 Admonition 插件如何与 Obsidian 内置的 Callouts 功能协同工作。
        - 如果**关闭**（像图片中那样），Admonition 插件可能会在内部动态生成和管理使其自定义类型能像 Obsidian 内置 Callouts 一样工作的样式。
        - 如果**开启**，Admonition 插件可能会生成一个独立的 CSS 代码片段文件（你可以在 `.obsidian/snippets` 文件夹中找到它），这个文件包含了让你自定义的 Admonition 类型也能被 Obsidian 内置 Callouts 系统识别和渲染的样式规则。这样做的好处是，即使 Admonition 插件本身被禁用，只要这个 CSS 代码片段是启用的，那些基于 Admonition 自定义类型创建的 callout 块（如果它们也遵循了 callout 的基本语法 `>[!type]`）可能仍然能以你期望的样式显示。
    - **作用**：提供一种更持久或更符合 Obsidian 内置 Callouts 机制的方式来应用自定义 Admonition 类型的样式。
4. **Add New (添加新的)**
    
    - **描述**："Add a new Admonition type. All custom Admonitions will also be usable as callouts." (添加一个新的 Admonition 类型。所有自定义 Admonition 也将可用作 callout。)
    - **图标**：一个加号 `+` 图标。
    - **功能**：点击这个按钮会允许你**创建全新的、你自己的 Admonition 类型**。你会需要为新类型指定一个唯一的ID（比如 `my-custom-note`）、默认显示的标题、图标（通常可以从 Font Awesome 或其他支持的图标库选择）、默认的颜色等。创建后，你就可以在笔记中使用 `ad-my-custom-note` 这样的语法来调用它了。并且，如描述所说，这些自定义类型通常也会被设计成可以作为 Obsidian 内置的 Callout 使用（即使用 `>[!my-custom-note]` 语法）。
5. **Import Admonition(s) (导入 Admonition)**
    
    - **描述**："Import admonitions from a JSON definition." (从一个 JSON 定义文件导入 admonition。)
    - **按钮**："Choose Files" (选择文件)，旁边有一个信息 `i` 图标。
    - **功能**：与上面的 "Export Custom Types as JSON" 对应。这个功能允许你选择一个之前导出的 JSON 文件（或者别人分享给你的 JSON 文件），并将其中定义的自定义 Admonition 类型导入到你当前的 Obsidian 库中。
    - **作用**：方便快速地从备份恢复自定义类型，或者应用他人分享的 Admonition 配置。

**Admonitions & Callouts (Admonition 与 Callout 的通用设置)**

6. **Add Drop Shadow (添加投影)**
    
    - **描述**："A drop shadow will be added to admonitions." (将为 admonition 添加投影效果。)
    - **状态**：图片中此选项的开关为**开启**状态。
    - **功能**：启用后，所有的 admonition 块（以及可能包括 Callouts）会带有一个细微的阴影效果，使它们看起来更有立体感，像是浮在笔记内容之上。
    - **作用**：一种视觉增强效果。
7. **Collapsible by Default (默认可折叠)**
    
    - **描述**："All admonitions & callouts will be collapsible by default. Use `collapse: none` to prevent." (所有 admonition 和 callout 默认都将是可折叠的。使用 `collapse: none` 来阻止。)
    - **状态**：图片中此选项的开关为**关闭**状态。
    - **功能**：
        - 如果**开启**，那么你创建的每一个 admonition 或 callout，即使你没有在代码块中明确指定 `collapse: open` 或 `collapse: closed`，它们也都会默认带有折叠/展开的功能（通常默认是展开状态，但标题旁会有折叠箭头）。
        - 如果你希望某个特定的 admonition **不可折叠**，你需要在其定义中明确加入 `collapse: none`。
        - 如果**关闭**（像图片中那样），那么只有那些在定义中明确包含了 `collapse: open` 或 `collapse: closed` 的 admonition 才具有折叠功能。
    - **作用**：统一控制所有 admonition/callout 是否具备可折叠特性。
8. **Add Copy Button (添加复制按钮)**
    
    - **描述**："Add a 'copy content' button to admonitions & callouts." (为 admonition 和 callout 添加一个“复制内容”按钮。)
    - **状态**：图片中此选项的开关为**关闭**状态。
    - **功能**：启用后，会在每个 admonition 或 callout 块的右上角（或其他显眼位置）添加一个小按钮，点击该按钮可以快速复制该块内的所有文本内容到剪贴板。
    - **作用**：方便快速复制代码片段、引言或其他 admonition 中的重要文本。
9. **Parse Titles as Markdown (将标题解析为Markdown)**
    
    - **描述**："Admonition Titles will be rendered as markdown." (Admonition 标题将被渲染为 markdown。)
    - **状态**：图片中此选项的开关为**开启**状态。
    - **功能**：启用后，你在 admonition 定义中设置的 `title:` 后面的文本，如果包含 Markdown 语法（例如 `**加粗**`, `*斜体*`, `` `代码` ``, `[[链接]]`），这些 Markdown 语法会被正确地渲染显示在 admonition 的标题栏上。如果禁用，标题通常会作为纯文本显示。
    - **作用**：允许在 admonition 标题中使用更丰富的文本格式。
10. **Set Admonition Colors (设置 Admonition 颜色)**
    
    - **描述**："Disable this setting to turn off admonition coloring by default. Can be overridden in the admonition definition." (禁用此设置可默认关闭 admonition 的着色。可以在 admonition 定义中覆盖。)
    - **状态**：图片中此选项的开关为**开启**状态。
    - **功能**：
        - 如果**开启**（像图片中那样），那么 admonition 会使用其类型所定义的默认颜色（或你在单个 admonition 中用 `color:` 参数指定的颜色）来进行着色（通常是左边框和标题背景）。
        - 如果**关闭**，那么所有 admonition 默认情况下可能不会显示其特定的强调色，除非你在单个 admonition 的定义中通过 `color:` 参数强制指定了颜色。
    - **作用**：全局控制 admonition 是否应用其类型定义的颜色方案。
11. **Hide Empty Admonitions (隐藏空的 Admonition)**
    
    - **描述**："Any admonition that does not have content inside it will be hidden." (任何内部没有内容的 admonition 都将被隐藏。)
    - **状态**：图片中此选项的开关为**关闭**状态。
    - **功能**：启用后，如果你创建了一个 admonition 块，但没有在其中填写任何实际内容（只有标题或完全是空的），那么这个空的 admonition 块在阅读视图下将不会显示出来。
    - **作用**：保持笔记的整洁，避免显示没有意义的空信息框。

**Icon Packs (图标包)**

12. **Use Font Awesome Icons (使用 Font Awesome 图标)**
    
    - **描述**："Font Awesome Free icons will be available in the item picker. Existing Admonitions defined using Font Awesome icons will continue to work." (Font Awesome 免费版图标将在项目选择器中可用。使用 Font Awesome 图标定义的现有 Admonition 将继续工作。)
    - **状态**：图片中此选项的开关为**开启**状态。
    - **功能**：启用后，当你在创建或编辑自定义 Admonition 类型并为其选择图标时，可以使用来自流行的 Font Awesome (免费版) 图标库中的图标。
    - **作用**：提供大量高质量的矢量图标供选择。
13. **Load Additional Icons (加载额外图标)**
    
    - **描述**："Load an additional icon pack. This requires an internet connection." (加载一个额外的图标包。这需要互联网连接。)
    - **当前值示例**：下拉菜单中显示 "Octicons"，并有刷新和加号图标。
    - **功能**：允许你除了 Font Awesome 之外，再选择加载其他预设的图标库（例如 Octicons, RPG Awesome 等，具体支持哪些取决于插件版本）。加载这些图标库通常需要在首次使用时联网下载。
        - **下拉菜单**：选择要加载的额外图标包。
        - **刷新图标**：可能用于重新加载或更新图标列表。
        - **加号图标**：可能用于添加更多图标包的来源或进行其他配置。
    - **作用**：进一步扩展可用图标的选择范围，让你的 admonition 更具表现力。
