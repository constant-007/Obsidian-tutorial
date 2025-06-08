# Meta Bind 高级应用 - 健康管理追踪器

这是一个使用Meta Bind插件构建的综合健康管理系统，帮助你追踪和管理各项健康指标。

## 🏃‍♂️ 基础健康信息

### 个人基本信息
姓名:
```meta-bind
type: input
bind: health_name
placeholder: "输入姓名"
```

年龄:
```meta-bind
type: number
bind: health_age
min: 1
max: 120
```

性别:
```meta-bind
type: select
bind: health_gender
options:
  - 男
  - 女
```

身高 (cm):
```meta-bind
type: number
bind: health_height
min: 100
max: 250
step: 0.1
```

### 健康档案
**基本信息**
- 姓名: `META{health_name || "未设置"}`
- 年龄: `META{health_age || 0}` 岁
- 性别: `META{health_gender || "未设置"}`
- 身高: `META{health_height || 0}` cm

## ⚖️ 体重管理

### 体重记录
当前体重 (kg):
```meta-bind
type: number
bind: current_weight
step: 0.1
min: 20
max: 300
```

目标体重 (kg):
```meta-bind
type: number
bind: target_weight
step: 0.1
min: 20
max: 300
```

```meta-bind-button
label: "记录体重"
icon: "trending-up"
style: primary
action:
  type: js
  code: |
    const weight = meta.getMetadata("current_weight");
    const date = new Date().toLocaleDateString();
    
    if (!weight) {
      new Notice("请输入体重");
      return;
    }
    
    // 获取历史记录
    const weightHistory = meta.getMetadata("weight_history") || [];
    
    // 添加新记录
    weightHistory.push({
      weight: weight,
      date: date,
      timestamp: new Date().toISOString()
    });
    
    meta.setMetadata("weight_history", weightHistory);
    meta.setMetadata("last_weight_date", date);
    
    new Notice(`体重记录已保存: ${weight}kg`);
```

### 体重分析
**当前状态**
- 当前体重: `META{current_weight || 0}` kg
- 目标体重: `META{target_weight || 0}` kg
- 需要改变: `META{current_weight && target_weight ? (current_weight - target_weight > 0 ? "减重 " + (current_weight - target_weight).toFixed(1) : "增重 " + Math.abs(current_weight - target_weight).toFixed(1)) + " kg" : "请设置目标"}`

BMI指数: `META{
  const height = health_height || 0;
  const weight = current_weight || 0;
  if (height && weight) {
    const bmi = (weight / ((height / 100) ** 2)).toFixed(1);
    return bmi;
  }
  return "未计算";
}`

健康状况: `META{
  const height = health_height || 0;
  const weight = current_weight || 0;
  if (height && weight) {
    const bmi = weight / ((height / 100) ** 2);
    if (bmi < 18.5) return "🔵 偏瘦";
    else if (bmi < 24) return "🟢 正常";
    else if (bmi < 28) return "🟡 偏胖";
    else return "🔴 肥胖";
  }
  return "📊 请输入身高体重";
}`

最后记录时间: `META{last_weight_date || "从未记录"}`

## 🍎 饮食记录

### 今日饮食
早餐:
```meta-bind
type: textArea
bind: today_breakfast
placeholder: "记录今日早餐内容..."
```

午餐:
```meta-bind
type: textArea
bind: today_lunch
placeholder: "记录今日午餐内容..."
```

晚餐:
```meta-bind
type: textArea
bind: today_dinner
placeholder: "记录今日晚餐内容..."
```

零食/饮品:
```meta-bind
type: textArea
bind: today_snacks
placeholder: "记录零食和饮品..."
```

### 营养评估
每日饮水量 (杯):
```meta-bind
type: number
bind: daily_water
min: 0
max: 20
```

蔬菜摄入:
```meta-bind
type: select
bind: vegetable_intake
options:
  - 充足 (5份以上)
  - 适中 (3-4份)
  - 不足 (1-2份)
  - 很少 (不到1份)
```

主食类型:
```meta-bind
type: checkbox
bind: staple_foods
options:
  - 米饭
  - 面条
  - 面包
  - 杂粮
  - 薯类
```

