---
# 学习管理
course_name: ""
study_hours: 0
completion_rate: 0
last_study_date: ""
difficulty: "medium"
notes: ""

# 项目管理
project_name: ""
project_status: "planning"
start_date: ""
end_date: ""
team_members: []
project_progress: 0
budget: 0

# 个人效率
daily_energy: 5
focus_time: 0
interruptions: 0
mood: "neutral"
productivity_score: 0

# 目标追踪
goal_title: ""
target_value: 100
current_value: 0
goal_deadline: ""
milestones: []

# 阅读追踪
book_title: ""
total_pages: 0
pages_read: 0
reading_start: ""
reading_status: "未开始"

# 财务追踪
income: 0
expenses: 0
savings_goal: 1000
current_savings: 0

# 健康追踪
weight: 0
target_weight: 0
exercise_minutes: 0
water_intake: 0
sleep_hours: 0
---

# Meta Bind实际应用场景

这个文件展示了Meta Bind在各种实际场景中的应用，包括学习管理、项目管理、个人效率追踪等。

## 🎓 学习管理系统

### 课程信息
- 课程名称：`INPUT[text:course_name]`
- 学习时长：`INPUT[number:study_hours]` 小时
- 完成率：`INPUT[slider(minValue(0), maxValue(100), stepSize(5)):completion_rate]`%
- 最后学习日期：`INPUT[date:last_study_date]`
- 难度等级：`INPUT[inlineSelect(option(easy, 简单), option(medium, 中等), option(hard, 困难)):difficulty]`

### 学习进度显示
- 当前课程：`VIEW[{course_name}][text]`
- 学习进度：`VIEW[{completion_rate}]`% (`VIEW[{study_hours}]`小时)
- 剩余进度：`VIEW[100 - {completion_rate}]`%
- 学习状态：`VIEW[{completion_rate} >= 100 ? "✅ 已完成" : {completion_rate} >= 80 ? "🎯 即将完成" : {completion_rate} >= 50 ? "📚 进行中" : "🚀 刚开始"][text]`

### 学习笔记
`INPUT[textArea(placeholder(记录学习心得和重点)):notes]`

## 📊 项目管理系统

### 项目基本信息
- 项目名称：`INPUT[text:project_name]`
- 项目状态：`INPUT[inlineSelect(option(planning, 规划中), option(in_progress, 进行中), option(testing, 测试中), option(completed, 已完成), option(suspended, 暂停)):project_status]`
- 开始日期：`INPUT[date:start_date]`
- 结束日期：`INPUT[date:end_date]`
- 项目进度：`INPUT[slider(minValue(0), maxValue(100), stepSize(5)):project_progress]`%

### 团队与预算
- 团队成员：`INPUT[multiSelect(option(张三), option(李四), option(王五), option(赵六)):team_members]`
- 项目预算：`INPUT[number:budget]` 元

### 项目概览
- 当前项目：`VIEW[{project_name}][text]`
- 项目状态：`VIEW[{project_status}][text]`
- 进度显示：`VIEW[{project_progress}]`% 
- 进度条：`INPUT[progressBar:project_progress]`
- 完成度评估：`VIEW[{project_progress} >= 90 ? "🎉 项目即将完成" : {project_progress} >= 70 ? "⚡ 快速推进中" : {project_progress} >= 30 ? "📈 稳步进行" : "🚀 项目启动"][text]`
- 团队规模：`VIEW[{team_members}.length]`人
- 预算状态：`VIEW[{budget}]`元

## ⚡ 个人效率追踪

### 每日状态记录
- 精力水平：`INPUT[slider(minValue(1), maxValue(10), stepSize(1)):daily_energy]`/10
- 专注时间：`INPUT[number:focus_time]` 分钟
- 被打断次数：`INPUT[number:interruptions]` 次
- 心情状态：`INPUT[inlineSelect(option(great, 很棒), option(good, 不错), option(neutral, 一般), option(tired, 疲惫), option(stressed, 压力大)):mood]`

### 效率分析
- 今日精力：`VIEW[{daily_energy}]`/10 `VIEW[{daily_energy} >= 8 ? "🔥" : {daily_energy} >= 6 ? "⚡" : {daily_energy} >= 4 ? "😐" : "😴"][text]`
- 专注表现：`VIEW[{focus_time}]`分钟 `VIEW[{focus_time} >= 120 ? "🎯 专注达人" : {focus_time} >= 60 ? "📚 不错" : "⏰ 需要改进"][text]`
- 干扰程度：`VIEW[{interruptions}]`次 `VIEW[{interruptions} <= 2 ? "✅ 很好" : {interruptions} <= 5 ? "⚠️ 一般" : "🚨 太多干扰"][text]`
- 当前心情：`VIEW[{mood}][text]`

### 效率得分计算
生产力得分：`VIEW[({daily_energy} * 10 + {focus_time} / 2 - {interruptions} * 5)][math:productivity_score]`

## 🎯 目标追踪系统

### 目标设定
- 目标标题：`INPUT[text:goal_title]`
- 目标数值：`INPUT[number:target_value]`
- 当前进度：`INPUT[number:current_value]`
- 截止日期：`INPUT[date:goal_deadline]`
- 里程碑：`INPUT[multiSelect(option(25%), option(50%), option(75%), option(90%)):milestones]`

