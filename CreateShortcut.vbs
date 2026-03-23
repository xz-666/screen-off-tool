' CreateShortcut.vbs v1.0.0
' Create desktop shortcut with hotkey / 创建桌面快捷方式（带快捷键）
' https://github.com/xz-666/screen-off-tool

Option Explicit

On Error Resume Next

Dim WshShell, oFSO, currentDir, batPath, shortcutPath, oLink, result

Set WshShell = CreateObject("WScript.Shell")
If Err.Number <> 0 Then
    MsgBox "Error: Cannot create WScript.Shell object / 错误：无法创建 WScript.Shell 对象", 16, "Error"
    WScript.Quit 1
End If

Set oFSO = CreateObject("Scripting.FileSystemObject")

' Get current directory / 获取当前目录
currentDir = oFSO.GetParentFolderName(WScript.ScriptFullName)
batPath = currentDir & "\ScreenOff.bat"
shortcutPath = WshShell.SpecialFolders("Desktop") & "\ScreenOff.lnk"

' Check if main program exists / 检查主程序是否存在
If Not oFSO.FileExists(batPath) Then
    MsgBox "Error: ScreenOff.bat not found!" & vbCrLf & _
           "Please ensure this script is in the same folder as ScreenOff.bat" & vbCrLf & vbCrLf & _
           "错误：找不到 ScreenOff.bat！" & vbCrLf & _
           "请确保此脚本与 ScreenOff.bat 在同一目录", _
           16, "Error / 错误"
    WScript.Quit 1
End If

' Check if shortcut already exists / 检查快捷方式是否已存在
If oFSO.FileExists(shortcutPath) Then
    result = MsgBox("Shortcut already exists. Overwrite?" & vbCrLf & _
                    "快捷方式已存在，是否覆盖？", _
                    vbYesNo + vbQuestion, "Confirm / 确认")
    If result = vbNo Then
        MsgBox "Cancelled / 已取消", 64, "Info / 信息"
        WScript.Quit 0
    End If
End If

' Create shortcut / 创建快捷方式
On Error Resume Next
Set oLink = WshShell.CreateShortcut(shortcutPath)
oLink.TargetPath = batPath
oLink.WorkingDirectory = currentDir
oLink.IconLocation = "%SystemRoot%\System32\shell32.dll,27"
oLink.HotKey = "CTRL+ALT+S"
oLink.Description = "Turn off monitor (PC keeps running). Move mouse to wake. / 关闭显示器（电脑不休眠），移动鼠标唤醒"
oLink.Arguments = "/s"
oLink.WindowStyle = 7  ' Minimized / 最小化窗口
oLink.Save

' Check if save was successful / 检查是否保存成功
If Err.Number <> 0 Then
    MsgBox "Failed to create shortcut!" & vbCrLf & _
           "创建快捷方式失败！" & vbCrLf & vbCrLf & _
           "Error / 错误: " & Err.Description, _
           16, "Error / 错误"
    WScript.Quit 1
End If

MsgBox "Shortcut created successfully! / 快捷方式已创建到桌面！" & vbCrLf & vbCrLf & _
       "Hotkey / 快捷键: Ctrl + Alt + S" & vbCrLf & vbCrLf & _
       "Usage / 使用方法:" & vbCrLf & _
       "1. Press Ctrl+Alt+S to turn off screen / 按 Ctrl+Alt+S 黑屏" & vbCrLf & _
       "2. Move mouse or press any key to wake / 移动鼠标或按键唤醒", _
       64, "Success / 成功"
