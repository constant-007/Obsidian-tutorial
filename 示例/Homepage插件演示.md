---
cssclasses:
  - homepage
  - custom-background
banner: "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80"
---

<div class="homepage-container">
  <div class="homepage-overlay"></div>
  
  <!-- 顶部欢迎区域 -->
  <div class="hero-section">
    <div class="hero-content">
      <div class="hero-title">
        <h1><span class="gradient-text">✨ 我的数字大脑</span></h1>
        <p class="hero-subtitle">知识管理 · 创意孵化 · 智慧沉淀</p>
      </div>
      
      <div class="hero-info">
        <div class="time-card">
          <div class="time-display">
            <span id="current-time"></span>
          </div>
          <div class="date-display">
            <span id="current-date"></span>
          </div>
        </div>
        
        <div class="weather-card">
          <div class="weather-icon">🌤️</div>
          <div class="weather-info">
            <span class="temperature">23°C</span>
            <span class="weather-desc">晴朗</span>
          </div>
        </div>
        
        <div class="motivational-card">
          <div class="quote-icon">💡</div>
          <div class="quote-content">
            <span id="daily-quote"></span>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 快速操作栏 -->
  <div class="quick-actions">
    <div class="action-button" onclick="createNewNote()">
      <div class="action-icon">📝</div>
      <span>新建笔记</span>
    </div>
    <div class="action-button" onclick="openDailyNote()">
      <div class="action-icon">📅</div>
      <span>今日笔记</span>
    </div>
    <div class="action-button" onclick="openGraph()">
      <div class="action-icon">🕸️</div>
      <span>知识图谱</span>
    </div>
    <div class="action-button" onclick="randomNote()">
      <div class="action-icon">🎲</div>
      <span>随机笔记</span>
    </div>
    <div class="action-button" onclick="globalSearch()">
      <div class="action-icon">🔍</div>
      <span>全局搜索</span>
    </div>
  </div>
  
  <!-- 主要内容区域 -->
  <div class="main-grid">
    
    <!-- 左侧列 -->
    <div class="grid-column left-column">
      
      <!-- 最近文件卡片 -->
      <div class="dashboard-card recent-files-card">
        <div class="card-header">
          <h3><span class="card-icon">📄</span>最近编辑</h3>
          <div class="card-badge">5</div>
        </div>
        <div class="card-content">
          <div class="file-list">
            <div class="file-item">
              <div class="file-icon">📝</div>
              <div class="file-info">
                <span class="file-name">项目规划文档.md</span>
                <span class="file-time">2分钟前</span>
              </div>
              <div class="file-actions">
                <button class="mini-btn">📌</button>
              </div>
            </div>
            <div class="file-item">
              <div class="file-icon">💡</div>
              <div class="file-info">
                <span class="file-name">创意收集箱.md</span>
                <span class="file-time">15分钟前</span>
              </div>
              <div class="file-actions">
                <button class="mini-btn">📌</button>
              </div>
            </div>
            <div class="file-item">
              <div class="file-icon">📚</div>
              <div class="file-info">
                <span class="file-name">学习笔记.md</span>
                <span class="file-time">1小时前</span>
              </div>
              <div class="file-actions">
                <button class="mini-btn">📌</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 任务管理卡片 -->
      <div class="dashboard-card tasks-card">
        <div class="card-header">
          <h3><span class="card-icon">✅</span>今日任务</h3>
          <div class="progress-ring">
            <svg width="30" height="30">
              <circle cx="15" cy="15" r="12" stroke="#e2e8f0" stroke-width="3" fill="none"/>
              <circle cx="15" cy="15" r="12" stroke="#10b981" stroke-width="3" fill="none" 
                      stroke-dasharray="75.4" stroke-dashoffset="18.85" transform="rotate(-90 15 15)"/>
            </svg>
            <span class="progress-text">75%</span>
          </div>
        </div>
        <div class="card-content">
          <div class="task-list">
            <div class="task-item completed">
              <input type="checkbox" checked readonly>
              <span class="task-text">完成项目提案</span>
              <span class="task-priority high">高</span>
            </div>
            <div class="task-item completed">
              <input type="checkbox" checked readonly>
              <span class="task-text">回复重要邮件</span>
              <span class="task-priority medium">中</span>
            </div>
            <div class="task-item">
              <input type="checkbox" readonly>
              <span class="task-text">准备明天的会议</span>
              <span class="task-priority high">高</span>
            </div>
            <div class="task-item">
              <input type="checkbox" readonly>
              <span class="task-text">整理本周笔记</span>
              <span class="task-priority low">低</span>
            </div>
          </div>
          <button class="add-task-btn">+ 添加新任务</button>
        </div>
      </div>
      
    </div>
    
    <!-- 中间列 -->
    <div class="grid-column center-column">
      
      <!-- 知识统计面板 -->
      <div class="dashboard-card stats-card">
        <div class="card-header">
          <h3><span class="card-icon">📊</span>知识库统计</h3>
        </div>
        <div class="card-content">
          <div class="stats-grid">
            <div class="stat-item">
              <div class="stat-icon">📝</div>
              <div class="stat-info">
                <span class="stat-number">1,247</span>
                <span class="stat-label">笔记总数</span>
              </div>
            </div>
            <div class="stat-item">
              <div class="stat-icon">🏷️</div>
              <div class="stat-info">
                <span class="stat-number">89</span>
                <span class="stat-label">标签数量</span>
              </div>
            </div>
            <div class="stat-item">
              <div class="stat-icon">🔗</div>
              <div class="stat-info">
                <span class="stat-number">2,156</span>
                <span class="stat-label">内部链接</span>
              </div>
            </div>
            <div class="stat-item">
              <div class="stat-icon">📅</div>
              <div class="stat-info">
                <span class="stat-number">365</span>
                <span class="stat-label">连续天数</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 项目追踪卡片 -->
      <div class="dashboard-card projects-card">
        <div class="card-header">
          <h3><span class="card-icon">🚀</span>项目进展</h3>
          <button class="header-btn">查看全部</button>
        </div>
        <div class="card-content">
          <div class="project-list">
            <div class="project-item">
              <div class="project-header">
                <span class="project-name">📱 移动应用开发</span>
                <span class="project-status active">进行中</span>
              </div>
              <div class="project-progress">
                <div class="progress-bar">
                  <div class="progress-fill" style="width: 75%"></div>
                </div>
                <span class="progress-label">75%</span>
              </div>
              <div class="project-meta">
                <span class="project-deadline">🗓️ 截止：2024-02-15</span>
                <span class="project-team">👥 3人</span>
              </div>
            </div>
            
            <div class="project-item">
              <div class="project-header">
                <span class="project-name">📚 知识管理系统</span>
                <span class="project-status planning">规划中</span>
              </div>
              <div class="project-progress">
                <div class="progress-bar">
                  <div class="progress-fill" style="width: 25%"></div>
                </div>
                <span class="progress-label">25%</span>
              </div>
              <div class="project-meta">
                <span class="project-deadline">🗓️ 截止：2024-03-01</span>
                <span class="project-team">👥 2人</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </div>
    
    <!-- 右侧列 -->
    <div class="grid-column right-column">
      
      <!-- 日历小部件 -->
      <div class="dashboard-card calendar-card">
        <div class="card-header">
          <h3><span class="card-icon">📅</span>本月日历</h3>
          <div class="calendar-nav">
            <button class="nav-btn">‹</button>
            <span class="current-month">2024年1月</span>
            <button class="nav-btn">›</button>
          </div>
        </div>
        <div class="card-content">
          <div class="mini-calendar">
            <div class="calendar-weekdays">
              <span>日</span><span>一</span><span>二</span><span>三</span><span>四</span><span>五</span><span>六</span>
            </div>
            <div class="calendar-days">
              <span class="day other-month">31</span>
              <span class="day">1</span>
              <span class="day">2</span>
              <span class="day">3</span>
              <span class="day">4</span>
              <span class="day">5</span>
              <span class="day">6</span>
              <span class="day">7</span>
              <span class="day">8</span>
              <span class="day">9</span>
              <span class="day">10</span>
              <span class="day">11</span>
              <span class="day">12</span>
              <span class="day">13</span>
              <span class="day today">14</span>
              <span class="day">15</span>
              <span class="day">16</span>
              <span class="day">17</span>
              <span class="day">18</span>
              <span class="day">19</span>
              <span class="day">20</span>
              <span class="day">21</span>
              <span class="day">22</span>
              <span class="day">23</span>
              <span class="day">24</span>
              <span class="day">25</span>
              <span class="day">26</span>
              <span class="day">27</span>
              <span class="day">28</span>
              <span class="day">29</span>
              <span class="day">30</span>
              <span class="day">31</span>
              <span class="day other-month">1</span>
              <span class="day other-month">2</span>
              <span class="day other-month">3</span>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 收藏夹卡片 -->
      <div class="dashboard-card bookmarks-card">
        <div class="card-header">
          <h3><span class="card-icon">⭐</span>收藏夹</h3>
          <button class="header-btn">管理</button>
        </div>
        <div class="card-content">
          <div class="bookmark-list">
            <div class="bookmark-item">
              <div class="bookmark-icon">🎯</div>
              <div class="bookmark-info">
                <span class="bookmark-title">年度目标规划</span>
                <span class="bookmark-path">目标/2024年规划.md</span>
              </div>
            </div>
            <div class="bookmark-item">
              <div class="bookmark-icon">💰</div>
              <div class="bookmark-info">
                <span class="bookmark-title">投资学习笔记</span>
                <span class="bookmark-path">理财/投资策略.md</span>
              </div>
            </div>
            <div class="bookmark-item">
              <div class="bookmark-icon">🧠</div>
              <div class="bookmark-info">
                <span class="bookmark-title">思维模型集</span>
                <span class="bookmark-path">思维/模型库.md</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 灵感捕获卡片 -->
      <div class="dashboard-card inspiration-card">
        <div class="card-header">
          <h3><span class="card-icon">💡</span>灵感捕获</h3>
        </div>
        <div class="card-content">
          <div class="quick-note-area">
            <textarea placeholder="记录你的灵感和想法..." rows="3"></textarea>
            <div class="note-actions">
              <button class="save-btn">💾 保存</button>
              <button class="voice-btn">🎤 语音</button>
            </div>
          </div>
          <div class="recent-inspirations">
            <div class="inspiration-item">
              <span class="inspiration-text">"创意是把已知的东西以新的方式组合"</span>
              <span class="inspiration-time">2小时前</span>
            </div>
            <div class="inspiration-item">
              <span class="inspiration-text">"学习不是填满水桶，而是点燃火焰"</span>
              <span class="inspiration-time">昨天</span>
            </div>
          </div>
        </div>
      </div>
      
    </div>
    
  </div>
  
  <!-- 底部状态栏 -->
  <div class="status-bar">
    <div class="status-left">
      <span class="status-item">🔄 已同步</span>
      <span class="status-item">📡 在线</span>
      <span class="status-item">⚡ 插件：28个已激活</span>
    </div>
    <div class="status-right">
      <span class="status-item">💾 自动保存：开启</span>
      <span class="status-item">🎨 主题：Dark</span>
      <span class="status-item">📊 使用时长：3小时42分钟</span>
    </div>
  </div>
  
