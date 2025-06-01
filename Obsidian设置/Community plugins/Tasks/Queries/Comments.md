---
publish: true
---

# 注释

所有以`#`字符开头的查询行都被视为注释，将被忽略。

示例：

    ```tasks
    not done
    # 取消注释以下行以启用简短模式：
    # short mode
    ```

## 行内注释

> [!released]
> 行内注释在Tasks 4.7.0中引入。

[Mustache.js](https://www.npmjs.com/package/mustache)注释也可以在行内使用：

    ```tasks
    not done
    short mode {{! 此注释将被忽略 }}
    ```

当Tasks处理查询中的[[Placeholders|占位符]]时，此类注释将被删除。

行中`{{!`和`}}`之间的任何文本都将被忽略。不支持多行注释（除非可能与[[Line Continuations|行继续]]结合使用）。
