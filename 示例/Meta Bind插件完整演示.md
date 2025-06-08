# Meta Bind 插件完整演示

Meta Bind是一个强大的Obsidian插件，它允许你在笔记中创建交互式表单元素、绑定数据到文档属性、实现响应式用户界面。

## 1. 基础输入字段演示

### 文本输入
```meta-bind
name: "用户姓名"
type: input
bind: user_name
```

### 数字输入
```meta-bind
name: "年龄"
type: number
bind: user_age
```

### 下拉选择
```meta-bind
name: "职业"
type: select
bind: profession
options:
  - 学生
  - 教师
  - 工程师
  - 设计师
```

### 复选框
```meta-bind
name: "兴趣爱好"
type: checkbox
bind: hobbies
options:
  - 阅读
  - 运动
  - 音乐
  - 编程
```

### 切换开关
```meta-bind
name: "接收通知"
type: toggle
bind: notifications
```

### 滑块
```meta-bind
name: "满意度"
type: slider
bind: satisfaction
min: 1
max: 10
step: 1
```

## 2. 数据显示

显示姓名: `META{user_name}`
显示年龄: `META{user_age}` 岁
职业: `META{profession}`
通知状态: `META{notifications ? "已开启" : "已关闭"}`
满意度: `META{satisfaction}`/10

## 3. 按钮组件

### 基本按钮
```meta-bind-button
label: "保存数据"
icon: "save"
style: primary
action:
  type: command
  command: "app:reload"
```

### JavaScript按钮
```meta-bind-button
label: "显示问候"
icon: "message-circle"
style: primary
action:
  type: js
  code: |
    const name = meta.getMetadata("user_name") || "朋友";
    new Notice(`你好，${name}！`);
```

## 4. 高级功能演示

### BMI计算器
身高(cm):
```meta-bind
type: number
bind: height
placeholder: "170"
```

体重(kg):
```meta-bind
type: number
bind: weight
placeholder: "70"
```

BMI指数: `META{weight && height ? (weight / ((height / 100) ** 2)).toFixed(1) : "未计算"}`

### 任务管理器
任务标题:
```meta-bind
type: input
bind: task_title
placeholder: "输入任务标题"
```

任务状态:
```meta-bind
type: select
bind: task_status
options:
  - 待开始
  - 进行中
  - 已完成
```

```meta-bind-button
label: "完成任务"
icon: "check"
style: success
action:
  type: updateMetadata
  bindTarget: task_status
  evaluate: false
  value: "已完成"
```

当前任务: `META{task_title || "无任务"}`
状态: `META{task_status || "未设置"}`

### 学习进度跟踪
总课程数:
```meta-bind
type: number
bind: total_courses
min: 1
```

已完成:
```meta-bind
type: number
bind: completed_courses
min: 0
```

进度: `META{total_courses ? ((completed_courses || 0) / total_courses * 100).toFixed(1) : 0}%`

```meta-bind-button
label: "完成一门课程"
icon: "plus"
style: primary
action:
  type: js
  code: |
    const current = meta.getMetadata("completed_courses") || 0;
    const total = meta.getMetadata("total_courses") || 0;
    if (current < total) {
      meta.setMetadata("completed_courses", current + 1);
      new Notice("恭喜完成一门课程！");
    }
```

## 5. 表单验证示例

### 用户注册表单
用户名:
```meta-bind
type: input
bind: reg_username
placeholder: "请输入用户名"
```

邮箱:
```meta-bind
type: input
bind: reg_email
placeholder: "请输入邮箱"
```

同意条款:
```meta-bind
type: toggle
bind: agree_terms
```

```meta-bind-button
label: "注册"
icon: "user-plus"
style: primary
action:
  type: js
  code: |
    const username = meta.getMetadata("reg_username");
    const email = meta.getMetadata("reg_email");
    const agreed = meta.getMetadata("agree_terms");
    
    if (!username || !email || !agreed) {
      new Notice("请填写所有必填项并同意条款");
      return;
    }
    
    if (!email.includes("@")) {
      new Notice("请输入有效的邮箱地址");
      return;
    }
    
    meta.setMetadata("registration_success", true);
    new Notice("注册成功！");
```

