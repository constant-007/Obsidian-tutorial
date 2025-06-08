# Meta Bind 高级应用 - 客户关系管理系统

这是一个使用Meta Bind插件构建的完整CRM（客户关系管理）系统示例，展示了如何创建复杂的业务应用。

## 🏢 客户信息管理

### 基本客户信息
公司名称:
```meta-bind
type: input
bind: client_company
placeholder: "输入公司名称"
```

联系人姓名:
```meta-bind
type: input
bind: client_contact_name
placeholder: "主要联系人姓名"
```

职位:
```meta-bind
type: input
bind: client_position
placeholder: "联系人职位"
```

邮箱:
```meta-bind
type: input
bind: client_email
placeholder: "联系邮箱"
```

电话:
```meta-bind
type: input
bind: client_phone
placeholder: "联系电话"
```

### 客户分类信息
客户类型:
```meta-bind
type: select
bind: client_type
options:
  - 潜在客户
  - 正式客户
  - VIP客户
  - 流失客户
```

行业分类:
```meta-bind
type: select
bind: client_industry
options:
  - 科技
  - 金融
  - 教育
  - 医疗
  - 制造业
  - 零售
  - 其他
```

公司规模:
```meta-bind
type: select
bind: client_size
options:
  - 小型企业 (<50人)
  - 中型企业 (50-500人)
  - 大型企业 (500-5000人)
  - 超大型企业 (>5000人)
```

## 📊 客户信息看板

### 客户档案
---
**公司信息**
- 公司名称: `META{client_company || "未设置"}`
- 主要联系人: `META{client_contact_name || "未设置"}`
- 职位: `META{client_position || "未设置"}`
- 邮箱: `META{client_email || "未设置"}`
- 电话: `META{client_phone || "未设置"}`

**分类信息**
- 客户类型: `META{client_type || "未分类"}`
- 行业: `META{client_industry || "未分类"}`
- 公司规模: `META{client_size || "未设置"}`

**客户价值评估**
客户价值: `META{
  const type = client_type || "";
  const industry = client_industry || "";
  const size = client_size || "";
  
  let score = 0;
  
  // 客户类型评分
  if (type === "VIP客户") score += 40;
  else if (type === "正式客户") score += 30;
  else if (type === "潜在客户") score += 20;
  else if (type === "流失客户") score += 5;
  
  // 行业评分
  if (industry === "科技" || industry === "金融") score += 30;
  else if (industry === "医疗" || industry === "教育") score += 20;
  else score += 10;
  
  // 规模评分
  if (size.includes("超大型")) score += 30;
  else if (size.includes("大型")) score += 20;
  else if (size.includes("中型")) score += 15;
  else score += 10;
  
  return score + " 分";
}`

客户等级: `META{
  const type = client_type || "";
  if (type === "VIP客户") return "⭐⭐⭐⭐⭐ 钻石客户";
  else if (type === "正式客户") return "⭐⭐⭐⭐ 黄金客户";
  else if (type === "潜在客户") return "⭐⭐⭐ 银牌客户";
  else if (type === "流失客户") return "⭐ 需要挽回";
  else return "⭐⭐ 普通客户";
}`

---

## 💼 销售机会管理

### 创建销售机会
项目名称:
```meta-bind
type: input
bind: opportunity_name
placeholder: "输入项目或机会名称"
```

预估金额 (万元):
```meta-bind
type: number
bind: opportunity_amount
step: 0.1
min: 0
```

成功概率 (%):
```meta-bind
type: slider
bind: opportunity_probability
min: 0
max: 100
step: 10
```

销售阶段:
```meta-bind
type: select
bind: opportunity_stage
options:
  - 初步接触
  - 需求确认
  - 方案制定
  - 商务谈判
  - 合同签署
  - 项目交付
```

预计成交时间:
```meta-bind
type: date
bind: opportunity_close_date
```

负责销售:
```meta-bind
type: input
bind: opportunity_owner
placeholder: "销售负责人"
```

### 机会分析
**销售机会概览**
- 项目名称: `META{opportunity_name || "未设置"}`
- 预估金额: `META{opportunity_amount || 0}` 万元
- 成功概率: `META{opportunity_probability || 0}%`
- 预期收入: `META{((opportunity_amount || 0) * (opportunity_probability || 0) / 100).toFixed(1)}` 万元
- 当前阶段: `META{opportunity_stage || "未设置"}`
- 预计成交: `META{opportunity_close_date || "未设置"}`
- 负责人: `META{opportunity_owner || "未指定"}`

