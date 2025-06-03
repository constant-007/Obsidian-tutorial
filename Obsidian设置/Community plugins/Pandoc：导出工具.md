## 基本介绍

Obsidian 的 Pandoc 插件允许用户直接在 Obsidian内部利用 Pandoc 的强大文档转换功能。Pandoc 被誉为文档转换领域的“瑞士军刀”，它可以在数十种标记语言格式之间进行转换。

以下是对 Obsidian Pandoc 插件的介绍：

**核心功能：**

- **直接在 Obsidian 中导出笔记：** 无需离开 Obsidian 环境，就可以将当前的笔记或选中的内容导出为多种不同的文件格式。
- **支持广泛的输出格式：** 借助 Pandoc 的能力，该插件可以支持导出为：
    - Microsoft Word (`.docx`)
    - PDF (通常需要 LaTeX 环境支持，如 MiKTeX, MacTeX, 或 TeX Live)
    - HTML
    - EPUB
    - OpenDocument Text (`.odt`)
    - 幻灯片格式如 PowerPoint (`.pptx`) 或 Beamer (PDF 幻灯片)
    - 以及其他 Pandoc 支持的格式。
- **自定义导出选项：** 你可以在插件设置中配置 Pandoc 的命令行参数，从而精确控制导出过程。例如：
    - 指定参考文献样式 (CSL 文件)
    - 使用自定义模板 (例如 Word 的 `.dotx` 模板或 LaTeX 模板)
    - 调整字体、页边距等。
- **导出整个保管库或特定文件夹 (取决于插件实现)：** 某些版本的 Pandoc 插件或相关社区工作流可能支持更批量的导出操作。
- **处理 Obsidian 特有的 Markdown 语法：** 插件通常会尝试将 Obsidian 的一些非标准 Markdown 元素（如内部链接 `[[wikilinks]]`、嵌入 `![[embeds]]` 等）转换为 Pandoc 能理解的格式或在导出时进行适当处理。

**为什么需要这个插件？**

- **学术写作：** 对于需要提交 Word 文档或使用特定参考文献格式的学术论文，此插件非常有用。你可以用 Markdown 轻松写作，然后导出为符合要求的格式。
- **分享与协作：** 当需要与不使用 Markdown 或 Obsidian 的人分享笔记时，可以方便地将其转换为通用的格式如 Word 或 PDF。
- **多格式输出：** 如果你需要将同一份内容发布到不同平台（例如博客的 HTML、电子书的 EPUB），Pandoc 插件可以简化这个过程。
- **利用 Pandoc 的高级功能：** Pandoc 本身非常强大，包括对元数据、参考文献、目录、脚注、数学公式等的精细控制。通过插件，可以在 Obsidian 中利用这些功能。

**如何开始使用：**

