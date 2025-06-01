---
publish: true
---

# 每日议程

<span class="related-pages">#plugin/calendar #plugin/periodic-notes</span>

使用默认的`Daily-notes`插件，带有`{{date+14d:YYYY-MM-DD}}`等语法的**模板**无法正确加载日期。不过，[Calendar Plugin](https://github.com/liamcain/obsidian-calendar-plugin)和[Periodic Notes Plugin](https://github.com/liamcain/obsidian-periodic-notes)的作者**Liam Cain**编写了代码，可以使用`date+Xd`格式创建新的每日笔记（使用这两个插件）。
因此，如果您想使用此格式而不是标准的`Daily-notes`语法，请确保通过这两个插件之一创建新笔记，而不是`Daily-notes`。

- **Calendar Plugin**：只需点击日历UI上的日期，就会创建一个新的每日笔记
- **Periodic Notes Plugin**：安装，如果需要可以从`Daily-notes`迁移，然后点击左侧停靠栏上新的`Open Today`功能区。下面是如果今天是2021年8月14日的示例。

|                 | Daily Notes                      | Calendar                         | Periodic Notes                   |
| --------------- | -------------------------------- | -------------------------------- | -------------------------------- |
| 模板语法        | `due on {{date+14d:YYYY-MM-DD}}` | `due on {{date+14d:YYYY-MM-DD}}` | `due on {{date+14d:YYYY-MM-DD}}` |
| 输出            | `due on {{date+14d:YYYY-MM-DD}}` | `due on 2021-08-28`              | `due on 2021-08-28`              |

如果您想使用默认的`Daily-notes`插件，解决方法是用[[Custom Filters|自定义过滤]]表达式替换不支持的语法。
例如，`due before {{date+14d:YYYY-MM-DD}}`可以替换为

```markdown
filter by function task.due.moment?.isBefore(moment("{{date:YYYY-MM-DD}}").add(14, 'days'), 'day') || false
```

## 每日议程**模板**示例

    ## 任务
    ### 逾期
    ```tasks
    not done
    due before {{date:YYYY-MM-DD}}
    ```

    ### 今天到期
    ```tasks
    not done
    due on {{date:YYYY-MM-DD}}
    ```

    ### 未来两周内到期
    ```tasks
    not done
    due after {{date:YYYY-MM-DD}}
    due before {{date+14d:YYYY-MM-DD}}
    ```

    ### 无到期日期
    ```tasks
    not done
    no due date
    ```

    ### 今天完成
    ```tasks
    done on {{date:YYYY-MM-DD}}
    ```

## 每日议程查询故障排除

### 指令包含未展开的模板文本

<!-- If the above heading name changes, please update the source code,
so that the new URL is shown in the error message below. -->

为了防止意外在模板文件上运行Tasks搜索，所有内置的Tasks日期搜索都会检查看起来像模板规则的文本。

如果发现，它们将拒绝运行搜索，因为经验发现结果很少是用户想要的。

错误消息将包含此文本：

<!-- snippet: TemplatingPluginTools.test.TemplatingPluginTools_date_templating_error_sample_for_docs.approved.text -->
```text
Instruction contains unexpanded template text: "<%" - and cannot be interpreted.

Possible causes:
- The query is an a template file, and is not intended to be searched.
- A command such as "Replace templates in the active file" needs to be run.
- The core "Daily notes" plugin is in use, and the template contained
  date calculations that it does not support.
- Some sample template text was accidentally pasted in to a tasks query,
  instead of in to a template file.

See: https://publish.obsidian.md/tasks/Advanced/Daily+Agenda#Instruction+contains+unexpanded+template+text
```
<!-- endSnippet -->

> [!released]
> 未展开模板文本的检查在Tasks 5.0.0中引入。
