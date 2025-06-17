```ad-note
这插件似乎在Windows上执行python代码有问题，下面python代码如果运行报错是正常的，等待项目作者修复吧
```

## 🚀 插件概述

Execute Code 插件的主要特点：
- ⚡ **即时执行**：点击按钮即可运行代码
- 🌐 **多语言支持**：Python、JavaScript、Shell、R、Rust等
- 📊 **结果显示**：直接在笔记中显示执行结果
- 🔧 **环境配置**：可自定义执行环境
- 📁 **代码管理**：组织和重用代码片段

---

## 📝 基础用法

### Python 示例

```python
# -*- coding: utf-8 -*-
# 基本计算和输出
print("Python Code Execution Demo")
print("=" * 30)

# 数学计算
result = 2 ** 10
print(f"2^10 = {result}")

# 列表操作
numbers = [1, 2, 3, 4, 5]
squared = [x**2 for x in numbers]
print(f"Squared list: {squared}")

# 字符串处理
text = "Hello Obsidian!"
print(f"Reversed: {text[::-1]}")
```

### JavaScript 示例

```javascript
// JavaScript 基础演示
console.log("🌟 JavaScript 代码执行演示");
console.log("=".repeat(30));

// 对象和数组操作
const tasks = [
    { name: "学习 Obsidian", completed: true },
    { name: "练习编程", completed: false },
    { name: "写文档", completed: true }
];

// 统计完成的任务
const completedTasks = tasks.filter(task => task.completed);
console.log(`已完成任务数量: ${completedTasks.length}`);

// 函数定义和调用
function fibonacci(n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

console.log(`斐波那契数列前10项:`);
for (let i = 0; i < 10; i++) {
    console.log(`F(${i}) = ${fibonacci(i)}`);
}
```

### Shell 脚本示例

```bash
#!/bin/bash
# Shell 脚本演示

echo "🐚 Shell 脚本执行演示"
echo "========================"

# 系统信息
echo "当前目录: $(pwd)"
echo "当前用户: $(whoami)"
echo "当前时间: $(date)"

# 文件操作演示（安全的临时操作）
echo "创建临时文件演示:"
temp_file="/tmp/obsidian_demo.txt"
echo "Hello from Obsidian Execute Code!" > "$temp_file"
echo "文件内容: $(cat $temp_file)"
rm "$temp_file"
echo "临时文件已清理"
```

---

## 📊 数据分析示例

### Python 数据处理

```python
# -*- coding: utf-8 -*-
import json
from datetime import datetime, timedelta

# Simulate learning data
learning_data = {
    "Obsidian": {"hours": 25, "difficulty": 7, "progress": 85},
    "Python": {"hours": 40, "difficulty": 8, "progress": 70},
    "JavaScript": {"hours": 30, "difficulty": 6, "progress": 65},
    "DataAnalysis": {"hours": 20, "difficulty": 9, "progress": 45}
}

print("Learning Progress Analysis")
print("=" * 40)

# Calculate total learning time
total_hours = sum(data["hours"] for data in learning_data.values())
print(f"Total hours: {total_hours}")

# Find the most difficult subject
hardest_subject = max(learning_data.items(), key=lambda x: x[1]["difficulty"])
print(f"Hardest: {hardest_subject[0]} (difficulty: {hardest_subject[1]['difficulty']}/10)")

# Calculate average progress
avg_progress = sum(data["progress"] for data in learning_data.values()) / len(learning_data)
print(f"Average progress: {avg_progress:.1f}%")

# Recommend next step
incomplete = [(name, data) for name, data in learning_data.items() if data["progress"] < 80]
incomplete.sort(key=lambda x: x[1]["progress"], reverse=True)

if incomplete:
    next_study = incomplete[0]
    print(f"Recommend: {next_study[0]} (progress: {next_study[1]['progress']}%)")
```

### 简单数据可视化

```python
# -*- coding: utf-8 -*-
# Simple ASCII chart
def create_bar_chart(data, title="Chart"):
    print(f"\n{title}")
    print("-" * 50)
    
    max_value = max(data.values())
    
    for label, value in data.items():
        bar_length = int((value / max_value) * 30)
        bar = "█" * bar_length + "░" * (30 - bar_length)
        print(f"{label:12} |{bar}| {value}")

# Learning data
learning_data = {
    "Obsidian": {"hours": 25, "progress": 85},
    "Python": {"hours": 40, "progress": 70},
    "JavaScript": {"hours": 30, "progress": 65},
    "DataAnalysis": {"hours": 20, "progress": 45}
}

# Create charts
progress_data = {name: data["progress"] for name, data in learning_data.items()}
create_bar_chart(progress_data, "Progress Comparison")

hours_data = {name: data["hours"] for name, data in learning_data.items()}
create_bar_chart(hours_data, "Hours Comparison")
```

