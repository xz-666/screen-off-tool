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

### 📥 Installation

1. Download `ScreenOff.bat`
2. (Optional) Run `CreateShortcut.vbs` to create a desktop shortcut with hotkey

### 🚀 Usage

#### Method 1: Direct Run

1. Double-click `ScreenOff.bat`
2. Wait 3 seconds (move your hand away from mouse)
3. Monitor turns off
4. Move mouse or press any key to wake up

#### Method 2: Hotkey (Recommended)

1. Double-click `CreateShortcut.vbs` to create desktop shortcut
2. Press **`Ctrl + Alt + S`** to turn off screen instantly
3. Move mouse or press any key to wake up

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
├── CreateShortcut.vbs     # Create desktop shortcut with hotkey
├── README.md             # This file
└── LICENSE               # MIT License
```

### ❓ Troubleshooting / 故障排除

| Issue / 问题 | Solution / 解决方法 |
|-------------|-------------------|
| Hotkey not working / 快捷键不工作 | Some apps (QQ, WeChat) may use `Ctrl+Alt+S`. Right-click the shortcut → Properties → change hotkey. / 某些软件可能占用此快捷键。右键快捷方式→属性→修改快捷键。 |
| PowerShell error / PowerShell 错误 | Ensure PowerShell execution policy allows scripts. Run as admin: `Set-ExecutionPolicy RemoteSigned` / 确保执行策略允许脚本。以管理员运行：`Set-ExecutionPolicy RemoteSigned` |
| Screen wakes immediately / 屏幕立即亮起 | Move your hand away from mouse before countdown ends. / 倒计时结束前把手从鼠标上移开。 |
| How to uninstall? / 如何卸载？ | Delete `ScreenOff.bat` and desktop `ScreenOff.lnk`. / 直接删除文件和桌面快捷方式即可。 |

---

<a name="chinese"></a>
## 🇨🇳 中文

一个简单的 Windows 小工具，**关闭显示器但保持电脑继续运行**。适合下载大文件、长时间计算、或想省电又不想中断工作时使用。

### ✨ 功能

- 🖥️ **瞬间关闭显示器** - 省电护眼
- 💻 **电脑继续运行** - 后台任务不中断
- ⌨️ **任意键唤醒** - 移动鼠标或按键立即亮屏
- ⚡ **无需安装** - 双击即用

### 📥 安装

1. 下载 `ScreenOff.bat`
2. （可选）运行 `CreateShortcut.vbs` 创建桌面快捷方式

### 🚀 使用方法

#### 方式一：直接运行

1. 双击 `ScreenOff.bat`
2. 等待 3 秒（把手从鼠标上移开）
3. 屏幕关闭
4. 移动鼠标或按任意键唤醒

#### 方式二：快捷键（推荐）

1. 双击 `CreateShortcut.vbs` 创建桌面快捷方式
2. 按 **`Ctrl + Alt + S`** 立即黑屏
3. 移动鼠标或按任意键唤醒

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
├── CreateShortcut.vbs     # 创建桌面快捷方式
├── README.md             # 说明文档
└── LICENSE               # MIT 许可证
```

### ❓ 故障排除

| 问题 | 解决方法 |
|------|---------|
| 快捷键不工作 | 某些软件（如 QQ、微信）可能占用 `Ctrl+Alt+S`。右键快捷方式→属性→修改快捷键。 |
| PowerShell 错误 | 确保执行策略允许脚本。以管理员运行：`Set-ExecutionPolicy RemoteSigned` |
| 屏幕立即亮起 | 倒计时结束前把手从鼠标上移开。 |
| 如何卸载？ | 直接删除 `ScreenOff.bat` 和桌面 `ScreenOff.lnk` 快捷方式即可。 |

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