### 目标追踪显示
- 当前目标：`VIEW[{goal_title}][text]`
- 完成比例：`VIEW[{current_value} / {target_value} * 100]`%
- 完成进度：`INPUT[progressBar:current_value]`
- 目标状态：`VIEW[{current_value} >= {target_value} ? "🎉 目标达成！" : {current_value} / {target_value} >= 0.8 ? "🔥 即将达成" : {current_value} / {target_value} >= 0.5 ? "📈 进展良好" : "💪 继续努力"][text]`
- 剩余数量：`VIEW[{target_value} - {current_value}]`
- 截止日期：`VIEW[{goal_deadline}][text]`

## 📚 阅读追踪器

### 图书信息
- 书名：`INPUT[text:book_title]`
- 总页数：`INPUT[number:total_pages]`
- 已读页数：`INPUT[number:pages_read]`
- 开始日期：`INPUT[date:reading_start]`
- 阅读状态：`INPUT[inlineSelect(option(未开始), option(阅读中), option(已完成), option(暂停中)):reading_status]`

### 阅读进度
- 当前图书：`VIEW[{book_title}][text]`
- 阅读进度：`VIEW[{pages_read} / {total_pages} * 100]`% (`VIEW[{pages_read}]`/`VIEW[{total_pages}]`页)
- 剩余页数：`VIEW[{total_pages} - {pages_read}]`页
- 阅读状态：`VIEW[{reading_status}][text]`
- 完成情况：`VIEW[{pages_read} >= {total_pages} ? "✅ 已读完" : {pages_read} / {total_pages} >= 0.8 ? "📖 快读完了" : {pages_read} / {total_pages} >= 0.5 ? "📚 过半了" : "🚀 刚开始"][text]`

## 💰 财务追踪器

### 收支记录
- 本月收入：`INPUT[number:income]` 元
- 本月支出：`INPUT[number:expenses]` 元
- 储蓄目标：`INPUT[number:savings_goal]` 元
- 当前储蓄：`INPUT[number:current_savings]` 元

### 财务分析
- 本月收入：¥`VIEW[{income}][text]`
- 本月支出：¥`VIEW[{expenses}][text]`
- 本月结余：¥`VIEW[{income} - {expenses}][math]`
- 储蓄进度：`VIEW[{current_savings} / {savings_goal} * 100]`%
- 储蓄状态：`VIEW[{current_savings} >= {savings_goal} ? "🎉 储蓄目标达成" : {current_savings} / {savings_goal} >= 0.8 ? "💰 接近目标" : {current_savings} / {savings_goal} >= 0.5 ? "💳 进展不错" : "💪 继续努力"][text]`
- 距离目标：¥`VIEW[{savings_goal} - {current_savings}][math]`

## 🏃‍♀️ 健康追踪器

### 健康数据录入
- 当前体重：`INPUT[number:weight]` kg
- 目标体重：`INPUT[number:target_weight]` kg
- 运动时长：`INPUT[number:exercise_minutes]` 分钟
- 饮水量：`INPUT[number:water_intake]` 杯
- 睡眠时长：`INPUT[number:sleep_hours]` 小时

### 健康状况分析
- 体重情况：`VIEW[{weight}]`kg (目标：`VIEW[{target_weight}]`kg)
- 体重差距：`VIEW[{weight} - {target_weight}]`kg
- 今日运动：`VIEW[{exercise_minutes}]`分钟 `VIEW[{exercise_minutes} >= 60 ? "🔥 运动达人" : {exercise_minutes} >= 30 ? "💪 不错" : "🚶 需要加强"][text]`
- 饮水情况：`VIEW[{water_intake}]`杯 `VIEW[{water_intake} >= 8 ? "💧 补水充足" : {water_intake} >= 6 ? "🥤 还不错" : "🚰 需要多喝水"][text]`
- 睡眠质量：`VIEW[{sleep_hours}]`小时 `VIEW[{sleep_hours} >= 8 ? "😴 睡眠充足" : {sleep_hours} >= 7 ? "😊 还可以" : "⏰ 睡眠不足"][text]`

## 📝 快速操作按钮

### 学习管理操作
```meta-bind-button
style: primary
label: 完成今日学习
actions:
  - type: updateMetadata
    bindTarget: completion_rate
    evaluate: true
    value: "{completion_rate} + 10"
  - type: updateMetadata
    bindTarget: last_study_date
    evaluate: true
    value: "moment().format('YYYY-MM-DD')"
```

### 项目管理操作
```meta-bind-button
style: primary
label: 更新项目进度
actions:
  - type: updateMetadata
    bindTarget: project_progress
    evaluate: true
    value: "Math.min({project_progress} + 5, 100)"
```

### 健康记录操作
```meta-bind-button
style: primary
label: 记录运动
actions:
  - type: updateMetadata
    bindTarget: exercise_minutes
    evaluate: true
    value: "{exercise_minutes} + 30"
```

这些模板展示了Meta Bind在实际生活和工作中的强大应用潜力，你可以根据自己的需求进行修改和扩展。 