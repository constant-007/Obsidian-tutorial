这插件我还没用起来，就不做介绍了。

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


![[Pasted image 20250601162120.png]]

**Date & Time (日期与时间)**

---

1. **Move dates to card footer (将日期移动到卡片页脚)**
    
    - **描述：** When toggled, dates will be displayed in the card's footer instead of the card's body.
    - **中文解释：** 当启用此选项（开关打开）时，卡片上的日期信息将显示在卡片的页脚区域，而不是在卡片的主要内容区域（正文）。这有助于保持卡片正文的整洁，并将日期这类元数据信息统一放置。
    - **图片状态：** 未启用 (灰色开关)，所以日期默认会显示在卡片正文中或根据其在文本中的位置显示。
2. **Date trigger (日期触发符)**
    
    - **描述：** When this is typed, it will trigger the date selector.
    - **中文解释：** 当你在卡片中输入这里设置的字符（或字符串）时，会自动触发日期选择器，方便你快速插入日期。
    - **图片状态：** `@` (默认情况下，输入 `@` 会弹出日期选择器)。
3. **Time trigger (时间触发符)**
    
    - **描述：** When this is typed, it will trigger the time selector.
    - **中文解释：** 当你在卡片中输入这里设置的字符（或字符串）时，会自动触发时间选择器，方便你快速插入时间。
    - **图片状态：** `@@` (默认情况下，输入 `@@` 会弹出时间选择器)。
4. **Date format (日期格式)**
    
    - **描述：** This format will be used when saving dates in markdown. For more syntax, refer to format reference. Your current syntax looks like this: 2025-06-01
    - **中文解释：** 此设置定义了在 Markdown 文件中保存日期时所使用的格式。图片中显示的当前格式为 `YYYY-MM-DD`（年-月-日），例如 `2025-06-01`。你可以参考插件或 Moment.js/Luxon 等库的格式参考来了解更多语法选项。
    - **图片状态：** `YYYY-MM-DD`。
5. **Time format (时间格式)**
    
    - **描述：** For more syntax, refer to format reference. Your current syntax looks like this: 16:20
    - **中文解释：** 此设置定义了在 Markdown 文件中保存时间时所使用的格式。图片中显示的当前格式为 `HH:mm`（24小时制的小时:分钟），例如 `16:20`。
    - **图片状态：** `HH:mm`。
6. **Date display format (日期显示格式)**
    
    - **描述：** This format will be used when displaying dates in Kanban cards. For more syntax, refer to format reference. Your current syntax looks like this: 2025-06-01
    - **中文解释：** 此设置定义了日期在看板卡片上实际显示出来的格式。这可能与存储在 Markdown 文件中的格式不同，允许你以更易读或更简洁的方式展示日期。图片中显示的当前显示格式也为 `YYYY-MM-DD`。
    - **图片状态：** `YYYY-MM-DD`。
7. **Show relative date (显示相对日期)**
    
    - **描述：** When toggled, cards will display the distance between today and the card's date. e.g. 'In 3 days', 'A month ago'. Relative dates will not be shown for dates from the Tasks and Dataview plugins.
    - **中文解释：** 当启用此选项时，卡片上将显示日期相对于今天的距离，例如“3天后”、“一个月前”。但请注意，来自 Obsidian Tasks 插件或 Dataview 插件的日期将不会以相对日期的形式显示（它们会保持其原始格式）。
    - **图片状态：** 未启用 (灰色开关)。
8. **Link dates to daily notes (将日期链接到每日笔记)**
    
    - **描述：** When toggled, dates will link to daily notes. Eg. [2021-04-26]
    - **中文解释：** 当启用此选项时，如果你的 Obsidian 知识库中存在对应日期的每日笔记，那么看板卡片上的日期文本将自动链接到该每日笔记。例如，卡片上的日期 `2021-04-26` 会变成一个指向 `2021-04-26.md` 每日笔记的链接。
    - **图片状态：** 未启用 (灰色开关)。
9. **Display date colors (显示日期颜色)**
    
    - **描述：** Set colors for dates displayed in cards based on the rules below.
    - **中文解释：** 此功能允许你根据预设的规则为卡片上显示的日期设置不同的颜色。例如，你可以设置规则使得即将到期的日期显示为黄色，已过期的日期显示为红色等。通过下方的 "Add date color" 按钮来添加颜色规则。
    - **图片状态：** 当前没有预设的日期颜色规则。

![[Pasted image 20250601164326.png]]
1. **Add date and time to archived cards (将日期和时间添加到已归档卡片)**
    
    - **描述：** When toggled, the current date and time will be added to the card title when it is archived. Eg. - `[ ] 2021-05-14 10:00am My card title`
    - **中文解释：** 当启用此选项时，在卡片被归档的那一刻，当前的日期和时间会自动添加到该卡片的标题中。示例显示，它通常会加在标题的前面，并且可能包含一个任务完成的标记（如 `[ ]` 或 `[x]`，具体取决于卡片状态和插件实现）。
    - **图片状态：** 未启用 (灰色开关)。
2. **Add archive date/time after card title (在卡片标题后添加归档日期/时间)**
    
    - **描述：** When toggled, the archived date/time will be added after the card title, e.g. - `[ ] My card title 2021-05-14 10:00am`. By default, it is inserted before the title.
    - **中文解释：** 当启用此选项时，归档的日期和时间将被添加到卡片标题的 _后面_，而不是默认的前面。这只有在上面的“Add date and time to archived cards”启用时才有意义，或者如果插件逻辑允许独立控制位置。
    - **图片状态：** 未启用 (灰色开关)。