**阶段进度**
销售进度: `META{
  const stage = opportunity_stage || "";
  const stages = ["初步接触", "需求确认", "方案制定", "商务谈判", "合同签署", "项目交付"];
  const currentIndex = stages.indexOf(stage);
  const progress = currentIndex >= 0 ? ((currentIndex + 1) / stages.length * 100) : 0;
  
  const bars = Math.round(progress / 5);
  return "🟩".repeat(bars) + "⬜".repeat(20 - bars) + " " + progress.toFixed(0) + "%";
}`

风险评估: `META{
  const probability = opportunity_probability || 0;
  const amount = opportunity_amount || 0;
  
  if (probability >= 80 && amount >= 10) return "🟢 高价值低风险";
  else if (probability >= 60 && amount >= 5) return "🟡 中等风险";
  else if (probability >= 40) return "🟠 需要关注";
  else return "🔴 高风险项目";
}`

## 📅 客户互动记录

### 添加互动记录
互动类型:
```meta-bind
type: select
bind: interaction_type
options:
  - 电话沟通
  - 邮件往来
  - 会议拜访
  - 产品演示
  - 技术支持
  - 商务谈判
  - 合同签署
  - 培训服务
```

互动主题:
```meta-bind
type: input
bind: interaction_subject
placeholder: "本次互动的主要内容"
```

互动结果:
```meta-bind
type: select
bind: interaction_result
options:
  - 非常成功
  - 基本达成目标
  - 有待改进
  - 效果不佳
```

详细记录:
```meta-bind
type: textArea
bind: interaction_details
placeholder: "详细记录本次互动的内容、讨论要点、客户反馈等..."
```

下次跟进时间:
```meta-bind
type: date
bind: next_followup
```

```meta-bind-button
label: "保存互动记录"
icon: "save"
style: primary
action:
  type: js
  code: |
    const record = {
      type: meta.getMetadata("interaction_type"),
      subject: meta.getMetadata("interaction_subject"),
      result: meta.getMetadata("interaction_result"),
      details: meta.getMetadata("interaction_details"),
      nextFollowup: meta.getMetadata("next_followup"),
      timestamp: new Date().toLocaleString(),
      client: meta.getMetadata("client_company") || "未指定客户"
    };
    
    if (!record.type || !record.subject) {
      new Notice("请填写互动类型和主题");
      return;
    }
    
    // 保存记录
    const existingRecords = meta.getMetadata("interaction_history") || [];
    existingRecords.push(record);
    meta.setMetadata("interaction_history", existingRecords);
    
    // 更新统计
    meta.setMetadata("last_interaction", record.timestamp);
    meta.setMetadata("total_interactions", existingRecords.length);
    
    new Notice("互动记录已保存！");
    
    // 清空表单
    meta.setMetadata("interaction_type", null);
    meta.setMetadata("interaction_subject", null);
    meta.setMetadata("interaction_result", null);
    meta.setMetadata("interaction_details", null);
    meta.setMetadata("next_followup", null);
```

### 互动统计
**互动摘要**
- 总互动次数: `META{total_interactions || 0}` 次
- 最后互动时间: `META{last_interaction || "无记录"}`
- 下次跟进时间: `META{next_followup || "未设置"}`

跟进提醒: `META{
  const nextDate = next_followup;
  if (!nextDate) return "📅 请设置跟进时间";
  
  const today = new Date();
  const followupDate = new Date(nextDate);
  const diffDays = Math.ceil((followupDate - today) / (1000 * 60 * 60 * 24));
  
  if (diffDays < 0) return "🔴 跟进逾期 " + Math.abs(diffDays) + " 天";
  else if (diffDays === 0) return "🟡 今日需要跟进";
  else if (diffDays <= 3) return "🟠 " + diffDays + " 天后跟进";
  else return "🟢 " + diffDays + " 天后跟进";
}`

## 📈 业绩分析

### 销售目标设置
月度销售目标 (万元):
```meta-bind
type: number
bind: monthly_target
step: 1
min: 0
```

已完成销售额 (万元):
```meta-bind
type: number
bind: completed_sales
step: 0.1
min: 0
```

