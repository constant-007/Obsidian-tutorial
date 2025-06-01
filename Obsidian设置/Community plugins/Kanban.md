
下面是kanban插件的设置项介绍

![[Pasted image 20250601160319.png]]

1. **Display card checkbox (显示卡片复选框)**
    
    - **描述：** When toggled, a checkbox will be displayed with each card.
    - **中文解释：** 当启用此选项（开关打开）时，每张卡片上都会显示一个复选框。这对于将卡片标记为“完成”或进行快速勾选非常有用。
    - **图片状态：** 已启用 (绿色开关)。
2. **New line trigger (新建行触发方式)**
    
    - **描述：** Select whether Enter or Shift + Enter creates a new line. The opposite of what you choose will create and complete editing of cards and lists.
    - **中文解释：** 这个设置决定了在编辑卡片或列表标题时，按 `Enter` 键是创建新的一行，还是像 `Shift + Enter` 那样创建新行。你选择的那个按键组合将用于换行，而另一个（没有选择的那个）则会用于创建并完成卡片或列表的编辑。
    - **图片状态：** `Shift + Enter` (即按下 `Shift + Enter` 会在卡片内换行，单独按 `Enter` 会完成编辑/创建新卡片)。
3. **Prepend / append new cards (新卡片添加位置)**
    
    - **描述：** This setting controls whether new cards are added to the beginning or end of the list.
    - **中文解释：** 此设置控制新创建的卡片是添加到列表的顶部（Prepend）还是底部（Append）。
    - **图片状态：** `Append` (新卡片会添加到列表的底部)。
4. **Hide card counts in list titles (在列表标题中隐藏卡片计数)**
    
    - **描述：** When toggled, card counts are hidden from the list title.
    - **中文解释：** 当启用此选项时，列表标题中将不再显示该列表包含的卡片数量。
    - **图片状态：** 未启用 (灰色开关)，所以默认会显示卡片数量。
5. **List width (列表宽度)**
    
    - **描述：** Enter a number to set the list width in pixels.
    - **中文解释：** 在这里输入一个数字来设置看板中每个列表的宽度，单位是像素。
    - **图片状态：** `272 (default)` (列表的默认宽度是 272 像素)。
6. **Expand lists to full width in list view (在列表视图中将列表扩展到完整宽度)**
    
    - **描述：** 启用后，如果看板的整体宽度大于所有列表宽度之和，列表会自动扩展以填满可用空间，而不是固定在其设定的宽度。)
    - **中文解释：** 当启用此选项时，如果看板的总宽度允许，各个列表会尝试扩展自身的宽度以填满整个看板的可用水平空间。如果未启用，列表将保持其设定的固定宽度（如上面的 `List width` 设置）。
    - **图片状态：** 未启用 (灰色开关)。
7. **Maximum number of archived cards (已归档卡片的最大数量)**
    
    - **描述：** Archived cards can be viewed in markdown mode. This setting will begin removing old cards once the limit is reached. Setting this value to -1 will allow a board's archive to grow infinitely.
    - **中文解释：** 归档的卡片可以在 Markdown 模式下查看。此设置会限定一个看板可以归档的卡片数量上限。一旦达到这个限制，最早归档的卡片将会被移除。如果将此值设置为 `-1`，则允许看板的归档无限增长。
    - **图片状态：** `-1 (default)` (默认情况下，归档的卡片数量没有限制)。
8. **Note template (笔记模板)**
    
    - **描述：** This template will be used when creating new notes from Kanban cards.
    - **中文解释：** 当你从看板的卡片创建新的笔记时，这里指定的模板将会被使用。这允许你为通过看板创建的笔记预设一个统一的格式或内容结构。
    - **图片状态：** `No template` (当前没有设置默认的笔记模板)。
9. **Note folder (笔记文件夹)**
    
    - **描述：** Notes created from Kanban cards will be placed in this folder. If blank, they will be placed in the default location for this vault.
    - **中文解释：** 从看板卡片创建的笔记将会被保存在这个指定的文件夹中。如果此项为空，那么这些笔记将被保存在当前 Obsidian 知识库的默认位置。
    - **图片状态：** `Default folder` (笔记将保存在知识库的默认文件夹中)。


![[Pasted image 20250601161725.png]]


**Tags (标签)**

---

1. **Move tags to card footer (将标签移动到卡片页脚)**
    
    - **描述：** When toggled, tags will be displayed in the card's footer instead of the card's body.
    - **中文解释：** 当启用此选项（开关打开）时，卡片上的标签将显示在卡片的页脚区域，而不是在卡片的主要内容区域（正文）。这有助于保持卡片正文的整洁，将元数据信息统一放置。
    - **图片状态：** 未启用 (灰色开关)，所以标签默认会显示在卡片正文中。
2. **Tag click action (标签点击行为)**
    
    - **描述：** This setting controls whether clicking the tags displayed below the card title opens the Obsidian search or the Kanban board search.
    - **中文解释：** 此设置控制当用户点击卡片上（通常在标题下方）显示的标签时所触发的动作。你可以选择是打开 Obsidian 的全局搜索来查找带有该标签的所有笔记，还是在当前的看板内进行搜索以筛选包含该标签的卡片。
    - **图片状态：** `Search Obsidian Vault` (点击标签会触发 Obsidian 的全局搜索)。另一个选项应该是类似于 "Search Kanban board" 之类的。
3. **Tag sort order (标签排序顺序)**
    
    - **描述：** Set an explicit sort order for the specified tags.
    - **中文解释：** 你可以在这里为特定的标签设置一个明确的显示顺序。如果你希望某些标签总是排在其他标签前面（或后面）显示在卡片上，可以在这里进行定义。通过下方的 `#tag` 输入框和 "Add tag" 按钮来添加并排序标签。
    - **图片状态：** 当前没有预设的标签排序规则。你可以输入一个标签（例如 `#important`）然后点击 "Add tag" 来开始定义顺序。
4. **Tag colors (标签颜色)**
    
    - **描述：** Set colors for tags displayed in cards.
    - **中文解释：** 此功能允许你为不同的标签设置不同的颜色。这样，在看板的卡片上，不同标签会以你设定的颜色显示，有助于通过颜色快速识别和区分不同类型的任务或项目。通过下方的 "Add tag color" 按钮来为标签指定颜色。
    - **图片状态：** 当前没有预设的标签颜色规则。点击 "Add tag color" 后，你通常需要输入标签名称并选择一个颜色。

这些关于标签的设置项可以帮助你更好地在看板中组织、可视化和交互你的标签，使任务管理更加高效和直观。