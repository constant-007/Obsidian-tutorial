---
publish: true
---

# 如何设置反向链接样式

<span class="related-pages">#css #feature/backlinks </span>

## 动机和假设

在Tasks结果中，默认情况下每个任务都显示其文件名和前一个标题的名称，例如`(ACME > Steps to world domination)`。
这被称为**[[Backlinks|反向链接]]**。

如果您不喜欢反向链接的外观，本指南展示了如何修改它们的外观。

我们假设您知道如何[在Obsidian中使用CSS片段](https://help.obsidian.md/How+to/Add+custom+styles#Use+Themes+and+or+CSS+snippets)。

## 默认反向链接样式

这是一个不隐藏输出任何组件的示例任务块：有时您想查看每个任务中的所有信息。

    ```tasks
    not done
    description includes trash
    ```

此截图显示了使用一些示例数据可能的外观：

![Tasks with vanilla backlink styles](../images/backlinks-default-style.png)

注意反向链接（蓝色文件和标题名称）在视觉上可能完全主导结果。

## 内置选项

我们可以使用`hide backlink`，但这样我们就失去了导航到源文件的能力。

我们也可以使用`short mode`，这会用图标替换反向链接文本，但这会隐藏任务的所有其他属性，如到期日期和重复。

## 使用CSS来淡化反向链接

我们可以使用[此CSS片段](https://github.com/obsidian-tasks-group/obsidian-tasks/blob/main/resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-backlinks-small-grey.css)淡化反向链接中的文本：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-backlinks-small-grey.css -->
```css
/* By David Phillips (autonia) https://github.com/autonia
   From https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/622#discussioncomment-2649299
*/
.tasks-backlink {
    font-size: 0.7em;
    opacity: 0.6;
    filter: grayscale(60%);
}
```
<!-- endSnippet -->

这给我们这个结果：

![Tasks with small grey backlinks](../images/backlinks-snippet-tasks-plugin-backlinks-small-grey.png)

## 使用CSS将反向链接替换为图标

或者我们可以使用[此CSS片段](https://github.com/obsidian-tasks-group/obsidian-tasks/blob/main/resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-backlinks-icon.css)将反向链接文本替换为图标：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-backlinks-icon.css -->
```css
/* By Anna Kornfeld Simpson (@AnnaKornfeldSimpson) https://github.com/AnnaKornfeldSimpson
   From https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/834#discussioncomment-3028600

   然后转换为在此.css文件中嵌入图标，以去除对互联网连接的需求，如下所示：
   1. 链接图标从 https://twemoji.twitter.com 下载
      https://github.com/twitter/twemoji/blob/master/assets/svg/1f517.svg
      在CC-BY 4.0许可证下授权
   2. SVG编码用于使用 https://yoksel.github.io/url-encoder/ 在此嵌入

Tasks 3.0.0兼容性说明。

    在Tasks 3.0.0之前，下面的第一个CSS行是以下内容，带有'>'
    分隔符。

li.plugin-tasks-list-item > span.tasks-backlink > a {
*/
li.plugin-tasks-list-item span.tasks-backlink > a {
    content: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 36 36'%3E%3Cpath fill='%238899A6' d='M15 9l6-6s6-6 12 0 0 12 0 12l-8 8s-6 6-12 0c-1.125-1.125-1.822-2.62-1.822-2.62l3.353-3.348S14.396 18.396 16 20c0 0 3 3 6 0l8-8s3-3 0-6-6 0-6 0l-3.729 3.729s-1.854-1.521-5.646-.354L15 9z'/%3E%3Cpath fill='%238899A6' d='M20.845 27l-6 6s-6 6-12 0 0-12 0-12l8-8s6-6 12 0c1.125 1.125 1.822 2.62 1.822 2.62l-3.354 3.349s.135-1.365-1.469-2.969c0 0-3-3-6 0l-8 8s-3 3 0 6 6 0 6 0l3.729-3.729s1.854 1.521 5.646.354l-.374.375z'/%3E%3C/svg%3E");
    height: .9em;
}
```
<!-- endSnippet -->

这给我们这个结果：

![Tasks with icons for backlink](../images/backlinks-snippet-tasks-plugin-backlinks-icon.png)
