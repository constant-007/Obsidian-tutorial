---
progress: 0
---
# Meta Bind插件完整功能演示

Meta Bind插件是Obsidian中最强大的元数据绑定和交互式表单插件之一，可以将笔记变成动态的、可互动的文档。

## 📋 目录

1. [基础输入字段](#基础输入字段)
2. [文本输入与文本区域](#文本输入与文本区域)  
3. [选择器与下拉菜单](#选择器与下拉菜单)
4. [日期与时间选择器](#日期与时间选择器)
5. [滑块与数字输入](#滑块与数字输入)
6. [按钮与动作](#按钮与动作)
7. [VIEW字段显示](#VIEW字段显示)
8. [高级绑定功能](#高级绑定功能)
9. [样式与自定义](#样式与自定义)
10. [复杂示例场景](#复杂示例场景)

---

## 基础输入字段

### 简单文本输入
`INPUT[text:title]`

### 多行文本输入
`INPUT[textArea:description]`

### 数字输入
`INPUT[number:age]`

### 切换开关
`INPUT[toggle:completed]`

---

## 文本输入与文本区域

### 带占位符的文本输入
`INPUT[text(placeholder(请输入您的姓名)):name]`

### 带默认值的文本输入
`INPUT[text(defaultValue(默认文本)):textWithDefault]`

### 多行文本区域
`INPUT[textArea:notes]`

### 带占位符的文本区域
`INPUT[textArea(placeholder(在此输入您的笔记...)):detailedNotes]`

---

## 选择器与下拉菜单

### 简单下拉选择
`INPUT[select(option(低), option(中), option(高)):priority]`

### 内联选择器（更紧凑）
`INPUT[inlineSelect(option(待办), option(进行中), option(已完成)):status]`

### 多选框
`INPUT[multiSelect(option(工作), option(学习), option(生活), option(娱乐)):tags]`

### 列表选择器
`INPUT[list(option(项目), option(任务), option(笔记), option(想法)):category]`

---

## 日期与时间选择器

### 日期选择器
`INPUT[date:dueDate]`

### 时间选择器
`INPUT[time:reminderTime]`

### 日期时间组合
`INPUT[dateTime:meetingTime]`

### 日期选择器（带日历弹窗）
`INPUT[datePicker:eventDate]`

---

## 滑块与数字输入

### 基础数字输入
`INPUT[number:age]`

### 带范围限制的数字输入
`INPUT[number(minValue(0), maxValue(100)):score]`

### 滑块 (0-100)
`INPUT[slider(minValue(0), maxValue(100), stepSize(5)):progress]`

### 评分滑块 (1-5星)
`INPUT[slider(minValue(1), maxValue(5), stepSize(1)):rating]`

### 进度条显示
`INPUT[progressBar:completion]`

---

## 按钮与动作

按钮需要使用代码块格式定义，然后可以通过内联方式引用：

```meta-bind-button
style: primary
label: 完成任务
id: complete-task
action:
  type: updateMetadata
  bindTarget: completed
  evaluate: false
  value: true
```

```meta-bind-button
style: destructive
label: 重置进度
id: reset-progress
action:
  type: updateMetadata
  bindTarget: progress
  evaluate: false
  value: 0
```

内联按钮调用：`BUTTON[complete-task]` `BUTTON[reset-progress]`

---

## VIEW字段显示

### 显示文本值
当前标题：`VIEW[text:title]`

### 显示进度（计算）
进度状态：`VIEW[math:progress > 80 ? "接近完成" : progress > 50 ? "进行中" : "刚开始"]`

### 显示列表
当前标签：`VIEW[text:tags]`

### 隐藏条件显示
`VIEW[text(hidden(completed != true)):未完成提示][这个任务还没有完成！]`

---

## 高级绑定功能

### 跨文件绑定
绑定到其他文件的属性：`INPUT[toggle:OtherNote#completed]`

### 内存绑定（临时存储）
临时计数器：`INPUT[number:memory^counter]`

### 全局内存绑定
全局设置：`INPUT[text:globalMemory^setting]`

---

## 样式与自定义

### 带CSS类的输入字段
`INPUT[text(class(fancy-input)):styledInput]`

### 自定义样式的下拉选择
`INPUT[select(class(custom-select), option(选项1), option(选项2), option(选项3)):styledSelect]`

### 带标题的输入字段
`INPUT[text(title(请输入您的姓名)):nameWithTitle]`

### 显示样式的切换按钮
`INPUT[toggle(class(important-toggle)):importantFlag]`

---

## 复杂示例场景

### 项目管理表单

```meta-bind
INPUT[text(placeholder(输入项目名称)):projectTitle]
INPUT[textArea(placeholder(描述项目详情)):projectDesc]
INPUT[select(option(计划中), option(进行中), option(测试中), option(已完成), option(已暂停)):projectStatus]
INPUT[date:startDate]
INPUT[date:endDate]
INPUT[slider(minValue(0), maxValue(100), stepSize(5)):projectProgress]
INPUT[text:projectManager]
INPUT[multiSelect(option(张三), option(李四), option(王五), option(赵六), option(孙七)):teamMembers]
INPUT[number(minValue(0)):budget]
INPUT[list(option(低), option(中), option(高), option(极高)):riskLevel]
INPUT[textArea(placeholder(描述项目主要风险)):mainRisks]
INPUT[multiSelect(option(Web开发), option(移动应用), option(数据分析), option(机器学习), option(UI设计), option(测试), option(部署)):projectTags]
```

#### 显示项目信息
- 项目名称：`VIEW[text:projectTitle]`
- 项目状态：`VIEW[text:projectStatus]`
- 完成进度：`VIEW[text:projectProgress]`%
- 团队成员：`VIEW[text:teamMembers]`
- 项目标签：`VIEW[text:projectTags]`

### 个人任务跟踪器

```meta-bind
INPUT[text(placeholder(输入任务标题)):taskTitle]
INPUT[select(option(日常任务), option(工作任务), option(学习任务), option(个人事务)):taskType]
INPUT[list(option(低), option(中), option(高), option(紧急)):taskPriority]
INPUT[number(minValue(0.5), maxValue(24), stepSize(0.5)):estimatedHours]
INPUT[number(minValue(0), stepSize(0.25)):actualHours]
INPUT[toggle:taskCompleted]
INPUT[slider(minValue(0), maxValue(100), stepSize(10)):taskCompletion]
INPUT[dateTime:completionTime]
INPUT[textArea(placeholder(记录完成任务的心得和改进建议)):taskReflection]
```

#### 任务信息显示
- 任务标题：`VIEW[text:taskTitle]`
- 任务类型：`VIEW[text:taskType]`
- 优先级：`VIEW[text:taskPriority]`
- 预计用时：`VIEW[text:estimatedHours]` 小时
- 实际用时：`VIEW[text:actualHours]` 小时
- 完成状态：`VIEW[text:taskCompleted]`
- 完成度：`VIEW[text:taskCompletion]`%

### 学习笔记管理

```meta-bind
INPUT[text(placeholder(输入课程名称)):courseName]
INPUT[text(placeholder(讲师姓名)):instructor]
INPUT[select(option(Coursera), option(edX), option(Udemy), option(YouTube), option(线下课程), option(其他)):platform]
INPUT[slider(minValue(0), maxValue(100), stepSize(5)):chapterProgress]
INPUT[list(option(初学), option(理解), option(熟练), option(精通)):masteryLevel]
INPUT[slider(minValue(1), maxValue(5), stepSize(1)):difficulty]
INPUT[number(minValue(0), stepSize(0.5)):studyHours]
INPUT[multiSelect(option(理论基础), option(实践应用), option(案例分析), option(项目实战)):keyConcepts]
INPUT[textArea(placeholder(记录重要的知识点)):keyPoints]
INPUT[textArea(placeholder(记录学习中的疑问)):questions]
INPUT[date:nextReview]
INPUT[number(minValue(0)):reviewCount]
INPUT[toggle:needsReview]
INPUT[textArea(placeholder(记录需要重点复习的内容)):reviewFocus]
```

#### 学习信息显示
- 课程名称：`VIEW[text:courseName]`
- 讲师：`VIEW[text:instructor]`
- 学习平台：`VIEW[text:platform]`
- 章节进度：`VIEW[text:chapterProgress]`%
- 掌握程度：`VIEW[text:masteryLevel]`
- 难度评价：`VIEW[text:difficulty]`⭐
- 学习时长：`VIEW[text:studyHours]` 小时
- 需要复习：`VIEW[text:needsReview]`

---

## 💡 高级功能应用场景

### 读书笔记评分系统
```meta-bind
INPUT[text(placeholder(书名)):bookTitle]
INPUT[text(placeholder(作者)):author]
INPUT[select(option(小说), option(科技), option(历史), option(传记), option(自助), option(其他)):bookType]
INPUT[slider(minValue(1), maxValue(5), stepSize(0.5)):bookRating]
```

- 书名：`VIEW[text:bookTitle]`
- 作者：`VIEW[text:author]`
- 类型：`VIEW[text:bookType]`
- 评分：`VIEW[text:bookRating]`⭐
- 推荐指数：`VIEW[math:bookRating >= 4.5 ? "强烈推荐" : bookRating >= 3.5 ? "推荐" : bookRating >= 2.5 ? "一般" : "不推荐"]`

### 习惯追踪器
```meta-bind
INPUT[text(placeholder(习惯名称)):habitName]
INPUT[number(minValue(1), maxValue(365)):targetDays]
INPUT[number(minValue(0)):currentStreak]
INPUT[toggle:todayCompleted]
```

- 习惯名称：`VIEW[text:habitName]`
- 目标天数：`VIEW[text:targetDays]`
- 已坚持：`VIEW[text:currentStreak]`天
- 完成率：`VIEW[math:Math.round((currentStreak/targetDays)*100)]`%
- 今日完成：`VIEW[text:todayCompleted]`

### 电影观看记录
```meta-bind
INPUT[text(placeholder(电影名称)):movieTitle]
INPUT[text(placeholder(导演)):director]
INPUT[multiSelect(option(动作), option(喜剧), option(剧情), option(科幻), option(恐怖), option(爱情), option(悬疑), option(动画)):movieGenre]
INPUT[date:watchDate]
INPUT[slider(minValue(1), maxValue(10), stepSize(0.5)):personalRating]
INPUT[textArea(placeholder(分享您的观后感)):movieReview]
```

- 电影名称：`VIEW[text:movieTitle]`
- 导演：`VIEW[text:director]`
- 类型：`VIEW[text:movieGenre]`
- 观看日期：`VIEW[text:watchDate]`
- 个人评分：`VIEW[text:personalRating]`/10

---

## 🎨 样式说明

为了更好的视觉效果，建议在CSS代码片段中添加以下样式：

```css
/* Meta Bind 自定义样式 */
.fancy-input input {
    border: 2px solid #007acc;
    border-radius: 8px;
    padding: 8px;
    font-size: 14px;
}

.custom-select select {
    border: 2px solid #28a745;
    border-radius: 6px;
    padding: 6px;
    background-color: #f8f9fa;
}

.important-toggle input[type="checkbox"] {
    transform: scale(1.2);
    accent-color: #dc3545;
}

/* 数字输入样式 */
.mb-input-wrapper.number-input > input {
    width: 80px;
    text-align: center;
}

/* 进度条样式 */
.mb-progress-bar {
    background: linear-gradient(90deg, #28a745 0%, #ffc107 50%, #dc3545 100%);
    border-radius: 10px;
    height: 20px;
}
```

## 📝 使用说明

1. **基础语法**：`INPUT[inputType:bindTarget]`
2. **参数语法**：`INPUT[inputType(arg1, arg2):bindTarget]`
3. **VIEW语法**：`VIEW[viewType:bindTarget]`
4. **按钮语法**：需要先定义代码块，然后用`BUTTON[id]`调用

## 🔧 高级技巧

### 数据绑定策略
- **本地绑定**：直接使用属性名（如 `title`）
- **跨文件绑定**：使用文件路径（如 `OtherNote#property`）
- **内存绑定**：使用 `memory^` 前缀
- **全局内存**：使用 `globalMemory^` 前缀

### 计算和表达式
- 使用 `VIEW[math:expression]` 进行数学计算
- 支持三元运算符：`condition ? valueIfTrue : valueIfFalse`
- 可以引用其他字段的值

这个演示文件展示了Meta Bind插件的完整功能，从基础的输入字段到高级的绑定和计算功能。通过这些示例，您可以创建功能强大、交互性强的笔记和表单。 