```meta-bind-button
label: "保存今日饮食"
icon: "utensils"
style: success
action:
  type: js
  code: |
    const dietRecord = {
      date: new Date().toLocaleDateString(),
      breakfast: meta.getMetadata("today_breakfast") || "",
      lunch: meta.getMetadata("today_lunch") || "",
      dinner: meta.getMetadata("today_dinner") || "",
      snacks: meta.getMetadata("today_snacks") || "",
      water: meta.getMetadata("daily_water") || 0,
      vegetables: meta.getMetadata("vegetable_intake") || "",
      staples: meta.getMetadata("staple_foods") || [],
      timestamp: new Date().toISOString()
    };
    
    // 保存记录
    const dietHistory = meta.getMetadata("diet_history") || [];
    dietHistory.push(dietRecord);
    meta.setMetadata("diet_history", dietHistory);
    meta.setMetadata("last_diet_date", dietRecord.date);
    
    new Notice("今日饮食记录已保存！");
    
    // 清空表单
    ["today_breakfast", "today_lunch", "today_dinner", "today_snacks", 
     "daily_water", "vegetable_intake", "staple_foods"].forEach(key => {
      meta.setMetadata(key, null);
    });
```

### 饮食分析
**今日饮食状况**
饮水量: `META{daily_water || 0}` 杯 `META{
  const water = daily_water || 0;
  if (water >= 8) return "💧 充足";
  else if (water >= 6) return "🟡 适中";
  else if (water >= 4) return "🟠 不足";
  else return "🔴 严重不足";
}`

蔬菜摄入: `META{vegetable_intake || "未记录"}`

营养评分: `META{
  const water = daily_water || 0;
  const vegetables = vegetable_intake || "";
  const staples = staple_foods || [];
  
  let score = 0;
  
  // 饮水评分
  if (water >= 8) score += 30;
  else if (water >= 6) score += 20;
  else if (water >= 4) score += 10;
  
  // 蔬菜评分
  if (vegetables.includes("充足")) score += 40;
  else if (vegetables.includes("适中")) score += 30;
  else if (vegetables.includes("不足")) score += 15;
  
  // 主食多样性评分
  score += Math.min(30, staples.length * 6);
  
  return score + " 分 (满分100分)";
}`

最后记录: `META{last_diet_date || "从未记录"}`

## 🏋️‍♀️ 运动健身

### 运动记录
运动类型:
```meta-bind
type: select
bind: exercise_type
options:
  - 跑步
  - 快走
  - 游泳
  - 骑行
  - 力量训练
  - 瑜伽
  - 球类运动
  - 其他
```

运动时长 (分钟):
```meta-bind
type: number
bind: exercise_duration
min: 1
max: 300
```

运动强度:
```meta-bind
type: select
bind: exercise_intensity
options:
  - 轻度 (心率较平缓)
  - 中度 (微微出汗)
  - 高强度 (大量出汗)
```

消耗卡路里 (估算):
```meta-bind
type: number
bind: calories_burned
min: 0
max: 2000
```

运动感受:
```meta-bind
type: select
bind: exercise_feeling
options:
  - 很轻松
  - 适中
  - 有点累
  - 很累
  - 筋疲力尽
```

```meta-bind-button
label: "记录运动"
icon: "activity"
style: primary
action:
  type: js
  code: |
    const exerciseRecord = {
      date: new Date().toLocaleDateString(),
      type: meta.getMetadata("exercise_type"),
      duration: meta.getMetadata("exercise_duration"),
      intensity: meta.getMetadata("exercise_intensity"),
      calories: meta.getMetadata("calories_burned") || 0,
      feeling: meta.getMetadata("exercise_feeling"),
      timestamp: new Date().toISOString()
    };
    
    if (!exerciseRecord.type || !exerciseRecord.duration) {
      new Notice("请填写运动类型和时长");
      return;
    }
    
    // 保存记录
    const exerciseHistory = meta.getMetadata("exercise_history") || [];
    exerciseHistory.push(exerciseRecord);
    meta.setMetadata("exercise_history", exerciseHistory);
    
    // 更新统计
    const totalMinutes = exerciseHistory.reduce((sum, record) => sum + (record.duration || 0), 0);
    const totalCalories = exerciseHistory.reduce((sum, record) => sum + (record.calories || 0), 0);
    
    meta.setMetadata("total_exercise_minutes", totalMinutes);
    meta.setMetadata("total_calories_burned", totalCalories);
    meta.setMetadata("last_exercise_date", exerciseRecord.date);
    
    new Notice(`运动记录已保存: ${exerciseRecord.type} ${exerciseRecord.duration}分钟`);
    
    // 清空表单
    ["exercise_type", "exercise_duration", "exercise_intensity", 
     "calories_burned", "exercise_feeling"].forEach(key => {
      meta.setMetadata(key, null);
    });
```

