# Screen Off Tool / 显示器黑屏工具

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows-blue.svg)](https://www.microsoft.com/windows)

[English](#english) | [中文](#chinese)

---

<a name="english"></a>
## 🇺🇸 English

A simple Windows tool to **turn off the monitor while keeping the computer running**. Perfect for downloads, long-running tasks, or when you want to save power without interrupting your work.

### ✨ Features

- 🖥️ **Turn off monitor instantly** - Save power and reduce eye strain
- 💻 **Keep computer running** - Downloads and tasks continue in background
- ⌨️ **Any key to wake** - Move mouse or press any key to wake up
- ⚡ **No installation** - Just double-click to use
- 🛡️ **Auto-recovery (single wake)** - Re-closes once if accidentally woken, then logs and exits
- 📝 **Wake log** - Records what caused the wake-up (QQ, mouse, etc.) to `screen-off.log`
- 🔒 **Ctrl+C only** - During countdown, only Ctrl+C can cancel (other keys ignored)

### 📥 Installation

1. Download `ScreenOff.bat`
2. (Optional) Run `CreateShortcut.vbs` to create a desktop shortcut with hotkey

### 🚀 Usage

#### Method 1: Direct Run

1. Double-click `ScreenOff.bat`
2. Wait 3 seconds (move your hand away from mouse)
3. Monitor turns off, background monitor starts
4. **When screen wakes:** Monitor detects → logs cause → re-closes once → exits
5. Check `screen-off.log` for wake-up reasons
6. Run again if you want to re-close the monitor

#### Method 2: Hotkey (Recommended)

1. Double-click `CreateShortcut.vbs` to create desktop shortcut
2. Press **`Ctrl + Alt + S`** to turn off screen instantly
3. **Background monitor runs once:** wakes → logs → re-closes → exits

#### Method 3: Stop Monitor

- Run `ScreenOff.bat /stop` to stop the background monitor

### 📝 Why 3 Seconds Countdown?

The screen may wake up immediately if:
- Mouse moves slightly
- Window focus changes

The 3-second countdown gives you time to move your hand away from the mouse.

### 🖥️ System Requirements / 系统要求

- Windows 7 / 8 / 10 / 11
- PowerShell 3.0 or higher (usually pre-installed)
- No administrator privileges required / 不需要管理员权限

### 🔧 File Structure

```
screen-off-tool/
├── ScreenOff.bat          # Main script
├── ScreenOff.Monitor.ps1  # Background monitor (auto-starts)
├── CreateShortcut.vbs     # Create desktop shortcut with hotkey
├── screen-off.log         # Wake-up event log (auto-generated)
├── README.md             # This file
└── LICENSE               # MIT License
```

### ❓ Troubleshooting / 故障排除

| Issue / 问题 | Solution / 解决方法 |
|-------------|-------------------|
| Hotkey not working / 快捷键不工作 | Some apps (QQ, WeChat) may use `Ctrl+Alt+S`. Right-click the shortcut → Properties → change hotkey. / 某些软件可能占用此快捷键。右键快捷方式→属性→修改快捷键。 |
| PowerShell error / PowerShell 错误 | Ensure PowerShell execution policy allows scripts. Run as admin: `Set-ExecutionPolicy RemoteSigned` / 确保执行策略允许脚本。以管理员运行：`Set-ExecutionPolicy RemoteSigned` |
| Screen wakes immediately / 屏幕立即亮起 | Background monitor will auto-recover. Check `screen-off.log` for the cause. / 后台监控会自动重新关闭。查看 `screen-off.log` 了解原因。 |
| How to stop monitor? / 如何停止监控？ | Run `ScreenOff.bat /stop` or check Task Manager for PowerShell processes. / 运行 `ScreenOff.bat /stop` 或在任务管理器中查看 PowerShell 进程。 |
| How to uninstall? / 如何卸载？ | Delete `ScreenOff.bat`, `ScreenOff.Monitor.ps1`, and desktop `ScreenOff.lnk`. / 直接删除文件和桌面快捷方式即可。 |

---

<a name="chinese"></a>
## 🇨🇳 中文

一个简单的 Windows 小工具，**关闭显示器但保持电脑继续运行**。适合下载大文件、长时间计算、或想省电又不想中断工作时使用。

### ✨ 功能

- 🖥️ **瞬间关闭显示器** - 省电护眼
- 💻 **电脑继续运行** - 后台任务不中断
- ⌨️ **任意键唤醒** - 移动鼠标或按键立即亮屏
- ⚡ **无需安装** - 双击即用
- 🛡️ **自动恢复一次** - 意外唤醒后自动重新关闭一次，记录日志后退出
- 📝 **唤醒日志** - 记录什么导致屏幕唤醒（QQ、鼠标等）
- 🔒 **仅 Ctrl+C 可取消** - 倒计时期间只有 Ctrl+C 有效，其他按键无效

### 📥 安装

1. 下载 `ScreenOff.bat`
2. （可选）运行 `CreateShortcut.vbs` 创建桌面快捷方式

### 🚀 使用方法

#### 方式一：直接运行

1. 双击 `ScreenOff.bat`
2. 等待 3 秒（把手从鼠标上移开）
3. 屏幕关闭，后台监控启动
4. **当屏幕被唤醒时：** 检测 → 记录原因 → 重新关闭一次 → 退出
5. 查看 `screen-off.log` 了解唤醒原因
6. 如需继续关闭，再次运行即可

#### 方式二：快捷键（推荐）

1. 双击 `CreateShortcut.vbs` 创建桌面快捷方式
2. 按 **`Ctrl + Alt + S`** 立即黑屏
3. **后台监控运行一次：** 唤醒 → 记录日志 → 重新关闭 → 退出

#### 方式三：停止监控

- 运行 `ScreenOff.bat /stop` 停止后台监控

### 📝 为什么等待 3 秒？

黑屏后立即亮起通常是因为：
- 鼠标轻微移动
- 窗口焦点切换

3 秒倒计时让你有时间把手从鼠标上移开，避免误触。

### 🖥️ 系统要求

- Windows 7 / 8 / 10 / 11
- PowerShell 3.0 或更高版本（通常预装）
- 不需要管理员权限

### 🔧 文件结构

```
screen-off-tool/
├── ScreenOff.bat          # 主程序
├── ScreenOff.Monitor.ps1  # 后台监控（自动启动）
├── CreateShortcut.vbs     # 创建桌面快捷方式
├── screen-off.log         # 唤醒事件日志（自动生成）
├── README.md             # 说明文档
└── LICENSE               # MIT 许可证
```

### ❓ 故障排除

| 问题 | 解决方法 |
|------|---------|
| 快捷键不工作 | 某些软件（如 QQ、微信）可能占用 `Ctrl+Alt+S`。右键快捷方式→属性→修改快捷键。 |
| PowerShell 错误 | 确保执行策略允许脚本。以管理员运行：`Set-ExecutionPolicy RemoteSigned` |
| 屏幕立即亮起 | 后台监控会重新关闭一次并记录原因到日志，然后退出。如需继续关闭请再次运行。 |
| 如何停止监控？ | 监控脚本会在唤醒后自动退出，无需手动停止。 |
| 如何卸载？ | 直接删除 `ScreenOff.bat`、`ScreenOff.Monitor.ps1` 和桌面 `ScreenOff.lnk` 快捷方式即可。 |

---

## 💡 Tips / 使用技巧

**EN:** For laptops, connect power adapter to prevent battery drain.
**CN:** 笔记本用户请接通电源，避免电池耗尽。

**EN:** Close popup-prone apps (QQ, WeChat) to prevent accidental wake-up.
**CN:** 关闭可能弹窗的软件（QQ、微信等），防止意外唤醒。

---

## 📄 License / 许可证

[MIT License](LICENSE)

Copyright (c) 2026 xz-666
