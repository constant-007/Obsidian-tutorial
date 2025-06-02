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

1. **Save index to cache**
    
    - **中文解释：** 将索引保存到缓存
    - **设置开关：** 右侧有一个开关，当前处于开启状态。
    - **说明：** `Enable caching to speed up indexing time. In rare cases, the cache write may cause a crash in Obsidian. This option will disable itself if it happens.` （启用缓存以加快索引时间。在极少数情况下，缓存写入可能会导致 Obsidian 崩溃。如果发生这种情况，此选项将自行禁用。）
        - 启用此选项后，Omnisearch 会将构建好的索引保存到磁盘上的缓存文件中。这样做的好处是，下次启动 Obsidian 时，Omnisearch 可以直接从缓存加载索引，而不是重新扫描和处理所有文件，从而大大加快了插件的启动和索引速度。
        - 开发者提示，在极少数情况下，写入缓存的过程可能会引发 Obsidian 崩溃。如果 Omnisearch 检测到这种情况，它会自动禁用这个缓存选项以保证稳定性。
2. **Show previous query results**
    
    - **中文解释：** 显示先前的查询结果
    - **设置开关：** 右侧有一个开关，当前处于开启状态。
    - **说明：** `Re-executes the previous query when opening Omnisearch.` （当打开 Omnisearch 时，重新执行上一次的查询。）
        - 如果启用此选项，每次您打开 Omnisearch 界面时（例如通过快捷键或命令面板），它会自动显示并执行您上一次搜索时使用的查询关键词和结果。这对于需要反复查看同一组搜索结果的场景很方便。
        - 如果禁用，每次打开 Omnisearch 都会是一个全新的、空白的搜索界面。
3. **Respect Obsidian's "Excluded Files"**
    
    - **中文解释：** 遵循 Obsidian 的“排除文件”设置
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `By default, files that are in Obsidian's "Options > Files & Links > Excluded Files" list are downranked in results. Enable this option to completely hide them.` （默认情况下，在 Obsidian 的“选项 > 文件与链接 > 排除的文件”列表中的文件，其搜索结果排名会降低。启用此选项可将其完全隐藏。）
        - Obsidian 自身有一个设置，允许用户指定一些不想在文件浏览器等处看到的文件或文件夹（“排除的文件”）。
        - **禁用时 (默认行为如描述)：** Omnisearch 仍然会索引这些被 Obsidian 排除的文件，但会在搜索结果中降低它们的排序优先级。
        - **启用时：** Omnisearch 将完全忽略这些被 Obsidian 排除的文件，它们不会出现在搜索结果中。
4. **Recency boost (experimental)**
    
    - **中文解释：** 近期文件加权 (实验性)
    - **下拉菜单：** 右侧有一个下拉菜单，当前显示 "Disabled" (已禁用)。
    - **说明：** `Files that have been modified more recently than [selected cutoff] are given a higher rank.` （在[选定截止时间]之后修改过的文件将被赋予更高的排名。）
        - 这是一个实验性功能，旨在提高最近修改过的文件在搜索结果中的排序。您可以从下拉菜单中选择一个时间范围（例如，过去24小时、过去一周等）。在这个时间范围内被修改过的文件，其搜索相关性得分会得到提升，从而更有可能出现在搜索结果的前面。
        - "Disabled" 表示不启用此加权功能。
5. **Folders to downrank in search results**
    
    - **中文解释：** 在搜索结果中降低排名的文件夹
    - **输入框：** 右侧有一个文本输入框，示例为 "Example: src,p2/dir"。
    - **说明：** `Folders to downrank in search results. Files in these folders will be downranked in results. They will still be indexed for tags, unlike excluded files. Folders should be comma delimited.` （在搜索结果中降低排名的文件夹。这些文件夹中的文件在结果中排名会降低。与排除的文件不同，它们仍会为标签建立索引。文件夹应以逗号分隔。）
        - 您可以在这里输入一些文件夹的路径。Omnisearch 仍然会索引这些文件夹中的文件内容，但当这些文件出现在搜索结果中时，它们的排序会被刻意降低。
        - 这对于那些包含您希望搜索到，但通常不那么重要的内容的文件夹（例如附件文件夹、存档文件夹）很有用。
        - 与完全“排除文件”不同，这里的文件只是排序靠后，并且它们所包含的标签（tags）依然会被索引。
        - 多个文件夹路径之间用逗号分隔。