---

## 🎯 实用工具示例

### 密码生成器

```python
# -*- coding: utf-8 -*-
import random
import string

def generate_password(length=12, include_symbols=True):
    """Generate secure password"""
    chars = string.ascii_letters + string.digits
    if include_symbols:
        chars += "!@#$%^&*"
    
    password = ''.join(random.choice(chars) for _ in range(length))
    return password

def check_password_strength(password):
    """Check password strength"""
    score = 0
    feedback = []
    
    if len(password) >= 8:
        score += 1
    else:
        feedback.append("At least 8 characters")
    
    if any(c.isupper() for c in password):
        score += 1
    else:
        feedback.append("Include uppercase")
        
    if any(c.islower() for c in password):
        score += 1
    else:
        feedback.append("Include lowercase")
        
    if any(c.isdigit() for c in password):
        score += 1
    else:
        feedback.append("Include digits")
        
    if any(c in "!@#$%^&*" for c in password):
        score += 1
    else:
        feedback.append("Include symbols")
    
    strength = ["Very Weak", "Weak", "Fair", "Strong", "Very Strong"][score]
    
    return score, strength, feedback

# Generate and analyze passwords
print("Password Generator Demo")
print("=" * 30)

for i in range(3):
    pwd = generate_password(12, True)
    score, strength, tips = check_password_strength(pwd)
    print(f"\nPassword {i+1}: {pwd}")
    print(f"Strength: {strength} ({score}/5)")
    if tips:
        print(f"Tips: {', '.join(tips)}")
```

### 时间计算器

```python
# -*- coding: utf-8 -*-
from datetime import datetime, timedelta

def time_calculator():
    """Time calculator tool"""
    print("Time Calculator")
    print("=" * 25)
    
    # Current time
    now = datetime.now()
    print(f"Current time: {now.strftime('%Y-%m-%d %H:%M:%S')}")
    
    # Important dates calculation
    important_dates = {
        "New Year": datetime(2025, 1, 1),
        "Spring Festival": datetime(2025, 1, 29),
        "Labor Day": datetime(2025, 5, 1),
        "National Day": datetime(2025, 10, 1)
    }
    
    print("\nDays to important holidays:")
    for event, date in important_dates.items():
        if date > now:
            delta = date - now
            print(f"{event}: {delta.days} days {delta.seconds//3600} hours")
    
    # Study time planning
    print("\nStudy time planning:")
    study_plan = [
        ("Daily review", timedelta(hours=1)),
        ("Weekend deep learning", timedelta(hours=4)),
        ("Monthly summary", timedelta(days=1))
    ]
    
    for activity, duration in study_plan:
        end_time = now + duration
        print(f"{activity}: {duration} -> End time {end_time.strftime('%H:%M')}")

time_calculator()
```

---

## 🔧 文件操作示例

### 文本处理工具

```python
# -*- coding: utf-8 -*-
import re
from collections import Counter

def text_analyzer(text):
    """Text analysis tool"""
    print("Text Analysis Results")
    print("=" * 25)
    
    # Basic statistics
    words = re.findall(r'\b\w+\b', text.lower())
    chars = len(text)
    lines = text.count('\n') + 1
    
    print(f"Characters: {chars}")
    print(f"Words: {len(words)}")
    print(f"Lines: {lines}")
    
    # Word frequency statistics
    word_freq = Counter(words)
    print(f"\nMost common words (top 5):")
    for word, freq in word_freq.most_common(5):
        print(f"  {word}: {freq} times")
    
    # Readability assessment
    avg_word_length = sum(len(word) for word in words) / len(words) if words else 0
    print(f"\nAverage word length: {avg_word_length:.1f} characters")
    
    return word_freq

# Example text analysis
sample_text = """
Obsidian is a powerful note-taking application that uses linked thought.
It helps you organize your knowledge and ideas effectively.
With plugins like Execute Code, you can run code directly in your notes.
This makes Obsidian perfect for learning programming and data analysis.
"""

analyzer_result = text_analyzer(sample_text)
```

### JSON 数据处理

