这插件给我一种Obsidian中的Obsidian的感觉，教程看起来非常复杂，等我用一段时间再来更新吧。基础功能上手应该不难，能够在笔记软件里面使用是真方便

## 设置项介绍

![[Pasted image 20250604195438.png]]

**常规设置**

- **Display Release Notes after update (更新后显示发行说明)**
    
    - **开关状态：** 开启 (ON)
    - **作用：** 当 Excalidraw 插件更新到新版本后，会自动显示该版本的更新日志和发行说明。你可以关闭这个选项，如果不想每次都看到，仍然可以通过 GitHub 查看更新日志。
- **Plugin update notification (插件更新通知)**
    
    - **开关状态：** 开启 (ON)
    - **作用：** 当有新版本的插件可用时，会显示一个通知。你需要检查社区插件列表以进行更新。如果关闭，则不会有主动通知。

**文件与文件夹设置 (大小写敏感)**

这些设置项都提示了 "CASE SenSitive!"，意味着在指定文件夹或文件名时，大小写会被区分对待。

- **Excalidraw folder (Excalidraw 文件夹)**
    
    - **当前值：** `Excalidraw` (这是占位符或默认值)
    - **作用：** 为新创建的 Excalidraw 绘图指定默认的保存位置。如果留空，绘图将默认创建在 Vault 的根目录。
- **Use Excalidraw folder when embedding a drawing into the active document (将绘图嵌入活动文档时使用 Excalidraw 文件夹)**
    
    - **开关状态：** 关闭 (OFF)
    - **作用：** 这个选项决定了当你使用命令面板的 "创建新绘图并嵌入到活动文档" 功能时，新绘图文件的存放位置。
        - **Toggle ON (开启时):** 新的嵌入式绘图将保存在上面设置的 "Excalidraw folder" 中。
        - **Toggle OFF (关闭时):** 新的嵌入式绘图将使用 Obsidian 设置中定义的附件文件夹 (Attachments folder) 作为保存位置。
- **Crop file folder (裁剪文件文件夹)**
    
    - **当前值：** `e.g.: Excalidraw/Cropped` (这是示例占位符)
    - **作用：** 指定通过 Excalidraw 裁剪图片后，生成的新绘图文件的默认保存位置。如果留空，则会遵循 Vault 的附件设置。
- **Image annotation file folder (图片注释文件文件夹)**
    
    - **当前值：** `e.g.: Excalidraw/Annotatio` (这是示例占位符，似乎少了个 'n')
    - **作用：** 指定通过 Excalidraw 注释图片后，生成的新绘图文件的默认保存位置。如果留空，则会遵循 Vault 的附件设置。

**模板与自动化设置 (大小写敏感)**

- **Excalidraw template file or folder (Excalidraw 模板文件或文件夹)**
    
    - **当前值：** `Excalidraw/Template.excal` (这是占位符或默认值)
    - **作用：** 指定用于创建新 Excalidraw 绘图的模板。
        - **模板文件 (Template File)：** 如果你指定的是一个 `.md` 文件（例如 `Excalidraw/Template.excalidraw.md`）或者在兼容模式下的 `.excalidraw` 文件，那么新绘图将基于这个文件的内容创建。
        - **模板文件夹 (Template Folder)：** 如果你指定的是一个文件夹，那么在创建新绘图时，系统会提示你从该文件夹中选择一个模板。
        - **Pro Tip (专业提示)：** 如果你同时使用 Obsidian 的 Templater 插件，你可以用 Templater 代码来自动配置你的绘图。
- **Excalidraw Automate script folder (Excalidraw 自动化脚本文件夹)**
    
    - **当前值：** `Excalidraw/Scripts` (这是占位符或默认值)
    - **作用：** 指定存放 Excalidraw 自动化脚本的文件夹。放在这个文件夹里的脚本可以通过 Obsidian 的命令面板访问，并且可以为最常用的脚本分配快捷键，就像其他 Obsidian 命令一样。这些脚本可以用来执行更复杂或自动化的绘图操作。