### 运动统计
**运动数据**
- 累计运动时长: `META{total_exercise_minutes || 0}` 分钟
- 累计消耗卡路里: `META{total_calories_burned || 0}` 大卡
- 最后运动时间: `META{last_exercise_date || "从未记录"}`

本周运动状况: `META{
  const history = exercise_history || [];
  const today = new Date();
  const weekAgo = new Date(today.getTime() - 7 * 24 * 60 * 60 * 1000);
  
  const weeklyExercises = history.filter(record => {
    const recordDate = new Date(record.timestamp);
    return recordDate >= weekAgo;
  });
  
  const weeklyMinutes = weeklyExercises.reduce((sum, record) => sum + (record.duration || 0), 0);
  
  if (weeklyMinutes >= 150) return "🏆 优秀 (WHO推荐标准)";
  else if (weeklyMinutes >= 120) return "💪 良好";
  else if (weeklyMinutes >= 60) return "👍 一般";
  else return "🔴 需要加强";
}`

## 😴 睡眠管理

### 睡眠记录
昨晚就寝时间:
```meta-bind
type: time
bind: bedtime
```

今晨起床时间:
```meta-bind
type: time
bind: wakeup_time
```

睡眠质量:
```meta-bind
type: select
bind: sleep_quality
options:
  - 很好 (深度睡眠，精神饱满)
  - 良好 (睡得还行)
  - 一般 (有些疲惫)
  - 较差 (多次醒来)
  - 很差 (失眠或严重不足)
```

睡前活动:
```meta-bind
type: checkbox
bind: pre_sleep_activities
options:
  - 看书
  - 听音乐
  - 冥想
  - 看手机
  - 看电视
  - 运动
  - 工作
```

```meta-bind-button
label: "记录睡眠"
icon: "moon"
style: primary
action:
  type: js
  code: |
    const bedtime = meta.getMetadata("bedtime");
    const wakeupTime = meta.getMetadata("wakeup_time");
    const quality = meta.getMetadata("sleep_quality");
    
    if (!bedtime || !wakeupTime) {
      new Notice("请填写就寝和起床时间");
      return;
    }
    
    // 计算睡眠时长
    const bedHour = parseInt(bedtime.split(':')[0]);
    const bedMinute = parseInt(bedtime.split(':')[1]);
    const wakeHour = parseInt(wakeupTime.split(':')[0]);
    const wakeMinute = parseInt(wakeupTime.split(':')[1]);
    
    let sleepMinutes = (wakeHour * 60 + wakeMinute) - (bedHour * 60 + bedMinute);
    if (sleepMinutes < 0) sleepMinutes += 24 * 60; // 跨夜
    
    const sleepHours = (sleepMinutes / 60).toFixed(1);
    
    const sleepRecord = {
      date: new Date().toLocaleDateString(),
      bedtime: bedtime,
      wakeupTime: wakeupTime,
      duration: sleepHours,
      quality: quality,
      preActivities: meta.getMetadata("pre_sleep_activities") || [],
      timestamp: new Date().toISOString()
    };
    
    // 保存记录
    const sleepHistory = meta.getMetadata("sleep_history") || [];
    sleepHistory.push(sleepRecord);
    meta.setMetadata("sleep_history", sleepHistory);
    meta.setMetadata("last_sleep_duration", sleepHours);
    meta.setMetadata("last_sleep_date", sleepRecord.date);
    
    new Notice(`睡眠记录已保存: ${sleepHours}小时`);
    
    // 清空表单
    ["bedtime", "wakeup_time", "sleep_quality", "pre_sleep_activities"].forEach(key => {
      meta.setMetadata(key, null);
    });
```

### 睡眠分析
**睡眠概况**
- 昨晚睡眠时长: `META{last_sleep_duration || 0}` 小时
- 最后记录日期: `META{last_sleep_date || "从未记录"}`