</div>

<!-- JavaScript 功能 -->
<script>
// 时间更新
function updateTime() {
  const now = new Date();
  const timeElement = document.getElementById('current-time');
  const dateElement = document.getElementById('current-date');
  
  if (timeElement) {
    timeElement.textContent = now.toLocaleTimeString('zh-CN', {
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit'
    });
  }
  
  if (dateElement) {
    dateElement.textContent = now.toLocaleDateString('zh-CN', {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      weekday: 'long'
    });
  }
}

// 每日名言
function updateDailyQuote() {
  const quotes = [
    "知识就是力量，但智慧才是生活的艺术。",
    "今天的努力是明天成功的基石。",
    "学而时习之，不亦说乎？",
    "读万卷书，行万里路。",
    "博学之，审问之，慎思之，明辨之，笃行之。",
    "纸上得来终觉浅，绝知此事要躬行。"
  ];
  
  const today = new Date().getDate();
  const quote = quotes[today % quotes.length];
  const quoteElement = document.getElementById('daily-quote');
  
  if (quoteElement) {
    quoteElement.textContent = quote;
  }
}

// 快速操作函数
function createNewNote() {
  app.commands.executeCommandById('file-explorer:new-file');
}

function openDailyNote() {
  app.commands.executeCommandById('daily-notes');
}

