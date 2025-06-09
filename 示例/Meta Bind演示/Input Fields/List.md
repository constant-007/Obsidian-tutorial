---
list:
  - apple
  - banana
  - berries
  - https://github.com/
  - apple
list2:
  - "[[Example Note with Image|Example Note with Image]]"
  - "[[Example Note with Callouts|Example Note with Callouts]]"
list3:
  - Example Note with Image
  - Example Note with Callouts
  - Example Note with Embeds
list4:
  - Example Note with Callouts
  - Example Note with Embeds
  - Example Note with Embeds
list5:
  - "[[Example Note with Embeds|Example Note with Embeds]]"
  - "[[Example Note with Callouts|Example Note with Callouts]]"
list6:
  - ""
---

### 列表

```meta-bind
INPUT[list(showcase):list]
```

`VIEW[{list}][link]`

```meta-bind
INPUT[list(showcase, multiLine):list]
```

### 列表建议器

```meta-bind
INPUT[listSuggester(optionQuery(#example-note), showcase):list2]
```

`VIEW[{list2}][link]`

```meta-bind
INPUT[listSuggester(optionQuery(#example-note), useLinks(false), showcase):list3]
```

`VIEW[{list3}][link]`

### 内联列表

一些文本: `INPUT[inlineList:list5]` 更多文本

### 内联列表建议器

```meta-bind
INPUT[inlineListSuggester(optionQuery(#example-note), option(something, other), useLinks(false), showcase):list4]
```

一些文本: `INPUT[inlineListSuggester(optionQuery(#example-note), option(something, other), useLinks(false)):list4]` 更多文本

`INPUT[inlineListSuggester(optionQuery(#example-note), option(something, other), allowOther):list5]` 

### 空值

```meta-bind
INPUT[list(showcase):list6]
```