睡眠充足度: `META{
  const duration = parseFloat(last_sleep_duration || 0);
  if (duration >= 8) return "😴 充足";
  else if (duration >= 7) return "😊 良好";
  else if (duration >= 6) return "😐 一般";
  else if (duration >= 5) return "😴 不足";
  else return "🚨 严重不足";
}`

平均睡眠时长: `META{
  const history = sleep_history || [];
  if (history.length === 0) return "无数据";
  
  const totalHours = history.reduce((sum, record) => sum + parseFloat(record.duration || 0), 0);
  const avgHours = (totalHours / history.length).toFixed(1);
  return avgHours + " 小时";
}`

## 🧠 心理健康

### 情绪记录
今日整体心情:
```meta-bind
type: select
bind: daily_mood
options:
  - 非常开心 😄
  - 开心 😊
  - 平静 😌
  - 一般 😐
  - 有点低落 😔
  - 很低落 😢
  - 焦虑 😰
  - 愤怒 😠
```

压力水平:
```meta-bind
type: slider
bind: stress_level
min: 1
max: 10
step: 1
```

今日感恩的事:
```meta-bind
type: textArea
bind: daily_gratitude
placeholder: "记录今天值得感恩的事情..."
```

情绪触发因素:
```meta-bind
type: checkbox
bind: mood_triggers
options:
  - 工作压力
  - 人际关系
  - 健康问题
  - 财务担忧
  - 家庭事务
  - 天气
  - 睡眠不足
  - 运动后兴奋
  - 完成目标
  - 其他
```

### 心理活动
今日冥想/放松 (分钟):
```meta-bind
type: number
bind: meditation_minutes
min: 0
max: 120
```

社交活动:
```meta-bind
type: checkbox
bind: social_activities
options:
  - 与家人聊天
  - 朋友聚会
  - 同事交流
  - 参加活动
  - 志愿服务
  - 独处时光
```

```meta-bind-button
label: "记录心理状态"
icon: "heart"
style: success
action:
  type: js
  code: |
    const mentalRecord = {
      date: new Date().toLocaleDateString(),
      mood: meta.getMetadata("daily_mood"),
      stress: meta.getMetadata("stress_level") || 0,
      gratitude: meta.getMetadata("daily_gratitude") || "",
      triggers: meta.getMetadata("mood_triggers") || [],
      meditation: meta.getMetadata("meditation_minutes") || 0,
      social: meta.getMetadata("social_activities") || [],
      timestamp: new Date().toISOString()
    };
    
    if (!mentalRecord.mood) {
      new Notice("请选择今日心情");
      return;
    }
    
    // 保存记录
    const mentalHistory = meta.getMetadata("mental_history") || [];
    mentalHistory.push(mentalRecord);
    meta.setMetadata("mental_history", mentalHistory);
    meta.setMetadata("last_mental_date", mentalRecord.date);
    
    new Notice("心理状态记录已保存！");
    
    // 清空表单
    ["daily_mood", "stress_level", "daily_gratitude", "mood_triggers",
     "meditation_minutes", "social_activities"].forEach(key => {
      meta.setMetadata(key, null);
    });
```

### 心理分析
**心理健康状况**
- 今日心情: `META{daily_mood || "未记录"}`
- 压力水平: `META{stress_level || 0}` / 10
- 冥想时长: `META{meditation_minutes || 0}` 分钟
- 最后记录: `META{last_mental_date || "从未记录"}`

心理健康指数: `META{
  const stress = stress_level || 5;
  const meditation = meditation_minutes || 0;
  const mood = daily_mood || "";
  
  let score = 50; // 基础分
  
  // 心情评分
  if (mood.includes("非常开心")) score += 25;
  else if (mood.includes("开心")) score += 20;
  else if (mood.includes("平静")) score += 15;
  else if (mood.includes("一般")) score += 0;
  else if (mood.includes("低落")) score -= 15;
  else if (mood.includes("焦虑") || mood.includes("愤怒")) score -= 20;
  
  // 压力影响
  score -= (stress - 5) * 3;
  
  // 冥想奖励
  score += Math.min(15, meditation * 0.5);
  
  score = Math.max(0, Math.min(100, score));
  return score.toFixed(0) + " 分";
}`

