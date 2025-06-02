---
cssclasses:
  - homepage-premium
banner: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80"
obsidianUIMode: preview
---

<div class="homepage-container">
  <div class="background-overlay"></div>
  
  <div class="hero-section">
    <div class="hero-content">
      <div class="time-display">
        <div class="current-time" id="live-time">12:34</div>
        <div class="current-date" id="live-date">2024年1月15日 星期一</div>
      </div>
      
      <div class="greeting-section">
        <h1 class="main-greeting">
          <span id="greeting-text">早上好</span>，
          <span class="user-name">探索者</span>！
        </h1>
        <p class="motivational-quote" id="daily-quote">
          每一天都是一个新的开始，充满无限可能。
        </p>
      </div>
      
      <div class="weather-widget">
        <div class="weather-info">
          <span class="weather-icon">☀️</span>
          <span class="weather-temp">24°C</span>
          <span class="weather-desc">晴朗</span>
        </div>
      </div>
    </div>
    
    <div class="hero-stats">
      <div class="stat-item">
        <div class="stat-number" id="notes-count">156</div>
        <div class="stat-label">笔记总数</div>
      </div>
      <div class="stat-item">
        <div class="stat-number" id="words-today">2,847</div>
        <div class="stat-label">今日字数</div>
      </div>
      <div class="stat-item">
        <div class="stat-number" id="streak-days">12</div>
        <div class="stat-label">连续天数</div>
      </div>
    </div>
  </div>

  <div class="main-content">
    <div class="quick-actions-panel">
      <h2 class="section-title">
        <span class="section-icon">⚡</span>
        快速操作
      </h2>
      <div class="quick-buttons">
        <button class="action-btn primary">
          <span class="btn-icon">📝</span>
          <span class="btn-text">新建笔记</span>
        </button>
        <button class="action-btn secondary">
          <span class="btn-icon">📅</span>
          <span class="btn-text">今日笔记</span>
        </button>
        <button class="action-btn accent">
          <span class="btn-icon">🎨</span>
          <span class="btn-text">思维导图</span>
        </button>
        <button class="action-btn success">
          <span class="btn-icon">🎲</span>
          <span class="btn-text">随机漫游</span>
        </button>
      </div>
    </div>
  </div>
</div>

## 📚 最近文件

<div class="simple-card">

**Advanced Slides 插件演示** `2分钟前` 📄  
**Admonition插件演示** `1小时前` 📝  
**项目计划** `今天` 🎯  

</div>

## ✅ 今日任务

<div class="simple-card">

**完成度：75%**

- [x] 完成项目文档 `高优先级`
- [x] 团队会议准备 `中等优先级`  
- [x] 代码审查 `中等优先级`
- [ ] 更新演示文档 `低优先级`

</div>

## ⭐ 精选内容

<div class="simple-card">

🎨 **设计灵感收集**  
`#设计` `#创意`

💡 **技术学习路径**  
`#学习` `#编程`

📊 **数据分析模板**  
`#模板` `#数据`

</div>

## 🎓 学习进度

<div class="simple-card">

**Obsidian 高级技巧**  
<div class="progress-container">
  <div class="progress-bar-simple">
    <div class="progress-fill-simple" style="width: 85%"></div>
  </div>
  <span class="progress-percent">85%</span>
</div>

**数据可视化**  
<div class="progress-container">
  <div class="progress-bar-simple">
    <div class="progress-fill-simple" style="width: 62%"></div>
  </div>
  <span class="progress-percent">62%</span>
</div>

**项目管理**  
<div class="progress-container">
  <div class="progress-bar-simple">
    <div class="progress-fill-simple" style="width: 28%"></div>
  </div>
  <span class="progress-percent">28%</span>
</div>

</div>

## 💭 创意火花

<div class="simple-card">

> "创新来源于对现有事物的重新组合"  
> — 史蒂夫·乔布斯

`#创新` `#思维` `#设计`

</div>

## 🚀 项目仪表盘

<div class="simple-card">

### Obsidian 教程项目 `进行中`
**进度：78%** | 预期: 2024-02-15 | 团队: 3人

### 知识管理系统 `规划中`  
**进度：15%** | 预期: 2024-03-01 | 团队: 5人

### 插件开发 `已完成`
**进度：100%** | 完成: 2024-01-10 | 团队: 2人

</div>

---

<div class="footer-simple">

🔥 连续12天保持学习  
📈 本周效率提升25%  
🎯 月度目标完成67%  

</div>

<script>
function updateDateTime() {
  const now = new Date();
  
  const timeElement = document.getElementById('live-time');
  if (timeElement) {
    timeElement.textContent = now.toLocaleTimeString('zh-CN', {
      hour: '2-digit',
      minute: '2-digit'
    });
  }
  
  const dateElement = document.getElementById('live-date');
  if (dateElement) {
    dateElement.textContent = now.toLocaleDateString('zh-CN', {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      weekday: 'long'
    });
  }
}

function updateGreeting() {
  const hour = new Date().getHours();
  const greetingElement = document.getElementById('greeting-text');
  
  if (!greetingElement) return;
  
  if (hour < 6) {
    greetingElement.textContent = '深夜好';
  } else if (hour < 12) {
    greetingElement.textContent = '早上好';
  } else if (hour < 18) {
    greetingElement.textContent = '下午好';
  } else {
    greetingElement.textContent = '晚上好';
  }
}

function init() {
  updateDateTime();
  updateGreeting();
  setInterval(updateDateTime, 60000);
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', init);
} else {
  init();
}
</script> 