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