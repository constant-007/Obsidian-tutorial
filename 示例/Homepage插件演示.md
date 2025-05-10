# Homepage 插件功能演示

Homepage插件是Obsidian中强大的主页创建工具，可以为您的知识库提供一个集中的导航和操作中心。以下演示其最强大的功能。

## 1. 动态内容展示

Homepage可以自动展示和更新各类动态内容：

```homepage-section
type: quick-links
links: 
  - "[[文档1|重要笔记]]"
  - "[[文档2|进行中的项目]]"
  - "[[文档3|参考资料]]"
title: 快速访问
```

```homepage-section
type: recent-files
limit: 5
title: 最近编辑的文件
```

```homepage-section
type: starred-files
limit: 3
title: 已加星标的文件
```

## 2. 日历和任务整合

显示您的日历视图和待办任务：

```homepage-section
type: calendar
title: 日历视图
```

```homepage-section
type: tasks
query: "not done"
limit: 5
title: 待办任务
filter: path includes 任务 OR tags includes #任务
```

## 3. 高级数据视图

通过Dataview查询展示强大的数据视图功能：

```homepage-section
type: dataview
query: 'TABLE file.mtime as "上次修改", choice(contains(tags, "#项目"), "✅", "❌") as "是项目" FROM "项目" SORT file.mtime DESC LIMIT 5'
title: 项目状态追踪
```

## 4. Markdown内容与样式

支持完整的Markdown格式，包括表格、图片等：

```homepage-section
type: markdown
content: |
  ## 今日焦点
  
  | 项目 | 优先级 | 时间 |
  | --- | --- | --- |
  | 写作 | 高 | 2小时 |
  | 阅读 | 中 | 1小时 |
  | 复习 | 低 | 30分钟 |
  
  ![工作流程](../Attachment/avatar.jpg)
title: 自定义内容
```

## 5. 天气和外部API整合

```homepage-section
type: weather
location: Beijing
title: 北京天气
```

## 6. 自定义CSS样式

```homepage-section
type: markdown
content: |
  <div class="custom-homepage-card">
    <h3>个性化欢迎界面</h3>
    <p>使用自定义CSS创建独特的设计</p>
    <button class="homepage-button">点击开始工作</button>
  </div>
title: 自定义样式组件
cssclasses: custom-card
```

## 7. 可折叠分组

```homepage-section
type: group
collapsed: false
title: 学习资源
sections:
  - type: quick-links
    links: 
      - "[[笔记1|编程笔记]]"
      - "[[笔记2|语言学习]]"
    title: 学习链接
  - type: markdown
    content: |
      - [ ] 完成Python课程
      - [ ] 复习英语
    title: 学习计划
```

## 8. 动态生成的工作区

```homepage-section
type: workspaces
limit: 5
title: 保存的工作区
```

## 9. 命令按钮

```homepage-section
type: buttons
buttons:
  - name: 创建新笔记
    icon: create-new
    cmd: create-new
  - name: 打开图谱视图
    icon: graph
    cmd: graph:open
  - name: 每日笔记
    icon: calendar-with-checkmark
    cmd: daily-notes
title: 快速命令
```

## 10. 可定制的布局系统

```homepage-section
type: layout
layout:
  - direction: row
    size: 50-50
    sections:
      - type: markdown
        content: |
          ## 左侧内容
          这里是左边的内容区域
        title: 左侧面板
      - type: markdown
        content: |
          ## 右侧内容
          这里是右边的内容区域
        title: 右侧面板
title: 自定义布局
```

---

## 配置示例

以下是一个完整的Homepage配置示例（需保存为`homepage.md`）：

