#NoEnv
#SingleInstance ignore
SendMode Input
SetWorkingDir %A_ScriptDir%\data
SetWinDelay, -1
SetControlDelay, -1
SetKeyDelay, -1
SetMouseDelay, -1
SetBatchLines, -1
coordmode, mouse, Relative
Process, Priority,, H

FrameTime := 0
StartTime := A_TickCount
FrameCount := 0

gui, font, cffffff
gui, font, s80
Gui, Add, Text, -Background vLeftRudder x0 y0 h100 w5, |
gui, font, s0
gui, add, text, -Background vSpacer w475,
gui, font, s80
Gui, Add, Text, -Background vRightRudder ys x595 y0 h100 w5, |
gui, font, s20
gui, add, text, -Background vball -wrap center h15 w15 x300 y300, ⧈
gui, font, s20
Gui, Add, Text, Background x200 y5 w80 cblue, 0
Gui, Add, Text, Background x400 y5 w80 cred, 0

Gui, Add, Text, vBallFPS -Backgroundtrans x275 y05 w100, 0
Gui, Add, Text, vAIFPS -Backgroundtrans x275 y35 w100, 0
Gui, Add, Text, vUserFPS -Backgroundtrans x275 y65 w100, 0
gui, font, s09
Gui, Add, Text, vAVGFPS Background x05 y05 w30 cGreen, FPS: 0
gui, font, s20

Gui, Add, button, gplay vplay x260 y540, Start
gui, font, s12
Gui, Add, Text, x50 y100 vStartText, Welcome to Pong AHK Edition!`n`nHow to Play:`n1. Press Start to Begin.`n`n2. Your mouse will be locked to`nthe game window.`n`n3. Press "ESC" to pause the game.`nThis also unlocks your mouse.`n`n4. The game ends when a player`nreaches 11 points with a lead of`n2 points.

Guicontrol, hide, Spacer
Guicontrol, hide, BallFPS
Guicontrol, hide, AIFPS
Guicontrol, hide, UserFPS
gui, color, 0
gui, show, w600 h600, Pong AHK Game
ControlSetText, Static2, 0, Pong AHK Game
return

Play:
run, %A_ScriptDir%\data\AI Logic.ahk,,, Child1
run, %A_ScriptDir%\data\User Logic.ahk,,, Child2
run, %A_ScriptDir%\data\Ball Logic.ahk,,, Child3
guicontrol, hide, play
guicontrol, hide, StartText
return


guiclose:
process, close, %Child1%
process, close, %Child2%
process, close, %Child3%
process, close, %Child4%
exitapp

Esc::
    toggle := !toggle
    if (toggle = 1)
    {
    WinGetPos, OutX, OutY, , , Pong AHK Game
    OutX := OutX + 120
    OutY := OutY + 200
    run, %A_ScriptDir%\data\PauseGame.ahk,,, Child4
    ControlSetText, Static2, %Child4%, Pong AHK Game
    loop
    {
    Active := WinExist("AHKPongPaused")
    if (Active != 0)
    {
        WinMove, AHKPongPaused,, %OutX%, %OutY%
        break
    }
    }
    }
    else
    {
        winclose, AHKPongPaused
        ControlSetText, Static2, 0, Pong AHK Game
        WinClose, Paused Pong AHK Game
        WinActivate, Pong AHK Game
        mousemove, 300, 300
    }
Return