# Meta Bind实际应用场景

本文件展示Meta Bind插件在各种实际场景中的应用，提供具体的使用案例和模板。

## 📚 学习管理系统

### 课程跟踪器

```meta-bind
INPUT[text(placeholder(课程名称)):courseName]
INPUT[text(placeholder(讲师姓名)):instructor]
INPUT[select(option(在线), option(线下), option(混合)):courseType]
INPUT[date:startDate]
INPUT[date:endDate]
INPUT[slider(minValue(0), maxValue(100), stepSize(5)):progress]
INPUT[list(option(初学), option(理解), option(熟练), option(精通)):skillLevel]
INPUT[multiSelect(option(视频), option(文档), option(练习), option(项目)):completedMaterials]
INPUT[toggle:certified]
INPUT[number(minValue(0), stepSize(0.5)):studyHours]
INPUT[textArea(placeholder(学习笔记和心得)):notes]
```

**课程信息显示：**
- 课程名称：`VIEW[text:courseName]`
- 讲师：`VIEW[text:instructor]`
- 类型：`VIEW[text:courseType]`
- 进度：`VIEW[text:progress]`%
- 技能水平：`VIEW[text:skillLevel]`
- 已完成材料：`VIEW[text:completedMaterials]`
- 是否认证：`VIEW[text:certified]`
- 学习时长：`VIEW[text:studyHours]`小时

**进度管理按钮：**

```meta-bind-button
style: primary
label: +10% 进度
id: increase-course-progress
action:
  type: inlineJS
  code: |
    const current = context.bound.progress || 0;
    const newProgress = Math.min(current + 10, 100);
    engine.updateMetadata('progress', newProgress, context.file.path);
    if (newProgress >= 100) {
      new Notice('恭喜！课程已完成！');
    }
```

```meta-bind-button
style: default
label: 记录学习时长
id: log-study-time
action:
  type: inlineJS
  code: |
    const hours = prompt('今天学习了多少小时？');
    if (hours && !isNaN(hours)) {
      const current = context.bound.studyHours || 0;
      const newTotal = current + parseFloat(hours);
      engine.updateMetadata('studyHours', newTotal, context.file.path);
      new Notice(`已记录${hours}小时，总计${newTotal}小时`);
    }
```

---

## 💼 项目管理系统

### 项目看板

```meta-bind
INPUT[text(placeholder(项目名称)):projectName]
INPUT[textArea(placeholder(项目描述)):projectDescription]
INPUT[select(option(策划), option(开发), option(测试), option(部署), option(维护)):projectStage]
INPUT[list(option(低), option(中), option(高), option(紧急)):priority]
INPUT[date:deadline]
INPUT[multiSelect(option(前端), option(后端), option(数据库), option(UI设计), option(测试)):techStack]
INPUT[number(minValue(0)):estimatedHours]
INPUT[number(minValue(0)):actualHours]
INPUT[slider(minValue(0), maxValue(100), stepSize(5)):completion]
INPUT[toggle:onTrack]
```

**项目状态显示：**
- 项目：`VIEW[text:projectName]`
- 阶段：`VIEW[text:projectStage]`
- 优先级：`VIEW[text:priority]`
- 截止日期：`VIEW[text:deadline]`
- 完成度：`VIEW[text:completion]`%
- 进度正常：`VIEW[text:onTrack]`
- 效率：`VIEW[math:actualHours > 0 ? Math.round((estimatedHours/actualHours)*100) : 0]`%

**项目控制面板：**

```meta-bind-button
style: primary
label: 推进到下一阶段
id: next-stage
action:
  type: inlineJS
  code: |
    const stages = ['策划', '开发', '测试', '部署', '维护'];
    const current = context.bound.projectStage;
    const currentIndex = stages.indexOf(current);
    if (currentIndex < stages.length - 1) {
      const nextStage = stages[currentIndex + 1];
      engine.updateMetadata('projectStage', nextStage, context.file.path);
      new Notice(`项目已推进到：${nextStage}`);
    } else {
      new Notice('项目已完成所有阶段！');
    }
```

```meta-bind-button
style: destructive
label: 标记为延期
id: mark-delayed
action:
  type: inlineJS
  code: |
    engine.updateMetadata('onTrack', false, context.file.path);
    const reason = prompt('延期原因：');
    if (reason) {
      engine.updateMetadata('delayReason', reason, context.file.path);
    }
    new Notice('项目已标记为延期');
```

---

## 📊 个人效率追踪

### 番茄工作法计时器

