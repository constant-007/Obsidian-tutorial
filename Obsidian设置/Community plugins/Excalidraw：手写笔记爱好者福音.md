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

在这些设置项下方，通常还会有一个视频教程的嵌入，比如图片中显示的 "Mastering Excalidraw Te..."，这可以帮助用户更好地理解和使用插件的某些高级功能，比如模板。

理解并正确配置这些选项，可以让你更高效地在 Obsidian 中使用 Excalidraw 进行可视化创作。