这插件对应Notion中的todo，用于创建待办事项

![[Pasted image 20250601191746.png]]

相比于Notion的todo，Obsidian中tasks插件创建的待办事项更加优秀。tasks插件最大的优势是支持查询、归类待办事项，让你更好地管理这些待办事项。主要通过给待办事项添加完成日期，优先级，标签等元标签给任务做标记。然后就可使用tasks插件自己的查询语法，或者[[Dataview插件综述|Dataview]]等插件查询、分类任务

如果不想写或者不会写查询，可以让AI帮你写

tasks插件的文档超多，官方文档地址：

```embed
title: "Introduction - Tasks User Guide - Obsidian Publish"
image: "https://publish-01.obsidian.md/access/40e62a316a834ff6f495ebf1d122cae6/images/acme.png"
description: "Introduction - Tasks User Guide - Powered by Obsidian Publish."
url: "https://publish.obsidian.md/tasks/Introduction"
aspectRatio: "45.579567779960705"
```

我已经在cursor中用Claude把这些文档全部翻译过来啦，不想看英文的小伙伴可以在Tasks文件夹下查看中文版本

下面是tasks插件的设置项介绍：

![[Pasted image 20250601200322.png]]

### 1. Task Format (任务格式)

- **显示内容：** "The format that Tasks uses to read and write tasks." (Tasks 读取和写入任务时使用的格式。)
    
    - **重要提示：** "Tasks currently only supports one format at a time. Selecting Dataview will currently **stop Tasks reading its own emoji signifiers**." (Tasks 目前一次只支持一种格式。选择 Dataview 格式当前会**阻止 Tasks 读取其自身的表情符号标识符**。)
    - **当前选项示例：** 下拉菜单中显示 "Tasks Emoji Format" (Tasks 表情符号格式)。
- 解释：
    
    这个设置决定了 Tasks 插件如何识别和处理你笔记中任务的特定属性（例如截止日期、优先级、完成日期、循环规则等）。它定义了插件用来解析这些信息的特定文本标记。
    
    - **Tasks Emoji Format (Tasks 表情符号格式)：** 这是 Tasks 插件的默认格式。它使用表情符号来标记任务的各种属性。例如：
        
        - 📅 (日历表情) 用于 **截止日期** (Due Date)
        - ✅ (勾选表情) 用于 **完成日期** (Done Date)
        - 🔁 (循环表情) 用于 **循环任务** (Recurring)
        - 🔼 (向上箭头) / 🔽 (向下箭头) 等用于 **优先级** (Priority)
        - ⏳ (沙漏表情) 用于 **计划日期** (Scheduled Date)
        - ➕ (加号表情) 用于 **创建日期** (Created Date)
    - **其他格式 (例如 Dataview 格式 - 根据提示推断)：** 虽然截图中未直接显示，但提示中提到了 "Selecting Dataview"。如果选择了这种格式，Tasks 插件可能会去识别 Dataview 插件风格的内联字段 (inline fields) 来定义任务属性，例如 `due:: YYYY-MM-DD` 或 `priority:: high`。
        
    - **核心要点：**
        
        - **一次只能激活一种格式。** 你不能同时让 Tasks 插件识别多种格式的元数据。
        - **更改格式的风险：** 如果你从 "Tasks Emoji Format" 切换到例如 "Dataview" 格式，Tasks 插件将**不再识别**之前用表情符号标记的任务属性。这意味着之前用表情符号添加的截止日期、优先级等信息，在 Tasks 插件的查询和处理中可能会失效，除非你手动将它们更新为新的格式。因此，在更改此设置时需要非常谨慎，并最好保持一致。

---

### 2. Global task filter (全局任务过滤器)

