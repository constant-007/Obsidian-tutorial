# Obsidian，宇宙最强个人笔记软件

之前看过挺多人说Obsidian的，自己也下过这软件，但当时尝试一下就放弃了。大概因为一开始没意识到Obsidian万丈高楼平地起的插件逻辑，以为它功能就那么简单。而且我本来一直用Notion，那个时候感觉Notion天下无敌，Obsidian看起来不可能实现Notion那些丰富的功能

直到最近，误打误撞发现Obsidian强大的插件生态，这才意识到Obsidian需要靠插件支棱起来。大多数我原以为Obsidian无法实现的Notion功能，实际可以通过插件实现。相较于Notion这种商业软件，Obsidian的插件逻辑给到用户很大自由度。不仅可以选择添加、删除哪些功能，更好地适配个人需求。大多数插件内部也有包括功能、外观等自定义选项，进一步提高用户对笔记整体的细粒度控制

如果有一定编程基础，或者会用AI氛围编程，你可以在Obsidian实现几乎任何别家笔记软件的功能，甚至创造新功能。这种自由度使得Obsidian非常适合作为个人笔记平台

有一个有意思的比喻：如果说Notion是一把瑞士军刀，Obsidian就是乐高积木。你可以用积木搭建任何武器，比如剑，长矛，锤子，还能在这些武器中随意切换。这可以让你的笔记适应更多需求场景

但如果你用积木做一个和Notion一样的瑞士军刀，积木的质量怎么和钢抗衡呢？这也确实反映了Notion作为一个体系完备的商业软件，相同的功能，维护和实现上普遍来讲都会比Obsidian更好用的状况

两个软件面向群体不同。Notion适合小白，团队协作场景；Obsidian则适合有一定笔记软件以及编程基础，笔记主要用于个人业务的用户

我用了大概一个星期了解、添加Obsidian第三方社区插件中最热门，实用的插件，并把Obsidian主题、布局等调整成我习惯的样子。一些功能较多的复杂插件还在学习，如Excalidraw

虽然我本身用Notion比较久，对Markdown笔记软件相对熟悉，也有一定编程基础，但Obsidian一开始用起来还是有些费劲。时间上有很多花在问AI这些插件分别用来做什么，截图插件设置项给AI让AI解释，以及让AI写具体例子向我展示插件作用，帮助我更好地理解插件应用场景

由此我想到做一个GitHub仓库，以Obsidian Vault（Obsidian笔记库）的形式呈现，专门用于介绍Obsidian基础设置，最热门第三方插件的用法（包含每个插件后台设置选项介绍）。对于Dataview，Kanban，Projects这种复杂插件，配上案例以帮助读者真正体验、理解插件。这样新入坑Obsidian的小伙伴就不用自己一个个问AI，让AI想案例啥的，直接从Obsidian Vault中统一查看可以节省大家很多时间

如前所述，仓库将以Obsidian Vault的形式呈现，这个Vault和我平时使用的Obsidian Vault设置上一模一样，大多数Obsidian实用插件都已安装，界面也很简洁。好处是大家不用在自己安装，我写教程时也趁手一点

写这个教程还有一个目的，就是希望能在过程中加深我对Obsidian插件的理解，帮助自己更好地利用这个软件，因为感觉它的潜力比较大。一起加油吧少年

---

## 🚀 如何使用本教程

### 📋 使用前准备