注册状态: `META{registration_success ? "✅ 已注册" : "⏳ 未注册"}`

## 6. 数据统计看板

### 项目信息
项目名称:
```meta-bind
type: input
bind: project_name
```

项目进度:
```meta-bind
type: slider
bind: project_progress
min: 0
max: 100
step: 5
```

团队人数:
```meta-bind
type: number
bind: team_size
min: 1
```

### 项目看板
**项目名称:** `META{project_name || "未命名项目"}`
**完成进度:** `META{project_progress || 0}%`
**团队规模:** `META{team_size || 0}` 人

进度条: `META{
  const progress = project_progress || 0;
  const bars = Math.round(progress / 5);
  return "🟩".repeat(bars) + "⬜".repeat(20 - bars);
}`

项目状态: `META{
  const progress = project_progress || 0;
  if (progress === 0) return "🔴 未开始";
  if (progress < 50) return "🟡 进行中";
  if (progress < 100) return "🔵 即将完成";
  return "🟢 已完成";
}`

```meta-bind-button
label: "项目完成"
icon: "check-circle"
style: success
action:
  type: js
  code: |
    meta.setMetadata("project_progress", 100);
    meta.setMetadata("completion_date", new Date().toLocaleDateString());
    new Notice("🎉 项目完成！");
```

完成日期: `META{completion_date || "未完成"}`

## 7. 高级JavaScript应用

### 数据分析工具
```meta-bind-button
label: "分析当前数据"
icon: "bar-chart"
style: primary
action:
  type: js
  code: |
    const data = {
      name: meta.getMetadata("user_name") || "未知用户",
      age: meta.getMetadata("user_age") || 0,
      satisfaction: meta.getMetadata("satisfaction") || 0,
      progress: meta.getMetadata("project_progress") || 0
    };
    
    const score = (data.satisfaction * 0.4 + data.progress * 0.006) * (data.age > 18 ? 1 : 0.8);
    
    meta.setMetadata("analysis_score", score.toFixed(2));
    meta.setMetadata("analysis_time", new Date().toLocaleString());
    
    let level = "初级";
    if (score >= 8) level = "优秀";
    else if (score >= 6) level = "良好";
    else if (score >= 4) level = "中等";
    
    meta.setMetadata("user_level", level);
    new Notice(`分析完成！综合评分: ${score.toFixed(2)}`);
```

**数据分析结果:**
- 用户等级: `META{user_level || "未评估"}`
- 综合评分: `META{analysis_score || "0"}` 分
- 分析时间: `META{analysis_time || "未分析"}`

### 数据导出功能
```meta-bind-button
label: "导出所有数据"
icon: "download"
style: secondary
action:
  type: js
  code: |
    const exportData = {
      个人信息: {
        姓名: meta.getMetadata("user_name"),
        年龄: meta.getMetadata("user_age"),
        职业: meta.getMetadata("profession")
      },
      项目信息: {
        项目名称: meta.getMetadata("project_name"),
        进度: meta.getMetadata("project_progress")
      },
      导出时间: new Date().toISOString()
    };
    
    const jsonData = JSON.stringify(exportData, null, 2);
    navigator.clipboard.writeText(jsonData);
    new Notice("数据已导出到剪贴板！");
```

## 8. 样式定制示例

### 自定义样式按钮
```meta-bind-button
label: "主要操作"
icon: "star"
style: primary
class: "custom-btn-primary"
action:
  type: js
  code: new Notice("主要按钮被点击！");
```

```meta-bind-button
label: "危险操作"
icon: "alert-triangle"
style: destructive
class: "custom-btn-danger"
action:
  type: js
  code: new Notice("危险操作确认！");
```