6. **Split CamelCaseWords**
    
    - **中文解释：** 分割驼峰式单词
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Enable this if you want to be able to search for CamelCaseWords as separate words.` （如果您希望能够将驼峰式单词作为单独的词进行搜索，请启用此选项。） `Changing this setting will clear the cache.` （更改此设置将清除缓存。） `Needs a restart to fully take effect.` （需要重启才能完全生效。）
        - 驼峰式命名（CamelCaseWords）是指像 `MyDocumentName` 或 `iPhoneSE` 这样的写法。
        - **禁用时：** `MyDocumentName` 会被视为一个单独的词。搜索 "My" 或 "Document" 可能不会直接匹配到它（除非有其他匹配逻辑）。
        - **启用时：** Omnisearch 会将 `MyDocumentName` 拆分成 `My`, `Document`, `Name` 三个独立的词进行索引。这样，搜索 "document" 或 "name" 就能更容易地找到这个笔记。
        - 如提示所述，更改此设置会清除缓存，并需要重启 Obsidian。
7. **Simpler search**
    
    - **中文解释：** 更简单的搜索
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Enable this if Obsidian often freezes while making searches. Words shorter than 3 characters won't be used as prefixes; this can reduce search delay but will return fewer results.` （如果 Obsidian 在搜索时经常卡顿，请启用此选项。长度小于3个字符的单词将不会用作前缀；这可以减少搜索延迟，但会返回较少的结果。）
        - 这是一个性能优化选项。如果您的仓库非常大，或者在搜索时感觉 Omnisearch 响应慢甚至导致 Obsidian 卡顿，可以尝试启用它。
        - 启用后，Omnisearch 会简化其搜索逻辑，特别是它不会将非常短的词（少于3个字符）用作前缀匹配。例如，搜索 "th" 可能不会匹配到 "the"。这会牺牲一定的搜索全面性，以换取更快的搜索速度和更低的资源消耗。
8. **Tokenize URLs**
    
    - **中文解释：** 将 URL 标记化（分词）
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Enable this if you want to be able to search for URLs as separate words. This setting has a strong impact on indexing performance, and can crash Obsidian under certain conditions.` （如果您希望能够将 URL 作为单独的词进行搜索，请启用此选项。此设置对索引性能有很大影响，并且在某些情况下可能导致 Obsidian 崩溃。）
        - URL (网址) 通常是一个长字符串，例如 `https://www.example.com/path/to/page`。
        - **禁用时：** 上述 URL 会被视为一个整体。
        - **启用时：** Omnisearch 会尝试将 URL 分解成更小的部分（例如 `http`, `www`, `example`, `com`, `path`, `to`, `page`）进行索引。这样您就可以通过搜索 URL 中的某个部分来找到包含该 URL 的笔记。
        - **重要警告：** 开发者明确指出，这个功能对索引性能有显著的负面影响（因为会产生大量额外的词元），并且在某些情况下甚至可能导致 Obsidian 崩溃。因此，请谨慎启用此选项，并确保您确实需要这个功能。
9. **Open in new pane**
    
    - **中文解释：** 在新窗格中打开
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Open and create files in a new pane instead of the current pane.` （在新窗格而不是当前窗格中打开和创建文件。）
        - 当您通过 Omnisearch 的搜索结果点击一个文件时：
            - **禁用时：** 该文件会在当前活动的窗格中打开，替换掉当前窗格的内容。
            - **启用时：** 该文件会在一个新的窗格中打开，保留当前窗格的内容不变。这对于需要同时查看多个文件的用户来说更方便。
        - 这也适用于通过 Omnisearch 创建新文件（如果插件支持此操作）。
10. **Set Vim like navigation keys**
    
    - **中文解释：** 设置类 Vim 导航键
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Maps down the results with Ctrl + J/N, or navigate up with Ctrl + K/P.` （使用 Ctrl + J/N 向下导航结果，或使用 Ctrl + K/P 向上导航结果。）
        - 如果您习惯使用 Vim 编辑器的快捷键：
            - **启用时：** 在 Omnisearch 的搜索结果列表中，您可以使用 `Ctrl + J` 或 `Ctrl + N` 向下移动光标，使用 `Ctrl + K` 或 `Ctrl + P` 向上移动光标。
            - **禁用时：** 将使用标准的上下箭头键进行导航。
