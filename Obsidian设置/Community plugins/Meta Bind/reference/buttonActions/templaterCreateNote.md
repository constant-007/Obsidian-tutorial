---
title: Templater创建笔记 (Templater Create Note)
description: Templater创建笔记按钮动作参考文档。
---

Templater创建笔记动作使用 [Templater](https://github.com/SilentVoid13/Templater) 模板创建新笔记。

```ts
interface TemplaterCreateNoteButtonAction {
	type: 'templaterCreateNote';
	templateFile: string; // 模板文件的路径，相对于库根目录
	folderPath?: string; // 可选，创建笔记的文件夹路径，相对于库根目录
	fileName?: string; // 可选，要创建的文件名
	openNote?: boolean; // 是否打开创建的笔记
	openIfAlreadyExists?: boolean; // 如果笔记已存在，是否打开该笔记而不是创建新的递增名称笔记
}
```

### 示例

此按钮使用 `templates` 文件夹中的 `Lecture Template` 模板在 `Lectures` 文件夹中创建一个标题为 `新讲座笔记 - 请重命名` 的新笔记。

````custom_markdown {5-8}
```meta-bind-button
style: primary
label: 创建讲座笔记
actions:
  - type: templaterCreateNote
    templateFile: "templates/Lecture Template.md"
    folderPath: Lectures
    fileName: "新讲座笔记 - 请重命名"
```
````