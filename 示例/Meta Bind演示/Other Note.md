---
tags: test
title: test te
select: option a
date: 2023-09-22
time: 19:20
multi-select:
  - option a
  - option b
text: this is some text
---

## 这是另一个笔记
这个笔记用于测试与另一个笔记的同步。

### 选择器
选择器
```meta-bind
INPUT[
	select(
		option(option a),
		option(option b),
		option(option c),
		option(option d)
	):select
]
```

带标题的选择器
```meta-bind
INPUT[select(
title(带标题的选择器),
option(option a),
option(option b),
option(option c),
option(option d)
):select]
```