![[Pasted image 20250604213507.png]]

**保存设置 (Saving Section)**

顶部的说明文字提到，在“保存”部分，你可以配置绘图的保存方式。这包括压缩 Excalidraw JSON 数据、为桌面和移动端设置自动保存间隔、定义文件名格式以及选择使用 `.excalidraw.md` 还是 `.md` 文件扩展名等选项。

---

- **Compress Excalidraw JSON in Markdown (在 Markdown 中压缩 Excalidraw JSON)**
    - **开关状态：** 开启 (ON)
    - **作用：** 启用此功能后，绘图数据（JSON 格式）将使用 LZ-String 算法进行 Base64 压缩后存储。
    - **优点：**
        - 可以减少 Excalidraw 的 JSON 数据干扰 Obsidian 搜索结果的可能性。
        - 可以减小 Excalidraw 文件的大小。
    - **行为：** 当你将 Excalidraw 视图切换到 Markdown 视图时，如果使用了 Excalidraw 中的选项菜单，文件会以未压缩的方式保存，以便你阅读和编辑 JSON 字符串。当你切换回 Excalidraw 视图时，文件会再次被压缩。
    - **影响范围：** 此设置只对之后的操作生效 (“point forward”)，即现有的绘图文件不会受此设置影响，除非你打开它们并重新保存。
    - **Toggle ON (开启时)：** 压缩绘图 JSON。
    - **Toggle OFF (关闭时)：** 保持绘图 JSON 不压缩。

---

- **Decompress Excalidraw JSON in Markdown View (在 Markdown 视图中解压缩 Excalidraw JSON)**
    - **开关状态：** 关闭 (OFF)
    - **作用：** 启用此功能后，当你切换到 Markdown 视图时，Excalidraw 的 JSON 数据会自动解压缩。这能让你更容易地阅读和编辑 JSON 字符串。当你切换回 Excalidraw 视图并保存 (Ctrl+S) 时，数据会再次被压缩。
    - **插件建议：** 插件开发者建议关闭此选项，因为关闭它可以使文件更小，并避免不必要的搜索结果出现在 Obsidian 的搜索中。你可以随时使用命令面板中的 "Excalidraw: Decompress current Excalidraw file" 命令来手动解压缩你需要阅读或编辑的 JSON 数据。

---

- **Interval for autosave on Desktop (桌面端自动保存间隔)**
    - **当前设置：** Moderate (every 60 seconds) - 中等 (每60秒)
    - **作用：** 设置在桌面版 Obsidian 上自动保存 Excalidraw 绘图的时间间隔。
    - **跳过保存的条件：** 如果绘图内容没有发生任何变化，则会跳过此次自动保存。
    - **触发保存的条件：**
        - 关闭工作区标签页时。
        - 在 Obsidian 内部导航，但离开了当前活动的 Excalidraw 标签页时 (例如点击 Obsidian 的功能区图标、检查反向链接等)。
    - **无法保存的条件：** 如果直接终止 Obsidian 进程或完全关闭 Obsidian 应用，Excalidraw 可能无法保存当前工作。

---

- **Interval for autosave on Mobile (移动端自动保存间隔)**
    - **当前设置：** Moderate (every 30 seconds) - 中等 (每30秒)
    - **作用：** 设置在移动版 Obsidian 上自动保存 Excalidraw 绘图的时间间隔。
    - **插件建议：** 建议在移动端使用更频繁的自动保存间隔。
    - **触发保存的条件：** 与桌面端类似，例如关闭工作区标签页或在 Obsidian 内导航离开当前 Excalidraw 标签页时。
    - **无法保存的条件：** 如果直接终止 Obsidian 应用 (例如从后台向上滑动关闭)，Excalidraw 可能无法保存当前工作。
    - **特别注意：** 有时移动操作系统 (Android 和 iOS) 为了节省系统资源，可能会在后台关闭 Obsidian 应用，这可能导致最新的更改无法保存。因此，在移动设备上更频繁的自动保存是有益的。

