
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
# 基本计算和输出
print("🐍 Python 代码执行演示")
print("=" * 30)

# 数学计算
result = 2 ** 10
print(f"2的10次方 = {result}")

# 列表操作
numbers = [1, 2, 3, 4, 5]
squared = [x**2 for x in numbers]
print(f"平方数列表: {squared}")

# 字符串处理
text = "Hello Obsidian!"
print(f"反转字符串: {text[::-1]}")
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
import json
from datetime import datetime, timedelta

# 模拟学习数据
learning_data = {
    "Obsidian": {"hours": 25, "difficulty": 7, "progress": 85},
    "Python": {"hours": 40, "difficulty": 8, "progress": 70},
    "JavaScript": {"hours": 30, "difficulty": 6, "progress": 65},
    "数据分析": {"hours": 20, "difficulty": 9, "progress": 45}
}

print("📊 学习进度分析")
print("=" * 40)

# 计算总学习时间
total_hours = sum(data["hours"] for data in learning_data.values())
print(f"总学习时间: {total_hours} 小时")

# 找出最难的科目
hardest_subject = max(learning_data.items(), key=lambda x: x[1]["difficulty"])
print(f"最难科目: {hardest_subject[0]} (难度: {hardest_subject[1]['difficulty']}/10)")

# 计算平均进度
avg_progress = sum(data["progress"] for data in learning_data.values()) / len(learning_data)
print(f"平均进度: {avg_progress:.1f}%")

# 推荐下一步学习
incomplete = [(name, data) for name, data in learning_data.items() if data["progress"] < 80]
incomplete.sort(key=lambda x: x[1]["progress"], reverse=True)

if incomplete:
    next_study = incomplete[0]
    print(f"\n💡 建议优先学习: {next_study[0]} (当前进度: {next_study[1]['progress']}%)")
```

### 简单数据可视化

```python
# 创建简单的ASCII图表
def create_bar_chart(data, title="图表"):
    print(f"\n📈 {title}")
    print("-" * 50)
    
    max_value = max(data.values())
    
    for label, value in data.items():
        bar_length = int((value / max_value) * 30)
        bar = "█" * bar_length + "░" * (30 - bar_length)
        print(f"{label:12} |{bar}| {value}")

# 使用学习数据创建图表
progress_data = {name: data["progress"] for name, data in learning_data.items()}
create_bar_chart(progress_data, "学习进度对比")

hours_data = {name: data["hours"] for name, data in learning_data.items()}
create_bar_chart(hours_data, "学习时间对比")
```

---

## 🎯 实用工具示例

### 密码生成器

```python
import random
import string

def generate_password(length=12, include_symbols=True):
    """生成安全密码"""
    chars = string.ascii_letters + string.digits
    if include_symbols:
        chars += "!@#$%^&*"
    
    password = ''.join(random.choice(chars) for _ in range(length))
    return password

def check_password_strength(password):
    """检查密码强度"""
    score = 0
    feedback = []
    
    if len(password) >= 8:
        score += 1
    else:
        feedback.append("密码长度至少8位")
    
    if any(c.isupper() for c in password):
        score += 1
    else:
        feedback.append("包含大写字母")
        
    if any(c.islower() for c in password):
        score += 1
    else:
        feedback.append("包含小写字母")
        
    if any(c.isdigit() for c in password):
        score += 1
    else:
        feedback.append("包含数字")
        
    if any(c in "!@#$%^&*" for c in password):
        score += 1
    else:
        feedback.append("包含特殊字符")
    
    strength = ["很弱", "弱", "一般", "强", "很强"][score]
    
    return score, strength, feedback

# 生成并分析密码
print("🔐 密码生成器演示")
print("=" * 30)

for i in range(3):
    pwd = generate_password(12, True)
    score, strength, tips = check_password_strength(pwd)
    print(f"\n密码 {i+1}: {pwd}")
    print(f"强度: {strength} ({score}/5)")
    if tips:
        print(f"建议: {', '.join(tips)}")
```

### 时间计算器

```python
from datetime import datetime, timedelta