### 业绩看板
**本月业绩**
- 销售目标: `META{monthly_target || 0}` 万元
- 已完成: `META{completed_sales || 0}` 万元
- 完成率: `META{monthly_target ? ((completed_sales || 0) / monthly_target * 100).toFixed(1) : 0}%`
- 剩余目标: `META{Math.max(0, (monthly_target || 0) - (completed_sales || 0))}` 万元

目标完成进度: `META{
  const target = monthly_target || 0;
  const completed = completed_sales || 0;
  if (target === 0) return "⬜".repeat(20) + " 0%";
  
  const percentage = Math.min(100, (completed / target * 100));
  const bars = Math.round(percentage / 5);
  return "🟩".repeat(bars) + "⬜".repeat(20 - bars) + " " + percentage.toFixed(1) + "%";
}`

业绩状态: `META{
  const target = monthly_target || 0;
  const completed = completed_sales || 0;
  if (target === 0) return "📊 请设置目标";
  
  const percentage = (completed / target * 100);
  if (percentage >= 100) return "🎉 目标已达成！";
  else if (percentage >= 80) return "🔥 接近目标，加油！";
  else if (percentage >= 60) return "💪 进展良好";
  else if (percentage >= 40) return "⚡ 需要加速";
  else return "🚨 需要紧急行动";
}`

### 客户价值分析
```meta-bind-button
label: "生成客户分析报告"
icon: "bar-chart"
style: primary
action:
  type: js
  code: |
    const clientData = {
      company: meta.getMetadata("client_company") || "未知客户",
      type: meta.getMetadata("client_type") || "未分类",
      industry: meta.getMetadata("client_industry") || "未知行业",
      size: meta.getMetadata("client_size") || "未知规模",
      opportunity: {
        name: meta.getMetadata("opportunity_name") || "无项目",
        amount: meta.getMetadata("opportunity_amount") || 0,
        probability: meta.getMetadata("opportunity_probability") || 0,
        stage: meta.getMetadata("opportunity_stage") || "未设置"
      },
      interactions: meta.getMetadata("total_interactions") || 0
    };
    
    // 计算客户生命周期价值
    const clv = clientData.opportunity.amount * (clientData.opportunity.probability / 100);
    
    // 生成分析结果
    const analysis = {
      客户生命周期价值: clv.toFixed(1) + " 万元",
      客户活跃度: clientData.interactions > 5 ? "高" : clientData.interactions > 2 ? "中" : "低",
      转化可能性: clientData.opportunity.probability > 70 ? "高" : clientData.opportunity.probability > 40 ? "中" : "低",
      优先级: clv > 10 ? "高优先级" : clv > 5 ? "中优先级" : "低优先级",
      建议行动: clv > 10 ? "重点跟进，配置资深销售" : clv > 5 ? "定期跟进，保持联系" : "维护关系，等待机会"
    };
    
    meta.setMetadata("client_analysis", analysis);
    meta.setMetadata("analysis_date", new Date().toLocaleString());
    
    new Notice("客户分析报告生成完成！");
```

**客户分析报告**
- 分析时间: `META{analysis_date || "未生成"}`
- 生命周期价值: `META{client_analysis?.客户生命周期价值 || "未计算"}`
- 客户活跃度: `META{client_analysis?.客户活跃度 || "未评估"}`
- 转化可能性: `META{client_analysis?.转化可能性 || "未评估"}`
- 客户优先级: `META{client_analysis?.优先级 || "未评估"}`
- 行动建议: `META{client_analysis?.建议行动 || "请先生成分析报告"}`

## 🎯 客户关怀

### 客户满意度调查
服务满意度:
```meta-bind
type: slider
bind: service_satisfaction
min: 1
max: 10
step: 1
```

产品满意度:
```meta-bind
type: slider
bind: product_satisfaction
min: 1
max: 10
step: 1
```

推荐可能性:
```meta-bind
type: slider
bind: nps_score
min: 0
max: 10
step: 1
```

改进建议:
```meta-bind
type: textArea
bind: customer_feedback
placeholder: "客户提出的改进建议..."
```

