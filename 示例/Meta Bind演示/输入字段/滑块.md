---
slider1: 80
slider2: 14
slider3: 227
slider4: 0.1
---

### 简单滑块

```meta-bind
INPUT[slider(showcase):slider1]
```

### 带标签的滑块

```meta-bind
INPUT[slider(addLabels, showcase):slider1]
```

### 自定义最小最大值的滑块

```meta-bind
INPUT[slider(addLabels, minValue(-20), maxValue(20), showcase):slider2]
```

```meta-bind
INPUT[slider(addLabels, minValue(0), maxValue(1000), showcase):slider3]
```

### 自定义步长的滑块

```meta-bind
INPUT[slider(addLabels, minValue(0), maxValue(10), stepSize(0.1), showcase):slider4]
```