function openGraph() {
  app.commands.executeCommandById('graph:open');
}

function randomNote() {
  app.commands.executeCommandById('random-note');
}

function globalSearch() {
  app.commands.executeCommandById('switcher:open');
}

// 初始化
document.addEventListener('DOMContentLoaded', function() {
  updateTime();
  updateDailyQuote();
  
  // 每秒更新时间
  setInterval(updateTime, 1000);
  
  // 添加卡片悬停效果
  const cards = document.querySelectorAll('.dashboard-card');
  cards.forEach(card => {
    card.addEventListener('mouseenter', function() {
      this.style.transform = 'translateY(-2px)';
    });
    
    card.addEventListener('mouseleave', function() {
      this.style.transform = 'translateY(0)';
    });
  });
});

// 添加粒子效果
function createParticles() {
  const particleContainer = document.createElement('div');
  particleContainer.className = 'particles';
  document.querySelector('.homepage-container').appendChild(particleContainer);
  
  for (let i = 0; i < 50; i++) {
    const particle = document.createElement('div');
    particle.className = 'particle';
    particle.style.left = Math.random() * 100 + '%';
    particle.style.animationDuration = (Math.random() * 20 + 10) + 's';
    particle.style.animationDelay = Math.random() * 20 + 's';
    particleContainer.appendChild(particle);
  }
}

