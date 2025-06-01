---
publish: true
---

# 使用文件名作为默认日期

## 自动计划日期

> [!released]
>
> - 在Tasks 1.18.0中引入。
> - 在7.6.0中添加了对完全匹配自定义格式的文件名的支持。

您可以根据任务文件的名称自动为任务设置计划日期。此功能可以在设置中启用，通过选项`Use filename as Scheduled date for undated tasks`。更改此设置需要重启Obsidian。

例如，这允许您将日记中的所有任务视为已计划。然后您可以使用`scheduled`和`happens`[[Filters|过滤器]]查询它们。

示例查询：

````text
```tasks
scheduled before today
group by scheduled
not done
```
````

> [!info] 查看隐含日期
>
> - 任务在任何Obsidian视图中都不会在视觉上修改：计划日期只是隐含的，不会显示。
> - 但是，它将出现在[[Create or edit Task|编辑对话框]]中。
> - 也可以通过在任务块中使用`group by scheduled`指令来检查。

## 规则

要从文件名自动设置计划日期，适用以下规则：

- 必须启用设置'Use filename as Scheduled date for undated tasks'，并重启Obsidian，
- 任务必须没有现有的计划日期、截止日期或开始日期，
- 以下条件之一必须为真：
  1. 文件名必须**包含**格式为`YYYY-MM-DD`或`YYYYMMDD`的日期，
  2. 或者文件名必须**完全等于**使用[[Use Filename as Default Date#Additional date format|附加日期格式设置]]添加的附加日期格式），
- 如果启用了[[#Folders setting|该设置]]，文件必须在配置的文件夹或其子文件夹之一中。

包含内置日期格式的文件名示例：

```text
daily/2022-10-12 Wednesday.md
meetings/rd. 2022-09-07.md
20220612 - random thoughts.md
```

## 设置

以下图像显示了与此功能相关的设置：

![Use filename as Scheduled date for undated tasks settings](../images/settings-use-filename-for-date.png)
<span class="caption">使用文件名作为未标注日期任务的计划日期设置</span>

### 附加日期格式
> [!released]
> 在tasks 7.6.0中引入。

默认情况下，只有日期格式`YYYY-MM-DD`和`YYYYMMDD`会被匹配。

此设置允许您指定要为此功能匹配的附加日期格式。

> [!warning]
> 请注意，与`YYYY-MM-DD`和`YYYYMMDD`日期格式不同，此设置目前不支持文件名中的前缀或后缀。自定义附加日期格式必须与文件完全匹配。
>
> 因此，如果附加格式是`MMM D YYYY`：
>
> - 文件`Jan 4 2024.md`将被检测为日期`2024-01-04`。
> - 文件`Notes from Jan 4 2024.md`不会被识别为有日期。

请参阅[语法参考](https://momentjs.com/docs/#/displaying/format/)了解支持的日期格式。

> [!example] 示例1
> 如果您在`daily/Jun 20 2024`中有一个日记，那么您可以使用日期格式`MMMM Do YYYY`来自动将该文件中的任务设置为在该日期计划。

> [!example] 示例2
> 如果您的Daily Notes核心插件设置指定了带有文件夹的日期格式：
>
> ```text
> YYYY/MM/dddd, MMMM Do YYYY
> ```
>
> 那么您需要将此文本作为附加文件名日期格式输入：
>
> ```text
> dddd, MMMM Do YYYY
> ```

> [!example] 示例3 - 周记
> 如果您使用周记，您可以指定周记名称的格式，然后Tasks将选择一周的第一天作为默认计划日期。例如，如果使用典型的周记名称如`2024-W49`：
>
> ```text
> YYYY-[W]ww
> ```

### 文件夹设置

如果在设置对话框中`Folders with default Scheduled dates`字段留空，默认日期将应用于库中所有文件的未标注日期任务。

可以输入逗号分隔的文件夹列表来限制范围。然后默认日期将仅应用于指定文件夹及其子文件夹中所有文件的未标注日期任务。

示例：

| 文件夹设置   | 匹配文件                                                                          | 不匹配                               |
| ----------------- | --------------------------------------------------------------------------------------- | ------------------------------------------ |
| (空)           | `20221022.md`<br/>`daily/20221012.md`                                                   |                                            |
| `daily`           | `daily/2022-10-12.md`<br/>`daily/notes/2022-10-12.md`                                   | `20221022.md`<br/>`meetings/2022-10-12.md` |
| `daily,prj/daily` | `daily/2022-10-12.md`<br/>`prj/daily/2022-10-12.md`<br/>`prj/daily/notes/2022-06-12.md` | `20221022.md`<br/>`meetings/2022-10-12.md` |

> [!warning]
> 不支持名称中包含逗号（`,`）的文件夹。

## 限制

### 将设置应用于选定文件夹

不支持名称中包含逗号（`,`）的文件夹。

### 附加日期格式的精确匹配

与`YYYY-MM-DD`和`YYYYMMDD`日期格式不同，如果提供了附加的自定义日期格式，它将不支持前缀或后缀，只会匹配遵循提供的确切格式的文件。