```meta-bind
INPUT[text(placeholder(任务名称)):taskName]
INPUT[number(minValue(1), maxValue(10), defaultValue(4)):pomodoroTarget]
INPUT[number(minValue(0)):completedPomodoros]
INPUT[toggle:inProgress]
INPUT[time:startTime]
INPUT[textArea(placeholder(任务总结)):taskSummary]
```

**番茄钟状态：**
- 当前任务：`VIEW[text:taskName]`
- 目标番茄钟：`VIEW[text:pomodoroTarget]`
- 已完成：`VIEW[text:completedPomodoros]`
- 进行中：`VIEW[text:inProgress]`
- 完成率：`VIEW[math:Math.round((completedPomodoros/pomodoroTarget)*100)]`%

**番茄钟控制：**

```meta-bind-button
style: primary
label: 开始番茄钟
id: start-pomodoro
hidden: "inProgress == true"
action:
  type: inlineJS
  code: |
    engine.updateMetadata('inProgress', true, context.file.path);
    engine.updateMetadata('startTime', new Date().toLocaleTimeString(), context.file.path);
    new Notice('番茄钟开始！25分钟后休息');
    setTimeout(() => {
      new Notice('番茄钟结束！休息5分钟', 10000);
    }, 1500000); // 25分钟
```

```meta-bind-button
style: default
label: 完成番茄钟
id: complete-pomodoro
hidden: "inProgress != true"
action:
  type: inlineJS
  code: |
    const completed = (context.bound.completedPomodoros || 0) + 1;
    engine.updateMetadata('completedPomodoros', completed, context.file.path);
    engine.updateMetadata('inProgress', false, context.file.path);
    const target = context.bound.pomodoroTarget || 4;
    if (completed >= target) {
      new Notice('恭喜！今日番茄钟目标达成！');
    } else {
      new Notice(`番茄钟 ${completed}/${target} 完成`);
    }
```

---

## 🎯 目标追踪系统

### SMART目标管理

```meta-bind
INPUT[text(placeholder(目标描述)):goalDescription]
INPUT[select(option(职业发展), option(学习成长), option(健康生活), option(人际关系), option(财务规划)):goalCategory]
INPUT[date:targetDate]
INPUT[slider(minValue(0), maxValue(100), stepSize(5)):progress]
INPUT[textArea(placeholder(具体行动计划)):actionPlan]
INPUT[multiSelect(option(每日), option(每周), option(每月)):trackingFrequency]
INPUT[toggle:achieved]
INPUT[number(minValue(1), maxValue(5)):difficulty]
INPUT[number(minValue(1), maxValue(10)):importance]
```

**目标状态：**
- 目标：`VIEW[text:goalDescription]`
- 类别：`VIEW[text:goalCategory]`
- 截止日期：`VIEW[text:targetDate]`
- 进度：`VIEW[text:progress]`%
- 难度：`VIEW[text:difficulty]`/5
- 重要性：`VIEW[text:importance]`/10
- 已达成：`VIEW[text:achieved]`

**目标管理：**

```meta-bind-button
style: primary
label: 更新进度
id: update-goal-progress
action:
  type: inlineJS
  code: |
    const increment = prompt('进度增加多少%？');
    if (increment && !isNaN(increment)) {
      const current = context.bound.progress || 0;
      const newProgress = Math.min(current + parseInt(increment), 100);
      engine.updateMetadata('progress', newProgress, context.file.path);
      if (newProgress >= 100) {
        engine.updateMetadata('achieved', true, context.file.path);
        new Notice('🎉 恭喜！目标已达成！');
      } else {
        new Notice(`进度更新为 ${newProgress}%`);
      }
    }
```

---

## 📖 阅读跟踪器

### 读书进度管理

```meta-bind
INPUT[text(placeholder(书名)):bookTitle]
INPUT[text(placeholder(作者)):author]
INPUT[select(option(小说), option(非虚构), option(技术), option(传记), option(历史)):genre]
INPUT[number(minValue(1)):totalPages]
INPUT[number(minValue(0)):currentPage]
INPUT[date:startDate]
INPUT[date:finishDate]
INPUT[slider(minValue(1), maxValue(5), stepSize(0.5)):rating]
INPUT[textArea(placeholder(读书笔记)):readingNotes]
INPUT[toggle:recommended]
```

**阅读状态：**
- 书名：`VIEW[text:bookTitle]`
- 作者：`VIEW[text:author]`
- 类型：`VIEW[text:genre]`
- 进度：`VIEW[text:currentPage]`/`VIEW[text:totalPages]` (`VIEW[math:Math.round((currentPage/totalPages)*100)]`%)
- 评分：`VIEW[text:rating]`⭐
- 推荐：`VIEW[text:recommended]`

