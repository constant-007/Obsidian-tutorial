# 内部函数

[Templater](https://github.com/SilentVoid13/Templater)提供的不同内部变量和函数按不同**模块**进行分类整理。现有的**内部模块**包括：

- [App模块](./internal-modules/app-module.md)：`tp.app`
- [Config模块](./internal-modules/config-module.md)：`tp.config`
- [Date模块](./internal-modules/date-module.md)：`tp.date`
- [File模块](./internal-modules/file-module.md)：`tp.file`
- [Frontmatter模块](./internal-modules/frontmatter-module.md)：`tp.frontmatter`
- [Hooks模块](./internal-modules/hooks-module.md)：`tp.hooks`
- [Obsidian模块](./internal-modules/obsidian-module.md)：`tp.obsidian`
- [System模块](./internal-modules/system-module.md)：`tp.system`
- [Web模块](./internal-modules/web-module.md)：`tp.web`

如果您正确理解了[对象层次结构](../syntax.md#objects-hierarchy)，这意味着典型的内部函数调用看起来像这样：` <% tp.<module_name>.<internal_function_name> %>`

## 贡献

我邀请每个人通过添加新的内部函数来为此插件的开发做出贡献。更多信息请参见[这里](./contribute.md)。