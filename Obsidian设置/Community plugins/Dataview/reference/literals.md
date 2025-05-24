# 字面量

Dataview查询语言*字面量*是代表常量值（如文本（`"Science"`）或数字（`2021`））的**表达式**。它们可以作为[函数](functions.md)或[比较等表达式](./expressions.md)的一部分使用。一些使用**字面量**的[查询](../queries/structure.md)示例：

~~~

比较中使用的字面量（数字）2022
```dataview
LIST
WHERE file.day.year = 2022
```

函数调用中使用的字面量（文本）"Math"
```dataview
LIST
WHERE contains(file.name, "Math")
```

作为源使用的字面量（链接）[[Study MOC]]
```dataview
LIST
FROM [[Study MOC]]
```

比较中使用的字面量（日期）date(yesterday)
```dataview
TASK
WHERE !completed AND file.day = date(yesterday)
```

比较中使用的字面量（持续时间）dur(2 days)
```dataview
LIST
WHERE end - start > dur(2 days)
```
~~~

> [!summary] 字面量
> 字面量是可以作为Dataview查询语言（DQL）一部分使用的**静态值**，例如用于比较。

以下是DQL中可能的字面量的详尽但非穷尽列表。

### 通用
字面量|描述
-|-
`0`|数字零
`1337`|正数1337
`-200`| 负数-200
`"The quick brown fox jumps over the lazy dog"`| 文本（有时称为"字符串"）
`[[Science]]`|指向名为"Science"的文件的链接
`[[]]`| 指向当前文件的链接
`[1, 2, 3]`|数字1、2和3的列表
`[[1, 2],[3, 4]]`|列表[1, 2]和[3, 4]的列表
`{ a: 1, b: 2 }`| 具有键a和b的对象，其中a的值为1，b为2。 |
`date(2021-07-14)`| 日期（在下面阅读更多） |
`dur(2 days 4 hours)` | 持续时间（在下面阅读更多） | 

> [!attention] 字面量作为字段值
> 字面量只有在查询内使用时才会被这样解释，而不是在用作元数据值时。有关字段的可能值及其数据类型，请参考[元数据类型](../annotation/types-of-metadata.md)。

### 日期

当您使用[ISO日期格式的字段值](../annotation/types-of-metadata.md#date)时，您需要将这些字段与日期对象进行比较。Dataview为常见用例（如明天、当前周的开始等）提供了一些简写。请注意，`date()`也是一个[函数](functions.md#dateany)，可以在**文本**上调用以提取日期。

字面量|描述
-|-
`date(2021-11-11)`|日期，2021年11月11日
`date(2021-09-20T20:17)`| 日期，2021年9月20日20:17
`date(today)`|代表当前日期的日期
`date(now)`|代表当前日期和时间的日期
`date(tomorrow)`|代表明天日期的日期
`date(yesterday)`|代表昨天日期的日期
`date(sow)`|代表当前周开始的日期
`date(eow)`|代表当前周结束的日期
`date(som)`|代表当前月开始的日期
`date(eom)`|代表当前月结束的日期
`date(soy)`|代表当前年开始的日期
`date(eoy)`|代表当前年结束的日期

### 持续时间

持续时间是时间跨度的代表。您可以[直接定义它们](../annotation/types-of-metadata.md#duration)或通过[日期计算](../annotation/types-of-metadata.md#duration)创建它们，并将这些用于比较等操作。

#### 秒
字面量|描述
-|-
`dur(1 s)`|一秒
`dur(3 s)`|三秒
`dur(1 sec)`|一秒
`dur(3 secs)`|三秒
`dur(1 second)`|一秒
`dur(3 seconds)`|三秒

#### 分钟
字面量|描述
-|-
`dur(1 m)`|一分钟
`dur(3 m)`|三分钟
`dur(1 min)`|一分钟
`dur(3 mins)`|三分钟
`dur(1 minute)`|一分钟
`dur(3 minutes)`|三分钟

#### 小时
字面量|描述
-|-
`dur(1 h)`|一小时
`dur(3 h)`|三小时
`dur(1 hr)`|一小时
`dur(3 hrs)`|三小时
`dur(1 hour)`|一小时
`dur(3 hours)`|三小时

#### 天
字面量|描述
-|-
`dur(1 d)`|一天
`dur(3 d)`|三天
`dur(1 day)`|一天
`dur(3 days)`|三天

#### 周
字面量|描述
-|-
`dur(1 w)`|一周
`dur(3 w)`|三周
`dur(1 wk)`|一周
`dur(3 wks)`|三周
`dur(1 week)`|一周
`dur(3 weeks)`|三周

#### 月
字面量|描述
-|-
`dur(1 mo)`|一个月
`dur(3 mo)`|三个月
`dur(1 month)`|一个月
`dur(3 months)`|三个月

#### 年
字面量|描述
-|-
`dur(1 yr)`|一年
`dur(3 yrs)`|三年
`dur(1 year)`|一年
`dur(3 years)`|三年

#### 组合
字面量|描述
-|-
`dur(1 s, 2 m, 3 h)`|三小时、两分钟和一秒
`dur(1 s 2 m 3 h)`|三小时、两分钟和一秒
`dur(1s 2m 3h)`|三小时、两分钟和一秒
`dur(1second 2min 3h)`|三小时、两分钟和一秒