```meta-bind-button
label: "提交满意度调查"
icon: "heart"
style: success
action:
  type: js
  code: |
    const survey = {
      service: meta.getMetadata("service_satisfaction") || 0,
      product: meta.getMetadata("product_satisfaction") || 0,
      nps: meta.getMetadata("nps_score") || 0,
      feedback: meta.getMetadata("customer_feedback") || "",
      date: new Date().toLocaleString(),
      client: meta.getMetadata("client_company") || "未知客户"
    };
    
    if (survey.service === 0 || survey.product === 0) {
      new Notice("请完成满意度评分");
      return;
    }
    
    // 计算综合满意度
    const overallSatisfaction = ((survey.service + survey.product) / 2).toFixed(1);
    
    // 判断NPS类型
    let npsType = "";
    if (survey.nps >= 9) npsType = "推广者";
    else if (survey.nps >= 7) npsType = "中性者"; 
    else npsType = "批评者";
    
    meta.setMetadata("overall_satisfaction", overallSatisfaction);
    meta.setMetadata("nps_type", npsType);
    meta.setMetadata("survey_date", survey.date);
    
    new Notice(`满意度调查完成！综合评分: ${overallSatisfaction}/10`);
```

**满意度报告**
- 调查时间: `META{survey_date || "未调查"}`
- 综合满意度: `META{overall_satisfaction || "0"}` / 10
- NPS类型: `META{nps_type || "未评估"}`
- 客户反馈: `META{customer_feedback || "无反馈"}`

满意度等级: `META{
  const score = parseFloat(overall_satisfaction || 0);
  if (score >= 9) return "😍 非常满意";
  else if (score >= 7) return "😊 比较满意";
  else if (score >= 5) return "😐 一般";
  else if (score >= 3) return "😞 不满意";
  else return "😡 非常不满意";
}`

## 🔧 系统管理

### 数据导出
```meta-bind-button
label: "导出客户档案"
icon: "download"
style: secondary
action:
  type: js
  code: |
    const customerProfile = {
      基本信息: {
        公司名称: meta.getMetadata("client_company"),
        联系人: meta.getMetadata("client_contact_name"),
        职位: meta.getMetadata("client_position"),
        邮箱: meta.getMetadata("client_email"),
        电话: meta.getMetadata("client_phone"),
        客户类型: meta.getMetadata("client_type"),
        行业: meta.getMetadata("client_industry"),
        规模: meta.getMetadata("client_size")
      },
      销售机会: {
        项目名称: meta.getMetadata("opportunity_name"),
        预估金额: meta.getMetadata("opportunity_amount"),
        成功概率: meta.getMetadata("opportunity_probability"),
        当前阶段: meta.getMetadata("opportunity_stage"),
        负责人: meta.getMetadata("opportunity_owner")
      },
      满意度: {
        综合满意度: meta.getMetadata("overall_satisfaction"),
        NPS类型: meta.getMetadata("nps_type"),
        调查时间: meta.getMetadata("survey_date")
      },
      分析结果: meta.getMetadata("client_analysis"),
      导出时间: new Date().toISOString()
    };
    
    const jsonData = JSON.stringify(customerProfile, null, 2);
    navigator.clipboard.writeText(jsonData);
    new Notice("客户档案已导出到剪贴板！");
```

### 系统重置
```meta-bind-button
label: "重置所有数据"
icon: "refresh-cw"
style: destructive
action:
  type: js
  code: |
    const confirm = window.confirm("确定要重置所有CRM数据吗？此操作不可撤销！");
    if (!confirm) return;
    
    const keysToReset = [
      "client_company", "client_contact_name", "client_position", "client_email", "client_phone",
      "client_type", "client_industry", "client_size", "opportunity_name", "opportunity_amount",
      "opportunity_probability", "opportunity_stage", "opportunity_close_date", "opportunity_owner",
      "interaction_type", "interaction_subject", "interaction_result", "interaction_details",
      "next_followup", "interaction_history", "last_interaction", "total_interactions",
      "monthly_target", "completed_sales", "service_satisfaction", "product_satisfaction",
      "nps_score", "customer_feedback", "overall_satisfaction", "nps_type", "survey_date",
      "client_analysis", "analysis_date"
    ];
    
    keysToReset.forEach(key => meta.setMetadata(key, null));
    new Notice("所有CRM数据已重置！");
```

---

## 📋 使用指南

这个CRM系统展示了Meta Bind的强大功能：

✅ **完整的数据管理** - 客户信息、销售机会、互动记录
✅ **实时数据分析** - 自动计算客户价值、业绩分析
✅ **交互式界面** - 直观的表单和按钮操作
✅ **智能提醒** - 跟进提醒、风险评估
✅ **数据可视化** - 进度条、等级显示
✅ **业务逻辑** - 复杂的计算和条件判断
✅ **数据导出** - JSON格式的数据导出功能

你可以基于这个模板构建自己的业务管理系统！ 