#### 1. 安装 Obsidian
- 访问 [Obsidian 官网](https://obsidian.md/) 下载并安装最新版本
- 支持 Windows、macOS、Linux、iOS、Android 等多平台
- **推荐版本**：v1.4.0 或更高版本

#### 2. 下载本教程 Vault
有两种方式获取本教程：

**方法一：Git Clone（推荐）**
```bash
git clone https://github.com/your-username/Obsidian-tutorial.git
```

**方法二：直接下载**
- 点击 GitHub 页面右上角的绿色 **Code** 按钮
- 选择 **Download ZIP**
- 解压到您希望存放的位置

### 📂 Vault 结构说明

```
Obsidian-tutorial/
├── .obsidian/                 # Obsidian 配置文件夹
│   ├── plugins/              # 已安装的插件
│   ├── themes/               # 主题文件
│   ├── snippets/             # CSS 代码片段
│   └── workspace.json        # 工作区布局
├── 示例/                     # 插件演示文件夹
│   ├── Admonition插件演示.md
│   ├── Advanced Slides插件演示.md
│   ├── homepage.md
│   └── ...                   # 更多插件示例
├── 插件介绍/                 # 插件详细说明
├── 配置指南/                 # 设置教程
└── README.md                 # 本文件
```

### 🛠️ 快速开始步骤

#### 步骤 1：打开 Vault
1. 启动 Obsidian 应用
2. 点击 **打开文件夹作为保险库**
3. 选择下载的 `Obsidian-tutorial` 文件夹
4. 确认并打开

#### 步骤 2：安装插件（自动）
打开 Vault 后，Obsidian 会检测到已配置的插件：

1. 如果提示 **"检测到社区插件"**，点击 **启用**
2. 如果某些插件未自动安装，可以：
   - 进入 `设置` → `社区插件`
   - 点击 **浏览** 搜索并安装缺失的插件
   - 参考下方的 [核心插件列表](#核心插件列表)

#### 步骤 3：启用插件
1. 进入 `设置` → `社区插件`
2. 确保以下核心插件已启用：
   - Admonition
   - Advanced Slides
   - Homepage
   - Execute Code
   - DataView
   - 其他插件（查看完整列表）

#### 步骤 4：验证配置
1. 重启 Obsidian
2. 打开 `示例/homepage.md` 查看是否正常显示
3. 尝试打开其他示例文件验证插件功能

### 🔧 核心插件列表

本教程包含以下精选插件的详细说明和示例：

| 插件名称 | 主要功能 | 示例文件 |
|---------|---------|---------|
| **Admonition** | 美化提示框和警告 | `示例/Admonition插件演示.md` |
| **Advanced Slides** | 创建专业幻灯片 | `示例/Advanced Slides插件演示.md` |
| **Homepage** | 个性化首页仪表盘 | `示例/homepage.md` |
| **Execute Code** | 在笔记中执行代码 | `示例/Execute Code插件演示.md` |
| **DataView** | 数据查询和展示 | `插件介绍/DataView详解.md` |
| **Kanban** | 看板项目管理 | `示例/Kanban看板演示.md` |
| **Calendar** | 日历视图 | `插件介绍/Calendar使用指南.md` |
| **Templater** | 强大的模板系统 | `插件介绍/Templater进阶.md` |

### 📚 学习路径建议

#### 🌱 初学者路径（1-2周）
1. **第1天**：熟悉 Obsidian 基础操作
   - 阅读官方入门指南
   - 练习 Markdown 语法
   
2. **第2-3天**：体验插件效果
   - 浏览 `示例/` 文件夹中的所有演示
   - 了解每个插件的基本功能
   
3. **第4-7天**：深入学习核心插件
   - Admonition：美化笔记显示
   - Homepage：打造个人仪表盘
   - Advanced Slides：制作演示文稿
   
4. **第2周**：进阶功能
   - DataView：数据查询
   - Templater：模板自动化
   - CSS 自定义样式

#### 🚀 进阶用户路径（3-5天）
1. **第1天**：配置优化
   - 自定义主题和 CSS
   - 优化插件设置
   
2. **第2-3天**：工作流搭建
   - 项目管理系统
   - 知识管理体系
   
3. **第4-5天**：自定义开发
   - 编写 CSS Snippets
   - 学习插件 API

### ⚡ 常见问题解决

#### Q1: 插件无法加载怎么办？
**解决方案：**
1. 检查网络连接（某些插件需要联网下载）
2. 重启 Obsidian
3. 手动重新安装问题插件：
   ```
   设置 → 社区插件 → 浏览 → 搜索插件名称 → 安装
   ```

#### Q2: 样式显示异常？
**解决方案：**
1. 确认 CSS Snippets 已启用：
   ```
   设置 → 外观 → CSS 代码片段
   ```
2. 检查主题兼容性
3. 重新加载 CSS：`Ctrl/Cmd + R`

#### Q3: 某些功能无法使用？
**解决方案：**
1. 检查插件版本兼容性
2. 查看插件设置页面
3. 参考对应的示例文件进行配置

#### Q4: 性能问题？
**解决方案：**
1. 禁用不需要的插件
2. 减少大文件的数量
3. 定期清理 `.obsidian/workspace.json`

### 🎯 使用技巧

#### 💡 效率提升技巧
1. **快捷键设置**：为常用插件功能设置快捷键
2. **模板使用**：利用 Templater 创建标准化笔记
3. **标签系统**：建立一致的标签体系
4. **链接思维**：多使用 `[[双链]]` 连接概念

#### 🎨 个性化定制
1. **主题选择**：根据使用场景选择合适主题
2. **CSS 调优**：参考 `.obsidian/snippets/` 中的示例
3. **布局优化**：调整工作区布局适合自己的工作流
4. **插件组合**：找到适合自己的插件组合

### 📖 进一步学习资源

#### 官方资源
- [Obsidian 官方文档](https://help.obsidian.md/)
- [Obsidian 社区论坛](https://forum.obsidian.md/)
- [插件开发文档](https://docs.obsidian.md/Plugins/Getting+started)

#### 社区资源
- [Obsidian 中文社区](https://forum-zh.obsidian.md/)
- [YouTube 教程合集](https://www.youtube.com/results?search_query=obsidian+tutorial)
- [Reddit Obsidian 社区](https://www.reddit.com/r/ObsidianMD/)

#### 扩展阅读
- 《卡片笔记写作法》- 了解笔记方法论
- 《如何阅读一本书》- 提升信息处理能力
- [Building a Second Brain](https://www.buildingasecondbrain.com/) - 个人知识管理

### 🤝 贡献指南

欢迎为本教程贡献内容！您可以：

1. **报告问题**：在 Issues 中报告错误或提出改进建议
2. **提交插件演示**：为新插件创建演示文件
3. **改进文档**：修正错误或补充说明
4. **分享配置**：分享您的插件配置和使用技巧

**贡献步骤：**
1. Fork 本仓库
2. 创建新分支：`git checkout -b feature/your-feature`
3. 提交更改：`git commit -m 'Add some feature'`
4. 推送到分支：`git push origin feature/your-feature`
5. 创建 Pull Request

### 📄 许可证

本项目采用 [MIT 许可证](LICENSE)，您可以自由使用、修改和分发。

### 🙏 致谢

感谢 Obsidian 开发团队和社区插件开发者们的辛勤工作，让这个强大的笔记平台成为可能。

---

## 💬 联系方式

如果您在使用过程中遇到问题，或有任何建议，欢迎通过以下方式联系：

- **GitHub Issues**：[提交问题](https://github.com/your-username/Obsidian-tutorial/issues)
- **邮箱**：your-email@example.com
- **微信群**：[扫码加入讨论群](link-to-wechat-group)

让我们一起探索 Obsidian 的无限可能！🚀

