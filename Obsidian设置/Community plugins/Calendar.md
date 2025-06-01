这插件对标Notion的日历视图：

![](https://img.aiexplorernote.com/obsidian-plugin/notion-calendar-view.jpg)

安装后，边栏会出现一个日历图标，点击便会在边栏显示日历视图

![](https://img.aiexplorernote.com/obsidian-plugin/calendat-view-in-obsdian-sidebar.jpg)

点击日历视图上的日期会跳转到以当天日期命名的笔记，如果不存在该笔记，会询问是否要创建。这种日历视图可以一眼看出哪些天有记录，哪些是空白的，便于导航

如果当天笔记有记录，日历视图中会在日期下面显示“·”：

![](https://img.aiexplorernote.com/obsidian-plugin/dot-in-calendat-view.jpg)

“·”点的数量由笔记中字数决定，可以在设置中控制：

![](https://img.aiexplorernote.com/obsidian-plugin/calendar-settings.jpg)

1. **Words per dot (每点代表的字数)**
    
    - **描述：** How many words should be represented by a single dot? (多少字由一个小点代表？)
    - **当前值：** 250
    - **解释：** 它用于在日历视图中，通过日期下方的小点来大致表示当天日记（Daily Note）的字数多少。设置为 250 意味着每 250 个字会显示一个小点（或类似标记）。
2. **Start week on (周起始日)**
    
    - **描述：** Choose what day of the week to start. Select 'Locale default' to use the default specified by moment.js (选择一周从哪天开始。选择 'Locale default' 将使用 moment.js 指定的区域设置默认值)。
    - **当前值：** Locale default (Sunday) (区域设置默认 - 周日)
    - **解释：** 这个设置决定了日历视图中每周的第一天是星期几。
        - 你可以选择一个特定的日期，比如“Monday (星期一)”。
        - 选择 "Locale default" (区域设置默认) 意味着它会根据你的操作系统或 Obsidian 的区域语言设置来决定周的起始日。在很多地区（比如美国），周日是一周的开始，所以这里括号里提示了 "(Sunday)"。如果你的系统设置为中国，那么它可能会默认为周一。
3. **Confirm before creating new note (创建新笔记前确认)**
    
    - **描述：** Show a confirmation modal before creating a new note (在创建新笔记前显示一个确认弹窗)。
    - **当前状态：** 开关已打开 (绿色，表示启用)
    - **解释：** 当这个选项启用时，如果你在日历上点击一个没有对应日记的日期来创建新的日记时，系统会弹出一个确认对话框，询问你是否真的要创建。这可以防止意外点击导致创建不必要的空笔记。如果关闭此选项，点击就会直接创建日记。
4. **Show week number (显示周数)**
    
    - **描述：** Enable this to add a column with the week number (启用此项会在日历中添加一个显示周数的列)。
    - **当前状态：** 开关已关闭 (灰色，表示禁用)
    - **解释：** 如果启用这个选项，日历视图通常会在每一行的左侧（或右侧，取决于具体实现）显示一个额外的列，标明当前是本年度的第几周（例如，W22 代表第 22 周）。这对于习惯用周数来规划和追踪事务的用户非常有用。

**Advanced Settings (高级设置)**

1. **Override locale (覆盖区域设置)**
    - **描述：** Set this if you want to use a locale different from the default (如果你想使用与默认设置不同的区域设置，请设置此项)。
    - **当前值：** Same as system (en-us) (与系统相同 - 美国英语)
    - **解释：** “Locale” (区域设置) 通常决定了日期、时间、数字等的显示格式，以及像“周起始日”这样的默认行为。
        - 默认情况下，插件会尝试使用你的操作系统或 Obsidian 的整体区域设置（如此处显示的 "en-us" 代表美国英语）。
        - 如果你希望 Calendar 插件使用与其他程序或系统不同的日期时间格式或周起始规则（比如，你的系统是英文，但你希望日历按照中文习惯显示周一为起始日并且日期格式也本地化），你可以在这里选择一个特定的区域设置来覆盖默认值。

