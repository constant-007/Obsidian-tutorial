---
title: 运行Templater文件 (Run Templater File)
description: 运行Templater文件按钮动作参考文档。
---

执行单个文件中的所有 [Templater](https://github.com/SilentVoid13/Templater) 模板。

```ts
interface RunTemplaterFileButtonAction {
	type: 'runTemplaterFile';
	templateFile: string; // 模板文件的路径，相对于库根目录
}
```

### 示例

#### 横幅通知

这将显示一个包含您当前所在文件标题的横幅。

##### 按钮

````custom_markdown {5-8}
```meta-bind-button
style: primary
label: 显示文件名
actions:
  - type: runTemplaterFile
    templateFile: "templates/Notice.md"
```
````

##### 文件 (Notice.md)

```js

```