// 启动粒子效果
if (typeof createParticles === 'function') {
  createParticles();
}
</script>

<style>
/* 基础样式重置与全局设置 */
.homepage-ultimate {
  --primary-color: #6366f1;
  --secondary-color: #8b5cf6;
  --accent-color: #10b981;
  --warning-color: #f59e0b;
  --danger-color: #ef4444;
  --success-color: #10b981;
  --glass-bg: rgba(255, 255, 255, 0.1);
  --glass-border: rgba(255, 255, 255, 0.2);
  --shadow-light: 0 4px 6px rgba(0, 0, 0, 0.07);
  --shadow-medium: 0 10px 15px rgba(0, 0, 0, 0.1);
  --shadow-heavy: 0 20px 25px rgba(0, 0, 0, 0.15);
  --border-radius: 12px;
  --transition-smooth: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

/* 背景与容器 */
.homepage-container {
  position: relative;
  min-height: 100vh;
  background: linear-gradient(135deg, 
    rgba(99, 102, 241, 0.1) 0%, 
    rgba(139, 92, 246, 0.1) 50%, 
    rgba(16, 185, 129, 0.1) 100%),
    url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80');
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  padding: 20px;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
}

.homepage-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(15, 23, 42, 0.3);
  backdrop-filter: blur(1px);
  z-index: -1;
}

/* 粒子动画 */
.particles {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 0;
}

.particle {
  position: absolute;
  width: 2px;
  height: 2px;
  background: rgba(255, 255, 255, 0.3);
  border-radius: 50%;
  animation: float linear infinite;
}

@keyframes float {
  from {
    opacity: 0;
    transform: translateY(100vh) rotate(0deg);
  }
  10% {
    opacity: 1;
  }
  90% {
    opacity: 1;
  }
  to {
    opacity: 0;
    transform: translateY(-100px) rotate(360deg);
  }
}

/* 主要区域样式 */
.hero-section {
  text-align: center;
  padding: 40px 0 60px;
  position: relative;
  z-index: 2;
}

.hero-content {
  max-width: 1200px;
  margin: 0 auto;
}

.hero-title h1 {
  font-size: 3.5rem;
  margin: 0 0 10px;
  font-weight: 700;
}