```javascript
// JSON 数据处理示例
console.log("🗂️ JSON 数据处理演示");

// 模拟API响应数据
const apiData = {
    "users": [
        {"id": 1, "name": "张三", "role": "开发者", "score": 95},
        {"id": 2, "name": "李四", "role": "设计师", "score": 88},
        {"id": 3, "name": "王五", "role": "产品经理", "score": 92},
        {"id": 4, "name": "赵六", "role": "开发者", "score": 89}
    ],
    "timestamp": "2024-01-15T10:30:00Z"
};

// 数据筛选和统计
const developers = apiData.users.filter(user => user.role === "开发者");
console.log(`开发者数量: ${developers.length}`);

const avgScore = apiData.users.reduce((sum, user) => sum + user.score, 0) / apiData.users.length;
console.log(`平均分数: ${avgScore.toFixed(2)}`);

// 生成报告
const report = {
    "总用户数": apiData.users.length,
    "平均分数": Math.round(avgScore),
    "最高分用户": apiData.users.reduce((max, user) => user.score > max.score ? user : max),
    "角色分布": {}
};

// 统计角色分布
apiData.users.forEach(user => {
    report["角色分布"][user.role] = (report["角色分布"][user.role] || 0) + 1;
});

console.log("\n📊 数据报告:");
console.log(JSON.stringify(report, null, 2));
```

---

## 🎨 创意应用

### ASCII 艺术生成器

```python
# -*- coding: utf-8 -*-
def create_ascii_art(text, style="*"):
    """Generate ASCII art text"""
    
    # Simple ASCII font mapping
    font_map = {
        'A': ["  *  ", " *** ", "*   *", "*****", "*   *"],
        'B': ["**** ", "*   *", "**** ", "*   *", "**** "],
        'C': [" ****", "*    ", "*    ", "*    ", " ****"],
        'O': [" *** ", "*   *", "*   *", "*   *", " *** "],
        'D': ["**** ", "*   *", "*   *", "*   *", "**** "],
        'E': ["*****", "*    ", "***  ", "*    ", "*****"],
        ' ': ["     ", "     ", "     ", "     ", "     "]
    }
    
    text = text.upper()
    height = 5
    
    # Generate each line
    lines = []
    for row in range(height):
        line = ""
        for char in text:
            if char in font_map:
                line += font_map[char][row] + " "
            else:
                line += "????? "
        lines.append(line)
    
    return "\n".join(lines)

# Generate title art
title_art = create_ascii_art("CODE")
print("ASCII Art Generator")
print("=" * 30)
print(title_art)

# Generate border
def create_border(text, char="*"):
    """Create decorative border for text"""
    lines = text.split('\n')
    max_width = max(len(line) for line in lines)
    
    border = char * (max_width + 4)
    result = [border]
    
    for line in lines:
        padded_line = line.ljust(max_width)
        result.append(f"{char} {padded_line} {char}")
    
    result.append(border)
    return '\n'.join(result)

bordered_text = create_border("Execute Code Plugin\nPowerful Code Executor", "*")
print(f"\n{bordered_text}")
```

### 随机名言生成器

```python
# -*- coding: utf-8 -*-
import random

# Programming quotes library
programming_quotes = [
    {
        "quote": "Code is like humor. When you have to explain it, it's bad.",
        "author": "Cory House"
    },
    {
        "quote": "Programs must be written for people to read, and only incidentally for machines to execute.",
        "author": "Harold Abelson"
    },
    {
        "quote": "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.",
        "author": "Martin Fowler"
    },
    {
        "quote": "Experience is a hard teacher because she gives the test first, the lesson afterward.",
        "author": "Vernon Law"
    },
    {
        "quote": "The greatest enemy of learning is knowing.",
        "author": "John Maxwell"
    }
]

def generate_daily_quote():
    """Generate daily programming quote"""
    quote_data = random.choice(programming_quotes)
    
    print("Daily Programming Quote")
    print("=" * 30)
    print(f'"{quote_data["quote"]}"')
    print(f"\n— {quote_data['author']}")
    
    # Add decoration
    print("\n" + "*" * 15)

generate_daily_quote()
```

---

## ⚙️ 使用技巧

### 1. 插件设置建议

```yaml
# 推荐的Execute Code配置
languages:
  python: 
    command: "python"
    timeout: 30
  javascript:
    command: "node"
    timeout: 10
  shell:
    command: "bash"
    timeout: 15

# 安全设置
allow_input: false
max_execution_time: 60
auto_save: true
```

### 2. 常用代码模板

