这插件旨在加强Obsidian的搜索体验，使用BM25算法，但这个有时候精确查找找不到。我一般还是用Obsidian最简单的搜索功能多一点。ominisearch插件的话可以了解一下：

## 基本介绍

**核心功能与优势：**

- **智能排序与相关性：** Omnisearch 采用智能加权算法（如 BM25），不仅仅是简单地匹配关键词，还会根据词语在文档标题、小标题以及正文中的出现频率和位置来评估相关性，从而优先展示最匹配的笔记。
- **广泛的文件类型支持：** 除了 Markdown 文件（`.md`），Omnisearch 还可以索引和搜索 PDF 文件、Office 文档（如 `.docx`, `.pptx`, `.xlsx`）以及图片中的文本（OCR 功能）。这需要配合另一个名为 "Text Extractor" 的插件来实现对这些非纯文本内容的文本提取。
- **高效的索引与搜索速度：** Omnisearch 会在启动时或后台持续更新其索引，并将索引保留在内存中，这使得搜索响应非常迅速。即使是大型仓库，也能在短时间内完成索引。
- **类似“快速切换”的体验：** 其工作流程类似于 Obsidian 内置的“快速切换”（Quick Switcher）功能，但功能更为强大，可以看作是“快速切换”的增强版。
- **用户友好的搜索语法：** 支持使用引号进行“精确短语搜索”，以及使用 `-` 号排除包含特定词语的笔记。还可以通过 `ext:` 或直接使用文件后缀（如 `.pdf`, `.jpg`）来筛选特定文件类型，或使用 `path:` 来限定搜索范围。
- **容错性：** 对于偶尔的拼写错误，Omnisearch 具有一定的容错能力，能够部分匹配查询内容。
- **键盘优先设计：** 支持全程键盘操作，无需鼠标即可高效完成搜索和导航。
- **多功能搜索模式：**
    - **仓库搜索 (Vault Search):** 通过命令面板 (Command Palette) 使用 "Omnisearch: Vault search" 进行全局搜索。
    - **文件内搜索 (In-File Search):** 通过命令面板使用 "Omnisearch: In-file search" 在当前激活的 Markdown 文件内进行搜索，并能快速定位到匹配位置。
- **直接插入链接：** 可以在搜索结果中直接将笔记以 `[[链接]]` 的形式插入到当前笔记中。
- **外部访问 (可选):** 提供了一个可选的本地 HTTP 服务器，允许从 Obsidian 外部查询 Omnisearch。

**与核心搜索的区别：**

Omnisearch 并非旨在完全取代 Obsidian 的核心搜索插件。核心搜索插件在复杂的布尔逻辑查询和正则表达式方面可能更具优势。而 Omnisearch 更专注于快速、直观地找到最相关的笔记，尤其适合那些笔记数量庞大、组织可能不太规整的用户，或者需要快速在多种类型文件中查找信息的用户。它的设计理念是让你能够通过最自然的、自发的关键词快速定位到所需信息。

## 设置项介绍

![[Pasted image 20250602102617.png]]

顶部提示信息：

- **Indexing: Changing indexing settings will clear the cache, and requires a restart of Obsidian.**
    - **中文解释：** 索引：更改索引设置将会清除缓存，并且需要重启 Obsidian。
    - **说明：** 这是一个重要的提示。当您修改了以下任何关于索引（即插件如何读取和处理您的文件以供搜索）的设置后，Omnisearch 需要重新构建其搜索数据库（缓存）。为了使更改生效并重建索引，您需要关闭并重新打开 Obsidian。

主要的设置选项：

1. **Omnisearch requires Text Extractor to index PDFs and images.**
    
    - **中文解释：** Omnisearch 需要 Text Extractor 插件来索引 PDF 和图片。
    - **说明：** 这是一个依赖关系说明。如果你想让 Omnisearch 能够搜索 PDF 文档和图片文件中的文本内容，你必须安装并启用另一个名为 "Text Extractor" 的社区插件。Text Extractor 负责从这些文件中提取文本，然后 Omnisearch 才能对这些文本进行索引和搜索。
2. **Omnisearch requires AI Image Analyzer to index images with AI.**
    
    - **中文解释：** Omnisearch 需要 AI Image Analyzer 插件来通过 AI 索引图片。
    - **说明：** 这是另一个依赖关系说明，针对更高级的图片索引。如果你希望 Omnisearch 利用人工智能来理解和索引图片内容（可能不仅仅是图片中的文字，还包括图片描述、对象识别等，具体取决于 AI Image Analyzer 的功能），你需要安装并启用 "AI Image Analyzer" 插件。
3. **PDFs content indexing (Disabled)**
    
    - **中文解释：** PDF 内容索引 (已禁用)
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Omnisearch will use Text Extractor to index the content of your PDFs.` （Omnisearch 将使用 Text Extractor 来索引您的 PDF 内容。）
        - 启用此选项后，Omnisearch 会配合 Text Extractor 插件，读取您 Obsidian 仓库中 PDF 文件的文本内容，并将其纳入搜索索引。这样您就可以通过关键词搜索到 PDF 文件中的具体内容了。禁用状态下，Omnisearch 不会索引 PDF 内容。
4. **Images OCR indexing (Disabled)**
    
    - **中文解释：** 图片 OCR 索引 (已禁用)
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Omnisearch will use Text Extractor to OCR your images and index their content.` （Omnisearch 将使用 Text Extractor 来对您的图片进行 OCR 并索引其内容。）
        - OCR (Optical Character Recognition，光学字符识别) 是一种将图片中的文字转换为可编辑和可搜索文本的技术。启用此选项后，Omnisearch 会利用 Text Extractor 对您仓库中的图片文件进行 OCR 处理，提取图片中的文字，并将其加入搜索索引。这样，您就可以搜索图片里包含的文字了。禁用状态下，Omnisearch 不会进行此操作。
