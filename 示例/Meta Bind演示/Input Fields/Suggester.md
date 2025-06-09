---
suggest: option 2
fileSuggest: "[[Example Note with Embeds|Example Note with Embeds]]"
fileSuggest2: "[[Example Note with Embeds]]"
fileSuggest3: Example Note with Embeds
---

### 简单建议器

```meta-bind
INPUT[suggester(
option(option 1),
option(option 2),
option(option 3),
showcase
):suggest]
```

```meta-bind
INPUT[suggester(
option(option 1),
option(option 2),
option(option 3),
allowOther,
showcase
):suggest]
```

### 与 Dataview 配合的建议器

注意，如果未启用 dataview，这将报错。

`INPUT[suggester(optionQuery(#example-note)):fileSuggest]`

```meta-bind
INPUT[suggester(optionQuery(#example-note), showcase):fileSuggest]
```

```meta-bind
INPUT[suggester(optionQuery(#example-note), useLinks(partial), showcase):fileSuggest2]
```

```meta-bind
INPUT[suggester(optionQuery(#example-note), useLinks(false), showcase):fileSuggest3]
```