```python
# -*- coding: utf-8 -*-
# Python quick template
def quick_analysis(data):
    """Quick data analysis template"""
    print("Data Analysis Results")
    print("-" * 20)
    # Add your analysis code here
    pass

# Usage example
# quick_analysis(your_data)
```

### 3. 调试技巧

```javascript
// JavaScript 调试模板
function debugInfo(variable, label = "Debug") {
    console.log(`🐛 ${label}:`, typeof variable, variable);
    if (typeof variable === 'object' && variable !== null) {
        console.log("属性:", Object.keys(variable));
    }
}

// 使用示例
const testData = {name: "测试", value: 42};
debugInfo(testData, "测试数据");
```

---

## 🌟 总结

Execute Code 插件为 Obsidian 带来了强大的代码执行能力，让笔记不再只是静态文本，而成为了可交互的知识载体。

### 主要优势：
- 🚀 **即时反馈**：立即看到代码运行结果
- 📚 **学习利器**：边学边练，效果加倍
- 🔬 **实验平台**：快速验证想法和概念
- 📊 **数据处理**：在笔记中直接分析数据
- 🎯 **提升效率**：减少工具切换，专注思考

### 使用建议：
1. **合理使用**：避免执行危险或耗时的代码
2. **版本控制**：重要代码建议备份
3. **安全意识**：不要执行不信任的代码
4. **性能考虑**：大量计算建议在专门环境中进行

通过 Execute Code 插件，Obsidian 真正成为了程序员和数据分析师的全能工具！

---

*💡 提示：记得在插件设置中配置好各种编程语言的执行环境，享受在笔记中编程的乐趣！* 

## 设置项解释

![[Pasted image 20250604194430.png]]
### General Settings (常规设置)

1. **Timeout (in seconds) / 超时 (秒)**

    - **解释**: 这个设置项允许你指定一个时间限制 (以秒为单位)，超过这个时间后，正在执行的代码程序将被自动关闭。

    - **目的**: 主要目的是防止代码陷入无限循环或执行时间过长导致 Obsidian 卡死或资源过度消耗。例如，设置为 `10` 表示如果一段代码运行超过10秒钟，插件会自动终止它。

2. **Allow Input / 允许输入**

    - **解释**: 这个开关决定了在运行代码块时，是否会提供一个标准输入 (stdin) 的输入框。

    - **目的**: 如果你的代码需要用户在运行时输入数据 (例如，Python 中的 `input()` 函数或 C++ 中的 `std::cin`)，你需要开启这个选项。开启后，执行这类代码时通常会弹出一个输入框让你输入内容。关闭此选项后，需要输入的代码可能会直接报错或无法按预期工作。

    - **注意**: 更改此设置后，通常需要刷新 Obsidian (或者重启 Obsidian) 才能生效。

3. **WSL Mode / WSL 模式**

    - **解释**: 这个开关决定了是否在 Windows Subsystem for Linux (WSL) 环境中运行代码。

    - **目的**: 如果你在 Windows 系统上，并且安装了 WSL，同时希望你的代码（尤其是那些依赖 Linux 环境或工具链的脚本，如 Shell 脚本）在 WSL 环境中执行，那么可以开启这个选项。

    - **注意**: 如果你没有安装 WSL，或者不确定这是什么，请不要开启此选项，否则代码可能无法执行。

4. **[Experimental] Persistent Output / [实验性] 持久化输出**

    - **解释**: 这是一个实验性功能。如果启用，代码块的输出结果将被直接写入 Markdown 文件本身。

    - **目的**: 通常情况下，代码执行的输出是动态显示的，并不会保存到 `.md` 文件中。启用此选项后，输出会成为笔记内容的一部分，即使关闭并重新打开笔记，输出依然存在。这对于希望将代码结果固化在文档中的场景很有用。

    - **注意**: 因为是实验性功能，它可能不像其他功能那样稳定，使用时可能会遇到一些预期之外的行为或 bug。

  

---

  

### Language-Specific Settings (特定语言设置)

  

- **解释**: 这个区域允许你为不同的编程语言进行特定的配置。图片中显示了 "Javascript" 作为例子，并且有一个下拉箭头，暗示你可以选择其他语言进行设置。

- **目的**: 不同语言的执行可能需要不同的环境、编译器/解释器路径或其他参数。例如：

    - 对于 Python，你可能需要指定 Python 解释器的路径 (例如 `C:\Python39\python.exe` 或 `/usr/bin/python3`)。

    - 对于 C++，可能需要指定编译器路径和编译参数。

    - 对于 JavaScript (Node.js)，可能需要指定 Node 的路径。

