' CreateShortcut.vbs - Create desktop shortcut with hotkey
' 创建桌面快捷方式（带 Ctrl+Alt+S 快捷键）

Set WshShell = CreateObject("WScript.Shell")
Set oFSO = CreateObject("Scripting.FileSystemObject")

' Get current directory / 获取当前目录
currentDir = oFSO.GetParentFolderName(WScript.ScriptFullName)
batPath = currentDir & "\ScreenOff.bat"

' Check if main program exists / 检查主程序是否存在
If Not oFSO.FileExists(batPath) Then
    MsgBox _
        "Error: ScreenOff.bat not found!" & vbCrLf & _
        "Please ensure this script is in the same folder as ScreenOff.bat" & vbCrLf & vbCrLf & _
        "错误：找不到 ScreenOff.bat！" & vbCrLf & _
        "请确保此脚本与 ScreenOff.bat 在同一目录", _
        16, "Error / 错误"
    WScript.Quit 1
End If

' Create desktop shortcut / 创建桌面快捷方式
Set oLink = WshShell.CreateShortcut(WshShell.SpecialFolders("Desktop") & "\ScreenOff.lnk")
oLink.TargetPath = batPath
oLink.WorkingDirectory = currentDir
oLink.IconLocation = "%SystemRoot%\System32\shell32.dll,27"
oLink.HotKey = "CTRL+ALT+S"
oLink.Description = "Turn off monitor (computer keeps running). Move mouse to wake. / 关闭显示器（电脑不休眠），移动鼠标唤醒"
oLink.Arguments = "/s"
oLink.WindowStyle = 7  ' Minimized / 最小化窗口
oLink.Save

MsgBox _
    "Shortcut created on desktop! / 快捷方式已创建到桌面！" & vbCrLf & vbCrLf & _
    "Hotkey / 快捷键: Ctrl + Alt + S" & vbCrLf & vbCrLf & _
    "Usage / 使用方法:" & vbCrLf & _
    "1. Press Ctrl+Alt+S to turn off screen / 按 Ctrl+Alt+S 黑屏" & vbCrLf & _
    "2. Move mouse or press any key to wake / 移动鼠标或按键唤醒", _
    64, "Success / 成功"
