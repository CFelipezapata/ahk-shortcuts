#Requires AutoHotkey v2.0

; Win + 1: Windows Terminal (better window match)
#1::{
    if WinExist("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
        WinActivate
    else
        Run("wt.exe")
}

; Win + 2: Cursor IDE
#2::{
    if WinExist("ahk_exe cursor.exe")
        WinActivate
    else
        Run("C:\Users\" . A_UserName . "\AppData\Local\Programs\cursor\Cursor.exe")
}

; Win + 3: Chrome
#3::{
    if WinExist("ahk_exe chrome.exe")
        WinActivate
    else
        Run("chrome.exe")
}

; Win + 4: Slack
#4::{
    if WinExist("ahk_exe slack.exe")
        WinActivate
    else
        Run("slack.exe")
}

; Alt + Space: Open or focus ChatGPT app
!Space:: {
    if WinExist("ahk_exe ChatGPT.exe")
        WinActivate
    else
        Run("C:\Users\" . A_UserName . "\AppData\Local\Microsoft\WindowsApps\chatgpt.exe")
}

; Alt + ` : Cycle between windows of the same app (like macOS)
; Source: https://gist.github.com/CFelipezapata/f7563d364197936a6673d28ad53b01dc
!`::{
    activeProcess := WinGetProcessName("A")
    winList := WinGetList("ahk_exe " activeProcess)

    if winList.Length > 1 {
        ; Activate the last window in the stack (most recently used *other* one)
        WinActivate("ahk_id " winList[winList.Length])
    }
}
