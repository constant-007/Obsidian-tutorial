Obsidian几乎完全免费，唯独同步与将笔记发布成网页需要付费，这是因为这两项功能都需要维护服务器与数据库，收费合情合理。那有没有办法实现免费同步呢？有，Git以及Remotely Save这类插件专门用与实现同步服务

个人更推荐使用Git，因为Remotely Save并不完全免费，而且对国内用户并不友好 #链接回来 
## Git插件介绍

首先，我们来了解下Git是什么以及Git插件的功能：

> [!faq]+ Git是什么 & Git插件的功能
> 
> Git 是一个分布式版本控制系统。简单来说，它被设计用来追踪文件（尤其是文本文件，如代码或 Markdown 笔记）的每一次修改历史。你可以：
> 
> * **提交 (Commit)**：将当前版本的文件状态保存为一个“快照”。
> * **查看历史 (History/Log)**：回顾之前的所有提交记录，了解文件是如何一步步变化的。
> * **版本回退 (Revert/Checkout)**：如果需要，可以恢复到之前的某个版本。
> * **分支 (Branch)**：创建不同的开发线路，进行实验性修改而不影响主线。
> * **合并 (Merge)**：将不同分支的修改合并到一起。
> * **远程仓库 (Remote Repository)**：可以将你的本地 Git 仓库与一个在线的代码托管平台（如 GitHub, GitLab, Gitea 等）连接，将你的提交推送到远程服务器进行备份或协作。
> 
> **Obsidian Git 插件的功能：**
> 
> "Obsidian Git" 插件将 Git 的这些核心功能直接集成到了 Obsidian 的用户界面中，让你无需离开 Obsidian 或频繁使用命令行就能管理你的笔记库版本。
> 
> **主要功能和特点：**
> 
> 1.  **自动备份和版本控制**：
>     * **定时提交 (Automatic Commit)**：插件可以设置一个时间间隔（例如每10分钟），自动将笔记库中所有已更改的文件执行 `git add .` 和 `git commit` 操作。这意味着你的笔记修改历史会被定期保存下来。
>     * **自动推送 (Automatic Push)**：在自动提交后，还可以选择自动将这些提交推送到你设置的远程 Git 仓库（如 GitHub 上的私有仓库）。
>     * **自动拉取 (Automatic Pull)**：可以在 Obsidian 启动时自动从远程仓库拉取最新的更改，确保你的本地库与远程保持同步，这对于多设备使用非常重要。
> 
> 2.  **手动 Git 操作**：
>     * **提交 (Commit)**：可以手动提交所有更改，并自定义提交信息 (commit message)。
>     * **推送 (Push)**：手动将本地的提交推送到远程仓库。
>     * **拉取 (Pull)**：手动从远程仓库拉取最新的更改到本地。
>     * **暂存 (Stage)**：提供类似 `git add <file>` 的功能，可以选择性地将某些更改的文件加入到下一次提交中。
>     * **撤销更改 (Discard Changes)**：可以丢弃某个文件自上次提交以来的所有未保存的修改。
> 
> 3.  **可视化界面**：
>     * **源码控制视图 (Source Control View)**：插件通常会提供一个专门的侧边栏面板，显示当前已更改、已暂存、未追踪的文件列表，类似于 VS Code 等代码编辑器中的 Git 面板。你可以在这个视图中方便地进行暂存、提交、查看差异等操作。
>     * **历史视图 (History View)**：可以查看整个库或单个文件的提交历史记录，点击某个提交可以看到该次提交具体修改了哪些文件以及文件的差异。
>     * **差异视图 (Diff View)**：可以清晰地看到文件在不同版本之间的具体内容差异（增加了哪些行，删除了哪些行，修改了哪些行）。
>     * **行作者信息 (Line Authoring / Git Blame)**：可以查看文件中每一行最后是由哪个提交修改的，以及修改者和时间等信息。
> 
> 4.  **冲突处理 (Conflict Resolution)**：
>     * 当从远程拉取更改，并且本地也有未同步的修改时，如果两者修改了同一文件的同一部分，就可能产生合并冲突。插件通常会标记出这些冲突文件，并可能提供一些基础的界面辅助你解决这些冲突（尽管有时复杂的冲突可能仍需要借助外部 Git 工具）。
> 
> 5.  **支持 Git 子模块 (Git Submodules)**：
>     * 如果你在你的笔记库中使用了 Git 子模块来管理某些部分的独立版本，插件通常也支持对子模块进行提交和同步。
> 
> 6.  **与 Obsidian 命令面板和快捷键集成**：
>     * 插件提供的所有主要 Git 操作（如提交、推送、拉取等）都可以通过 Obsidian 的命令面板调用，并且你可以为它们设置自定义的快捷键。
> 
> 7.  **`.gitignore` 文件编辑**：
>     * 允许你直接在 Obsidian 内部编辑 `.gitignore` 文件，用来指定哪些文件或文件夹不应被 Git追踪和提交（例如，Obsidian 的缓存文件、一些临时文件等）。
> 
> 
> 总而言之，"Obsidian Git" 插件对于那些熟悉 Git 或者愿意学习 Git 的用户来说，是一个非常强大和灵活的笔记备份、同步及版本管理解决方案。它为你提供了对笔记数据历史的完全控制