## 📊 健康总览

### 综合健康评估
```meta-bind-button
label: "生成健康报告"
icon: "file-medical"
style: primary
action:
  type: js
  code: |
    // 收集所有健康数据
    const healthData = {
      基本信息: {
        姓名: meta.getMetadata("health_name") || "未设置",
        年龄: meta.getMetadata("health_age") || 0,
        身高: meta.getMetadata("health_height") || 0,
        当前体重: meta.getMetadata("current_weight") || 0
      },
      BMI分析: {},
      运动状况: {
        累计时长: meta.getMetadata("total_exercise_minutes") || 0,
        累计卡路里: meta.getMetadata("total_calories_burned") || 0
      },
      睡眠状况: {
        最近时长: meta.getMetadata("last_sleep_duration") || 0
      },
      心理状态: {
        压力水平: meta.getMetadata("stress_level") || 0,
        心情: meta.getMetadata("daily_mood") || "未记录"
      }
    };
    
    // 计算BMI
    const height = healthData.基本信息.身高;
    const weight = healthData.基本信息.当前体重;
    if (height && weight) {
      const bmi = (weight / ((height / 100) ** 2)).toFixed(1);
      healthData.BMI分析 = {
        BMI值: bmi,
        状态: bmi < 18.5 ? "偏瘦" : bmi < 24 ? "正常" : bmi < 28 ? "偏胖" : "肥胖"
      };
    }
    
    // 计算综合健康评分
    let totalScore = 0;
    let factors = 0;
    
    // BMI评分
    if (healthData.BMI分析.BMI值) {
      const bmi = parseFloat(healthData.BMI分析.BMI值);
      if (bmi >= 18.5 && bmi < 24) totalScore += 25;
      else if (bmi >= 17 && bmi < 28) totalScore += 15;
      else totalScore += 5;
      factors++;
    }
    
    // 运动评分
    const weeklyMinutes = Math.min(healthData.运动状况.累计时长, 7 * 60); // 限制为一周
    totalScore += Math.min(25, weeklyMinutes / 6); // 150分钟满分
    factors++;
    
    // 睡眠评分
    const sleepHours = parseFloat(healthData.睡眠状况.最近时长);
    if (sleepHours >= 7 && sleepHours <= 9) totalScore += 25;
    else if (sleepHours >= 6 && sleepHours <= 10) totalScore += 15;
    else totalScore += 5;
    factors++;
    
    // 心理状态评分
    const stress = healthData.心理状态.压力水平;
    totalScore += Math.max(0, 25 - stress * 2.5);
    factors++;
    
    const avgScore = factors > 0 ? (totalScore / factors).toFixed(0) : 0;
    
    const report = {
      评估时间: new Date().toLocaleString(),
      综合健康评分: avgScore + " 分 (满分100分)",
      健康等级: avgScore >= 80 ? "优秀" : avgScore >= 60 ? "良好" : avgScore >= 40 ? "一般" : "需要改善",
      详细数据: healthData,
      建议: avgScore >= 80 ? "保持当前良好的健康习惯！" :
            avgScore >= 60 ? "整体不错，注意保持规律作息和适量运动" :
            avgScore >= 40 ? "需要改善运动、睡眠或饮食习惯" :
            "建议咨询专业医生，制定系统的健康改善计划"
    };
    
    meta.setMetadata("health_report", report);
    new Notice(`健康报告生成完成！综合评分: ${avgScore}分`);
```

### 健康报告
**最新健康评估**
- 评估时间: `META{health_report?.评估时间 || "未生成"}`
- 综合评分: `META{health_report?.综合健康评分 || "未评估"}`
- 健康等级: `META{health_report?.健康等级 || "未评估"}`
- 专业建议: `META{health_report?.建议 || "请先生成健康报告"}`

健康趋势: `META{
  const report = health_report;
  if (!report) return "📈 请先生成报告";
  
  const score = parseInt(report.综合健康评分);
  if (score >= 80) return "🌟 健康状况优秀";
  else if (score >= 60) return "💚 健康状况良好";
  else if (score >= 40) return "⚠️ 健康状况一般";
  else return "🚨 需要重点关注健康";
}`

### 健康目标设置
每周运动目标 (分钟):
```meta-bind
type: number
bind: weekly_exercise_goal
min: 60
max: 600
step: 30
```