5. **Documents content indexing (Disabled)**
    
    - **中文解释：** 文档内容索引 (已禁用)
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Omnisearch will use Text Extractor to index the content of your office documents (currently .docx and .xlsx).` （Omnisearch 将使用 Text Extractor 来索引您的 Office 文档内容（目前支持 .docx 和 .xlsx）。）
        - 启用此选项后，Omnisearch 会配合 Text Extractor 插件，读取您仓库中指定的 Office 文档（目前看截图是支持 Word 的 `.docx` 文件和 Excel 的 `.xlsx` 文件）的内容，并将其纳入搜索索引。这样您就可以搜索这些 Office 文档中的文本了。禁用状态下，Omnisearch 不会索引这些文档的内容。
6. **Images AI indexing (Disabled)**
    
    - **中文解释：** 图片 AI 索引 (已禁用)
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Omnisearch will use AI Image Analyzer to index the content of your images with ai.` （Omnisearch 将使用 AI Image Analyzer 通过 AI 来索引您的图片内容。）
        - 如前所述，启用此选项后，Omnisearch 会结合 AI Image Analyzer 插件，使用人工智能技术分析图片内容并进行索引。这可能比单纯的 OCR 更进一步，能让你基于图片所描绘的对象或场景进行搜索（具体取决于 AI Image Analyzer 的能力）。禁用状态下，不进行此 AI 索引。
7. **Index paths of unsupported files**
    
    - **中文解释：** 索引不支持文件的路径
    - **下拉菜单：** 右侧有一个下拉菜单，当前显示 "Obsidian setting"。
    - **说明：** `Omnisearch can index filenames of "unsupported" files, such as e.g. .mp4 or non-extracted PDFs & images.` （Omnisearch 可以索引“不支持”文件的文件名，例如 .mp4 文件或未提取内容的 PDF 和图片。） `"Obsidian setting" will respect the value of "Files & Links > Detect all file extensions".` （“Obsidian setting” 将遵循“文件与链接 > 检测所有文件扩展名”的设置值。）
        - 这个设置决定了 Omnisearch 如何处理那些它不能直接读取内容的文件类型（比如视频 `.mp4`，或者因为 Text Extractor 未启用/配置而无法提取内容的 PDF/图片）。
        - 即使不能索引内容，Omnisearch 仍然可以索引这些文件的**文件名**。
        - 选择 "Obsidian setting" 意味着它会根据 Obsidian 核心设置中“文件与链接”下的“检测所有文件扩展名”的选项来决定是否索引这些不支持文件的文件名。如果 Obsidian 设置为检测所有扩展名，那么这些文件名也会被索引。您可以更改此设置，让 Omnisearch 强制索引所有文件的文件名，或者不索引它们。
8. **Set frontmatter property key as title**
    
    - **中文解释：** 设置 frontmatter 属性键作为标题
    - **输入框：** 右侧有一个文本输入框。
    - **说明：** `If you have a custom property in your notes that you want to use as the title in search results. If you set this to '#heading', then use the first heading from a file as the title. Leave empty to disable.` （如果您笔记中有一个自定义属性想用作搜索结果中的标题。如果将其设置为 '#heading'，则使用文件中的第一个标题作为标题。留空则禁用。）
        - Obsidian 笔记可以在文件顶部的 `---` 分隔区域内定义 "frontmatter" (元数据)。您可以设置一个 frontmatter 属性的键名（例如 `customTitle` 或 `alias`）。如果设置了，当这个笔记出现在 Omnisearch 的搜索结果中时，会优先使用该 frontmatter 属性的值作为标题显示，而不是文件名或笔记内的第一个标题。
        - 一个特殊的值是 `#heading`，如果设置为这个，Omnisearch 会自动提取笔记中的第一个一级标题（`# 标题`）作为搜索结果的标题。
        - 如果留空，则禁用此功能，Omnisearch 会使用默认的标题确定方式（通常是文件名）。
9. **Additional TEXT files to index**
    
    - **中文解释：** 额外要索引的文本文件
    - **输入框：** 右侧有一个文本输入框，示例为 "Example: txt org csv"。
    - **说明：** `In addition to standard .md files, Omnisearch can also index other PLAINTEXT files. Add extensions separated by a space, without the dot. Example: "txt org csv".` （除了标准的 .md 文件，Omnisearch 还可以索引其他纯文本文件。添加扩展名时用空格分隔，不需要加点。例如："txt org csv"。） `Using extensions of non-plaintext files (like .pptx) WILL cause crashes, because Omnisearch will try to index their content.` （使用非纯文本文件的扩展名（如 .pptx）会导致崩溃，因为 Omnisearch 会尝试索引其内容。）
        - 默认情况下，Omnisearch 主要索引 Markdown (`.md`) 文件。此选项允许您指定其他纯文本文件类型的扩展名，让 Omnisearch 也索引这些文件的内容。例如，如果您有一些 `.txt` (纯文本)、`.org` (Org Mode 文件) 或 `.csv` (逗号分隔值) 文件，并且希望它们能被搜索到，就可以在这里添加这些扩展名。
        - **重要警告：** 这里只能添加**纯文本**文件的扩展名。如果添加了非纯文本文件（如 `.pptx` 演示文稿、`.pdf` 等，这些需要 Text Extractor 处理），Omnisearch 会尝试直接按文本方式读取它们，这通常会导致错误或插件崩溃。

![[Pasted image 20250602103423.png]]