作为一个版本控制工具，它的主要功能是提供类似Obsidian自带的[[Core plugins#6. File recovery|File recovery]]那种文件快照功能。Git能将整个Obsidian Vault以快照形式保存，而且理论上可永久保存。像Notion这种商业软件，一般快照保存功能只能保存7天，更长时间要收费，但Git是免费的

这也是Git相对于其他同步插件的一大优势。如果使用Remotely Save提供的Google Drive，One Drive或者iCloud这种云服务进行同步，它们只会单纯同步本地文件与远程文件，不会保存仓库快照

当然，使用其他云服务的话，配合[[Core plugins#6. File recovery|File recovery]]插件的快照功能也能实现类似效果，但使用Git插件理论上可以完全舍弃File recovery 插件，精简一个插件也不错，还能节省空间

## 如何配置Git插件

1.  如果你没有安装Git，需要先去[Git官网](https://git-scm.com/downloads)下载
	
	![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/download-git.jpg)
	
2. 在Obsidian中安装Git插件
	
	- 到Obsidian设置页的第三方社区插件“Community plugins”部分
	- 关闭安全模式，点击浏览，在社区插件中搜索Git插件安装并启用
	
3. 将Obsidian库文件夹初始化为Git仓库，有两种方式实现
	
	最简单的方法是通过Git插件在Obsidian中的命令实现，这样可以不用接触命令行。按Ctrl + P打开[[Core plugins#4. Command palette|Command palette]]，输入“Git:init"，选择第一个选项按回车就行
	
	![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/initialize-obsdian-vault-as-git-repository.jpg)
	
	你也可以通过终端导航到Obsidian库文件夹，然后在终端执行下面这个命令：
	
	```
	git init
	```
	
	没有报错就行
	
4. 为实现同步，我们需要有一个远程Git仓库，这里选择GitHub作为仓库托管平台
	
	1. 在GitHub[创建一个新仓库](https://www.aiexplorernote.com/article/how-to-upload-pics-with-github-pages-picgo-obsidian#:~:text=%E9%A6%96%E5%85%88%EF%BC%8C%E6%88%91%E4%BB%AC%E6%96%B0%E5%BB%BA,%E7%84%B6%E5%90%8E%E2%80%9CCreate%20repository%22)，注意，创建时一定要选择私人仓库，否则你的笔记可以被别人在GitHub被别人查看
		   
		![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/create-git-repo-as-private-repo.jpg)
	2. 下面需要将本地仓库与这个新建的远程仓库相关联。同样有两种方法，通过git插件命令面板或者命令行实现
		1. 这是使用Git插件命令面板的方法：
			- 按Ctrl + P调出[[Core plugins#4. Command palette|Command palette]]，在其中输入“git:"
			- 在下方出现的命令列表中，选择"Git: Edit remotes"
			- 首先为你的远程仓库输入一个本地别名，比如"Obsidian"
			- 然后下一个输入框填写你GitHub仓库的URL，这样我们就设置好了远程仓库
			- 但现在还要指定本地分支跟踪的远程分支。继续打开Command palette，找到”Git: Set upstream branch"命令并运行
			- 它会让你选择远程仓库，选择我们刚才指定的本地别名为Obsidian的仓库
			- 接下来它会让你选需要跟踪的分支，以这样的格式写“远程仓库本地别名/远程仓库分支名（随意）"，比如我这里应该是”Obsidian/master"（远程仓库分支名随意。在我们指定远程仓库分支名后，如果没有该远程分支，Git会自动创建它会
		2. 接下来是通过命令行操作的方法
		- 在终端导航到Obsidian库文件夹
		- 执行第一个命令添加远程仓库:
		```
		   git remote add origin <你的仓库URL>
		```
		 - 将你的笔记文件添加到 Git 暂存区:
		```
		    git add .
		```
		- 创建一个初始提交：
		```
		   git commit -m "初始化"
		```
		-  为了统一，我们这里把本地分支名称强制命名为main:
		```
		   git branch -M main
		```
		-  将本地提交推送到远程仓库，并让git自动创建指定的远程分支:
		```
		   git push -u origin main
		```
		现在我们已成功使本地分支与远程仓库分支关联起来，Git插件能够正常实现拉取远程更新/推送本地更新到远程

如果你想直接用我的这个仓库，不想自己完全重新配置仓库，可以这样做：

1. 首先，在GitHub上克隆我的仓库到本地：
```
git clone https://github.com/cjjj9330/Obsidian-tutorial.git
```
2. 确保你已经按上面的步骤创建了一个私有git
3. 打开Obsidian，在Command palette中找到"Git: Remove remote“命令并运行
## Git插件后台设置详解

![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/screenshot-of-obsidan-git-settings.jpg)

### Split timers for automatic commit and sync

为自动提交和同步分别设置计时器。“提交"是指"git add" + ”git commit"操作，“同步"指”git pull" + "git push"（你可以在后面的设置中选择只进行单一操作或都不执行）。启用后，可以为提交使用一个时间间隔，为同步使用另一个时间间隔。建议不启用，因为启用容易导致冲突，特别是当你为git pull和git push 设置不同时间间隔时

### Auto commit-and-sync interval (minutes)

自动提交并同步的间隔 - 分钟。每多少分钟提交并同步更改。设为0（默认）则禁用。当上面的 "Split timers" 关闭时，这个设置定义了插件自动执行“提交所有更改到本地仓库，并且（如果配置了的话）将这些提交推送到远程仓库”这一系列操作的时间间隔

如果想实现像Notion那样的实时同步，可以将这一项设置为极小的值。但并不建议这样做，因为这样会使得Git 仓库多出极多无意义的提交信息，一方面会导致Git 历史难以管理，另一方面会无意义地加大仓库体积

这是两种方法架构不同导致的根本差异。Notion同步转为实时同步设计，而Git为版本控制而生，只是我们通过自动化提交/拉取实现伪同步，所以想通过Git追求极致同步体验就会影响版本控制以及增大仓库体积

不过如果我们只是个人使用，大部分情况下不用实时同步，所以我将时间间隔设置为20分钟，实际我感觉可以再长一点。实在要确保下次在另一台设备上使用时是最新的，可以直接手动同步一下

### Auto commit-and-sync after stopping file edits

停止文件编辑后自动提交并同步。要求上面“自动提交并同步的间隔”不为0。如果开启，则在停止文件编辑X分钟（你在Auto commit-and-sync interval中设置的值）后执行自动提交并同步。这主要用来防止在编辑文件时进行自动提交并同步

### Auto commit-and-sync after latest commit

在最后一次提交后自动提交并同步。如果开启，当你手动执行了一次提交后，插件会把这次手动提交的时间视为“最后一次同步时间”，然后从这个时间点开始重新计算下一次自动提交的间隔。这样可以避免在你刚刚手动提交完不久，自动提交又紧接着运行一次

### Auto push interval (minutes)

自动推送间隔 - 分钟。这个选项通常在上面的 "Split timers" 开启时才能用。 它定义了自动将本地已提交的更改推送到远程仓库的时间间隔。如果 "Split timers" 关闭，则推送行为包含在 "Auto commit-and-sync interval" 中

### Auto pull interval (minutes)

自动拉取间隔 - 分钟。每X分钟拉取更改。设为0（默认）则禁用。定义了自动从远程仓库拉取最新更改到本地仓库的时间间隔。因为我已经启用了Auto commit and sync，git pull操作包含在其中，所以我将这项设置为0，禁用

### Specify custom commit message on auto commit-and-sync

在自动提交并同步时指定自定义提交信息。如果开启，那么每次插件执行自动提交并同步操作之前，都会弹出一个对话框，让你输入本次提交的描述信息。如果关闭，自动提交会使用下面 "Commit message on auto commit-and-sync" 中设置的模板来自动生成提交信息

### Commit message on auto commit-and-sync

自动提交并同步时的提交信息。这里设置的是当插件执行自动提交操作时，默认使用的提交信息模板。你可以使用一些预设的占位符，插件在提交时会自动替换它们：

- `{{date}}`: 当前日期和时间 (格式由下面的 `{{date}} placeholder format` 设置)
- `{{hostname}}`: 当前电脑的主机名 (由下面的 `{{hostname}} placeholder replacement` 设置)
- `{{numFiles}}`: 本次提交中包含的已更改文件的数量
- `{{files}}`: 本次提交中已更改文件的列表（通常是文件名）

### Commit message on manual commit

手动提交时的提交信息。这里设置的是当你通过插件的命令执行手动提交操作时，预填充到提交信息输入框中的默认模板。你可以在这个预填充的模板基础上再进行修改

### `{{date}}` placeholder format

`{{date}}` 占位符格式。定义了上面提交信息模板中 `{{date}}` 占位符实际输出的日期和时间格式。它使用 [Moment.js](https://momentjs.com/) 的格式化标准

### `{{hostname}}` placeholder replacement

默认情况下，`{{hostname}}` 占位符会尝试获取你当前操作系统的真实主机名。如果你希望在提交信息中使用一个自定义的、更友好或更简洁的设备标识名称，而不是系统自动获取的主机名，可以在这里输入。例如，你可以为你的台式机输入 "Desktop-PC"，为你的笔记本输入 "MyLaptop"

### Preview commit message

预览提交信息。点击这个按钮，插件会根据你当前的提交信息模板设置和占位符，在右上方生成一个示例的提交信息给你看，让你检查格式和内容是否符合预期

### List filenames affected by commit in the commit body

在提交正文中列出受提交影响的文件名。启用后，当插件自动生成提交信息（或为你手动提交信息提供模板时）时，除了你设置的提交信息摘要（例如 `vault backup: {{date}}`），还会在提交信息的正文部分（更详细的描述区域）自动添加一个本次提交所影响（修改、添加、删除）的文件列表，方便以后回顾提交历史时快速了解该次提交具体动了哪些文件

![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/git-settings-in-obsdidian-2.jpg)

### Merge strategy

合并策略。这个设置定义了当你执行 `git pull` 操作（即从远程仓库拉取更新）时，Git 如何将远程分支上的新提交与你本地分支上的提交合并起来，有三个选项

- **Merge (合并)**：这是 `git pull` 的默认行为。它会尝试将远程分支的历史合并到本地分支，如果历史有分叉，会创建一个新的“合并提交” (merge commit) 来将两个分支的更改汇集起来。这种方式会保留分支的并行历史
-  **Rebase (变基)**：`git pull --rebase`。它会先将你本地尚未推送到远程的提交“暂存”起来，然后将远程分支的最新提交应用到你的本地分支，最后再把你本地的那些暂存的提交逐一重新应用到更新后的本地分支顶端。这样做可以使你的本地提交历史看起来更线性、更整洁，避免不必要的合并提交
- **Fast-forward only (仅快进)**：如果远程分支的历史是你本地分支历史的直接延续（即本地没有新的、与远程分叉的提交），那么 Git 会简单地将你的本地分支指针“快进”到远程分支的最新状态。如果不是直接延续（即有分叉），则 `pull` 操作会失败，提示你先解决分叉

这里是对Merge和Rebase的详细解释：

> [!faq]+ Merge和Rebase有什么区别？
> 
> 先来了解一下**分叉 (Diverged History) **是什么意思。
> 
> 当你的本地分支和它正在跟踪的远程分支都各自有了新的、对方没有的提交时，它们就分叉了。
> 
> 例如：
> 
> * 远程分支 `origin/main`: `A -- B -- C` (C是最新的)
> * 你本地的 `main` 分支，上次同步时也是在 `B`。之后你在本地做了一个新的提交 `D`：
>     `A -- B -- D` (D是你本地最新的)
> * 与此同时，别人（或者你在另一台设备上）向远程 `origin/main` 推送了一个新的提交 `E`，所以现在远程变成了：
>     `A -- B -- C -- E`
> 
> 现在，你的本地 `main` (`...B -- D`) 和远程 `origin/main` (`...B -- C -- E`) 就从共同的祖先 `B` 开始分叉了。
> 
> **在这种分叉的情况下，`git pull` (默认使用 merge 策略) 和 `git pull --rebase` 的行为：**
> 
> 1.  **使用 `Merge` (合并) 策略 (`git pull` 或 `git pull --no-rebase`)**：
>     * `git pull` 首先会执行 `git fetch`，将远程 `origin/main` 的最新历史 (`...C -- E`) 下载到你本地的 `origin/main` 引用。
>     * 然后，它会尝试将远程的 `origin/main` (即 `E` 这个提交) **合并 (merge)**到你当前的本地 `main` 分支 (即 `D` 这个提交)。
>     * **如果 D 和 (C 或 E) 修改了不同文件的不同部分，或者修改了同一文件的不同部分且 Git 能够自动合并**：
>         * Git 会成功创建一个新的**合并提交 (merge commit)**，例如 `M`。你的本地历史会变成：
>             ```
>                   A -- B -- D -- M
>                        \       /
>                         C -- E  (来自 origin/main)
>             ```
>         * 操作成功完成。
>     * **如果 D 和 C 或 E 修改了同一文件的同一部分，并且 Git 无法自动判断如何合并这些更改**：
>         * `git merge` 操作会**暂停**，并提示你发生了**合并冲突 (merge conflict)**。
>         * Git 会在冲突的文件中用特殊的标记（如 `<<<<<<<`, `=======`, `>>>>>>>`）标出冲突的部分。
>         * 你需要**手动编辑这些文件**，解决冲突（即决定保留哪些内容，或者如何将两边的更改结合起来）。
>         * 解决完所有冲突后，你需要执行 `git add <冲突文件>` 来标记冲突已解决，然后执行 `git commit` (通常不需要 `-m`，Git 会准备好一个默认的合并提交信息) 来完成这次合并。或者有时是 `git merge --continue`。
>         * 所以，它不是直接“失败”，而是“暂停等待你解决冲突”。如果你不解决冲突，合并就无法完成。
> 
> 2.  **使用 `Rebase` (变基) 策略 (`git pull --rebase`)**：
>     * `git pull --rebase` 同样会先执行 `git fetch`，获取远程 `origin/main` 的最新历史 (`...C -- E`)。
>     * 然后，它会尝试将你本地 `main` 分支上独有的提交 (在这个例子中是 `D`) “变基”到更新后的 `origin/main` 分支 (`...C -- E`) 的顶端。
>     * 具体过程是：
>         1.  Git 会先“撤销”你本地的提交 `D`，将你的 `main` 分支暂时回退到 `B`。
>         2.  然后将远程的提交 `C` 和 `E` 应用到你的 `main` 分支上，使得你的 `main` 分支现在是 `A -- B -- C -- E`。
>         3.  最后，Git 会尝试将你之前“撤销”的提交 `D` 重新应用到 `E` 的后面，形成一个新的提交 `D'` (内容与 `D` 相同，但由于基础变了，所以是一个新的提交对象，哈希值会不同)。
>     * **如果 D' 的更改与 (C 或 E) 的更改修改了不同文件的不同部分，或者修改了同一文件的不同部分且 Git 能够自动合并**：
>         * 变基成功，你的本地历史会变成线性的：`A -- B -- C -- E -- D'`。
>         * 操作成功完成。
>     * **如果 D' 的更改与 (C 或 E) 的更改修改了同一文件的同一部分，并且 Git 无法自动判断如何合并**：
>         * `git rebase` 操作会在应用 `D'` 的过程中**暂停**，并提示你发生了**合并冲突 (merge conflict)**。
>         * 同样，你需要手动编辑冲突文件，解决冲突。
>         * 解决完冲突后，你需要执行 `git add <冲突文件>`，然后运行 `git rebase --continue` 来让 Git 继续应用后续的本地提交（如果还有的话）。如果你想跳过当前这个冲突的提交，可以使用 `git rebase --skip`；如果想中止整个变基过程，可以使用 `git rebase --abort`。
>         * 所以，它也不是直接“失败”，而是“暂停等待你解决冲突”。
> 
> **总结：**
> 
> * 无论是 `merge` 还是 `rebase`，当本地和远程历史发生分叉，并且这些分叉的提交中**包含了对同一文件同一区域的修改**时，Git 都无法自动决定最终应该保留哪个版本，此时就会产生**合并冲突 (merge conflict)**。
> * 在这种情况下，`git pull` (或 `git pull --rebase`) 操作会**暂停**，并要求你**手动介入解决冲突**。
> * 只有当你解决了所有冲突并完成了合并或变基的后续步骤后，整个 `pull` 操作才算最终完成。
> * 如果分叉的提交修改的是**不同文件**，或者**同一文件的不同部分**，Git 通常能够成功地自动合并（对于 `merge` 策略会创建一个合并提交，对于 `rebase` 策略会逐个应用本地提交到新的基点上），这种情况下操作不会“失败”或暂停。
### Pull on startup

启用后，每次你打开 Obsidian 并加载这个库时，插件会自动执行一次 `git pull` 操作，从你配置的远程仓库拉取最新的更改

### Push on commit-and-sync

如果开启，"Commit-and-sync" 操作会包含 `push` (推送) 步骤。如果关闭，"Commit-and-sync" 操作将只执行本地提交（git add + git commit）和从远程拉取（git pull），不会自动将你的本地提交推送到远程。你之后需要手动执行推送操作

### Pull on commit-and-sync

如果开启，"Commit-and-sync" 操作会包含 `pull` (拉取) 步骤（通常在本地提交之后，推送之前执行）。如果关闭，"Commit-and-sync" 操作将只执行本地提交和推送到远程，不会自动从远程拉取更新

### Line author information

如果开启，当你查看或编辑笔记时，插件会在每一行的旁边显示最后修改该行的提交信息，例如提交的哈希值、作者、以及修改日期。建议关闭

![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/git-settings-in-obsidian-4.jpg)

### Show Author

决定在查看提交历史列表时，是否显示每次提交的作者名称。Git 会记录每次提交的作者信息

### Show Date

启用后，在提交历史列表中会显示每次提交的日期和时间。日期的显示格式会遵循你在插件在提交信息模板设置中为 `{{date}}` 占位符定义的格式

### Automatically refresh source control view on file changes

文件更改时自动刷新源码控制视图。启用后，每当你的笔记文件发生更改（例如你输入文字、保存文件），源码控制视图（显示已更改、已暂存文件的那个面板）会自动刷新以反映最新的文件状态

### Source control view refresh interval

源码控制视图刷新间隔。这个设置与上一个选项配合使用。它定义了在你最后一次修改文件后，插件会等待多长时间（以毫秒为单位）才去刷新源码控制视图。通过设置一个延迟，可以避免在你连续快速输入或修改文件时，源码控制视图过于频繁地刷新，从而减少潜在的性能影响。7000毫秒意味着在你停止编辑7秒后，视图才会更新

### Diff view style

差异视图样式。决定了当你查看文件更改的差异（diff）时，差异是如何展示的：

- `Split` (拆分/并排)：新旧版本的内容并排显示，方便对比
- `Unified` (统一/行内)：更改在同一个视图中以下一行旧内容、上一行新内容的方式显示。这更接近标准 `git diff` 的输出

### Disable informative notifications

禁用 git 操作的信息性通知以最大程度地减少干扰。启用此选项（将其拨到开启状态）会关闭那些仅仅是告知 Git 操作已成功完成的弹出式通知（例如，“推送成功”、“拉取完成”等），建议开启

### Disable error notifications

禁用错误通知。启用此选项（将其拨到开启状态）会关闭 Git 操作失败时的弹出式错误通知。通常不建议禁用错误通知，因为它们提示了重要的问题，需要你关注和解决

### Hide notifications for no changes

隐藏无更改时的通知。启用后，如果你执行提交或推送操作，但实际上并没有任何新的更改需要提交或推送，插件将不会弹出“无更改”之类的通知

### Show status bar

控制是否在 Obsidian 窗口底部的状态栏显示 Git 相关的信息，例如当前分支、是否有未提交的更改、上次同步时间等。点击状态栏的这些信息通常也可以触发一些快捷操作

### File menu integration

启用后，当你在 Obsidian 的文件浏览器中右键点击一个文件时，上下文菜单中会增加与 Git 相关的操作选项，如暂存该文件、取消暂存该文件、将该文件添加到 `.gitignore` 忽略列表

### Show branch status bar

（功能不明）

### Show the count of modified files in the status bar

在状态栏显示已修改文件的数量。启用后，会在状态栏显示当前有多少个文件已被修改但尚未提交

![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/git-settings-obsidian-5.jpg)


### Commit author

提交作者。如果你希望在这个库的提交历史中显示一个特定的名字（比如你的笔名，或者与全局 Git 配置不同的名字），可以在此填写

### Author email for commit

在这里输入的值将作为通过此插件进行的 Git 提交记录中的“作者邮箱”

### Update submodules

更新子模块。如果你的 Obsidian 库本身是一个 Git 仓库，并且你在其中使用了 Git 子模块（即在你的库中嵌入了其他独立的 Git 仓库），启用此选项会让插件在执行 "Commit-and-sync" 和 "Pull" 操作时，也尝试更新这些子模块

### Custom Git binary path

这个设置允许你指定 Git 可执行文件（`git.exe` 在 Windows 上，`git` 在 macOS/Linux 上）的完整路径。通常情况下，如果 Git 已经正确安装并且其路径已经添加到了系统的环境变量 `PATH` 中，那么插件可以直接通过输入 `git` 来找到并执行它，此时这个设置可以留空或保持为 `git`

### Additional environment variables

额外的环境变量。在非常特殊的情况下，某些 Git 操作可能需要特定的环境变量才能正常工作（例如，`GIT_SSH_COMMAND` 用于指定自定义的 SSH 命令，或者其他用于调试或特殊认证的变量）。普通用户通常不需要修改这里

### Additional PATH environment variable paths

额外的 PATH 环境变量路径。如果 Git 依赖的其他命令行工具没有在系统的标准 `PATH` 中，你可以在这里添加这些工具所在的目录路径。插件在执行 Git 命令时会临时将这些路径添加到 `PATH` 环境变量中

### Reload with new environment variables

使用新的环境变量重新加载。如果你修改了上面的 "Additional environment variables" 或 "Additional PATH environment variable paths" 设置，点击这个按钮会尝试让插件重新加载这些配置，以便新的环境变量设置能够应用于后续的 Git 操作

### Custom base path (Git repository path)

自定义基础路径 - Git 仓库路径。在大多数情况下，你的整个 Obsidian 库（Vault）的根目录就是你的 Git 仓库的根目录（即 `.git` 文件夹位于库的根目录下）。这种情况下，此设置通常留空

但是，如果你将 Git 仓库初始化在了库的某个子文件夹中（例如，你只想对库中的 `Notes` 文件夹进行版本控制，而不是整个库），那么你需要在这里指定从库根目录到那个实际作为 Git 仓库根目录的子文件夹的相对路径

### Custom Git directory path (instead of '.git')

自定义 Git 目录路径 - 代替 '.git'。Git 仓库的所有元数据和版本历史默认都存储在一个名为 `.git` 的隐藏文件夹中，这个文件夹位于仓库的根目录下。在极少数情况下，你可能通过高级 Git 命令将这个元数据文件夹设置成了其他名称或放在了其他位置（通过 `git init --separate-git-dir=<path>` 或修改 `$GIT_DIR` 环境变量）。如果你的 `.git` 文件夹不是标准的 `.git` 或者不在标准位置，你可以在这里指定它的实际路径或名称

### Disable on this device

如果你在多台设备上同步你的 Obsidian 库（包括 `.obsidian` 配置文件夹），但你希望其中某一台设备（例如，一台性能较差的旧电脑，或者一个你只想用来阅读笔记的设备）不执行任何 Git 操作（不自动提交、不自动同步等），就可以在这台设备上勾选此项。由于此设置本身不会被同步，所以它只影响当前设备