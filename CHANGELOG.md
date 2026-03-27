# Changelog / 更新日志

[English](#english) | [中文](#chinese)

---

<a name="english"></a>
## 🇺🇸 English

## [2.0.0] - 2026-03-27

### New Features
- 🛡️ **Background monitor (single-use)** - Detects wake event, logs cause, re-closes once, then exits
- 📝 **Wake-up log** - Records what caused wake events (QQ, mouse, system events) to `screen-off.log`
- 🔄 **Auto-exit** - Monitor script exits automatically after recovery, no manual stop needed
- 🔒 **Ctrl+C only during countdown** - Other keys are ignored during the 3-second countdown

### Technical Details
- New file: `ScreenOff.Monitor.ps1` - Background watchdog process (single-use mode)
- Monitors user input events to detect wake-ups
- Infinite wait: monitor runs until wake event is detected
- Uses `timeout /t /nobreak` - only responds to Ctrl+C, not other keys
- Auto-recovery: re-closes monitor within 1.5 seconds of wake detection

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

## [2.0.0] - 2026-03-27

### 新功能
- 🛡️ **后台监控（一次性）** - 检测到唤醒事件后记录原因、重新关闭一次，然后自动退出
- 📝 **唤醒日志** - 记录唤醒原因（QQ、鼠标、系统事件）到 `screen-off.log`
- 🔄 **自动退出** - 监控脚本在恢复后自动退出，无需手动停止
- 🔒 **倒计时仅 Ctrl+C 可取消** - 3 秒倒计时期间其他按键无效

### 技术细节
- 新增文件：`ScreenOff.Monitor.ps1` - 后台看门狗进程（一次性模式）
- 监控用户输入事件检测唤醒
- 无限等待：监控脚本持续运行直到检测到唤醒事件
- 使用 `timeout /t /nobreak` - 只响应 Ctrl+C，不响应其他按键
- 自动恢复：检测到唤醒后 1.5 秒内重新关闭显示器

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
