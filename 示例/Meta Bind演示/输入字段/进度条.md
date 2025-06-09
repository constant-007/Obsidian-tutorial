---
progress1: -6
progress2: 0.7
progress3: 2
progress4: 2.6
progress5: 60
progress6: 75
---

### 进度条

```meta-bind
INPUT[progressBar(showcase, minValue(-10), maxValue(3)):progress1]
```

```meta-bind
INPUT[progressBar(showcase, minValue(0), maxValue(1), stepSize(0.1)):progress2]
```

```meta-bind
INPUT[progressBar(showcase, minValue(0), maxValue(10), stepSize(-1)):progress3]
```

```meta-bind
INPUT[progressBar(showcase, minValue(0), maxValue(10), stepSize(0.1)):progress4]
```

如果不需要标签，可以将其隐藏。

```meta-bind
INPUT[progressBar(defaultValue(53), addLabels(false)):progress5]
```

通过一些 CSS 代码片段，我们可以改变进度条的颜色。

```meta-bind
INPUT[progressBar(defaultValue(53), class(red-progress-bar)):progress6]
```