- **显示内容：**
    
    - **推荐：** "Leave empty if you want all checklist items in your vault to be tasks managed by this plugin." (如果你希望保险库中所有的清单项都被此插件作为任务管理，请将此项留空。)
    - "Use a global filter if you want Tasks to only act on a subset of your `- [ ]` checklist items, so that a checklist item must include the specified string in its description in order to be considered a task." (如果你希望 Tasks 只作用于你 `- [ ]` 清单项的子集，可以使用全局过滤器，这样清单项必须在其描述中包含指定的字符串才会被视为任务。)
    - **示例：** "For example, if you set the global filter to `#task`, the Tasks plugin will only handle checklist items tagged with `#task`. Other checklist items will remain normal checklist items and not appear in queries or get a done date set." (例如，如果你将全局过滤器设置为 `#task`，则 Tasks 插件将仅处理带有 `#task` 标签的清单项。其他清单项将保持为普通清单项，不会出现在查询中或设置完成日期。)
    - **输入框提示：** "e.g. #task or TODO" (例如 #task 或 TODO)
- 解释：
    
    这个设置允许你定义哪些标准的 Markdown 清单项 (- [ ] ...) 会被 Tasks 插件识别和处理为“任务”。
    
    - **留空 (默认推荐)：** 如果此设置为空，那么你笔记库中**所有**使用 `- [ ]` 语法的清单项都会被 Tasks 插件视为一个任务进行管理。
    - **设置过滤器字符串：** 如果你在这里输入一个特定的文本字符串（比如一个标签 `#projectX`，或者一个关键词如 `TODO`），那么**只有那些描述中包含了这个指定字符串的清单项才会被 Tasks 插件识别为任务**。
        - 例如，如果你设置为 `#mypersonal_task`，那么只有像 `- [ ] 阅读书籍 #mypersonal_task` 这样的清单项才会被 Tasks 管理。而 `- [ ] 买牛奶` 就不会被 Tasks 插件处理。
    - **作用：** 这个功能非常有用，特别是当你在笔记中除了正式的任务外，还使用清单项来做一些临时的核对、购物清单或其他非正式列表时。通过设置全局过滤器，你可以确保只有那些你明确标记为“任务”的项目才会进入 Tasks 插件的管理范围（例如参与查询、排序、设置截止日期等）。

---

### 3. Global Query (全局查询)

- **显示内容：**
    
    - "A query that is automatically included at the start of every Tasks block in the vault. Useful for adding default filters, or layout options." (一个会自动包含在保险库中每个 Tasks 代码块开头的查询。用于添加默认过滤器或布局选项。)
    - **示例：**
        
        ```
        # For example...
        path does not include _templates/
        limit 300
        show urgency
        ```
        
- 解释：
    
    这个设置允许你定义一段默认的 Tasks 查询语句，这段语句会自动应用到你笔记库中所有的 ```tasks ``` 查询代码块的开头。
    
    - **用途：** 它可以帮你省去在每个单独的 `tasks` 查询块中重复输入常用过滤条件或显示选项的麻烦。
    - **示例分析：**
        - `path does not include _templates/`：这是一个非常实用的默认过滤器，它可以阻止 Tasks 插件从名为 `_templates` 的文件夹（通常存放模板文件）中提取和显示任务。这样你的任务列表就不会被模板中的示例任务干扰。
        - `limit 300`：默认限制每个 `tasks` 代码块最多显示 300 个任务。
        - `show urgency`：默认在任务列表中显示“紧迫性”评分（Tasks 插件会根据优先级、截止日期等计算一个紧迫性分数）。
    - **如何工作：** 当你写一个 ` ```tasks ``` ` 查询块时，Tasks 插件会先加载全局查询中的这些指令，然后再加载你在具体代码块中写的指令。
    - **覆盖：** 你仍然可以在单个的 `tasks` 代码块中覆盖或添加与全局查询不同的指令。例如，即使全局查询设置了 `limit 300`，你也可以在某个特定的 `tasks` 块中写 `limit 10` 来只显示10个任务。


![[Pasted image 20250601200306.png]]


### Task Statuses (任务状态总览)

这个设置区域允许你定义和管理任务在其生命周期中可以拥有的不同状态。它不仅仅是简单的“待办”和“完成”，你可以根据自己的工作流创建更细致的状态，并通过特定的 Markdown 符号来表示它们。

---

### Core Statuses (核心状态)

- **描述文字：** "These are the core statuses that Tasks supports natively, with no need for custom CSS styling or theming."
    
    - **中文大意：** 这些是 Tasks 插件原生支持的核心状态，无需自定义 CSS 样式或主题即可使用。
- **默认的核心状态列表 (截图中可见)：**
    
    - `- [ ] => [x], name: 'Todo', type: 'TODO'.` (旁边有编辑图标 ✎)
    - `- [x] => [ ], name: 'Done', type: 'DONE'.` (旁边有编辑图标 ✎)
- **按钮：** "Review and check your Statuses" (审查并检查你的状态)
    
- **解释：**
    
    - **核心地位：** 这两个是 Tasks 插件最基础、开箱即用的状态。它们直接利用了 Markdown 标准的未完成 (`- [ ]`) 和已完成 (`- [x]`) 复选框语法。
    - **状态详解：**
        - **Todo (待办):**
            - **符号 (Symbol):** (空格，代表 `- [ ]`)
            - **下一个状态符号 (Next Status Symbol):** `x` (意味着当你点击一个 `- [ ]` 任务时，它会变成 `- [x]`)
            - **名称 (Name):** `'Todo'` (这是在插件某些用户界面，如状态选择下拉菜单中显示给你的名称)
            - **类型 (Type):** `'TODO'` (这是插件内部用来理解这个状态语义的分类。`TODO` 类型通常表示任务是开放的、未完成的。)
        - **Done (完成):**
            - **符号 (Symbol):** `x` (代表 `- [x]`)
            - **下一个状态符号 (Next Status Symbol):** (空格，意味着如果你再次点击一个已完成的 `- [x]` 任务，它会变回 `- [ ]`。这个循环行为可以让你轻松地撤销完成或重开任务。)
            - **名称 (Name):** `'Done'`
            - **类型 (Type):** `'DONE'` (表示任务已经完成。)
    - **可编辑性：** 旁边的编辑图标 (✎) 表明你可以对这些核心状态进行一定的修改。通常，你可能主要修改的是 `name` (显示名称)。`type` 对于核心状态一般建议保持默认，因为插件的很多内置逻辑 (如查询 `is not done`) 依赖于这些标准类型。修改符号可能会破坏与标准 Markdown 的兼容性，通常不建议修改核心状态的符号。
    - **"Review and check your Statuses" 按钮：** 点击此按钮通常会弹出一个窗口或导航到一个界面，让你预览所有已配置的状态（包括核心和自定义的），并可能提供一些验证信息，帮助你确认配置是否正确以及它们将如何被插件解析。

---

### Custom Statuses (自定义状态)

- **第一条指示：** "You should first **select and install a CSS Snippet or Theme** to style custom checkboxes."
    
    - **中文大意：** 你应该首先**选择并安装一个 CSS 代码片段或主题**来为自定义复选框设置样式。
- **第二条指示：** "Then, use the buttons below to set up your custom statuses, to match your chosen CSS checkboxes." (截图未显示下方的按钮，但暗示了会有用于添加/编辑自定义状态的按钮)
    
    - **中文大意：** 然后，使用下方的按钮来设置你的自定义状态，以匹配你选择的 CSS 复选框样式。
- **提示 (Note)：** "Any statuses with the same symbol as any earlier statuses will be ignored. You can confirm the actually loaded statuses by running the 'Create or edit task' command and looking at the Status drop-down."
    
    - **中文大意：** 任何与已有状态（无论是核心状态还是列表中较早定义的自定义状态）符号相同的状态将被忽略。你可以通过运行“创建或编辑任务”命令并查看状态下拉列表来确认实际加载的状态。
- **链接：** "See the documentation to get started!" (查看文档以开始！)
    
- **解释：**
    
    - **扩展任务流：** 这个部分允许你创建超出“待办”和“完成”范围的个性化任务状态，例如 "进行中" (In Progress), "已取消" (Cancelled), "已委派" (Delegated), "暂停" (On Hold) 等。
    - **CSS 样式的关键性：**
        - 自定义状态通常会使用不同于空格或 `x` 的字符作为其在 Markdown 中的符号，例如 `- [/]` 代表“进行中”，`- [-]` 代表“已取消”。
        - 然而，Obsidian 本身以及 Tasks 插件并**不负责这些特殊符号在视觉上如何显示**（例如，让 `/` 看起来像一个加载动画，或者让 `-` 看起来像一个删除线）。
        - 因此，**你必须先安装一个支持自定义任务状态样式的 Obsidian 主题，或者添加一个特定的 CSS 代码片段**。这些主题或 CSS 片段会定义这些特殊符号（如 `/`, `-`, `?`, `>` 等）在复选框 `-[ ]` 中应该呈现为什么样子。Tasks 插件只负责这些状态的逻辑行为。
    - **设置流程：**
        1. **获取 CSS 支持：** 找到并安装一个提供自定义任务状态视觉样式的主题或 CSS 代码片段。
        2. **在 Tasks 中配置：** 然后回到这个 "Custom Statuses" 设置区域，点击（截图中未显示的）“添加自定义状态”按钮。对于每个自定义状态，你通常需要定义：
            - **符号 (Symbol):** 在 `- [ ]` 中使用的单个字符，例如 `/`, `-`, `?`。
            - **名称 (Name):** 在UI中显示的状态名称，例如 "进行中", "已取消"。
            - **下一个状态符号 (Next Status Symbol):** 当你点击此状态的任务时，它应该转变到的下一个状态的符号。例如，"进行中" (`/`) 点击后可能变为 "完成" (`x`)。
            - **类型 (Type):** 类似于核心状态，你需要为自定义状态指定一个语义类型，例如 `IN_PROGRESS`, `CANCELLED`, `TODO` (是的，一个自定义状态如果表示任务仍未完成，其类型也可以是 `TODO`) 或 `DONE`。这会影响插件如何理解和查询这些任务。
    - **符号的唯一性：** 提示中强调，你定义的自定义状态的**符号必须是唯一的**。如果它与核心状态的符号（空格或 `x`）或其他已定义的自定义状态的符号重复，则该重复的自定义状态将被忽略。列表中的顺序也可能影响处理。
    - **确认状态：** 你可以通过 Tasks 插件的“创建或编辑任务”命令（通常从命令面板触发）来查看一个下拉列表，其中会显示所有被正确加载和识别的有效状态。这是一个检查你配置是否生效的好方法。
    - **查阅文档：** 强烈建议阅读 Tasks 插件的官方文档，以获取关于如何配置自定义状态、如何寻找或编写相应 CSS 的详细信息。


![[Pasted image 20250601200701.png]]



### Set created date on every added task (为每个添加的任务设置创建日期)

- **描述文字：** "Enabling this will add a timestamp ➕ YYYY-MM-DD before other date values, when a task is created with 'Create or edit task', or by completing a recurring task."
    
    - **中文大意：** 启用此选项后，当通过“创建或编辑任务”命令创建任务时，或通过完成一个循环任务生成新任务时，会自动在该任务的其他日期值之前添加一个创建日期时间戳 ➕ YYYY-MM-DD。
- **开关状态：** (根据通用UI，右侧的开关控制开启/关闭，截图中此项的开关状态未明确显示，但通常默认为关闭，除非用户开启)
    
- **解释：**
    
    - **开启时：** 如果你启用这个选项，每当你通过 Tasks 插件的“创建或编辑任务”命令（通常从命令面板调起）添加一个新任务，或者当一个循环任务完成并生成下一个周期的任务时，Tasks 插件会自动为这个新任务添加一个创建日期（格式为 ➕ YYYY-MM-DD，例如 `➕ 2025-06-01`）。这个创建日期通常会加在任务文本中其他日期（如截止日期）的前面。
    - **关闭时：** 默认情况下，除非你手动输入，否则任务不会自动带有创建日期。
    - **用途：** 帮助你追踪任务是何时被创建的，对于回顾和规划可能很有用。

---

### Set done date on every completed task (为每个完成的任务设置完成日期)

- **描述文字：** "Enabling this will add a timestamp ✅ YYYY-MM-DD at the end when a task is toggled to done."
    
    - **中文大意：** 启用此选项后，当一个任务被切换为完成状态时，会自动在其末尾添加一个完成日期时间戳 ✅ YYYY-MM-DD。
- **开关状态：** **开启** (绿色，滑块在右侧)
    
- **解释：**
    
    - **开启时：** 当你将一个任务标记为完成时（例如，通过点击复选框，或者使用命令将其状态更改为“Done”类型），Tasks 插件会自动在该任务的描述文本末尾追加一个完成日期（格式为 ✅ YYYY-MM-DD，例如 `✅ 2025-06-01`）。
    - **关闭时：** 任务完成时不会自动添加完成日期，除非你的任务状态定义中包含了自动添加完成日期的逻辑（这比较少见）。
    - **用途：** 自动记录任务的实际完成时间，便于追踪进度和进行复盘。这是 Tasks 插件一个非常常用且推荐开启的功能。

---

### Set cancelled date on every cancelled task (为每个取消的任务设置取消日期)

- **描述文字：** "Enabling this will add a timestamp ❌ YYYY-MM-DD at the end when a task is toggled to cancelled." (这里的 ❌ 表情符号可能代表用户自定义的“已取消”状态，或者仅仅是插件解释中用的一个通用符号)
    
    - **中文大意：** 启用此选项后，当一个任务被切换为取消状态时，会自动在其末尾添加一个取消日期时间戳 ❌ YYYY-MM-DD。
- **开关状态：** **开启** (绿色，滑块在右侧)
    
- **解释：**
    
    - **开启时：** 如果你使用了自定义的任务状态，并且其中有一个状态被定义为“取消”类型 (例如，你创建了一个状态 `- [~]`，类型为 `CANCELLED`)，那么当你将任务切换到这个“取消”状态时，Tasks 插件会自动在该任务末尾追加一个取消日期（格式通常是你为该状态定义的符号加上日期，例如 `~ 2025-06-01`，或者如此处描述的 ❌ YYYY-MM-DD）。
    - **关闭时：** 任务切换到取消状态时不会自动添加取消日期。
    - **前提：** 这个选项的实际效果依赖于你是否配置并使用了“已取消”类型的自定义任务状态。
    - **用途：** 记录任务是何时被取消的。

---

### Dates from file names (从文件名获取日期)

- **设置项：** Use filename as Scheduled date for undated tasks (为无日期的任务使用文件名作为计划日期)
    
    - **描述文字：** "Save time entering Scheduled (⏳) dates. If this option is enabled, any undated tasks will be given a default Scheduled date extracted from their file name. By default, Tasks plugin will match both YYYY-MM-DD and YYYYMMDD date formats. Undated tasks have none of Due (📅), Scheduled (⏳) and Start (🛫) dates."
        - **中文大意：** 节省输入计划日期 (⏳) 的时间。如果启用此选项，任何没有日期的任务将从其文件名中提取一个默认的计划日期。默认情况下，Tasks 插件会匹配 YYYY-MM-DD 和 YYYYMMDD 两种日期格式。无日期的任务是指那些没有截止日期 (📅)、计划日期 (⏳) 和开始日期 (🛫) 的任务。
    - **开关状态：** **关闭** (灰色，滑块在左侧)
- **解释：**
    
    - **开启时：** 如果一个任务本身没有任何明确的截止日期、计划日期或开始日期，并且它的文件名包含一个 Tasks 插件可以识别的日期格式（如 `2025-06-01 我的笔记.md` 或 `20250601 每日记录.md`），Tasks 插件会自动将这个从文件名中提取的日期作为该任务的**计划日期 (Scheduled date ⏳)**。
    - **关闭时：** Tasks 插件不会尝试从文件名中提取日期来为任务设置默认的计划日期。
    - **用途：** 对于习惯使用日期作为文件名一部分的用户（例如每日笔记），这个功能可以自动为当天笔记中创建的无特定日期的任务赋予一个计划日期，使得这些任务能出现在“今日计划”等类似的查询中。

---

### Recurring tasks (循环任务)

- **设置项：** Next recurrence appears on the line below (下一个循环任务出现在下方一行)
    
    - **描述文字：** "Enabling this will make the next recurrence of a task appear on the line below the completed task. Otherwise the next recurrence will appear before the completed one."
        - **中文大意：** 启用此选项将使任务的下一个循环实例出现在已完成任务的下一行。否则，下一个循环实例将出现在已完成任务的前面（通常是替换原来的任务行）。
    - **开关状态：** **开启** (绿色，滑块在右侧)
- **解释：**
    
    - **开启时：** 当你完成一个循环任务时，原始任务会被标记为完成，并且**新生成的下一个周期的任务会出现在原任务的紧接着的下一行**。这会保留已完成任务的记录。
    - **关闭时：** 当你完成一个循环任务时，新生成的下一个周期的任务通常会**替换掉原来的任务行**。这意味着原来的那条已完成的任务文本（连同其完成状态和日期）会被新的未完成任务所覆盖。
    - **用途：** 大多数用户更喜欢开启此选项，以便能看到已完成的循环任务历史。
- **设置项：** Remove scheduled date on recurrence (在循环时移除计划日期)
    
    - **描述文字：** "Enabling this will make the next recurrence of a task have no Scheduled (⏳) date, when at least one of Start (🛫) or Due (📅) dates is present. This is for when you want the Start and Due dates to carry forward to the next recurrence, but you will set the Scheduled date in future, once you plan to work on it."
        - **中文大意：** 当任务至少有一个开始日期 (🛫) 或截止日期 (📅) 时，启用此选项将使任务的下一个循环实例没有计划日期 (⏳)。这适用于你希望开始日期和截止日期延续到下一个循环，但计划日期将在你将来计划处理它时再设置的场景。
    - **开关状态：** **关闭** (灰色，滑块在左侧)
- **解释：**
    
    - **开启时：** 如果一个循环任务设置了开始日期 (🛫) 或截止日期 (📅)（或两者都有），那么当它生成下一个循环实例时，新的实例会继承这些开始/截止日期，但其**计划日期 (⏳) 会被移除 (置空)**。
    - **关闭时：** 新的循环实例通常会同时继承原任务的开始日期、截止日期以及计划日期（如果原任务有的话），并根据循环规则调整这些日期。
    - **用途：** 这个选项适用于一种特定的工作流：你为循环任务设定了固定的开始和截止周期（例如，每周一必须开始，周五必须完成），但你不想让它立即出现在“今日计划”中，而是希望在临近处理它的时候再手动为其添加计划日期。如果关闭，那么计划日期也会跟着循环，可能会导致未来的任务过早出现在计划列表中。


![[Pasted image 20250601201225.png]]

### Auto-suggest (自动建议)

这个部分包含了在你输入任务时，插件提供智能建议的相关设置。

- **设置项：Auto-suggest task content (自动建议任务内容)**
    
    - **描述文字：** "Enabling this will open an intelligent suggest menu while typing inside a recognized task line."
        
        - **中文大意：** 启用此选项后，当你在一个已被识别的任务行内输入时，会打开一个智能建议菜单。
    - **开关状态：** **开启** (绿色，滑块在右侧)
        
    - **解释：**
        
        - **开启时：** 当你在编辑一个任务行（即以 `- [ ]` 或类似状态符号开头的那一行）时，Tasks 插件会尝试提供一个上下文相关的建议菜单。这个菜单可以帮助你快速输入表情符号（用于日期、优先级等）、建议补全某些关键词（如循环规则 `every week`）或者快速访问某些操作。
        - **关闭时：** 在输入任务时不会出现这个自动建议的弹出菜单，你需要手动输入所有符号和文本。
        - **用途：** 极大地提高输入任务属性（如截止日期 📅, 优先级 🔼, 循环规则 🔁 等）的效率和准确性，因为你不需要记住所有特定的表情符号或关键词。
- **设置项：Minimum match length for auto-suggest (自动建议的最小匹配长度)**
    
    - **描述文字：** "If higher than 0, auto-suggest will be triggered only when the beginning of any supported keywords is recognized."
        
        - **中文大意：** 如果大于0，则只有当识别到任何受支持关键词的开头部分时，才会触发自动建议。
    - **控件：** 滑块 (Slider)
        
    - **解释：**
        
        - 这个设置控制自动建议菜单何时开始出现。滑块的值代表你需要输入的字符数，用以触发与某个已知关键词匹配的建议。
        - **例如：** 如果设置为 `1` 或 `2`，当你开始输入像 `due` (截止日期) 或 `rec` (recurring/循环) 这样的词的开头一两个字母时，建议菜单就可能出现。
        - **如果设置为 `0` (通常意味着即使不输入，在特定上下文也会触发，或者只要有任何输入就触发)：** 建议菜单可能会更频繁地出现。
        - **较高的值：** 意味着你需要输入更多字符才能看到建议，可以减少建议菜单的干扰，但可能降低发现建议的速度。
        - **较低的值（或0）：** 建议更主动，但有时可能会在你只想输入普通文本时弹出。
        - **用途：** 根据个人偏好调整自动建议的灵敏度。
- **设置项：Maximum number of auto-suggestions to show (显示的最大自动建议数量)**
    
    - **描述文字：** "How many suggestions should be shown when an auto-suggest menu pops up (including the "+ 📝" option)." (这里的 "+ 📝" 选项可能指的是快速添加/编辑任务的某个操作或打开编辑任务的模态框)
        
        - **中文大意：** 当自动建议菜单弹出时，应该显示多少条建议（包括 "+ 📝" 选项）。
    - **控件：** 滑块 (Slider)
        
    - **解释：**
        
        - 这个设置控制自动建议弹出菜单中最多显示多少个项目。
        - **较高的值：** 如果有很多可能的匹配项，你会看到一个更长的列表。
        - **较低的值：** 列表会更简洁，只显示最相关的几个建议。
        - **用途：** 控制建议菜单的大小，以便在提供足够选项和避免屏幕混乱之间取得平衡。

---

### Dialogs (对话框)

这个部分与 Tasks 插件使用的各种对话框（例如创建/编辑任务时弹出的模态框）的行为有关。

- **设置项：Provide access keys in dialogs (在对话框中提供访问键)**
    - **描述文字：** "If the access keys (keyboard shortcuts) for various controls in dialog boxes conflict with system keyboard shortcuts or assistive technology functionality that is important for you, you may want to deactivate them here."
        
        - **中文大意：** 如果对话框中各种控件的访问键（键盘快捷键）与对你很重要的系统键盘快捷键或辅助技术功能冲突，你可能希望在此处禁用它们。
    - **开关状态：** **开启** (绿色，滑块在右侧)
        
    - **解释：**
        
        - **访问键 (Access Keys)：** 是一些允许用户通过键盘快捷方式（通常是 `Alt` + 某个字母）直接激活对话框中特定按钮或输入框的功能。例如，一个“保存”按钮的访问键可能是 `Alt+S`。
        - **开启时：** Tasks 插件的对话框会尝试提供这些访问键，方便键盘操作。
        - **关闭时：** 禁用这些内置于 Tasks 对话框的访问键。
        - **用途与冲突：** 开启此功能可以提高键盘操作效率。但是，正如描述所说，在某些情况下，这些由插件定义的访问键可能会与操作系统级别的快捷键、其他应用程序的全局快捷键，或者屏幕阅读器等辅助技术使用的快捷键发生冲突。如果你发现使用 Tasks 对话框时，按下某些 `Alt` 组合键触发了非预期的行为，或者干扰了你的辅助工具，那么你就可以考虑关闭这个选项。


> [!faq] 我没看懂这个Access Key是什么
> 不过貌似也没啥影响，不用管感觉