.gradient-text {
  background: linear-gradient(135deg, #6366f1, #8b5cf6, #10b981);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  animation: gradient-shift 3s ease-in-out infinite;
}

@keyframes gradient-shift {
  0%, 100% { filter: hue-rotate(0deg); }
  50% { filter: hue-rotate(30deg); }
}

.hero-subtitle {
  font-size: 1.3rem;
  color: rgba(255, 255, 255, 0.8);
  margin: 0 0 40px;
  font-weight: 300;
}

.hero-info {
  display: flex;
  justify-content: center;
  gap: 30px;
  flex-wrap: wrap;
  margin-top: 30px;
}

.time-card, .weather-card, .motivational-card {
  background: var(--glass-bg);
  backdrop-filter: blur(20px);
  border: 1px solid var(--glass-border);
  border-radius: var(--border-radius);
  padding: 20px;
  min-width: 200px;
  box-shadow: var(--shadow-medium);
  transition: var(--transition-smooth);
}

.time-card:hover, .weather-card:hover, .motivational-card:hover {
  transform: translateY(-5px);
  box-shadow: var(--shadow-heavy);
}

.time-display {
  font-size: 2rem;
  font-weight: 600;
  color: white;
  margin-bottom: 5px;
}

.date-display {
  font-size: 1rem;
  color: rgba(255, 255, 255, 0.7);
}

.weather-card {
  display: flex;
  align-items: center;
  gap: 15px;
}

.weather-icon {
  font-size: 2.5rem;
}

.temperature {
  font-size: 1.8rem;
  font-weight: 600;
  color: white;
  display: block;
}

.weather-desc {
  font-size: 0.9rem;
  color: rgba(255, 255, 255, 0.7);
}

.motivational-card {
  display: flex;
  align-items: center;
  gap: 15px;
  max-width: 300px;
}

.quote-icon {
  font-size: 2rem;
}

.quote-content {
  color: white;
  font-style: italic;
  line-height: 1.4;
}

/* 快速操作栏 */
.quick-actions {
  display: flex;
  justify-content: center;
  gap: 20px;
  margin: 0 0 40px;
  flex-wrap: wrap;
  position: relative;
  z-index: 2;
}

.action-button {
  background: var(--glass-bg);
  backdrop-filter: blur(20px);
  border: 1px solid var(--glass-border);
  border-radius: var(--border-radius);
  padding: 15px 20px;
  color: white;
  text-decoration: none;
  transition: var(--transition-smooth);
  cursor: pointer;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  min-width: 80px;
  box-shadow: var(--shadow-light);
}

.action-button:hover {
  transform: translateY(-3px);
  background: rgba(255, 255, 255, 0.15);
  box-shadow: var(--shadow-medium);
}

.action-icon {
  font-size: 1.5rem;
}

/* 主网格布局 */
.main-grid {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 25px;
  max-width: 1400px;
  margin: 0 auto;
  position: relative;
  z-index: 2;
}

.grid-column {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

/* 卡片基础样式 */
.dashboard-card {
  background: var(--glass-bg);
  backdrop-filter: blur(20px);
  border: 1px solid var(--glass-border);
  border-radius: var(--border-radius);
  box-shadow: var(--shadow-medium);
  transition: var(--transition-smooth);
  overflow: hidden;
}

.dashboard-card:hover {
  box-shadow: var(--shadow-heavy);
}

.card-header {
  padding: 20px 20px 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  margin-bottom: 15px;
}

.card-header h3 {
  margin: 0;
  color: white;
  font-size: 1.1rem;
  font-weight: 600;
  display: flex;
  align-items: center;
  gap: 8px;
}

.card-icon {
  font-size: 1.2rem;
}

.card-badge {
  background: var(--primary-color);
  color: white;
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 0.8rem;
  font-weight: 500;
}

.card-content {
  padding: 0 20px 20px;
}

/* 文件列表样式 */
.file-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.file-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 10px;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 8px;
  transition: var(--transition-smooth);
}

.file-item:hover {
  background: rgba(255, 255, 255, 0.1);
}

.file-icon {
  font-size: 1.2rem;
  width: 20px;
  text-align: center;
}

.file-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.file-name {
  color: white;
  font-weight: 500;
  font-size: 0.9rem;
}

.file-time {
  color: rgba(255, 255, 255, 0.6);
  font-size: 0.8rem;
}

.mini-btn {
  background: none;
  border: none;
  color: rgba(255, 255, 255, 0.6);
  cursor: pointer;
  padding: 4px;
  border-radius: 4px;
  transition: var(--transition-smooth);
}

.mini-btn:hover {
  background: rgba(255, 255, 255, 0.1);
}

/* 任务列表样式 */
.task-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
  margin-bottom: 15px;
}

