# Screen Off Tool / 显示器黑屏工具

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows-blue.svg)](https://www.microsoft.com/windows)

[English](#english) | [中文](#chinese)

---

<a name="english"></a>
## 🇺🇸 English

Two Windows tools to control your display:

### Option 1: ScreenOff.bat - Turn Off Monitor
- **What it does**: Sends signal to turn off monitor, auto-exits on mouse/keyboard activity
- **Best for**: Short breaks, saving power
- **Exit**: Move mouse or press any key

### Option 2: BlackScreen.bat - Black Screen Overlay
- **What it does**: Displays pure black fullscreen window
- **Best for**: Overnight downloads, preventing auto-wake issues
- **Exit**: Press ESC

### 📥 Installation

1. Download the repository
2. **NirCmd required for ScreenOff.bat**: Download from [nirsoft.net](https://www.nirsoft.net/utils/nircmd.html) and extract to `nircmd/` folder

### 🚀 Usage

#### ScreenOff.bat (Requires NirCmd)

1. Double-click `ScreenOff.bat`
2. Wait 3 seconds
3. Monitor turns off
4. Move mouse or press any key to exit

#### BlackScreen.bat (No dependencies)

1. Double-click `BlackScreen.bat`
2. Screen turns black immediately
3. Press ESC to exit

### 🖥️ System Requirements

- Windows 7 / 8 / 10 / 11
- PowerShell 3.0 or higher
- NirCmd (for ScreenOff.bat only)

### 🔧 File Structure

```
screen-off-tool/
├── ScreenOff.bat          # Turn off monitor (requires NirCmd)
├── ScreenOff.ps1          # ScreenOff main script
├── BlackScreen.bat        # Black screen overlay (no dependencies)
├── BlackScreen.ps1        # BlackScreen main script
├── CreateShortcut.vbs     # Create desktop shortcut
├── nircmd/
│   └── nircmd.exe         # NirCmd tool (download separately)
├── README.md
└── LICENSE
```

---

<a name="chinese"></a>
## 🇨🇳 中文

两个显示器控制工具：

### 方案一：ScreenOff.bat - 关闭显示器
- **功能**: 发送信号关闭显示器，检测到鼠标/键盘活动时自动退出
- **适用场景**: 短暂离开、省电
- **退出方式**: 移动鼠标或按任意键

### 方案二：BlackScreen.bat - 黑屏覆盖层
- **功能**: 显示纯黑全屏窗口
- **适用场景**: 夜间挂机下载、防止显示器自动唤醒
- **退出方式**: 按 ESC

### 📥 安装

1. 下载本仓库
2. **ScreenOff.bat 需要 NirCmd**: 从 [nirsoft.net](https://www.nirsoft.net/utils/nircmd.html) 下载并解压到 `nircmd/` 文件夹

### 🚀 使用方法

#### ScreenOff.bat (需要 NirCmd)

1. 双击 `ScreenOff.bat`
2. 等待 3 秒
3. 显示器关闭
4. 移动鼠标或按任意键退出

#### BlackScreen.bat (无需额外依赖)

1. 双击 `BlackScreen.bat`
2. 屏幕立即变黑
3. 按 ESC 退出

### 🖥️ 系统要求

- Windows 7 / 8 / 10 / 11
- PowerShell 3.0 或更高版本
- NirCmd（仅 ScreenOff.bat 需要）

### 🔧 文件结构

```
screen-off-tool/
├── ScreenOff.bat          # 关闭显示器（需要 NirCmd）
├── ScreenOff.ps1          # ScreenOff 主程序
├── BlackScreen.bat        # 黑屏覆盖层（无需额外依赖）
├── BlackScreen.ps1        # BlackScreen 主程序
├── CreateShortcut.vbs     # 创建桌面快捷方式
├── nircmd/
│   └── nircmd.exe         # NirCmd 工具（需单独下载）
├── README.md
└── LICENSE
```

### ❓ 故障排除

| 问题 | 解决方法 |
|------|---------|
| ScreenOff.bat 提示找不到 NirCmd | 从 nirsoft.net 下载 nircmd.exe 并放到 `nircmd/` 文件夹 |
| PowerShell 错误 | 确保执行策略允许脚本。以管理员运行：`Set-ExecutionPolicy RemoteSigned` |
| 显示器自动唤醒 | 这是硬件行为。请使用 BlackScreen.bat 或在显示器 OSD 菜单中关闭"自动唤醒" |
| 黑屏后无法退出 | 按 ESC（BlackScreen）或移动鼠标（ScreenOff） |

---

## 💡 Tips / 使用技巧

**笔记本用户**: 请接通电源，避免电池耗尽。

**防止自动唤醒**: 某些显示器检测到信号会自动唤醒。遇到此问题请使用 BlackScreen.bat。

**键盘快捷键**: 运行 `CreateShortcut.vbs` 创建桌面快捷方式，可设置快捷键（如 `Ctrl+Alt+S`）。

---

## 📄 License / 许可证

[MIT License](LICENSE)

Copyright (c) 2026 xz-666