![[Pasted image 20250604214350.png]]

**文件名设置 (Filename Settings - 在“保存”标签下)**

该部分顶部提供了一个链接 “date and time format reference”，点击它可以查看日期和时间格式的详细参考，以便你自定义文件名中的日期时间部分。

紧接着展示了两个文件名示例：

- **新绘图的文件名示例：** `Drawing 2025-06-04 21.43.35.excalidraw.md`
- **新嵌入绘图的文件名示例：** `(NOTE NAME) 2025-06-04 21.43.35.excalidraw.md` (其中 `(NOTE NAME)` 代表当前活动笔记的名称)

---

- **Filename prefix (文件名前缀)**
    - **当前值：** `Drawing`
    - **作用：** 这是为独立创建的新 Excalidraw 绘图设置的文件名第一部分（即前缀）。

---

- **Filename prefix when embedding a new drawing into a markdown note (将新绘图嵌入 Markdown 笔记时的文件名前缀)**
    - **开关状态：** 开启 (ON)
    - **作用：** 此选项决定了当你使用命令面板操作“创建新绘图并嵌入到活动文档”时，新插入绘图的文件名是否应以当前活动 Markdown 笔记的名称开头。
        - **Toggle ON (开启时)：** 新绘图的文件名将以活动文档的文件名作为前缀。
        - **Toggle OFF (关闭时)：** 新绘图的文件名将不包含活动文档的文件名。

---

- **Custom text after markdown Note's name when embedding (嵌入时在 Markdown 笔记名称后的自定义文本)**
    - **当前值：** (空)
    - **作用：** 此设置仅在将绘图嵌入到 Markdown 文档时影响文件名。这里输入的文本将被插入到笔记名称之后，但在日期之前。例如，如果笔记名为 `MyNote`，自定义文本为 `_diagram`，日期为 `2025-06-04`，则文件名可能类似于 `MyNote_diagram 2025-06-04...`。

---

- **Filename Date (文件名日期)**
    - **当前值：** `YYYY-MM-DD HH.mm.ss`
    - **作用：** 这是文件名的最后一部分，用于添加日期和时间戳。你可以将其留空，如果你不希望文件名中包含日期。显示的格式 `YYYY-MM-DD HH.mm.ss` 表示年-月-日 时.分.秒。你可以使用顶部提供的日期时间格式参考链接中的代码来自定义此格式。

---

- **.excalidraw.md or .md (使用 .excalidraw.md 或 .md 后缀)**
    - **开关状态：** 开启 (ON)
    - **作用：** 决定 Excalidraw 文件的扩展名。
        - **Toggle ON (开启时)：** 文件名将以 `.excalidraw.md` 结尾。说明中提到，此设置不适用于以兼容模式使用 Excalidraw（即不使用 Excalidraw Markdown 文件）的情况。
        - **Toggle OFF (关闭时)：** 文件名将以 `.md` 结尾。

---

- **Crop file prefix (裁剪文件前缀)**
    - **当前值：** `cropped_`
    - **作用：** 为通过裁剪图片创建的新绘图设置文件名的第一部分（前缀）。如果留空，将使用默认的 `cropped_` 作为前缀。

---

- **Annotation file prefix (注释文件前缀)**
    - **当前值：** `annotated_`
    - **作用：** 为通过注释图片创建的新绘图设置文件名的第一部分（前缀）。如果留空，将使用默认的 `annotated_` 作为前缀。

---

- **Preserve image size when annotating (注释时保留图片尺寸)**
    - **开关状态：** 开启 (ON)
    - **作用：** 当你在 Markdown 中注释一个图片时（通常意味着用 Excalidraw 绘图替换原始图片链接），启用此选项后，替换后的 Excalidraw 嵌入链接将包含原始图片的宽度信息，以尝试保持视觉上的尺寸一致性。