.task-item {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 8px;
  border-radius: 6px;
  transition: var(--transition-smooth);
}

.task-item:hover {
  background: rgba(255, 255, 255, 0.05);
}

.task-item.completed {
  opacity: 0.6;
}

.task-item.completed .task-text {
  text-decoration: line-through;
}

.task-text {
  flex: 1;
  color: white;
  font-size: 0.9rem;
}

.task-priority {
  padding: 2px 6px;
  border-radius: 4px;
  font-size: 0.7rem;
  font-weight: 500;
}

.task-priority.high {
  background: var(--danger-color);
  color: white;
}

.task-priority.medium {
  background: var(--warning-color);
  color: white;
}

.task-priority.low {
  background: var(--success-color);
  color: white;
}

.progress-ring {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
}

.progress-text {
  position: absolute;
  color: white;
  font-size: 0.8rem;
  font-weight: 600;
}

.add-task-btn {
  background: var(--primary-color);
  color: white;
  border: none;
  padding: 8px 12px;
  border-radius: 6px;
  cursor: pointer;
  transition: var(--transition-smooth);
  font-size: 0.9rem;
}

.add-task-btn:hover {
  background: var(--secondary-color);
}

/* 统计网格 */
.stats-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 15px;
}

.stat-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 15px;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 8px;
}

.stat-icon {
  font-size: 1.5rem;
}

.stat-info {
  display: flex;
  flex-direction: column;
}

.stat-number {
  color: white;
  font-size: 1.5rem;
  font-weight: 700;
}

.stat-label {
  color: rgba(255, 255, 255, 0.7);
  font-size: 0.8rem;
}

/* 项目列表 */
.project-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.project-item {
  padding: 15px;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 8px;
}

.project-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.project-name {
  color: white;
  font-weight: 500;
}

.project-status {
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 0.7rem;
  font-weight: 500;
}

.project-status.active {
  background: var(--success-color);
  color: white;
}

.project-status.planning {
  background: var(--warning-color);
  color: white;
}

.project-progress {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 8px;
}

.progress-bar {
  flex: 1;
  height: 6px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 3px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  background: var(--success-color);
  transition: width 0.3s ease;
}

.progress-label {
  color: white;
  font-size: 0.8rem;
  font-weight: 500;
  min-width: 35px;
}

.project-meta {
  display: flex;
  gap: 15px;
  color: rgba(255, 255, 255, 0.7);
  font-size: 0.8rem;
}

/* 日历样式 */
.calendar-nav {
  display: flex;
  align-items: center;
  gap: 10px;
}

.nav-btn {
  background: none;
  border: none;
  color: white;
  cursor: pointer;
  padding: 4px 8px;
  border-radius: 4px;
  transition: var(--transition-smooth);
}

.nav-btn:hover {
  background: rgba(255, 255, 255, 0.1);
}

.current-month {
  color: white;
  font-weight: 500;
  font-size: 0.9rem;
}

.mini-calendar {
  color: white;
}

.calendar-weekdays {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 2px;
  margin-bottom: 8px;
}

.calendar-weekdays span {
  text-align: center;
  font-size: 0.8rem;
  font-weight: 500;
  color: rgba(255, 255, 255, 0.7);
  padding: 4px;
}

.calendar-days {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 2px;
}

.day {
  text-align: center;
  padding: 6px 4px;
  font-size: 0.8rem;
  border-radius: 4px;
  cursor: pointer;
  transition: var(--transition-smooth);
}

.day:hover {
  background: rgba(255, 255, 255, 0.1);
}