- **操作**: 通常你需要从下拉列表中选择你想要配置的语言，然后插件会展现出针对该语言的可配置项。

  

---

  

![[Pasted image 20250604195008.png]]

  

### JavaScript / Node Settings (JavaScript / Node 设置)

  

这些设置专门用于配置 JavaScript 代码（通常是通过 Node.js 环境）的执行方式。

  

1. **Node path / Node 路径**

    - **解释**: 这个设置项允许你指定 `node` 可执行文件的路径。

    - **默认值**: 图片中显示默认值为 `node`。这意味着插件会假定 `node` 命令已经在你的系统环境变量 `PATH` 中配置好了，可以直接通过在终端输入 `node` 来调用。

    - **目的**: 如果你的 Node.js 安装在非标准位置，或者你希望使用特定版本的 Node.js (例如通过 nvm 等版本管理器管理，且未设置为全局默认)，你可能需要在这里填写 `node` 可执行文件的完整路径。

        - 例如，在 Windows 上可能类似：`C:\Program Files\nodejs\node.exe`

        - 在 macOS 或 Linux 上可能类似：`/usr/local/bin/node` 或 `~/.nvm/versions/node/v18.17.0/bin/node`

    - **如果留空或设为 `node`**: 插件会尝试从系统路径中找到 Node.js。如果找不到，执行 JavaScript 代码块时会失败。

2. **Node arguments / Node 参数**

    - **解释**: 在这里，你可以指定在执行 Node.js 时传递给 `node` 命令的额外参数。

    - **目的**: 这允许你启用 Node.js 的特定功能或标志。例如：

        - 你可能想传递一些 V8引擎的选项 (如 `--harmony` 来启用一些实验性的 JavaScript 特性)。

        - 指定内存限制 (如 `--max-old-space-size=4096` 来设置最大老生代内存为 4GB)。

        - 启用调试模式相关的参数。

    - **示例**: 如果你想启用所有 staging (harmony) 特性，可以填入 `--harmony`。

3. **Run Javascript blocks in Notebook Mode / 在 Notebook 模式下运行 JavaScript 代码块**

    - **解释**: 这是一个开关选项，决定了 JavaScript 代码块的执行上下文和持久性，模拟了类似 Jupyter Notebook 的行为。

    - **目的**:

        - **开启状态 (如图片所示)**:

            - **状态持久化**: 在同一个笔记中，一个 JavaScript 代码块中定义的变量、函数或进行的状态修改，可以被后续的 JavaScript 代码块访问和使用。就像在一个连续的 Notebook session 中运行代码一样。

            - **适合场景**: 当你希望将一个复杂的 JavaScript 任务分解到多个代码块中，并且后续代码块依赖于前面代码块的执行结果时，此模式非常有用。

        - **关闭状态**:

            - **独立执行**: 每个 JavaScript 代码块都会在一个全新的、隔离的 Node.js 环境中执行。一个代码块中的变量或状态不会影响到其他代码块。

            - **适合场景**: 当你希望每个代码块都是完全独立的，或者不希望不同代码块之间产生意外的相互影响时。

    - **注意**: 启用 Notebook 模式可能会消耗更多资源，因为需要维护一个持续的执行上下文。

4. **Inject Javascript code / 注入 JavaScript 代码**

    - **解释**: 这个文本框允许你输入一段 JavaScript 代码，这段代码会在**每个** JavaScript 代码块执行之前自动添加到其顶部。

    - **目的**:

        - **通用初始化**: 如果你有很多 JavaScript 代码块都需要相同的初始设置、导入相同的模块、或者定义一些通用的辅助函数，你可以把这些通用代码放在这里。这样就无需在每个代码块中重复编写它们。

        - **全局配置**: 例如，你可以预设一些全局变量或配置。

    - **示例**:

        JavaScript

        ```
        // 示例：自动引入常用的 'fs' 和 'path' 模块

        const fs = require('fs');

        const path = require('path');

        console.log('Global setup executed.');
        ```

        如果你在这里输入了上面的代码，那么你笔记中的任何可执行 JavaScript 代码块在实际运行时，都会先执行这段注入的代码。

  

---

  

这些针对 JavaScript 和 Node.js 的特定设置，使得用户可以更灵活地控制 JavaScript 代码在 Obsidian 笔记中的执行环境和行为，无论是简单的脚本测试，还是更复杂的、具有上下文依赖的 Notebook 式执行流程。