```yaml
---
cssclasses:
  - homepage
---

<div class="home-header">
  <div class="home-date">
    <span id="today"></span>
    <span id="time"></span>
  </div>
  <div class="home-greeting">
    <h3>欢迎回来，<span id="user-greeting"></span></h3>
  </div>
</div>

<div class="home-grid">
  <div class="home-card">
    <h3>📝 最近文件</h3>
    <div class="recent-files-content">
      %% 将由Homepage插件动态填充 %%
    </div>
  </div>
  
  <div class="home-card">
    <h3>⭐ 已加星标</h3>
    <div class="starred-files-content">
      %% 将由Homepage插件动态填充 %%
    </div>
  </div>
  
  <div class="home-card">
    <h3>✅ 待办事项</h3>
    <div class="tasks-content">
      %% 将由Homepage插件动态填充 %%
    </div>
  </div>
  
  <div class="home-card">
    <h3>📚 项目追踪</h3>
    <div class="dataview-content">
      %% 将由Homepage插件动态填充 %%
    </div>
  </div>
  
  <div class="home-card">
    <h3>⚡ 快速操作</h3>
    <div class="buttons-content">
      %% 将由Homepage插件动态填充 %%
    </div>
  </div>
</div>

<script>
  // 动态更新日期和时间
  function updateDateTime() {
    const today = document.getElementById('today');
    const time = document.getElementById('time');
    const now = new Date();
    
    today.innerText = now.toLocaleDateString('zh-CN', { 
      weekday: 'long', 
      year: 'numeric', 
      month: 'long', 
      day: 'numeric' 
    });
    
    time.innerText = now.toLocaleTimeString('zh-CN', {
      hour: '2-digit',
      minute: '2-digit'
    });
  }
  
  // 根据时间设置问候语
  function setGreeting() {
    const greeting = document.getElementById('user-greeting');
    const hour = new Date().getHours();
    
    if (hour < 6) {
      greeting.innerText = '夜猫子！';
    } else if (hour < 12) {
      greeting.innerText = '早上好！';
    } else if (hour < 18) {
      greeting.innerText = '下午好！';
    } else {
      greeting.innerText = '晚上好！';
    }
  }
  
  // 初始化
  updateDateTime();
  setGreeting();
  
  // 每分钟更新一次
  setInterval(updateDateTime, 60000);
</script>
```

## 自定义CSS示例

在vault的snippets文件夹中创建`homepage.css`：

```css
.homepage {
  --card-bg: rgba(var(--canvas-color), 0.05);
  --card-border-radius: 8px;
  --card-padding: 20px;
  --card-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.home-header {
  margin-bottom: 30px;
  text-align: center;
}

.home-date {
  font-size: 1.2em;
  color: var(--text-muted);
}

.home-greeting h3 {
  margin: 10px 0;
  font-size: 1.8em;
}

.home-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
}

.home-card {
  background: var(--card-bg);
  border-radius: var(--card-border-radius);
  padding: var(--card-padding);
  box-shadow: var(--card-shadow);
  transition: transform 0.2s, box-shadow 0.2s;
}

.home-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.home-card h3 {
  margin-top: 0;
  border-bottom: 1px solid var(--background-modifier-border);
  padding-bottom: 8px;
}

.homepage-button {
  background: var(--interactive-accent);
  color: var(--text-on-accent);
  border: none;
  border-radius: 4px;
  padding: 8px 16px;
  cursor: pointer;
  font-weight: 500;
  transition: background 0.2s;
}

.homepage-button:hover {
  background: var(--interactive-accent-hover);
}

/* 定制化不同类型的卡片 */
.home-card:nth-child(1) {
  border-left: 3px solid #5a67d8;
}

.home-card:nth-child(2) {
  border-left: 3px solid #f6ad55;
}

.home-card:nth-child(3) {
  border-left: 3px solid #48bb78;
}

.home-card:nth-child(4) {
  border-left: 3px solid #ed64a6;
}

.home-card:nth-child(5) {
  border-left: 3px solid #667eea;
}
```

这个演示文档展示了Homepage插件最强大的功能，包括动态内容展示、布局系统、交互元素和自定义样式，让您的Obsidian主页成为一个功能完备的控制中心。 