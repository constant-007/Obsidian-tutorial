## 顶部
![](Pasted%20image%2020250506232354.png)

### 1. Confirm file deletion

确认文件删除。删除文件前进行提示确认。启用此选项后，当你尝试删除一个文件时，Obsidian会弹出确认对话框要求你确认删除操作，以防止意外删除重要文件

### 2. Deleted files

已删除文件，设置文件删除后的处理方式。
- Move to system trash（移至系统回收站）：删除的文件将被移动到系统回收站
- Move to Obsidian trash (.trash folder)（移至Obsidian回收站）：删除的文件将被移动到笔记库中的.trash文件夹
- Permanently delete（永久删除）：删除的文件将被直接永久删除，无法恢复

### 3. Automatically update internal links

重命名文件后自动更新链接。启用此选项后，当你重命名一个文件时，Obsidian会自动更新所有指向该文件的内部链接，以保持链接的有效性。如果关闭此选项，在重命名文件时会提示你是否要更新链接

### 4. Default location for new notes

设置新建笔记的默认保存位置。
- Same folder as current file（与当前文件相同文件夹）：新笔记将保存在当前打开笔记所在的文件夹中
- In the folder specified below（在下方指定的文件夹中）：新笔记将保存在你指定的特定文件夹中
- Root folder（根文件夹）：新笔记将保存在笔记库的根目录

## 5. New link format

设置自动生成内部链接时使用的格式。
- Shortest path when possible（尽可能使用最短路径）：使用到目标笔记的最短可能路径
- Relative path to file（相对于文件的路径）：使用相对于当前笔记的路径
- Absolute path in vault（库中的绝对路径）：使用从库根目录开始的完整路径

## 使用 Wiki 链接
**Use [[Wikilinks]]（使用Wiki链接）：** 自动为[[links]]和![[images]]生成Wiki链接，而不是Markdown链接和图片。启用此选项后，Obsidian将使用`[[页面名称]]`格式创建链接，禁用则使用标准Markdown链接格式`[页面名称](路径)`。

## 检测所有文件扩展名
**Detect all file extensions（检测所有文件扩展名）：** 显示任何扩展名的文件，即使Obsidian无法原生打开它们。启用此选项后，你可以在文件浏览器中看到所有文件，并能链接到它们，即使这些文件需要外部程序打开。对于需要在笔记中引用各种文件类型的用户非常有用。

## 新附件默认位置
**Default location for new attachments（新附件默认位置）：** 设置新上传附件的默认保存位置。
- Same folder as current file（与当前文件相同文件夹）：附件将与引用它的笔记保存在同一文件夹
- In the folder specified below（在下方指定的文件夹中）：附件将保存在你指定的特定文件夹中
- In subfolder under current folder（当前文件夹的子文件夹中）：附件将保存在当前笔记所在文件夹的一个子文件夹中

## 附件文件夹路径
**Attachment folder path（附件文件夹路径）：** 设置存放新创建附件文件的文件夹路径。这个设置指定了拖放或粘贴的图片、音频录音等附件文件的保存位置。图片显示设置为"Attachment"文件夹。

## 排除的文件
**Excluded files（排除的文件）：** 设置要从搜索、图谱视图和未链接提及中隐藏的文件。被排除的文件在搜索结果中不可见，在图谱视图中不显示，在快速切换器和链接建议中也不那么醒目。可以通过"Manage"（管理）按钮设置具体的排除规则。

## 覆盖配置文件夹
**Override config folder（覆盖配置文件夹）：** 使用与默认配置文件夹不同的文件夹。该文件夹必须以点开头，图片显示设置为".obsidian"。这个设置允许你指定一个自定义的文件夹来存储Obsidian的配置文件，而不是使用默认的.obsidian文件夹。
