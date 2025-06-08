# Meta Bind按钮高级功能演示

本文件展示Meta Bind插件中按钮的各种高级功能和应用场景。

## 基础按钮示例

### 简单命令按钮
```meta-bind-button
style: primary
label: 打开命令面板
id: open-command-palette
action:
  type: command
  command: command-palette:open
```

### 更新元数据按钮
```meta-bind-button
style: default
label: 标记为已完成
id: mark-completed
action:
  type: updateMetadata
  bindTarget: completed
  evaluate: false
  value: true
```

### 重置数据按钮
```meta-bind-button
style: destructive
label: 重置所有数据
id: reset-all
action:
  type: updateMetadata
  bindTarget: progress
  evaluate: false
  value: 0
```

## 多动作按钮

### 完成任务并记录时间
```meta-bind-button
style: primary
label: 完成任务
id: complete-task-with-time
actions:
  - type: updateMetadata
    bindTarget: completed
    evaluate: false
    value: true
  - type: updateMetadata
    bindTarget: completedTime
    evaluate: false
    value: "{{date:YYYY-MM-DD HH:mm}}"
  - type: updateMetadata
    bindTarget: status
    evaluate: false
    value: "已完成"
```

### 创建新笔记按钮
```meta-bind-button
style: primary
label: 创建每日笔记
id: create-daily-note
action:
  type: createNote
  folderPath: "Daily Notes"
  fileName: "{{date:YYYY-MM-DD}} - Daily Note"
  openNote: true
  content: |
    # {{date:YYYY-MM-DD}} 每日笔记
    
    ## 今日目标
    - [ ] 
    - [ ] 
    - [ ] 
    
    ## 重要事项
    
    ## 学习记录
    
    ## 反思总结
```

## JavaScript 按钮

### 计算BMI
```meta-bind-button
style: default
label: 计算BMI
id: calculate-bmi
action:
  type: inlineJS
  code: |
    const weight = context.bound.weight || 0;
    const height = context.bound.height || 0;
    if (weight > 0 && height > 0) {
      const bmi = weight / ((height / 100) ** 2);
      const status = bmi < 18.5 ? '偏瘦' : 
                     bmi < 25 ? '正常' : 
                     bmi < 30 ? '超重' : '肥胖';
      engine.updateMetadata('bmi', bmi.toFixed(1), context.file.path);
      engine.updateMetadata('bmiStatus', status, context.file.path);
      new Notice(`BMI: ${bmi.toFixed(1)} (${status})`);
    } else {
      new Notice('请先输入体重和身高！');
    }
```

### 生成随机密码
```meta-bind-button
style: default
label: 生成随机密码
id: generate-password
action:
  type: inlineJS
  code: |
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*';
    let password = '';
    for (let i = 0; i < 12; i++) {
      password += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    engine.updateMetadata('generatedPassword', password, context.file.path);
    navigator.clipboard.writeText(password);
    new Notice('密码已生成并复制到剪贴板！');
```

## 条件按钮

### 根据进度显示不同按钮
```meta-bind-button
style: primary
label: 开始任务
id: start-task
hidden: "progress > 0"
action:
  type: updateMetadata
  bindTarget: progress
  evaluate: false
  value: 10
```

```meta-bind-button
style: default
label: 继续任务
id: continue-task
hidden: "progress == 0 || progress >= 100"
action:
  type: inlineJS
  code: |
    const currentProgress = context.bound.progress || 0;
    const newProgress = Math.min(currentProgress + 10, 100);
    engine.updateMetadata('progress', newProgress, context.file.path);
    new Notice(`进度更新为 ${newProgress}%`);
```

```meta-bind-button
style: primary
label: 任务完成
id: finish-task
hidden: "progress < 100"
action:
  type: updateMetadata
  bindTarget: completed
  evaluate: false
  value: true
```

## 文本处理按钮

### 正则替换按钮
```meta-bind-button
style: default
label: 格式化电话号码
id: format-phone
action:
  type: regexpReplaceInNote
  regexp: "(\d{3})(\d{4})(\d{4})"
  replacement: "$1-$2-$3"
```

