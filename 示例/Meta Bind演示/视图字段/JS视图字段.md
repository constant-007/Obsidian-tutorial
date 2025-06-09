---
number1: 100
number2: 43
result: "**4300** km"
n1clone: 100
cssclasses:
  - aa
  - 测试-类
---

### JavaScript 查看字段

`INPUT[number:number1]`
`INPUT[number:number2]`

```meta-bind-js-view
{number1} as n1
{number2} as n2
save to {result}
---
return engine.markdown.create(`**${context.bound.n1 * context.bound.n2}** km`);
```

```meta-bind-js-view
{number1} as n1
save to {n1clone}
hidden
---
return context.bound.n1;
```

你也可以通过这种方式动态地为你的笔记添加 CSS 类。

```meta-bind-js-view
{number1} as n1
save to {cssclasses}
---
const CLASS = '测试-类';

let classes = new Set(context.metadata.frontmatter.cssclasses ?? []);

if (context.bound.n1 >= 100) {
    classes.add(CLASS);
} else {
    classes.delete(CLASS);
}

return [...classes.values()];
```

## 其他笔记

```meta-bind-js-view
{Other Note#text} as text
---
return context.bound.text
```