每日睡眠目标 (小时):
```meta-bind
type: number
bind: daily_sleep_goal
min: 6
max: 10
step: 0.5
```

每日饮水目标 (杯):
```meta-bind
type: number
bind: daily_water_goal
min: 6
max: 15
```

```meta-bind-button
label: "设置健康目标"
icon: "target"
style: success
action:
  type: js
  code: |
    const goals = {
      运动目标: meta.getMetadata("weekly_exercise_goal") || 150,
      睡眠目标: meta.getMetadata("daily_sleep_goal") || 8,
      饮水目标: meta.getMetadata("daily_water_goal") || 8,
      设置时间: new Date().toLocaleString()
    };
    
    meta.setMetadata("health_goals", goals);
    new Notice("健康目标设置完成！");
```

**我的健康目标**
- 每周运动: `META{health_goals?.运动目标 || 150}` 分钟
- 每日睡眠: `META{health_goals?.睡眠目标 || 8}` 小时  
- 每日饮水: `META{health_goals?.饮水目标 || 8}` 杯
- 设置时间: `META{health_goals?.设置时间 || "未设置"}`

## 🔧 数据管理

### 导出健康数据
```meta-bind-button
label: "导出完整健康档案"
icon: "download"
style: secondary
action:
  type: js
  code: |
    const healthArchive = {
      个人信息: {
        姓名: meta.getMetadata("health_name"),
        年龄: meta.getMetadata("health_age"),
        性别: meta.getMetadata("health_gender"),
        身高: meta.getMetadata("health_height")
      },
      体重记录: meta.getMetadata("weight_history") || [],
      饮食记录: meta.getMetadata("diet_history") || [],
      运动记录: meta.getMetadata("exercise_history") || [],
      睡眠记录: meta.getMetadata("sleep_history") || [],
      心理记录: meta.getMetadata("mental_history") || [],
      健康目标: meta.getMetadata("health_goals"),
      最新报告: meta.getMetadata("health_report"),
      导出时间: new Date().toISOString()
    };
    
    const jsonData = JSON.stringify(healthArchive, null, 2);
    navigator.clipboard.writeText(jsonData);
    new Notice("健康档案已导出到剪贴板！");
```

### 清除数据
```meta-bind-button
label: "重置所有健康数据"
icon: "trash-2"
style: destructive
action:
  type: js
  code: |
    const confirm = window.confirm("确定要重置所有健康数据吗？此操作不可撤销！");
    if (!confirm) return;
    
    const keysToReset = [
      "health_name", "health_age", "health_gender", "health_height",
      "current_weight", "target_weight", "weight_history", "last_weight_date",
      "today_breakfast", "today_lunch", "today_dinner", "today_snacks",
      "daily_water", "vegetable_intake", "staple_foods", "diet_history", "last_diet_date",
      "exercise_type", "exercise_duration", "exercise_intensity", "calories_burned",
      "exercise_feeling", "exercise_history", "total_exercise_minutes", "total_calories_burned", "last_exercise_date",
      "bedtime", "wakeup_time", "sleep_quality", "pre_sleep_activities",
      "sleep_history", "last_sleep_duration", "last_sleep_date",
      "daily_mood", "stress_level", "daily_gratitude", "mood_triggers",
      "meditation_minutes", "social_activities", "mental_history", "last_mental_date",
      "health_report", "weekly_exercise_goal", "daily_sleep_goal", "daily_water_goal", "health_goals"
    ];
    
    keysToReset.forEach(key => meta.setMetadata(key, null));
    new Notice("所有健康数据已重置！");
```

---

## 🎯 使用说明

这个健康管理追踪器展示了Meta Bind的强大功能：

✅ **全面健康记录** - 体重、饮食、运动、睡眠、心理状态
✅ **智能数据分析** - 自动计算BMI、健康评分、趋势分析
✅ **目标管理** - 设置和追踪健康目标
✅ **历史数据追踪** - 完整的数据历史记录
✅ **综合评估报告** - 多维度健康状况分析
✅ **数据可视化** - 进度条、等级显示、状态指示
✅ **智能提醒** - 健康状况提醒和建议

通过这个系统，你可以全面地管理和追踪自己的健康状况，养成更好的生活习惯！ 