1. **安装 Pandoc：** 这是最重要的一步。Obsidian Pandoc 插件本身只是一个调用 Pandoc 的接口，你**必须**首先在你的操作系统上独立安装 Pandoc 程序。你可以从 Pandoc 官网 ([https://pandoc.org/](https://pandoc.org/)) 下载并安装。
    - **对于 PDF 导出：** 你通常还需要安装一个 LaTeX 发行版，例如 MiKTeX (Windows), MacTeX (macOS), 或 TeX Live (跨平台)。Pandoc 默认使用 LaTeX 来生成 PDF。
2. **安装插件：** 在 Obsidian 的 “设置” -> “社区插件” 中搜索 "Pandoc" 或 "Pandoc Plugin" 并安装。
3. **启用插件：** 安装后，确保启用该插件。
4. **配置插件：**
    - **Pandoc 路径 (可能需要)：** 有些插件可能需要你指定 Pandoc 的安装路径，但很多时候它可以自动检测到。
    - **导出设置/输出格式：** 插件设置里通常会有选项让你配置默认的导出格式，以及为不同格式指定特定的 Pandoc 参数。你可以添加多个导出配置文件，例如一个用于导出 Word，一个用于导出带参考文献的 PDF 等。
    - **Extra Pandoc Arguments：** 这是最灵活的部分，你可以在这里填写额外的 Pandoc 命令行参数，比如 `--citeproc` (处理参考文献), `--csl=your-style.csl` (指定 CSL 样式文件), `--reference-doc=your-template.docx` (指定 Word 模板) 等。
5. **使用插件：**
    - 通常，启用插件后，你可以在命令面板 (Ctrl/Cmd + P) 中找到相关的导出命令，例如 "Pandoc export as docx", "Pandoc export as pdf" 等。
    - 有些插件也可能在笔记的右键菜单或文件浏览器的右键菜单中添加导出选项。

**注意事项与提示：**

- **Pandoc 本身的学习曲线：** Pandoc 非常强大，但其命令行参数和模板系统也相对复杂。要充分发挥插件的功能，你可能需要花一些时间学习 Pandoc 的基本用法。
- **依赖外部程序：** 记住，这个插件的运行依赖于你系统中正确安装和配置的 Pandoc（以及可能的 LaTeX）。如果导出失败，首先检查 Pandoc 是否能独立在命令行中正常工作。
- **处理 Obsidian 链接和嵌入：** 不同版本的插件或配置对于 Obsidian 内部链接和嵌入的处理方式可能不同。有些能很好地转换它们，有些可能需要额外的配置或不支持所有情况。
- **元数据 (Metadata)：** 在你的 Markdown 文件中使用 YAML frontmatter 来定义标题、作者、日期等元数据，Pandoc 会在导出时使用这些信息。
- **查看插件文档：** 务必阅读你所安装的具体 Pandoc 插件的文档，因为不同的开发者实现的插件在细节和功能上可能会有所差异。

总而言之，Obsidian Pandoc 插件是连接 Obsidian 笔记与广阔文档世界的重要桥梁。对于需要高质量、多格式输出的用户，尤其是学术研究者和内容创作者，这是一个非常有价值的工具。它免去了手动复制粘贴和格式调整的麻烦，让你专注于内容创作本身。

## 设置项介绍

![[Pasted image 20250603192441.png]] 
1. **Custom CSS file for HTML output (自定义 HTML 输出的 CSS 文件)**：
    
    - 这里你可以指定一个本地 CSS 文件的路径。
    - 当你将笔记导出为 HTML 格式时，这个 CSS 文件中的样式规则会被用来美化输出的 HTML 页面。这允许你完全自定义 HTML 导出件的外观。
    - 输入框提示 "File name"，你可以使用绝对路径或相对于 Obsidian 库的路径。
2. **Inject app CSS (HTML output only) (注入应用 CSS - 仅限 HTML 输出)**：
    
    - 这个选项允许你将 Obsidian 应用本身的部分或全部 CSS 样式（包括你当前使用的主题样式和自定义 CSS 片段）也应用到导出的 HTML 文件中。
    - 旁边的下拉菜单（图中显示 "Light theme"）可能允许你选择注入亮色主题、暗色主题或当前主题的 CSS。
    - 说明中提到 "the files become a little bigger"，这是因为额外的 CSS 代码会增加 HTML 文件的大小。
3. **Internal link processing (内部链接处理)**：
    
    - 这个选项控制 Obsidian 中的内部链接（例如 `[[wikilinks]]`）在导出时如何被处理。
    - 下拉菜单（图中显示 "Turn into text"）提供了不同的处理方式，例如：
        - **Turn into text**：将链接文字直接转换为普通文本。
        - **Remove links**：移除链接，只保留链接文本。
        - **HTML links**：转换为标准的 HTML 链接 (可能需要进一步配置如何解析这些链接的目标)。
4. **Export files from HTML or markdown? (从 HTML 还是 Markdown 导出？)**：
    
    - 这个下拉选项（图中显示 "HTML"）决定了 Pandoc 转换的源头。
    - **HTML**：Obsidian 首先将其内部的 Markdown 渲染成 HTML（这会包含一些 Obsidian 特有的渲染效果或插件渲染的元素），然后再将这个 HTML 交给 Pandoc 处理。这有助于保留你在 Obsidian 中看到的“所见即所得”的效果，但可能不完全是纯净的 Markdown。
    - **Markdown**：插件直接将你的原始 Markdown 文件交给 Pandoc 处理。这更接近 Pandoc 的标准工作方式，对于使用 Pandoc 特有的 Markdown 扩展（如引文）会更直接。
5. **Export folder (导出文件夹)**：
    
    - 这里你可以指定一个绝对路径，所有通过此插件导出的文件都将保存到这个文件夹中。
    - 如果留空，导出的文件会保存在原始笔记所在的文件夹旁边，通常会创建一个名为 `/pandoc`（如图中占位符所示）的子文件夹来存放导出文件。
6. **Show Pandoc command line interface commands (显示 Pandoc 命令行命令)**：
    
    - 这是一个开关选项（图中为关闭状态）。
    - 如果开启，当你执行导出操作时，插件可能会显示它在后台实际执行的 Pandoc 命令行命令。这对于调试或学习 Pandoc 命令非常有帮助。
    - 说明提到 "Doesn't apply to HTML exports"，意味着此功能可能不适用于 HTML 导出，或者 HTML 导出的命令显示方式不同。
7. **Pandoc path (Pandoc 路径)**：
    
    - 非常关键的设置。这里需要填写你系统中 Pandoc 可执行文件的路径。
    - 说明中给出了提示：在 Mac/Linux 上，可以在终端使用 `which pandoc` 命令找到路径；在 Windows 上，可以在 PowerShell 中使用 `Get-Command pandoc`。
    - 如果 Pandoc 已经正确添加到系统环境变量中，这里可能留空或填写 `pandoc` 即可。
8. **PDFLaTeX path (PDFLaTeX 路径)**：
    
    - 如果你打算通过 LaTeX 来生成高质量的 PDF 文件，这里需要指定 `pdflatex` 可执行文件的路径。
    - 与 Pandoc 路径类似，可以使用 `which pdflatex` (Mac/Linux) 或相应命令 (Windows) 查找。
    - 这是使用 LaTeX 引擎输出 PDF 时的必要配置。
9. **Extra Pandoc arguments (额外 Pandoc 参数)**：
    
    - 这是一个非常强大的功能。你可以在这里添加任何 Pandoc 支持的命令行参数，以进一步自定义导出过程。
    - 每一行会被视为一个或多个参数（空格分隔）。
    - 图片右侧的示例文字给出了很好的例子：
        - `--bibliography "Zotero ExportsMy Library.json"`: 指定参考文献数据库文件（例如 Zotero 导出的 JSON 或 .bib 文件）。
        - `--template letter`: 指定使用一个名为 "letter" 的自定义模板。
    - 你可以用它来指定 CSL 文件 (用于引文样式)、PDF 引擎、设置变量、启用或禁用特定的 Pandoc 扩展等。

```ad-note
title: 注意
这插件导出的时候老是报路径找不到的错误，情况似乎有很多种，建议问大模型。我是把导出文件及设置为“/pandoc"，然后在D盘创建一个名为”pandoc"的文件夹后成功导出HTML文件，但其他格式依然无法导出。而且具体为什么是D盘我也不太清楚。
```