**阅读控制：**

```meta-bind-button
style: primary
label: 更新阅读进度
id: update-reading-progress
action:
  type: inlineJS
  code: |
    const pages = prompt('今天读了多少页？');
    if (pages && !isNaN(pages)) {
      const current = context.bound.currentPage || 0;
      const total = context.bound.totalPages || 0;
      const newPage = Math.min(current + parseInt(pages), total);
      engine.updateMetadata('currentPage', newPage, context.file.path);
      const percentage = Math.round((newPage/total)*100);
      if (newPage >= total) {
        engine.updateMetadata('finishDate', new Date().toISOString().split('T')[0], context.file.path);
        new Notice('🎉 恭喜！书已读完！');
      } else {
        new Notice(`阅读进度：${percentage}%`);
      }
    }
```

---

## 💰 财务管理器

### 支出跟踪

```meta-bind
INPUT[text(placeholder(支出描述)):expenseDescription]
INPUT[number(minValue(0), stepSize(0.01)):amount]
INPUT[select(option(食物), option(交通), option(购物), option(娱乐), option(学习), option(其他)):category]
INPUT[date:expenseDate]
INPUT[select(option(现金), option(信用卡), option(借记卡), option(移动支付)):paymentMethod]
INPUT[toggle:necessary]
INPUT[textArea(placeholder(备注)):notes]
```

**支出信息：**
- 描述：`VIEW[text:expenseDescription]`
- 金额：¥`VIEW[text:amount]`
- 类别：`VIEW[text:category]`
- 日期：`VIEW[text:expenseDate]`
- 支付方式：`VIEW[text:paymentMethod]`
- 必要支出：`VIEW[text:necessary]`

**财务分析按钮：**

```meta-bind-button
style: default
label: 计算月度支出
id: calculate-monthly
action:
  type: inlineJS
  code: |
    // 这里可以添加计算逻辑
    const amount = context.bound.amount || 0;
    new Notice(`当前支出：¥${amount}`);
```

---

## 🏃‍♂️ 健康追踪器

### 运动记录

```meta-bind
INPUT[select(option(跑步), option(游泳), option(骑行), option(健身), option(瑜伽), option(其他)):exerciseType]
INPUT[number(minValue(0), stepSize(5)):duration]
INPUT[number(minValue(0)):calories]
INPUT[date:exerciseDate]
INPUT[slider(minValue(1), maxValue(10)):intensity]
INPUT[textArea(placeholder(运动感受)):feelings]
INPUT[toggle:goalMet]
```

**运动状态：**
- 运动类型：`VIEW[text:exerciseType]`
- 持续时间：`VIEW[text:duration]`分钟
- 消耗卡路里：`VIEW[text:calories]`
- 强度：`VIEW[text:intensity]`/10
- 目标达成：`VIEW[text:goalMet]`

```meta-bind-button
style: primary
label: 记录今日运动
id: log-exercise
action:
  type: inlineJS
  code: |
    engine.updateMetadata('exerciseDate', new Date().toISOString().split('T')[0], context.file.path);
    new Notice('运动记录已保存！');
```

---

## 🎨 创意项目管理

### 设计项目跟踪

```meta-bind
INPUT[text(placeholder(项目名称)):designProject]
INPUT[select(option(Logo设计), option(网页设计), option(插画), option(品牌设计), option(UI/UX)):designType]
INPUT[text(placeholder(客户名称)):clientName]
INPUT[date:deadline]
INPUT[multiSelect(option(概念), option(草图), option(初稿), option(修订), option(完稿)):completedStages]
INPUT[number(minValue(0)):revisionCount]
INPUT[slider(minValue(1), maxValue(5)):clientSatisfaction]
INPUT[toggle:delivered]
```

**项目状态：**
- 项目：`VIEW[text:designProject]`
- 类型：`VIEW[text:designType]`
- 客户：`VIEW[text:clientName]`
- 截止日期：`VIEW[text:deadline]`
- 已完成阶段：`VIEW[text:completedStages]`
- 修订次数：`VIEW[text:revisionCount]`
- 客户满意度：`VIEW[text:clientSatisfaction]`/5
- 已交付：`VIEW[text:delivered]`

这些实际应用场景展示了Meta Bind如何帮助您管理生活和工作的各个方面，提高效率和组织能力。您可以根据自己的需求调整和定制这些模板。 