11. **Fuzziness**
    
    - **中文解释：** 模糊度
    - **下拉菜单/选择器：** 右侧有一个选择器，当前显示 "Not too fuzzy" (不太模糊)。
    - **说明：** `Define the level of fuzziness for the search. The higher the fuzziness, the more results you'll get.` （定义搜索的模糊程度。模糊度越高，您将获得越多的结果。）
        - 模糊搜索允许 Omnisearch 匹配与您的查询词不完全相同但相似的词语。例如，轻微的拼写错误或词语的变体。
        - "Not too fuzzy" (不太模糊) 可能意味着它会允许非常小的差异（比如一个字母的差异）。
        - 您可以调整这个设置来控制模糊匹配的程度。更高的模糊度会召回更多的结果，但其中一些结果可能与您的查询相关性较低。更低的模糊度则要求更精确的匹配。您需要根据自己的需求找到一个平衡点。

![[Pasted image 20250602103943.png]]

**User Interface (用户界面)**

1. **Show ribbon button**
    
    - **中文解释：** 显示快捷栏按钮
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Add a button on the sidebar to open the Vault search modal.` （在侧边栏添加一个按钮以打开仓库搜索模态框。）
        - 启用此选项后，Obsidian 左侧的快捷栏（Ribbon，通常是一列图标）中会出现一个 Omnisearch 的专属按钮。点击这个按钮可以快速启动 Omnisearch 的全局仓库搜索界面。
        - 如果禁用，您仍然可以通过命令面板或快捷键使用 Omnisearch，只是快捷栏上没有专属按钮。
2. **Show excerpts**
    
    - **中文解释：** 显示摘要
    - **设置开关：** 右侧有一个开关，当前处于开启状态。
    - **说明：** `Shows the contextual part of the note that matches the search. Disable this to only show filenames in results.` （显示笔记中与搜索匹配的上下文部分。禁用此选项则仅在结果中显示文件名。）
        - **启用时 (当前状态)：** 在搜索结果列表中，除了文件名，Omnisearch 还会显示一小段包含您搜索关键词的上下文内容（即笔记摘要或片段）。这有助于您快速判断该结果是否是您想要的。
        - **禁用时：** 搜索结果将只显示匹配到的文件名，不显示上下文摘要。这会使结果列表更简洁，但可能需要您点击进入笔记才能确认相关性。
3. **Show embed references**
    
    - **中文解释：** 显示嵌入引用
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Some results are embedded in other notes. This setting controls the maximum number of embeds to show in the search results. Set to 0 to disable. Also works with Text Extractor for embedded images and documents.` （一些结果被嵌入在其他笔记中。此设置控制搜索结果中显示的最大嵌入数量。设置为 0 则禁用。也适用于通过 Text Extractor 处理的嵌入图片和文档。）
        - Obsidian 允许在一个笔记中嵌入（embed / transclude）其他笔记、图片或文档的内容。
        - **启用并设置数量 (当前为关闭状态，但如果开启)：** 如果您的搜索词匹配到了一个被嵌入到其他笔记中的内容，Omnisearch 可以在搜索结果中显示这些嵌入的上下文。您可以设置一个最大数量，来限制显示多少条这样的嵌入引用。
        - **设置为 0 或禁用：** 不在搜索结果中特别显示这些嵌入的上下文信息。
        - 这个功能与 Text Extractor 插件配合，也可以处理嵌入的图片和文档中的匹配。
4. **Render line return in excerpts**
    
    - **中文解释：** 在摘要中渲染换行符
    - **设置开关：** 右侧有一个开关，当前处于开启状态。
    - **说明：** `Activate this option to render line returns in result excerpts.` （激活此选项以在结果摘要中渲染换行符。）
        - **启用时 (当前状态)：** 如果搜索结果的上下文摘要中包含换行，这些换行会真实地显示出来，使得摘要的格式更接近原文。
        - **禁用时：** 摘要中的换行符可能会被忽略或替换为空格，使得摘要显示为一整段连续的文本。
