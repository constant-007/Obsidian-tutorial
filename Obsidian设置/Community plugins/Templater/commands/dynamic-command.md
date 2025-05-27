# 动态命令

使用此命令实用工具，您可以将命令声明为"动态"，这意味着此命令将在进入预览模式时解析。

要声明动态命令，请在命令开始标签后添加加号`+`：`<%+`

就是这样，您的命令现在将仅在预览模式下执行。

这对于像`tp.file.last_modified_date`这样的内部函数很有用：

```javascript
最后修改日期：<%+ tp.file.last_modified_date() %>
```

**注意**：动态命令有已知问题，将来可能不会继续维护（详情请参见[此问题](https://github.com/SilentVoid13/Templater/issues/913)）。在大多数情况下，建议使用[Dataview](https://github.com/blacksmithgu/obsidian-dataview)插件作为替代方案。

## 刷新问题

预览模式的一个"缺点"是它将渲染的笔记放入缓存中，以加快速度。

这意味着您的动态命令将只渲染一次，即当您打开笔记时，但之后不会刷新。

如果您想刷新它，必须关闭笔记以清除缓存并重新打开它。