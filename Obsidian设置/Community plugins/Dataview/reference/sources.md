# 源

dataview **源**是标识一组文件、任务或其他数据的东西。源在内部由Dataview索引，因此查询速度很快。源最突出的用途是[FROM数据命令](../../queries/data-commands.md#from)。它们也用于各种JavaScript API查询调用中。

## 源的类型

Dataview目前支持**四种源类型**。

### 标签

形式为`#tag`的源。这些匹配所有具有给定标签的文件/部分/任务。

~~~
```dataview
LIST
FROM #homework
```
~~~

### 文件夹

形式为`"folder"`的源。这些匹配给定文件夹及其子文件夹中包含的所有文件/部分/任务。期望的是完整的库路径而不仅仅是文件夹名称。请注意，不支持尾随斜杠，即`"Path/To/Folder/"`不起作用，但`"Path/To/Folder"`起作用。

~~~
```dataview
TABLE file.ctime, status
FROM "projects/brainstorming"
```
~~~

### 特定文件

您可以通过指定完整路径从特定文件中选择：`"folder/File"`。

- 如果您有一个文件和一个文件夹具有完全相同的路径，Dataview将优先选择文件夹。您可以通过指定扩展名强制它从文件读取：`folder/File.md`。

~~~
```dataview
LIST WITHOUT ID next-in-line
FROM "30 Hobbies/Games/Dashboard"
```
~~~

### 链接

您可以选择链接**到**文件的链接，或**来自**文件的所有链接。

- 要获取所有链接**到**`[[note]]`的页面，使用`[[note]]`。
- 要获取所有**来自**`[[note]]`的链接页面（即该文件中的所有链接），使用`outgoing([[note]])`。
- 您可以通过`[[#]]`或`[[]]`隐式引用当前文件，即`[[]]`让您从所有链接到当前文件的文件中查询。

~~~
```dataview
LIST
FROM [[]]
```

```dataview
LIST
FROM outgoing([[Dashboard]])
```
~~~

## 组合源

您可以使用`and`和`or`组合这些过滤器以获得更高级的源。

- 例如，`#tag and "folder"`将返回`folder`中具有`#tag`的所有页面。
- 从`#food and !#fastfood`查询将只返回包含`#food`但不包含`#fastfood`的页面。
- `[[Food]] or [[Exercise]]`将给出链接到`[[Food]]`或`[[Exercise]]`的任何页面。

如果您有复杂的查询，其中分组或优先级很重要，您可以使用括号对它们进行逻辑分组：

- `#tag and ("folder" or #other-tag)`
- `(#tag1 or #tag2) and (#tag3 or #tag4)`


