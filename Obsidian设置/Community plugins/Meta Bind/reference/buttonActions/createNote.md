---
title: Create Note
description: Create Note button action reference.
---

**创建笔记** 动作在指定位置创建一个新的空白笔记。

```ts
interface CreateNoteButtonAction {
	type: 'createNote';
	fileName: string; // 新笔记的名称
	folderPath?: string; // 创建笔记的文件夹路径，如果未指定则在库的根目录创建
	openNote?: boolean; // 如果为 true，创建后将打开笔记
	openIfAlreadyExists?: boolean; // 如果笔记已存在，是否打开现有笔记而不是创建带递增编号的新笔记
}
```

当指定位置已存在同名笔记时，将创建一个附加递增编号的笔记。
例如，如果名为 `Note` 的笔记已存在，新笔记将命名为 `Note 1`。

### 示例

此按钮将在 `My Folder` 文件夹中创建一个名为 `New Note` 的新笔记。
如果同名笔记已存在，新笔记将命名为 `New Note 1`。

````custom_markdown {5-8}
```meta-bind-button
style: primary
label: Create Note
action:
  type: createNote
  folderPath: "My Folder"
  fileName: "New Note"
  openNote: false
```
````