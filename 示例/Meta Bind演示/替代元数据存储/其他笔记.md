### 其他笔记 - 替代存储演示

这个输入字段绑定到全局内存缓存。

`INPUT[text:globalMemory^test]`

`VIEW[{globalMemory^test} 123][text:globalMemory^test123]`

这个输入字段绑定到单文件内存缓存。

`INPUT[text:memory^test]`

`VIEW[{memory^test} 123][text:memory^test123]`

`VIEW[{memory^test123}456][text]`