.day.today {
  background: var(--primary-color);
  color: white;
  font-weight: 600;
}

.day.other-month {
  color: rgba(255, 255, 255, 0.3);
}

/* 收藏夹和灵感卡片 */
.bookmark-list, .recent-inspirations {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.bookmark-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 10px;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 6px;
  transition: var(--transition-smooth);
}

.bookmark-item:hover {
  background: rgba(255, 255, 255, 0.1);
}

.bookmark-icon {
  font-size: 1.2rem;
}

.bookmark-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.bookmark-title {
  color: white;
  font-weight: 500;
  font-size: 0.9rem;
}

.bookmark-path {
  color: rgba(255, 255, 255, 0.6);
  font-size: 0.8rem;
}

.quick-note-area {
  margin-bottom: 15px;
}

.quick-note-area textarea {
  width: 100%;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 6px;
  padding: 10px;
  color: white;
  font-family: inherit;
  font-size: 0.9rem;
  resize: vertical;
}

.quick-note-area textarea::placeholder {
  color: rgba(255, 255, 255, 0.5);
}

.note-actions {
  display: flex;
  gap: 8px;
  margin-top: 8px;
}

.save-btn, .voice-btn {
  background: var(--primary-color);
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 4px;
  cursor: pointer;
  font-size: 0.8rem;
  transition: var(--transition-smooth);
}

.save-btn:hover, .voice-btn:hover {
  background: var(--secondary-color);
}

.inspiration-item {
  padding: 8px;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 6px;
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.inspiration-text {
  color: white;
  font-size: 0.9rem;
  font-style: italic;
}

.inspiration-time {
  color: rgba(255, 255, 255, 0.6);
  font-size: 0.7rem;
}

/* 状态栏 */
.status-bar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 30px;
  padding: 15px 20px;
  background: var(--glass-bg);
  backdrop-filter: blur(20px);
  border: 1px solid var(--glass-border);
  border-radius: var(--border-radius);
  position: relative;
  z-index: 2;
}

.status-left, .status-right {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
}

.status-item {
  color: rgba(255, 255, 255, 0.8);
  font-size: 0.8rem;
  display: flex;
  align-items: center;
  gap: 5px;
}

.header-btn {
  background: none;
  border: 1px solid rgba(255, 255, 255, 0.2);
  color: rgba(255, 255, 255, 0.8);
  padding: 4px 8px;
  border-radius: 4px;
  cursor: pointer;
  font-size: 0.8rem;
  transition: var(--transition-smooth);
}

.header-btn:hover {
  background: rgba(255, 255, 255, 0.1);
  color: white;
}

/* 响应式设计 */
@media (max-width: 1200px) {
  .main-grid {
    grid-template-columns: 1fr 1fr;
  }
  
  .right-column {
    grid-column: span 2;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
  }
}

@media (max-width: 768px) {
  .homepage-container {
    padding: 15px;
  }
  
  .hero-title h1 {
    font-size: 2.5rem;
  }
  
  .hero-info {
    flex-direction: column;
    align-items: center;
  }
  
  .main-grid {
    grid-template-columns: 1fr;
  }
  
  .right-column {
    grid-column: span 1;
    display: flex;
    flex-direction: column;
  }
  
  .stats-grid {
    grid-template-columns: 1fr;
  }
  
  .status-bar {
    flex-direction: column;
    gap: 10px;
  }
  
  .status-left, .status-right {
    justify-content: center;
  }
}

/* 暗色主题优化 */
.theme-dark .homepage-ultimate {
  --glass-bg: rgba(30, 41, 59, 0.3);
  --glass-border: rgba(148, 163, 184, 0.2);
}

/* 动画增强 */
@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}

.card-badge {
  animation: pulse 2s infinite;
}

/* 滚动条美化 */
::-webkit-scrollbar {
  width: 8px;
}

::-webkit-scrollbar-track {
  background: rgba(255, 255, 255, 0.05);
  border-radius: 4px;
}

::-webkit-scrollbar-thumb {
  background: rgba(255, 255, 255, 0.2);
  border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
  background: rgba(255, 255, 255, 0.3);
}
</style> 