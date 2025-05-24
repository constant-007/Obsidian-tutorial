# 函数

Dataview函数提供了操作数据的更高级方法。您可以在**[数据命令](../queries/data-commands.md)**（除了FROM）中使用函数来过滤或分组，或将它们用作**[附加信息](../queries/query-types.md)**，如TABLE列或LIST查询的额外输出，以全新的角度查看您的数据。

## 函数如何工作

函数是[表达式](expressions.md)的另一种形式，可以在任何可以使用表达式的地方使用。函数总是返回一个新值，并遵循以下格式：

```
functionname(parameter1, parameter2)
```

参数又是[表达式](expressions.md)，您可以使用字面量、元数据字段，甚至另一个函数作为参数。您将在本页面的文档中了解到您的参数需要具有哪种[数据类型](../annotation/types-of-metadata.md)。请注意函数括号内的信息。方括号中的参数，即`link(path, [display])`意味着它们是*可选的*，可以省略。在每个函数的解释中了解更多关于默认行为的信息。

## 在值列表上调用函数

大多数函数可以应用于单个值（如`number`、`string`、`date`等）或这些值的列表。如果函数应用于列表，它也会在函数应用于列表中的每个元素后返回一个列表。例如：

```js
lower("YES") = "yes"
lower(["YES", "NO"]) = ["yes", "no"]

replace("yes", "e", "a") = "yas"
replace(["yes", "ree"], "e", "a") = ["yas", "raa"]
```

这种所谓的"函数向量化"在以下定义中不会明确提及，并且对于广泛的这些功能隐式地是可能的。

## 构造函数

创建值的构造函数。

### `object(key1, value1, ...)`

使用给定的键和值创建一个新对象。键和值应在调用中交替出现，键应始终是字符串/文本。

```js
object() => 空对象
object("a", 6) => 将"a"映射到6的对象
object("a", 4, "c", "yes") => 将a映射到4，c映射到"yes"的对象
```

### `list(value1, value2, ...)`

使用给定值创建一个新列表。`array`可以用作`list`的别名。

```js
list() => 空列表
list(1, 2, 3) => 包含1、2和3的列表
array("a", "b", "c") => 包含"a"、"b"和"c"的列表
```

### `date(any)`

如果可能，从提供的字符串、日期或链接对象解析日期，否则返回null。

```js
date("2020-04-18") = <表示2020年4月18日的日期对象>
date([[2021-04-16]]) = <给定页面的日期对象，引用file.day>
```

### `date(text, format)`