### 插入模板按钮
```meta-bind-button
style: primary
label: 插入会议记录模板
id: insert-meeting-template
action:
  type: insertIntoNote
  content: |
    ## 会议记录 - {{date:YYYY-MM-DD}}
    
    **会议时间**: {{date:YYYY-MM-DD HH:mm}}
    **参会人员**: 
    **会议主题**: 
    
    ### 讨论要点
    1. 
    2. 
    3. 
    
    ### 决定事项
    - [ ] 
    - [ ] 
    
    ### 下次会议
    **时间**: 
    **议题**: 
```

## 文件操作按钮

### 打开相关文件按钮
```meta-bind-button
style: default
label: 打开项目文档
id: open-project-doc
action:
  type: open
  link: "Projects/Project Documentation.md"
  newTab: true
```

### 运行外部脚本按钮
```meta-bind-button
style: primary
label: 备份笔记
id: backup-notes
action:
  type: jsFile
  file: "Scripts/backup-script.js"
```

## 延时和睡眠按钮

### 延时提醒按钮
```meta-bind-button
style: default
label: 5分钟后提醒
id: delayed-reminder
actions:
  - type: sleep
    ms: 300000
  - type: inlineJS
    code: |
      new Notice('提醒：时间到了！', 5000);
```

## 实际应用示例

### 学习进度跟踪器

输入字段：
```meta-bind
INPUT[text(placeholder(课程名称)):courseName]
INPUT[number(minValue(0), maxValue(100)):progress]
INPUT[toggle:completed]
```

控制按钮：
```meta-bind-button
style: primary
label: 增加进度 (+10%)
id: increase-progress
action:
  type: inlineJS
  code: |
    const current = context.bound.progress || 0;
    const newProgress = Math.min(current + 10, 100);
    engine.updateMetadata('progress', newProgress, context.file.path);
    if (newProgress >= 100) {
      engine.updateMetadata('completed', true, context.file.path);
      new Notice('恭喜！课程已完成！');
    }
```

```meta-bind-button
style: destructive
label: 重置进度
id: reset-progress
action:
  type: inlineJS
  code: |
    engine.updateMetadata('progress', 0, context.file.path);
    engine.updateMetadata('completed', false, context.file.path);
    new Notice('进度已重置');
```

### 任务管理器

```meta-bind-button
style: primary
label: 创建新任务
id: create-new-task
action:
  type: createNote
  folderPath: "Tasks"
  fileName: "任务 - {{date:YYYY-MM-DD-HHmm}}"
  openNote: true
  content: |
    ---
    type: task
    status: 待办
    priority: 中
    created: {{date:YYYY-MM-DD}}
    ---
    
    # 任务详情
    
    ## 描述
    
    
    ## 子任务
    - [ ] 
    - [ ] 
    
    ## 备注
```

## 内联按钮调用

使用上面定义的按钮：

- 基础操作：`BUTTON[mark-completed]` `BUTTON[reset-all]`
- 数据计算：`BUTTON[calculate-bmi]` `BUTTON[generate-password]`
- 进度管理：`BUTTON[start-task]` `BUTTON[continue-task]` `BUTTON[finish-task]`
- 文件操作：`BUTTON[create-daily-note]` `BUTTON[insert-meeting-template]`

## 按钮组合

多个按钮组合使用：`BUTTON[increase-progress, reset-progress]`

任务管理组合：`BUTTON[create-new-task, open-project-doc]`

## 最佳实践

1. **使用有意义的ID**：为每个按钮设置清晰的标识符
2. **合理设置样式**：根据按钮功能选择合适的样式（primary、default、destructive、plain）
3. **添加条件显示**：使用 `hidden` 属性根据条件显示/隐藏按钮
4. **组合多个动作**：使用 `actions` 数组执行多个操作
5. **错误处理**：在JavaScript代码中添加适当的错误检查
6. **用户反馈**：使用 `Notice` 给用户及时反馈

这些示例展示了Meta Bind按钮的强大功能，可以自动化各种任务，提高工作效率。 