def time_calculator():
    """时间计算工具"""
    print("⏰ 时间计算器")
    print("=" * 25)
    
    # 当前时间
    now = datetime.now()
    print(f"当前时间: {now.strftime('%Y-%m-%d %H:%M:%S')}")
    
    # 重要日期计算
    important_dates = {
        "新年": datetime(2025, 1, 1),
        "春节": datetime(2025, 1, 29),
        "劳动节": datetime(2025, 5, 1),
        "国庆节": datetime(2025, 10, 1)
    }
    
    print("\n📅 距离重要节日:")
    for event, date in important_dates.items():
        if date > now:
            delta = date - now
            print(f"{event}: {delta.days} 天 {delta.seconds//3600} 小时")
    
    # 学习时间规划
    print("\n📚 学习时间规划:")
    study_plan = [
        ("每日复习", timedelta(hours=1)),
        ("周末深度学习", timedelta(hours=4)),
        ("月度总结", timedelta(days=1))
    ]
    
    for activity, duration in study_plan:
        end_time = now + duration
        print(f"{activity}: {duration} -> 结束时间 {end_time.strftime('%H:%M')}")

time_calculator()
```

---

## 🔧 文件操作示例

### 文本处理工具

```python
import re
from collections import Counter

def text_analyzer(text):
    """文本分析工具"""
    print("📝 文本分析结果")
    print("=" * 25)
    
    # 基本统计
    words = re.findall(r'\b\w+\b', text.lower())
    chars = len(text)
    lines = text.count('\n') + 1
    
    print(f"字符数: {chars}")
    print(f"单词数: {len(words)}")
    print(f"行数: {lines}")
    
    # 词频统计
    word_freq = Counter(words)
    print(f"\n🔥 最常用词汇 (前5个):")
    for word, freq in word_freq.most_common(5):
        print(f"  {word}: {freq} 次")
    
    # 可读性评估
    avg_word_length = sum(len(word) for word in words) / len(words) if words else 0
    print(f"\n📊 平均单词长度: {avg_word_length:.1f} 字符")
    
    return word_freq

# 示例文本分析
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
def create_ascii_art(text, style="*"):
    """生成ASCII艺术字"""
    
    # 简单的ASCII字体映射
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
    
    # 生成每一行
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

# 生成标题艺术字
title_art = create_ascii_art("CODE")
print("🎨 ASCII 艺术生成器")
print("=" * 30)
print(title_art)

# 生成边框
def create_border(text, char="*"):
    """为文本创建装饰边框"""
    lines = text.split('\n')
    max_width = max(len(line) for line in lines)
    
    border = char * (max_width + 4)
    result = [border]
    
    for line in lines:
        padded_line = line.ljust(max_width)
        result.append(f"{char} {padded_line} {char}")
    
    result.append(border)
    return '\n'.join(result)

bordered_text = create_border("Execute Code Plugin\n功能强大的代码执行器", "🌟")
print(f"\n{bordered_text}")
```

### 随机名言生成器

```python
import random

# 编程相关的名言库
programming_quotes = [
    {
        "quote": "代码就像幽默。当你不得不解释它时，它就不好了。",
        "author": "Cory House"
    },
    {
        "quote": "程序必须为人们阅读而写，只是偶然地为机器执行。",
        "author": "Harold Abelson"
    },
    {
        "quote": "任何傻瓜都能写出计算机能理解的代码。好的程序员写出人类能理解的代码。",
        "author": "Martin Fowler"
    },
    {
        "quote": "经验是一个严厉的老师，她先考试，后讲课。",
        "author": "Vernon Law"
    },
    {
        "quote": "学习的最大敌人是已经知道。",
        "author": "John Maxwell"
    }
]

def generate_daily_quote():
    """生成每日编程名言"""
    quote_data = random.choice(programming_quotes)
    
    print("💡 今日编程名言")
    print("=" * 30)
    print(f'"{quote_data["quote"]}"')
    print(f"\n— {quote_data['author']}")
    
    # 添加装饰
    print("\n" + "✨" * 15)

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
# Python 快速模板
def quick_analysis(data):
    """数据快速分析模板"""
    print("📊 数据分析结果")
    print("-" * 20)
    # 在这里添加你的分析代码
    pass

# 使用示例
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