使用指定格式从文本解析日期为luxon `DateTime`。注意本地化格式可能不起作用。
使用[Luxon标记](https://moment.github.io/luxon/#/formatting?id=table-of-tokens)。

```js
date("12/31/2022", "MM/dd/yyyy") => 2022年12月31日的DateTime
date("210313", "yyMMdd") => 2021年3月13日的DateTime
date("946778645000", "x") => "2000-01-02T03:04:05"的DateTime
```

### `dur(any)`

从提供的字符串或持续时间解析持续时间，失败时返回null。

```js
dur(8 minutes) = <8分钟>
dur("8 minutes, 4 seconds") = <8分钟4秒>
dur(dur(8 minutes)) = dur(8 minutes) = <8分钟>
```

### `number(string)`

从给定字符串中提取第一个数字，如果可能则返回它。如果字符串中没有数字则返回null。

```js
number("18 years") = 18
number(34) = 34
number("hmm") = null
```

### `string(any)`

将任何值转换为"合理的"字符串表示。这有时会产生不如直接在查询中使用值那么漂亮的结果 - 它主要用于将日期、持续时间、数字等强制转换为字符串进行操作。

```js
string(18) = "18"
string(dur(8 hours)) = "8 hours"
string(date(2021-08-15)) = "August 15th, 2021"
```

### `link(path, [display])`

从给定的文件路径或名称构造链接对象。如果提供两个参数，第二个参数是链接的显示名称。

```js
link("Hello") => 指向名为'Hello'的页面的链接
link("Hello", "Goodbye") => 指向名为'Hello'的页面的链接，显示为'Goodbye'
```

### `embed(link, [embed?])`

将链接对象转换为嵌入式链接；Dataview视图对嵌入式链接的支持有些不完整，但图像的嵌入应该可以工作。

```js
embed(link("Hello.png")) => 指向"Hello.png"图像的嵌入式链接，将呈现为实际图像。
```

### `elink(url, [display])`

构造指向外部url（如`www.google.com`）的链接。如果提供两个参数，第二个参数是链接的显示名称。

```js
elink("www.google.com") => 指向google.com的链接元素
elink("www.google.com", "Google") => 指向google.com的链接元素，显示为"Google"
```

### `typeof(any)`

获取任何对象的类型以供检查。可以与其他运算符一起使用以根据类型改变行为。

```js
typeof(8) => "number"
typeof("text") => "string"
typeof([1, 2, 3]) => "array"
typeof({ a: 1, b: 2 }) => "object"
typeof(date(2020-01-01)) => "date"
typeof(dur(8 minutes)) => "duration"
```

---

## 数值运算

### `round(number, [digits])`

将数字四舍五入到给定的位数。如果未指定第二个参数，则四舍五入到最接近的整数；否则，四舍五入到给定的位数。

```js
round(16.555555) = 17
round(16.555555, 2) = 16.56
```

### `trunc(number)`

从数字中截断（"切掉"）小数点。

```js
trunc(12.937) = 12
trunc(-93.33333) = -93
trunc(-0.837764) = 0
```

### `floor(number)`

总是向下舍入并返回小于或等于给定数字的最大整数。
这意味着负数变得更负。

```js
floor(12.937) = 12
floor(-93.33333) = -94
floor(-0.837764) = -1
```

### `ceil(number)`

总是向上舍入并返回大于或等于给定数字的最小整数。
这意味着负数变得不那么负。

```js
ceil(12.937) = 13
ceil(-93.33333) = -93
ceil(-0.837764) = 0
```

### `min(a, b, ..)`

计算参数列表或数组的最小值。

```js
min(1, 2, 3) = 1
min([1, 2, 3]) = 1

min("a", "ab", "abc") = "a"
```

### `max(a, b, ...)`

计算参数列表或数组的最大值。

```js
max(1, 2, 3) = 3
max([1, 2, 3]) = 3

max("a", "ab", "abc") = "abc"
```

### `sum(array)`

对数组中的所有数值求和。如果您的总和中有null值，您可以通过`nonnull`函数消除它们。

```js
sum([1, 2, 3]) = 6
sum([]) = null

sum(nonnull([null, 1, 8])) = 9
```

### `product(array)`

计算数字列表的乘积。如果您的平均值中有null值，您可以通过`nonnull`函数消除它们。

```js
product([1,2,3]) = 6
product([]) = null

product(nonnull([null, 1, 2, 4])) = 8
```

### `reduce(array, operand)`

一个通用函数，用于将列表减少为一个值，有效操作数为`"+"`, `"-"`, `"*"`, `"/"`和布尔操作数`"&"`和`"|"`。请注意，使用`"+"`和`"*"`等于`sum()`和`product()`函数，使用`"&"`和`"|"`匹配`all()`和`any()`。

```js
reduce([100, 20, 3], "-") = 77
reduce([200, 10, 2], "/") = 10
reduce(values, "*") = Multiplies every element of values, same as product(values)
reduce(values, this.operand) = Applies the local field operand to each of the values
reduce(["⭐", 3], "*") = "⭐⭐⭐", same as "⭐" * 3

reduce([1]), "+") = 1, has the side effect of reducing the list into a single element
```

### `average(array)`

计算数值的数值平均值。如果您的平均值中有null值，您可以通过`nonnull`函数消除它们。

```js
average([1, 2, 3]) = 2
average([]) = null

average(nonnull([null, 1, 2])) = 1.5
```

### `minby(array, function)`

计算数组的数值最小值，使用提供的函数。

```js
minby([1, 2, 3], (k) => k) = 1
minby([1, 2, 3], (k) => 0 - k) => 3

minby(this.file.tasks, (k) => k.due) => (earliest due)
```

### `maxby(array, function)`

计算数组的数值最大值，使用提供的函数。

```js
maxby([1, 2, 3], (k) => k) = 3
maxby([1, 2, 3], (k) => 0 - k) => 1

maxby(this.file.tasks, (k) => k.due) => (latest due)
```

--

## Objects, Arrays, and String Operations

Operations that manipulate values inside of container objects.

### `contains()` and friends

For a quick summary, here are some examples:

```js
contains("Hello", "Lo") = false
contains("Hello", "lo") = true

icontains("Hello", "Lo") = true
icontains("Hello", "lo") = true

econtains("Hello", "Lo") = false
econtains("Hello", "lo") = true
econtains(["this","is","example"], "ex") = false
econtains(["this","is","example"], "is") = true
```

#### `contains(object|list|string, value)`

Checks if the given container type has the given value in it. This function behave slightly differently based on whether
the first argument is an object, a list, or a string.
This function is case-sensitive.

- For objects, checks if the object has a key with the given name. For example,
    ```
    contains(file, "ctime") = true
    contains(file, "day") = true (if file has a date in its title, false otherwise)
    ```
- For lists, checks if any of the array elements equals the given value. For example,
    ```
    contains(list(1, 2, 3), 3) = true
    contains(list(), 1) = false
    ```
- For strings, checks if the given value is a substring (i.e., inside) the string.
    ```
    contains("hello", "lo") = true
    contains("yes", "no") = false
    ```

#### `icontains(object|list|string, value)`

Case insensitive version of `contains()`.

#### `econtains(object|list|string, value)`

"Exact contains" checks if the exact match is found in the string/list.
This function is case sensitive.

- For strings, it behaves exactly like [`contains()`](#containsobjectliststring-value).
    ```
    econtains("Hello", "Lo") = false
    econtains("Hello", "lo") = true
    ```

- For lists, it checks if the exact word is in the list.
    ```
    econtains(["These", "are", "words"], "word") = false
    econtains(["These", "are", "words"], "words") = true
    ```

- For objects, it checks if the exact key name is present in the object. It does **not** do recursive checks.
    ```
    econtains({key:"value", pairs:"here"}, "here") = false
    econtains({key:"value", pairs:"here"}, "key") = true
    econtains({key:"value", recur:{recurkey: "val"}}, "value") = false
    econtains({key:"value", recur:{recurkey: "val"}}, "Recur") = false
    econtains({key:"value", recur:{recurkey: "val"}}, "recurkey") = false
    ```

### `containsword(list|string, value)`

Checks if `value` has an exact word match in `string` or `list`.
This is case insensitive.
The outputs are different for different types of input, see examples.

- For strings, it checks if the word is present in the given string.
    ```
    containsword("word", "word") = true
    containsword("word", "Word") = true
    containsword("words", "Word") = false
    containsword("Hello there!", "hello") = true
    containsword("Hello there!", "HeLLo") = true
    containsword("Hello there chaps!", "chap") = false
    containsword("Hello there chaps!", "chaps") = true
    ```

- For lists, it returns a list of booleans indicating if the word's exact case insensitive match was found.
    ```
    containsword(["I have no words.", "words"], "Word") = [false, false]
    containsword(["word", "Words"], "Word") = [true, false]
    containsword(["Word", "Words in word"], "WORD") = [true, true]
    ```

### `extract(object, key1, key2, ...)`

Pulls multiple fields out of an object, creating a new object with just those fields.

```
extract(file, "ctime", "mtime") = object("ctime", file.ctime, "mtime", file.mtime)
extract(object("test", 1)) = object()
```

### `sort(list)`

Sorts a list, returning a new list in sorted order.

```
sort(list(3, 2, 1)) = list(1, 2, 3)
sort(list("a", "b", "aa")) = list("a", "aa", "b")
```

### `reverse(list)`

Reverses a list, returning a new list in reversed order.

```
reverse(list(1, 2, 3)) = list(3, 2, 1)
reverse(list("a", "b", "c")) = list("c", "b", "a")
```

### `length(object|array)`

Returns the number of fields in an object, or the number of entries in an array.

```
length([]) = 0
length([1, 2, 3]) = 3
length(object("hello", 1, "goodbye", 2)) = 2
```

### `nonnull(array)`

Return a new array with all null values removed.

```
nonnull([]) = []
nonnull([null, false]) = [false]
nonnull([1, 2, 3]) = [1, 2, 3]
```

### `firstvalue(array)`

Return the first non-null value from the array, as a single element. This can be used to pick the first defined field in the children of a task/list item, like in `firstvalue(children.myField)`.

```js
firstvalue([null, 1, 2]) => 1
firstvalue(children.myField) => If children.myField equals [null, null, "myValue", null], it would return "myValue"
```

### `all(array)`

Returns `true` only if ALL values in the array are truthy. You can also pass multiple arguments to this function, in
which case it returns `true` only if all arguments are truthy.

```
all([1, 2, 3]) = true
all([true, false]) = false
all(true, false) = false
all(true, true, true) = true
```

You can pass a function as second argument to return only true if all elements in the array matches the predicate.

```
all([1, 2, 3], (x) => x > 0) = true
all([1, 2, 3], (x) => x > 1) = false
all(["apple", "pie", 3], (x) => typeof(x) = "string") = false
```

### `any(array)`

Returns `true` if ANY of the values in the array are truthy. You can also pass multiple arguments to this function, in
which case it returns `true` if any of the arguments are truthy.

```
any(list(1, 2, 3)) = true
any(list(true, false)) = true
any(list(false, false, false)) = false
any(true, false) = true
any(false, false) = false
```

You can pass a function as second argument to return only true if any element in the array matches the predicate.

```
any(list(1, 2, 3), (x) => x > 2) = true
any(list(1, 2, 3), (x) => x = 0) = false
```

### `none(array)`

Returns `true` if NONE of the values in the array are truthy.

```
none([]) = true
none([false, false]) = true
none([false, true]) = false
none([1, 2, 3]) = false
```

You can pass a function as second argument to return only true if none of the elements in the array matches the predicate.

```
none([1, 2, 3], (x) => x = 0) = true
none([true, true], (x) => x = false) = true
none(["Apple", "Pi", "Banana"], (x) => startswith(x, "A")) = false
```

### `join(array, [delimiter])`

Joins elements in an array into a single string (i.e., rendering them all on the same line). If provided with a second
argument, then each element will be separated by the given separator.

```
join(list(1, 2, 3)) = "1, 2, 3"
join(list(1, 2, 3), " ") = "1 2 3"
join(6) = "6"
join(list()) = ""
```

### `filter(array, predicate)`

Filters elements in an array according to the predicate, returning a new list of the elements which matched.

```js
filter([1, 2, 3], (x) => x >= 2) = [2, 3]
filter(["yes", "no", "yas"], (x) => startswith(x, "y")) = ["yes", "yas"]
```

### `unique(array)`

Creates a new array with only unique values. 

```js
unique([1, 3, 7, 3, 1]) => [1, 3, 7]
```

### `map(array, func)`

Applies the function to each element in the array, returning a list of the mapped results.

```js
map([1, 2, 3], (x) => x + 2) = [3, 4, 5]
map(["yes", "no"], (x) => x + "?") = ["yes?", "no?"]
```

### `flat(array, [depth])`

Concatenates sub-levels of the array to the desired depth. Default is 1 level, but it can
concatenate multiple levels. E.g. Can be used to reduce array depth on `rows` lists after
doing `GROUP BY`.

```js
flat(list(1, 2, 3, list(4, 5), 6)) => list(1, 2, 3, 4, 5, 6)
flat(list(1, list(21, 22), list(list (311, 312, 313))), 4) => list(1, 21, 22, 311, 312, 313)
flat(rows.file.outlinks)) => All the file outlinks at first level in output
```

### `slice(array, [start, [end]])`

Returns a shallow copy of a portion of an array into a new array object selected from `start`
to `end` (`end` not included) where `start` and `end` represents the index of items in that array.

```js
slice([1, 2, 3, 4, 5], 3) = [4, 5] => All items from given position, 0 as first
slice(["ant", "bison", "camel", "duck", "elephant"], 0, 2) = ["ant", "bison"] => First two items
slice([1, 2, 3, 4, 5], -2) = [4, 5] => counts from the end, last two items
slice(someArray) => a copy of someArray
```

---

## String Operations

### `regextest(pattern, string)`

Checks if the given regex pattern can be found in the string (using the JavaScript regex engine).

```js
regextest("\w+", "hello") = true
regextest(".", "a") = true
regextest("yes|no", "maybe") = false
regextest("what", "what's up dog?") = true
```

### `regexmatch(pattern, string)`

Checks if the given regex pattern matches the *entire* string, using the JavaScript regex engine.
This differs from `regextest` in that regextest can match just parts of the text.

```js
regexmatch("\w+", "hello") = true
regexmatch(".", "a") = true
regexmatch("yes|no", "maybe") = false
regexmatch("what", "what's up dog?") = false
```

### `regexreplace(string, pattern, replacement)`

Replaces all instances where the *regex* `pattern` matches in `string`, with `replacement`. This uses the JavaScript
replace method under the hood, so you can use special characters like `$1` to refer to the first capture group, and so on.

```js
regexreplace("yes", "[ys]", "a") = "aea"
regexreplace("Suite 1000", "\d+", "-") = "Suite -"
```

### `replace(string, pattern, replacement)`

Replace all instances of `pattern` in `string` with `replacement`.

```js
replace("what", "wh", "h") = "hat"
replace("The big dog chased the big cat.", "big", "small") = "The small dog chased the small cat."
replace("test", "test", "no") = "no"
```

### `lower(string)`

Convert a string to all lower case.

```js
lower("Test") = "test"
lower("TEST") = "test"
```

### `upper(string)`

Convert a string to all upper case.

```js
upper("Test") = "TEST"
upper("test") = "TEST"
```

### `split(string, delimiter, [limit])`

Split a string on the given delimiter string. If a third argument is provided, it limits the number of splits that occur. The delimiter string is interpreted as a regular expression. If there are capture groups in the delimiter, matches are spliced into the result array, and non-matching captures are empty strings.


```js
split("hello world", " ") = list("hello", "world")
split("hello  world", "\s") = list("hello", "world")
split("hello there world", " ", 2) = list("hello", "there")
split("hello there world", "(t?here)") = list("hello ", "there", " world")
split("hello there world", "( )(x)?") = list("hello", " ", "", "there", " ", "", "world")
```

### `startswith(string, prefix)`

Checks if a string starts with the given prefix.

```js
startswith("yes", "ye") = true
startswith("path/to/something", "path/") = true
startswith("yes", "no") = false
```

### `endswith(string, suffix)`

Checks if a string ends with the given suffix.

```js
endswith("yes", "es") = true
endswith("path/to/something", "something") = true
endswith("yes", "ye") = false
```

### `padleft(string, length, [padding])`

Pads a string up to the desired length by adding padding on the left side. If you omit the padding character, spaces
will be used by default.

```js
padleft("hello", 7) = "  hello"
padleft("yes", 5, "!") = "!!yes"
```

### `padright(string, length, [padding])`

Equivalent to `padleft`, but pads to the right instead.

```js
padright("hello", 7) = "hello  "
padright("yes", 5, "!") = "yes!!"
```

### `substring(string, start, [end])`

Take a slice of a string, starting at `start` and ending at `end` (or the end of the string if unspecified).

```js
substring("hello", 0, 2) = "he"
substring("hello", 2, 4) = "ll"
substring("hello", 2) = "llo"
substring("hello", 0) = "hello"
```

### `truncate(string, length, [suffix])`

Truncate a string to be at most the given length, including the `suffix` (which defaults to `...`). Generally useful
to cut off long text in tables.

```js
truncate("Hello there!", 8) = "Hello..."
truncate("Hello there!", 8, "/") = "Hello t/"
truncate("Hello there!", 10) = "Hello t..."
truncate("Hello there!", 10, "!") = "Hello the!"
truncate("Hello there!", 20) = "Hello there!"
```

## Utility Functions

### `default(field, value)`

If `field` is null, return `value`; otherwise return `field`. Useful for replacing null values with defaults. For example, to show projects which haven't been completed yet, use `"incomplete"` as their default value:

```js
default(dateCompleted, "incomplete")
```

Default is vectorized in both arguments; if you need to use default explicitly on a list argument, use `ldefault`, which
is the same as default but is not vectorized.

```js
default(list(1, 2, null), 3) = list(1, 2, 3)
ldefault(list(1, 2, null), 3) = list(1, 2, null)
```

### `display()`

Display function converts the input into a string representation while trying to
preserve the display property of data types.
This means that links and urls will be replaced by their display value.


```js
display("Hello World") = "Hello World"
display("**Hello** World") = "Hello World"
display("[Hello](https://example.com) [[World]]") = "Hello World"
display(link("path/to/file.md")) = "file"
display(link("path/to/file.md", "displayname")) = "displayname"
display(date("2024-11-18")) = "November 18, 2024"
display(list("Hello", "World")) = "Hello, World"
```

### `choice(bool, left, right)`

A primitive if statement - if the first argument is truthy, returns left; otherwise, returns right.

```js
choice(true, "yes", "no") = "yes"
choice(false, "yes", "no") = "no"
choice(x > 4, y, z) = y if x > 4, else z
```

### `hash(seed, [text], [variant])`

Generate a hash based on the `seed`, and the optional extra `text` or a variant `number`. The function
generates a fixed number based on the combination of these parameters, which can be used to randomize
the sort order of files or lists/tasks. If you choose a `seed` based on a date, i.e. "2024-03-17",
or another timestamp, i.e. "2024-03-17 19:13", you can make the "randomness" be fixed
related to that timestamp. `variant` is a number, which in some cases is needed to make the combination of
`text` and `variant` become unique.

```js
hash(dateformat(date(today), "YYYY-MM-DD"), file.name) = ... A unique value for a given date in time
hash(dateformat(date(today), "YYYY-MM-DD"), file.name, position.start.line) = ... A unique "random" value in a TASK query
```

This function can be used in a `SORT` statement to randomize the order. If you're using a `TASK` query,
since the file name could be the same for multiple tasks, you can add some number like the starting line
number (as shown above) to make it a unique combination. If using something like `FLATTEN file.lists as item`,
the similar addition would be to do `item.position.start.line` as the last parameter.

### `striptime(date)`

Strip the time component of a date, leaving only the year, month, and day. Good for date comparisons if you don't care
about the time.

```js
striptime(file.ctime) = file.cday
striptime(file.mtime) = file.mday
```

### `dateformat(date|datetime, string)`

Format a Dataview date using a formatting string. Uses [Luxon tokens](https://moment.github.io/luxon/#/formatting?id=table-of-tokens).

```js
dateformat(file.ctime,"yyyy-MM-dd") = "2022-01-05"
dateformat(file.ctime,"HH:mm:ss") = "12:18:04"
dateformat(date(now),"x") = "1407287224054"
dateformat(file.mtime,"ffff") = "Wednesday, August 6, 2014, 1:07 PM Eastern Daylight Time"
```

**Note:** `dateformat()` returns a string, not a date, so you can't compare it against the result from a call to `date()` or a variable like `file.day` which already is a date. To make those comparisons you can format both arguments.

### `durationformat(duration, string)`

Format a Dataview duration using a formatting string.
Anything inside single quotes will not be treated as a token and
instead will be shown in the output as written. See examples.

You may use these tokens:

- `S` for milliseconds
- `s` for seconds
- `m` for minutes
- `h` for hours
- `d` for days
- `w` for weeks
- `M` for months
- `y` for years

```js
durationformat(dur("3 days 7 hours 43 seconds"), "ddd'd' hh'h' ss's'") = "003d 07h 43s"
durationformat(dur("365 days 5 hours 49 minutes"), "yyyy ddd hh mm ss") = "0001 000 05 49 00"
durationformat(dur("2000 years"), "M months") = "24000 months"
durationformat(dur("14d"), "s 'seconds'") = "1209600 seconds"
```

### `currencyformat(number, [currency])`

Presents the number depending on your current locale, according to the `currency` code, from [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#List_of_ISO_4217_currency_codes).

```
number = 123456.789
currencyformat(number, "EUR") =  €123,456.79  in locale: en_US)
currencyformat(number, "EUR") =  123.456,79 € in locale: de_DE)
currencyformat(number, "EUR") =  € 123 456,79 in locale: nb)
```

### `localtime(date)`

Converts a date in a fixed timezone to a date in the current timezone.

### `meta(link)`

Get an object containing metadata of a link. When you access a property on a link what you get back is the property
value from the linked file. The `meta` function makes it possible to access properties of the link itself.

There are several properties on the object returned by `meta`:

#### `meta(link).display`

Get the display text of a link, or null if the link does not have defined display text.

```js
meta([[2021-11-01|Displayed link text]]).display = "Displayed link text"
meta([[2021-11-01]]).display = null
```

#### `meta(link).embed`

True or false depending on whether the link is an embed. Those are links that begin with an exclamation mark, like
`![[Some Link]]`.

#### `meta(link).path`

Get the path portion of a link.

```js
meta([[My Project]]).path = "My Project"
meta([[My Project#Next Actions]]).path = "My Project"
meta([[My Project#^9bcbe8]]).path = "My Project"
```

#### `meta(link).subpath`

Get the subpath of a link. For links to a heading within a file the subpath will be the text of the heading. For links
to a block the subpath will be the block ID. If neither of those cases applies then the subpath will be null.

```js
meta([[My Project#Next Actions]]).subpath = "Next Actions"
meta([[My Project#^9bcbe8]]).subpath = "9bcbe8"
meta([[My Project]]).subpath = null
```

This can be used to select tasks under specific headings.

```dataview
task
where meta(section).subpath = "Next Actions"
```

#### `meta(link).type`

Has the value "file", "header", or "block" depending on whether the link links to an entire file, a heading within
a file, or to a block within a file.

```js
meta([[My Project]]).type = "file"
meta([[My Project#Next Actions]]).type = "header"
meta([[My Project#^9bcbe8]]).type = "block"
```