3. **Archive date/time separator (归档日期/时间分隔符)**
    
    - **描述：** This will be used to separate the archived date/time from the title.
    - **中文解释：** 在这里输入的字符（或字符串）将被用作归档日期/时间与原始卡片标题之间的分隔符。例如，如果你输入 `|`，那么归档后的标题可能看起来像 `2021-05-14 10:00am | My card title` (如果日期在前) 或 `My card title | 2021-05-14 10:00am` (如果日期在后)。
    - **图片状态：** 输入框为空，意味着可能使用默认的空格或其他预设分隔符。
4. **Archive date/time format (归档日期/时间格式)**
    
    - **描述：** For more syntax, refer to format reference. Your current syntax looks like this: 2025-06-01 16:43
    - **中文解释：** 此设置定义了添加到已归档卡片上的日期和时间的具体格式。图片中显示的当前格式为 `YYYY-MM-DD HH:mm`（年-月-日 时:分，24小时制），例如 `2025-06-01 16:43`。
    - **图片状态：** `YYYY-MM-DD HH:mm`。
5. **Calendar: first day of week (日历：每周的第一天)**
    
    - **描述：** Override which day is used as the start of the week.
    - **中文解释：** 此设置允许你覆盖插件中日历视图或日期选择器默认的“每周第一天”。例如，你可以将每周的第一天设置为周一而不是周日（或反之），以符合你个人的习惯或地区设置。
    - **图片状态：** `default` (使用插件或系统的默认设置)。你可以点击下拉菜单选择其他选项，如 "Sunday" 或 "Monday"。

![[Pasted image 20250601164802.png]]

**Inline Metadata (内联元数据)**

---

1. **Inline metadata position (内联元数据位置)**
    
    - **描述：** Controls where the inline metadata (from the Dataview plugin) will be displayed.
    - **中文解释：** 此设置控制来自 [[Dataview插件综述|Dataview]] 插件的内联元数据显示在卡片上的哪个位置。例如，你可以选择将其显示在卡片正文、页脚或其他指定区域。
    - **图片状态：** `Card body` (内联元数据将显示在卡片正文中)。
2. **Move task data to card footer (将任务数据移动到卡片页脚)**
    
    - **描述：** When toggled, task data (from the Tasks plugin) will be displayed in the card's footer instead of the card's body.
    - **中文解释：** 当启用此选项时，来自 [[Tasks|Tasks]] 插件的任务数据（例如截止日期、优先级等）将显示在卡片的页脚区域，而不是在卡片的主要内容区域（正文）。
    - **图片状态：** 未启用 (灰色开关)。

**Linked Page Metadata (链接页面元数据)**

---

- **描述：** Display metadata for the first note linked within a card. Specify which metadata keys to display below. An optional label can be provided, and labels can be hidden altogether.
- **中文解释：** 此功能允许你在看板的卡片上直接显示该卡片链接到的第一个笔记文件中的元数据（通常是 [[Core plugins#14. Properties view|YAML frontmatter]] 中的字段）。
    - 你可以在下方的 "Metadata key" 输入框中指定要显示的元数据字段的键名（例如 `status`, `project`, `due_date` 等），然后点击 "Add key" 添加。
    - 你可以为显示的元数据提供一个可选的标签（别名），也可以选择完全隐藏标签，只显示元数据的值。
- **图片状态：** 当前没有添加任何元数据键。

**Board Header Buttons (看板头部按钮)**

---

这一部分控制看板视图顶部标题栏中显示哪些快捷操作按钮。

1. **Add a list (添加列表)**
    
    - **描述：** （隐式）控制是否显示用于在看板上添加新列表（泳道）的按钮。
    - **图片状态：** 已启用 (绿色开关)，表示会显示“添加列表”按钮。
2. **Archive completed cards (归档已完成卡片)**
    
    - **描述：** （隐式）控制是否显示用于一键归档看板中所有已完成卡片的按钮。
    - **图片状态：** 已启用 (绿色开关)，表示会显示“归档已完成卡片”按钮。
3. **Open as markdown (以 Markdown 形式打开)**
    
    - **描述：** （隐式）控制是否显示用于直接打开当前看板的原始 Markdown 文件的按钮。
    - **图片状态：** 已启用 (绿色开关)，表示会显示“以 Markdown 形式打开”按钮。
4. **Open board settings (打开看板设置)**
    
    - **描述：** （隐式）控制是否显示用于打开当前特定看板的设置界面的按钮（这会覆盖插件的全局默认设置）。
    - **图片状态：** 已启用 (绿色开关)，表示会显示“打开看板设置”按钮。
5. **Search... (搜索...)**
    
    - **描述：** （隐式）控制是否显示用于在当前看板内搜索卡片的按钮。
    - **图片状态：** 已启用 (绿色开关)，表示会显示“搜索”按钮。
6. **Board view (看板视图)**
    
    - **描述：** （隐式）控制是否显示与看板视图相关的按钮。这可能是一个刷新视图的按钮，或者如果插件支持多种看板视图模式，则用于切换视图模式。
    - **图片状态：** 已启用 (绿色开关)。

通过这些设置，你可以精细地控制看板卡片上显示哪些元数据信息，以及看板顶部的常用操作按钮，从而使看板界面更符合你的工作流程和信息展示需求。
