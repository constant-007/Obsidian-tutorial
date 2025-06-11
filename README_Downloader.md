# DeepLearning.AI Universal Course Downloader 📚🎥

一个功能强大且易用的脚本，用于下载 DeepLearning.AI 课程的字幕和视频。

## ✨ 主要特性

### 🎯 核心功能
- **智能字幕下载** - 自动下载所有课程字幕（WebVTT格式）
- **视频下载支持** - 集成 yt-dlp 进行视频下载
- **多课程支持** - 支持不同的 DeepLearning.AI 课程
- **交互式界面** - 友好的用户界面和选项选择
- **自动检测** - 从课程URL自动识别课程代码

### 🔧 技术特性
- **进度条显示** - 实时显示下载进度
- **错误处理** - 完善的错误处理和恢复机制
- **自动验证** - 验证下载文件的完整性
- **详细报告** - 生成完整的下载报告

## 🚀 快速开始

### 1. 基础使用（推荐）

```powershell
# 运行交互式界面
.\deeplearning_course_downloader.ps1
```

脚本会引导你：
1. 选择课程（或输入自定义课程代码）
2. 选择下载内容（字幕/视频/两者）
3. 自动下载并生成报告

### 2. 命令行使用

```powershell
# 只下载字幕（推荐）
.\deeplearning_course_downloader.ps1 -CourseCode "Anthropic/C2" -SubtitleOnly

# 下载到指定目录
.\deeplearning_course_downloader.ps1 -CourseCode "OpenAI/C1" -OutputDir "我的课程"

# 只下载视频（需要yt-dlp）
.\deeplearning_course_downloader.ps1 -CourseCode "Anthropic/C2" -VideoOnly
```

### 3. 查看帮助

```powershell
.\deeplearning_course_downloader.ps1 -Help
```

## 📋 支持的课程

### 当前支持的课程模板：

| 课程代码 | 课程名称 | 状态 |
|----------|----------|------|
| `Anthropic/C2` | MCP - Model Context Protocol | ✅ 已测试 |
| `OpenAI/C1` | ChatGPT Building System | 🔄 理论支持 |
| `OpenAI/C2` | Advanced ChatGPT | 🔄 理论支持 |
| 自定义课程 | 用户输入的课程代码 | 🔧 需要测试 |

### 课程代码格式：
```
Provider/CourseNumber
例如：Anthropic/C2, OpenAI/C1, Google/C1
```

## 🛠 安装要求

### 必需组件：
- **PowerShell 5.0+** （Windows 10内置）
- **网络连接** （访问 DeepLearning.AI 和 CloudFront）

### 可选组件（视频下载）：
- **Python 3.7+** 和 **pip**
- **yt-dlp** （脚本可自动安装）

## 🎥 视频下载功能

### 自动安装 yt-dlp

脚本会自动尝试安装 yt-dlp：

1. **通过 pip 安装**（如果有 Python）
2. **下载独立可执行文件**（备用方案）

### 手动安装 yt-dlp

```bash
# 方法1：通过 pip
pip install yt-dlp

# 方法2：下载可执行文件
# 访问：https://github.com/yt-dlp/yt-dlp/releases
```

### 视频下载特性

- **自动质量选择** - 默认720p，可调整
- **嵌入字幕** - 自动下载并嵌入字幕
- **格式转换** - 输出为MP4格式
- **版权提醒** - 确保合法使用

## 📁 输出结构

```
CourseDownloads_Anthropic_C2/
├── Subtitles/
│   ├── L1-subtitles.vtt
│   ├── L2-subtitles.vtt
│   └── ...
├── Videos/                 (如果下载视频)
│   ├── Lesson1_Title.mp4
│   └── ...
└── download_report.txt     (详细报告)
```

## 🔧 高级用法

### 1. 批量下载多个课程

```powershell
# 创建批量下载脚本
$courses = @("Anthropic/C2", "OpenAI/C1", "OpenAI/C2")

foreach ($course in $courses) {
    .\deeplearning_course_downloader.ps1 -CourseCode $course -SubtitleOnly -OutputDir "AllCourses\$($course.Replace('/', '_'))"
}
```

### 2. 自定义课程支持

```powershell
# 如果你发现新的课程，可以尝试
.\deeplearning_course_downloader.ps1 -CourseCode "NewProvider/C1"
```

### 3. 使用视频下载模块

```powershell
# 独立使用视频下载器
.\video_downloader_addon.ps1 -CourseUrl "https://example.com/video" -Quality 1080
```

## ❓ 故障排除

### 常见问题

**Q: 下载的字幕文件为空或包含数字？**  
A: 这是字节处理问题，已在当前版本修复。请使用最新脚本。

**Q: 视频下载失败？**  
A: 检查是否安装了 yt-dlp，并确保有合法访问权限。

**Q: 某些课程下载失败？**  
A: 课程可能使用不同的URL结构，请尝试自定义课程代码或联系更新。

**Q: 403或404错误？**  
A: 可能是课程未发布或URL结构变化，检查课程可用性。

### 调试技巧

```powershell
# 启用详细输出
$VerbosePreference = "Continue"
.\deeplearning_course_downloader.ps1 -CourseCode "Anthropic/C2"

# 检查网络连接
Test-NetConnection dyckms5inbsqq.cloudfront.net -Port 443
```

## 📊 性能优化

- **并发下载** - 脚本使用顺序下载确保稳定性
- **错误重试** - 自动跳过失败的文件并继续
- **缓存验证** - 避免重复下载相同文件
- **进度显示** - 实时进度反馈

## ⚖️ 法律声明

### 重要提醒：

1. **仅限教育用途** - 此工具仅供个人学习使用
2. **遵守服务条款** - 请遵守 DeepLearning.AI 的使用条款
3. **版权尊重** - 尊重课程内容的版权
4. **合法访问** - 确保你有合法的课程访问权限

### 免责声明：

- 用户需自行承担使用责任
- 工具开发者不对任何滥用行为负责
- 请确保遵守当地法律法规

## 🔄 更新日志

### v2.0 (当前版本)
- ✅ 修复字节处理问题
- ✅ 添加交互式界面
- ✅ 支持多课程格式
- ✅ 集成视频下载功能
- ✅ 改进错误处理
- ✅ 添加进度显示

### v1.0 (原始版本)
- ✅ 基础字幕下载功能
- ❌ 字节处理问题（已修复）

## 🤝 贡献

欢迎贡献代码和建议：

1. 报告 Bug 或问题
2. 建议新功能
3. 提交课程支持请求
4. 改进文档

## 📞 支持

如果遇到问题：

1. 查看此 README 的故障排除部分
2. 检查课程是否仍然可用
3. 验证网络连接
4. 尝试重新下载脚本

---

**享受你的学习之旅！** 📚✨ 