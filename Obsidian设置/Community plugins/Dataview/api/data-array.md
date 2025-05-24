# 数据数组

Dataview中结果列表的一般表示是`DataArray`，它是JavaScript数组的[代理](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy)版本，具有扩展功能。数据数组支持索引和迭代（通过`for`和`for ... of`循环），就像普通数组一样，但也包括许多数据操作运算符，如`sort`、`groupBy`、`distinct`、`where`等，以使操作表格数据更容易。

## 创建

大多数可以返回多个结果的Dataview API（如`dv.pages()`）都会返回数据数组。您也可以使用`dv.array(<array>)`将普通JavaScript数组显式转换为Dataview数组。如果您想将数据数组转换回普通数组，请使用`DataArray#array()`。

## 索引和变换

数据数组支持像普通数组一样的常规索引（如`array[0]`），但重要的是，它们还支持查询语言风格的"变换"：如果您使用字段名称（如`array.field`）索引到数据数组中，它会自动将数组中的每个元素映射到`field`，如果`field`本身也是数组，则展平`field`。

例如，`dv.pages().file.name`将返回库中所有文件名的数据数组；`dv.pages("#books").genres`将返回书籍中所有流派的展平列表。

## 原始接口

下面提供了数据数组实现的完整接口供参考：

```ts
/** 将数组元素映射到某个值的函数。 */
export type ArrayFunc<T, O> = (elem: T, index: number, arr: T[]) => O;

/** 比较两个类型的函数。 */
export type ArrayComparator<T> = (a: T, b: T) => number;

/**
 * 允许操作基于数组的数据的代理接口。数据数组上的所有函数都产生一个新数组
 * （即，数组是不可变的）。
 */
export interface DataArray<T> {
    /** 数组中元素的总数。 */
    length: number;

    /** 将数据数组筛选为仅匹配给定谓词的元素。 */
    where(predicate: ArrayFunc<T, boolean>): DataArray<T>;
    /** 'where'的别名，适用于想要数组语义的人。 */
    filter(predicate: ArrayFunc<T, boolean>): DataArray<T>;

    /** 通过对每个元素应用函数来映射数据数组中的元素。 */
    map<U>(f: ArrayFunc<T, U>): DataArray<U>;
    /** 通过对每个元素应用函数来映射数据数组中的元素，然后展平结果以产生新数组。 */
    flatMap<U>(f: ArrayFunc<T, U[]>): DataArray<U>;
    /** 可变地更改数组中的每个值，返回可以进一步链式调用的相同数组。 */
    mutate(f: ArrayFunc<T, any>): DataArray<any>;

    /** 将数组中的条目总数限制为给定值。 */
    limit(count: number): DataArray<T>;
    /**
     * 获取数组的切片。如果`start`未定义，则假定为0；如果`end`未定义，则假定为数组的末尾。
     */
    slice(start?: number, end?: number): DataArray<T>;
    /** 将此数据数组中的值与另一个可迭代对象/数据数组/数组的值连接起来。 */
    concat(other: Iterable<T>): DataArray<T>;

    /** 返回给定元素的第一个索引（可选择开始搜索的位置） */
    indexOf(element: T, fromIndex?: number): number;
    /** 返回满足给定谓词的第一个元素。 */
    find(pred: ArrayFunc<T, boolean>): T | undefined;
    /** 查找满足给定谓词的第一个元素的索引。如果没有找到则返回-1。 */
    findIndex(pred: ArrayFunc<T, boolean>, fromIndex?: number): number;
    /** 如果数组包含给定元素则返回true，否则返回false。 */
    includes(element: T): boolean;

    /**
     * 通过将数组中的每个元素转换为字符串，并用给定的分隔符（默认为', '）连接它们来返回字符串。
     */
    join(sep?: string): string;

    /**
     * 返回按给定键排序的已排序数组；可以提供可选的比较器，它将用于比较键以代替默认的dataview比较器。
     */
    sort<U>(key: ArrayFunc<T, U>, direction?: "asc" | "desc", comparator?: ArrayComparator<U>): DataArray<T>;

    /**
     * 返回按给定键分组的数组；结果数组将具有形式为{ key: <键值>, rows: DataArray }的对象。
     */
    groupBy<U>(key: ArrayFunc<T, U>, comparator?: ArrayComparator<U>): DataArray<{ key: U; rows: DataArray<T> }>;

    /**
     * 返回不同的条目。如果提供了键，则返回具有不同键的行。
     */
    distinct<U>(key?: ArrayFunc<T, U>, comparator?: ArrayComparator<U>): DataArray<T>;

    /** 如果谓词对所有值都为真则返回true。 */
    every(f: ArrayFunc<T, boolean>): boolean;
    /** 如果谓词对至少一个值为真则返回true。 */
    some(f: ArrayFunc<T, boolean>): boolean;
    /** 如果谓词对所有值都为假则返回true。 */
    none(f: ArrayFunc<T, boolean>): boolean;

    /** 返回数据数组中的第一个元素。如果数组为空则返回undefined。 */
    first(): T;
    /** 返回数据数组中的最后一个元素。如果数组为空则返回undefined。 */
    last(): T;

    /** 将此数据数组中的每个元素映射到给定键，然后展平它。*/
    to(key: string): DataArray<any>;
    /**
     * 递归展开给定键，基于键将树结构展平为平面数组。对于处理层次数据（如具有'子任务'的任务）很有用。
     */
    expand(key: string): DataArray<any>;

    /** 对数组中的每个元素运行lambda函数。 */
    forEach(f: ArrayFunc<T, void>): void;

    /** 计算数组中元素的总和。 */
    sum(): number;

    /** 计算数组中元素的平均值。 */
    avg(): number;

    /** 计算数组中元素的最小值。 */
    min(): number;

    /** 计算数组中元素的最大值。 */
    max(): number;

    /** 将其转换为普通的javascript数组。 */
    array(): T[];

    /** 允许直接在数组上迭代。 */
    [Symbol.iterator](): Iterator<T>;

    /** 将索引映射到值。 */
    [index: number]: any;
    /** 字段的自动展平。等效于隐式调用`array.to("field")` */
    [field: string]: any;
}
```
