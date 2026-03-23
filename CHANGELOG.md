# Changelog / 更新日志

[English](#english) | [中文](#chinese)

---

<a name="english"></a>
## 🇺🇸 English

## [1.0.0] - 2026-03-23

### Features
- ✨ Turn off monitor instantly while keeping PC running
- ⏱️ 3-second countdown with cancel support (Ctrl+C)
- 🔇 Silent mode (`/s` parameter) for hotkey usage
- 🔧 Error handling and PowerShell execution policy bypass
- 🌍 Bilingual documentation (English/Chinese)

### Technical Details
- Uses Windows API `SendMessage` with `SC_MONITORPOWER`
- Supports Windows 7/8/10/11
- No administrator privileges required

---

<a name="chinese"></a>
## 🇨🇳 中文

## [1.0.0] - 2026-03-23

### 功能
- ✨ 瞬间关闭显示器但保持电脑运行
- ⏱️ 3秒倒计时，支持取消（Ctrl+C）
- 🔇 静默模式（`/s` 参数）供快捷键使用
- 🔧 错误处理和 PowerShell 执行策略绕过
- 🌍 双语文档（中英文）

### 技术细节
- 使用 Windows API `SendMessage` 配合 `SC_MONITORPOWER`
- 支持 Windows 7/8/10/11
- 不需要管理员权限