5. **Show "Create note" button**
    
    - **中文解释：** 显示“创建笔记”按钮
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Shows a button next to the search input, to create a note. Acts the same as the shift + enter shortcut, can be useful for mobile device users.` （在搜索输入框旁边显示一个创建笔记的按钮。其功能与 shift + enter 快捷键相同，对于移动设备用户可能很有用。）
        - **启用时：** 在 Omnisearch 的搜索输入框旁边会出现一个按钮，点击它可以快速创建一个新笔记，笔记的标题通常会基于您当前的搜索词。
        - **禁用时 (当前状态)：** 不显示该按钮。您仍然可以使用 `Shift + Enter` 快捷键（如果插件支持）来达到类似效果。这个按钮主要是为了方便触屏操作或不常用快捷键的用户。
6. **Highlight matching words in results**
    
    - **中文解释：** 在结果中高亮匹配词语
    - **设置开关：** 右侧有一个开关，当前处于开启状态。
    - **说明：** `Will highlight matching results when enabled. See README for more customization options.` （启用时将高亮匹配的结果。有关更多自定义选项，请参阅 README。）
        - **启用时 (当前状态)：** 在搜索结果的摘要（excerpts）中，与您搜索查询匹配的关键词会被高亮显示（例如用不同背景色或加粗）。这使得快速定位相关信息更加容易。
        - 开发者提示可以查看插件的 README 文件了解是否有更多关于高亮样式的自定义选项。

**Results weighting (结果加权)**

这部分设置允许您调整不同因素在搜索结果排序中的重要性。数值越高，该因素的权重越大，符合该因素的笔记在搜索结果中排名就越靠前。这些通常是滑块控件。

1. **File name & declared aliases (default: 10)**
    
    - **中文解释：** 文件名和声明的别名 (默认值: 10)
    - **滑块：** 控制权重大小。
    - **说明：** 如果搜索关键词出现在笔记的文件名中，或者出现在笔记 frontmatter 中定义的别名 (aliases) 中，这个笔记的相关性得分会根据此处的权重增加。默认权重是 10，是一个相对较高的值，表明文件名和别名匹配非常重要。
2. **File directory (default: 7)**
    
    - **中文解释：** 文件目录 (默认值: 7)
    - **滑块：** 控制权重大小。
    - **说明：** 如果搜索关键词出现在笔记所在文件夹的路径（目录名）中，这个笔记的相关性得分会根据此处的权重增加。默认权重是 7。
3. **Headings level 1 (default: 6)**
    
    - **中文解释：** 一级标题 (默认值: 6)
    - **滑块：** 控制权重大小。
    - **说明：** 如果搜索关键词出现在笔记的一级标题中 (例如 `# 标题`)，这个笔记的相关性得分会根据此处的权重增加。默认权重是 6。
4. **Headings level 2 (default: 5)**
    
    - **中文解释：** 二级标题 (默认值: 5)
    - **滑块：** 控制权重大小。
    - **说明：** 如果搜索关键词出现在笔记的二级标题中 (例如 `## 标题`)，这个笔记的相关性得分会根据此处的权重增加。默认权重是 5。
5. **Headings level 3 (default: 4)**
    
    - **中文解释：** 三级标题 (默认值: 4)
    - **滑块：** 控制权重大小。
    - **说明：** 如果搜索关键词出现在笔记的三级标题中 (例如 `### 标题`)，这个笔记的相关性得分会根据此处的权重增加。默认权重是 4。
        - 通常标题级别越低（数字越大），其默认权重也略低，表示在更高层级标题中找到关键词更为重要。
6. **Tags (default: 2)**
    
    - **中文解释：** 标签 (默认值: 2)
    - **滑块：** 控制权重大小。
    - **说明：** 如果搜索关键词匹配到笔记中的标签 (例如 `#mytag`)，这个笔记的相关性得分会根据此处的权重增加。默认权重是 2。

