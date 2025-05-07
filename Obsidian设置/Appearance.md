## 顶部
![[Pasted image 20250507210837.png]]

### 1. Base color scheme

常见的全局主题色调，有明亮、深色和适应系统三个选项

### 2. Accent color

嗯，称为“强调色”吧，指界面中用于突出显示活动元素、按钮、链接、选中项、光标等的颜色。你可以点击那个圆形的颜色样本（图片中显示为一个淡绿色圆圈）来打开颜色选择器，挑选一个你喜欢的颜色作为强调色。旁边有一个重置按钮

### 3. Theme

这里称“皮肤”应该更适合一点，我预装了Blue Topaz，Minimal，和Things三个主题。大差不差这些主题。不过建议选Minimal，因为配合后面要介绍的Style Settings、Minimal Theme这两个插件，Minimal允许你对这个皮肤做颗粒度极高的控制

点击“Manage"按钮会打开一个”皮肤商店"，你可以在这里找到更多皮肤

### 4. Current community themes

用于统一检测已安装主题是否有更新并进行更新

## Font

![[Pasted image 20250507213354.png]]

### 1. Interface font

用于设置 Obsidian 应用程序整体用户界面（UI）所使用的字体。这包括菜单、侧边栏、设置界面、文件名列表、按钮上的文字等等，基本上是除了笔记编辑和阅读区域之外的所有地方

### 2. Text font

此选项用于设置你笔记的主要内容区域所使用的字体，也就是你进行编辑和阅读笔记时看到的文字所用的字体

### 3. Monospace font

等宽字体使用的字体样式。主要是用反引号 ` `` ` 包裹的代码以及笔记的 frontmatter (用 `---` 包裹的部分)部分使用字体

### 4. Font size

调整字体大小。这个很nice，Notion桌面软件就没有调整字体大小的选项，说实话Notion那个字体是比较小的，有时候看得会比较吃力。所以有这个选项对用户来说是很友好的

### 5. Quick font size adjustment

通过按住Ctrl，然后滚动鼠标滚轮快捷地实现字体缩放，锦上添花~

## Interface
![[Pasted image 20250507214701.png]]

### 1. Show inline title

启用此选项后，当前笔记的文件名会作为可编辑的标题直接显示在笔记内容的顶部。这意味着你可以在笔记内部直接修改文件名（即标题）。如果禁用，笔记顶部就不会显示这个行内标题，文件名主要通过标签页或文件列表查看。建议开启

### 2. Show tab title bar

就是这个东西：
![[Pasted image 20250507214815.png]]
这个用来在标签页之间切换（左边剪头）还是挺有用的，建议开启

### 3. Show Ribbon ^ribbon

最左边的这个：
![[Pasted image 20250507214934.png]]
### 4. Ribbon menu configuration

用于控制上面说的左侧边栏出现的图标，点击右边“Manage”会打开一个对话框，在里面可以选择想删除的图标


## Advanced
![[Pasted image 20250507221029.png]]

### 1. Zoom level

控制应用界面整体缩放程度

### 2. Native menus

控制右键菜单的呈现样式。如果开启，你在笔记中右击的时候会使用操作系统的原生样式。关闭则使用Obsidian样式。可以尝试一下

### 3. Window frame style

用于程序最顶部呈现的标题样式。如果你没有改，现在应该是“Hidden"（隐藏），所以你看不到上面的窗口标题。这个建议保持隐藏，可以让界面更简洁

### 4. Custom app icon

这个是真牛，允许你自定义程序的显示图标与窗口图标，就是这个：
![[Pasted image 20250507221058.png]]

但是这个设置好像有bug，下面的任务栏图标有时候会变成自定义图标，有时候又不行

### 5. Hardware acceleration

硬件加速，描述说如果关闭可能会对软件性能有较大影响，那就开启咯

## CSS snipets

重点来了，这个“CSS snippets”（CSS 代码片段）是 Obsidian 中一个非常强大的自定义外观功能。不会写脚本不要紧，毕竟现在有AI

**首先，简单了解一下 CSS 是什么：**

CSS (Cascading Style Sheets, 层叠样式表) 是一种计算机语言，主要用来定义网页或应用程序用户界面的外观和样式。比如，文字的颜色、大小、字体，元素的位置、边框、背景等等，都是通过 CSS 来控制的。Obsidian 的界面在底层也是用类似网页的技术构建的，所以可以用 CSS 来修改。

**CSS snippets 在 Obsidian 中的作用：**

CSS 代码片段是一些简短的、用户自定义的 CSS 代码，它们允许你对 Obsidian 的外观进行细致入微的调整，这些调整可能超出了主题或内置设置所能提供的范围。你可以把它们看作是你给 Obsidian 外观打上的“小补丁”或“个性化微调”。

**它们是如何工作的：**

1. **创建 CSS 文件**：你需要在你的 Obsidian 库（Vault）中的一个特定文件夹里创建 `.css` 文件。这个文件夹通常是 `你的库路径/.obsidian/snippets/`。每个 `.css` 文件就是一个独立的 CSS 代码片段。例如，现在我已经写了3个自定义CSS 脚本： `code_scrollbar.css`, `hide_ribbon.css`, `image_resize.css` ，就是放在这个文件夹里的三个不同的 CSS 文件。
2. **编写 CSS 代码**：在这些 `.css` 文件里，你可以写入标准的 CSS 代码来针对 Obsidian 界面的特定元素进行修改。
3. **启用/禁用**：在 Obsidian 的这个设置界面（如你图片所示），Obsidian 会列出 `snippets` 文件夹中所有的 `.css` 文件。你可以通过旁边的开关来独立启用或禁用某个代码片段，而不需要删除文件。

点击刷新图标会重新加载所有当前启用的 CSS 代码片段。如果你刚刚修改了某个 `.css` 文件并保存了，点击这个按钮可以立即看到修改后的效果，而无需重启 Obsidian

点击文件夹图标会直接在你的电脑文件管理器中打开 `VAULT_PATH/.obsidian/snippets/` 文件夹，方便你添加新的 `.css` 文件或编辑已有的文件

我写的image_resize.css这个脚本用于在阅读模式下将图片居中，但发现这样会导致第三方插件Image toolkit放大图片的时候出问题，所以暂时禁用；hide_ribbon这个脚本用于隐藏上面说的[[#^ribbon|Ribbon]]。我之前没发现设置里有这个选项就写了这个脚本，所以这个脚本实际可以删除；还有一个code_scrollbar.css，这个用于让三个反引号”```"包裹的代码在超长时