### 自定义输入样式
```meta-bind
name: "特殊输入"
type: input
bind: styled_input
class: "custom-input-style"
placeholder: "这是自定义样式的输入框"
```

## 9. 实际应用场景

### 每日打卡系统
今日日期: `META{new Date().toLocaleDateString()}`

打卡项目:
```meta-bind
type: checkbox
bind: daily_tasks
options:
  - 晨练
  - 阅读
  - 工作
  - 学习
  - 反思
```

```meta-bind-button
label: "提交打卡"
icon: "check-square"
style: success
action:
  type: js
  code: |
    const tasks = meta.getMetadata("daily_tasks") || [];
    const today = new Date().toLocaleDateString();
    const completedCount = tasks.length;
    
    meta.setMetadata("last_checkin_date", today);
    meta.setMetadata("checkin_count", completedCount);
    
    if (completedCount >= 3) {
      new Notice(`🎉 今日完成 ${completedCount} 项任务，表现优秀！`);
    } else {
      new Notice(`✅ 今日完成 ${completedCount} 项任务`);
    }
```

最后打卡: `META{last_checkin_date || "从未打卡"}`
完成任务数: `META{checkin_count || 0}` 项

### 财务记录器
收入/支出:
```meta-bind
type: select
bind: transaction_type
options:
  - 收入
  - 支出
```

金额:
```meta-bind
type: number
bind: amount
step: 0.01
```

类别:
```meta-bind
type: select
bind: category
options:
  - 餐饮
  - 交通
  - 购物
  - 娱乐
  - 其他
```

```meta-bind-button
label: "记录交易"
icon: "plus-circle"
style: primary
action:
  type: js
  code: |
    const type = meta.getMetadata("transaction_type");
    const amount = meta.getMetadata("amount") || 0;
    const category = meta.getMetadata("category");
    
    if (!type || !amount || !category) {
      new Notice("请填写完整信息");
      return;
    }
    
    const currentBalance = meta.getMetadata("balance") || 0;
    const newBalance = type === "收入" ? currentBalance + amount : currentBalance - amount;
    
    meta.setMetadata("balance", newBalance);
    meta.setMetadata("last_transaction", `${type}: ¥${amount} (${category})`);
    
    new Notice(`记录成功！当前余额: ¥${newBalance.toFixed(2)}`);
```

当前余额: ¥`META{(balance || 0).toFixed(2)}`
最后交易: `META{last_transaction || "无记录"}`

## 10. 故障排除

### 测试连接
```meta-bind-button
label: "测试插件状态"
icon: "activity"
style: secondary
action:
  type: js
  code: |
    const testData = {
      timestamp: new Date().toISOString(),
      random: Math.random().toString(36).substring(7)
    };
    
    meta.setMetadata("test_result", testData);
    new Notice("插件工作正常！测试数据已保存。");
```

测试结果: `META{test_result ? "✅ 正常" : "❌ 异常"}`

### 清除所有数据
```meta-bind-button
label: "重置演示数据"
icon: "refresh-cw"
style: destructive
action:
  type: js
  code: |
    const keysToReset = [
      "user_name", "user_age", "profession", "hobbies", "notifications",
      "satisfaction", "height", "weight", "task_title", "task_status",
      "project_name", "project_progress", "balance"
    ];
    
    keysToReset.forEach(key => meta.setMetadata(key, null));
    new Notice("演示数据已重置！");
```

---

这个演示文件展示了Meta Bind插件的所有主要功能：

✅ **基础输入控件** - 文本、数字、选择、切换等
✅ **数据绑定和显示** - 实时数据同步
✅ **按钮交互** - 各种类型的按钮操作  
✅ **JavaScript编程** - 复杂逻辑处理
✅ **表单验证** - 数据验证和错误处理
✅ **数据分析** - 统计和计算功能
✅ **实际应用** - 打卡、财务等实用场景
✅ **样式定制** - 自定义外观
✅ **故障排除** - 测试和维护工具

通过这些示例，你可以学会如何使用Meta Bind创建强大的交互式文档和应用！ 