**Header properties fields (头部属性字段)**

- **中文解释：** 头部属性字段
- **说明文字：** `You can set custom weights for values of header properties (e.g. "keywords"). Weights under 1.0 will downrank the results.` （您可以为头部属性（例如 "keywords"）的值设置自定义权重。低于 1.0 的权重将降低结果排名。）
- **按钮：** `Add a new property` (添加一个新属性)
    - **说明：** Obsidian 笔记的 frontmatter (头部元数据) 中可以包含用户自定义的属性（例如 `keywords: ["obsidian", "plugin"]` 或 `author: "John Doe"`）。
    - 这个设置允许您为特定的 frontmatter 属性中的文本匹配设置自定义的权重。例如，您可以指定如果搜索词匹配了 `keywords` 属性的值，那么给这个匹配一个特定的权重分数。
    - 点击 "Add a new property" 按钮，您通常可以输入属性的名称（key）并为其设定一个权重值。
    - 如果设置的权重低于 1.0，则意味着如果匹配发生在该属性中，反而会轻微降低该结果的排名（相较于不设置或设置大于等于1的权重）。

![[Pasted image 20250602104204.png]]

**API Access Through HTTP (通过 HTTP 访问 API)**

- **Omnisearch can be used through a simple HTTP server (more information).**
    - **中文解释：** Omnisearch 可以通过一个简单的 HTTP 服务器来使用 (更多信息)。
    - **说明：** 这是一个信息提示，说明 Omnisearch 提供了通过 HTTP API 从 Obsidian 外部访问其搜索功能的能力。点击 "(more information)" 链接通常会引导您到插件的文档，以获取关于如何使用这个 API 的详细说明（例如 API 端点、请求格式等）。

1. **Enable the HTTP server**
    
    - **中文解释：** 启用 HTTP 服务器
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** 启用此选项后，Omnisearch 会在您的计算机上启动一个本地的 HTTP 服务器。其他应用程序或脚本就可以通过网络请求（发送到指定的端口）来调用 Omnisearch 的搜索功能，并获取结果。这对于与其他工具集成或自动化某些工作流程非常有用。
2. **HTTP Port**
    
    - **中文解释：** HTTP 端口
    - **输入框：** 右侧有一个输入框，当前显示 "51361"。
    - **说明：** 如果您启用了 HTTP 服务器，这里设置的是服务器监听的网络端口号。其他程序需要通过 `http://localhost:端口号` (例如 `http://localhost:51361`) 来访问 API。您可以根据需要更改此端口号，以避免与其他正在运行的服务冲突。
3. **Show a notification when the server starts**
    
    - **中文解释：** 服务器启动时显示通知
    - **设置开关：** 右侧有一个开关，当前处于开启状态。
    - **说明：** 如果启用了 HTTP 服务器，并且此选项也处于开启状态，那么每次 Obsidian 启动并成功启动 Omnisearch 的 HTTP 服务器时，您会收到一个通知。这可以帮助您确认服务器是否正常运行。

**Debugging (调试)**

1. **Enable verbose logging**
    - **中文解释：** 启用详细日志记录
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Adds a LOT of logs for debugging purposes. Don't forget to disable it.` （为调试目的添加大量日志。不要忘记禁用它。）
        - 启用此选项后，Omnisearch 会在 Obsidian 的开发者控制台输出非常详细的运行日志。这对于插件开发者进行故障排查，或者在遇到问题时帮助定位原因非常有用。
        - **警告：** 因为会产生大量日志，这可能会稍微影响性能，并且使得控制台信息非常杂乱。因此，建议仅在需要调试时开启，问题解决后及时关闭。

**Danger Zone (危险区域)**

这部分包含一些可能会对插件行为或数据产生较大影响的选项，操作前请务必理解其含义。

