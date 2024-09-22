#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%\data
SetWinDelay, -1
SetControlDelay, -1
SetKeyDelay, -1
SetMouseDelay, -1
SetBatchLines, -1
coordmode, mouse, Relative

    FrameTime := 0
    StartTime := A_TickCount
    FrameCount := 0

Loop
{
    TopLabel:
    FrameCount++
    ifWinNotExist, Pong AHK Game
    {
        exit
    }
    ControlGetText, CheckPause, Static2, Pong AHK Game
        if (CheckPause != 0)
        {
            process, waitclose, %CheckPause%
        }

    WinGetPos, OutX, OutY, , , Pong AHK Game
    OutX := OutX + 200
    OutY := OutY + 220
    Outcome1 := WinExist("Game Over")
        if (Outcome1 != 0)
        {
            winactivate, Game Over
            WinMove, Game Over,, %OutX%, %OutY%
            sleep 100
            goto TopLabel      
        }

MouseGetPos, MouseX, MouseY
ControlGetPos, Static4X, Static4Y,,, Static4, Pong AHK Game
WinGetPos, X, Y, Width, Height, Pong AHK Game
RudderPositionY := MouseY - 60
ControlMove, Static1,, %RudderPositionY%,,, Pong AHK Game

    LeftBound := X
    RightBound := X + Width
    TopBound := Y
    BottomBound := Y + Height
    if (MouseX <= 0)
        {
            MouseMove, 5, %MouseY%
        }
        else if (MouseX >= 600)
        {
            MouseMove, 595, %MouseY%
        }
    if (MouseY <= 0)
        {
            MouseMove, %MouseX%, 5
        }
        else if (MouseY >= 600)
        {
            MouseMove, %MouseX%, 595
        }
        

FrameTime := A_TickCount - StartTime
    if (FrameTime >= 1000) {
        FPS := Floor(FrameCount * (1000 / FrameTime))
        ControlSetText, Static9, %FPS%, Pong AHK Game
        FrameCount := 0
        StartTime := A_TickCount

        ControlGetText, BallFPS, Static7, Pong AHK Game
        ControlGetText, AIFPS, Static8, Pong AHK Game 
        ControlGetText, UserFPS, Static9, Pong AHK Game
        AVGFPS := floor((BallFPS + AIFPS + UserFPS)/3)
        ControlSetText, Static10, FPS: %AVGFPS%, Pong AHK Game
       
    }

}
return