1. **Ignore diacritics**
    
    - **中文解释：** 忽略变音符号
    - **设置开关：** 右侧有一个开关，当前处于开启状态。
    - **说明：** `Normalize diacritics in search terms. Words like "brûlée" or "žluťoučký" will be indexed as "brulee" and "zlutoucky".` （在搜索词中规范化变音符号。像 "brûlée" 或 "žluťoučký" 这样的词将被索引为 "brulee" 和 "zlutoucky"。） `You probably should NOT disable this.` （您可能不应该禁用此选项。） `Changing this setting will clear the cache.` （更改此设置将清除缓存。） `Needs a restart to fully take effect.` （需要重启才能完全生效。）
        - 变音符号是指字母上下的附加符号，如法语的 `é`, `â`，德语的 `ü` 等。
        - **启用时 (当前状态)：** Omnisearch 会将带有变音符号的字符处理为其基本形式进行索引和搜索。例如，搜索 "brulee" 也能找到包含 "brûlée" 的笔记。这通常是推荐的行为，因为它使得搜索对用户更友好，不必精确输入变音符号。
        - **禁用时：** 搜索时必须精确匹配变音符号。例如，搜索 "brulee" 可能找不到 "brûlée"。
        - **警告：** 开发者建议不要禁用此选项。更改此设置会清除缓存并需要重启 Obsidian。
2. **Ignore Arabic diacritics (beta)**
    
    - **中文解释：** 忽略阿拉伯语变音符号 (测试版)
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** 这是一个针对阿拉伯语的特定设置，用于在索引和搜索时忽略阿拉伯文中的变音符号（Tashkeel/Harakat）。这是一个测试版 (beta) 功能，可能仍在开发和完善中。启用后，搜索阿拉伯文时可能不需要精确输入所有变音符号。
3. **Disable on this device**
    
    - **中文解释：** 在此设备上禁用
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Disable Omnisearch on this device only.` （仅在此设备上禁用 Omnisearch。） `Needs a restart to fully take effect.` （需要重启才能完全生效。）
        - 如果您的 Obsidian 配置在多台设备间同步，而您只想在当前这台设备上临时或永久禁用 Omnisearch 插件（例如，为了测试或其他插件的兼容性），可以启用此选项。它不会影响其他设备上 Omnisearch 的运行状态。
        - 禁用后，Omnisearch 的所有功能在这台设备上将停止工作，直到您再次取消勾选此选项并重启 Obsidian。
4. **Force save the cache**
    
    - **中文解释：** 强制保存缓存
    - **设置开关：** 右侧有一个开关，当前处于关闭状态。
    - **说明：** `Omnisearch has a security feature that automatically disables cache writing if it cannot fully perform the operation. Use this option to force the cache to be saved, even if it causes a crash.` （Omnisearch 有一个安全功能，如果无法完全执行操作，它会自动禁用缓存写入。使用此选项可以强制保存缓存，即使它会导致崩溃。） `Enabling this setting could lead to crash loops.` （启用此设置可能导致崩溃循环。）
        - 前面提到，如果 Omnisearch 在写入缓存时遇到问题（可能导致 Obsidian 崩溃），它会自动禁用缓存功能以保证稳定性。
        - **启用此选项 (非常不推荐常规使用)：** 会覆盖这个安全机制，强制 Omnisearch 尝试保存缓存，即使检测到潜在问题。
        - **严重警告：** 开发者明确指出，启用此设置可能导致 Obsidian 进入“崩溃循环”（即启动后因写入缓存失败而崩溃，重启后再次尝试并再次崩溃）。这通常只应该在开发者指导下或极特殊情况下尝试。
5. **Clear cache data**
    
    - **中文解释：** 清除缓存数据
    - **按钮：** 右侧有一个 "Clear cache" (清除缓存) 按钮。
    - **说明：** `Erase all Omnisearch cache data. Use this if Omnisearch results are inconsistent, missing, or appear outdated.` （擦除所有 Omnisearch 缓存数据。如果 Omnisearch 结果不一致、丢失或看起来已过时，请使用此选项。） `Needs a restart to fully take effect.` （需要重启才能完全生效。）
        - 点击此按钮会删除 Omnisearch 之前保存的所有索引缓存文件。
        - 如果您发现搜索结果不准确、缺失了应有的笔记，或者显示的是旧内容，清除缓存然后重启 Obsidian，让 Omnisearch 重新完整地建立索引，通常可以解决这些问题。
        - 这是一个常用的故障排除步骤。
