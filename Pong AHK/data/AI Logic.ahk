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

LoopCount = 1
FrameTime := 0
StartTime := A_TickCount
FrameCount := 0

Loop
{
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
ControlGetPos, Static4X, Static4Y,,, Static4, Pong AHK Game
ControlGetPos,, Static3Y,,, Static3, Pong AHK Game
if (LoopCount = 1)
{
    redo:
Random, AccMod, -1, 1
if (AccMod = 0)
    {
        goto redo
    }
Accuracy := 40 + AccMod
}
if (Accuracy < 40)
    {
        random, RNG, 0, 200
        if (RNG = 200)
        {
        Accuracy--
        }
    }
if (Accuracy > 40)
    {
       random, RNG, 0, 200
        if (RNG = 200)
        {
        Accuracy++
        }
    }
if (Accuracy > 100)
    {
        Accuracy = 39
    }
if (Accuracy < -20)
    {
        Accuracy = 41
    }
AIRudderPosY := Static4Y - Accuracy
Loop
{
     ifWinNotExist, Pong AHK Game
    {
        exit
    }
if (Static3Y = AIRudderPosY)
    {
        break
    }
if (Static3Y < AIRudderPosY)
{
Static3Y := Static3Y + 1   
ControlMove, Static3,, %Static3Y%,,, Pong AHK Game
}
if (Static3Y > AIRudderPosY)
{
Static3Y := Static3Y - 1   
ControlMove, Static3,, %Static3Y%,,, Pong AHK Game
}
}
LoopCount++
If (LoopCount > 100000)
    {
        LoopCount = 1
    }

FrameTime := A_TickCount - StartTime
    if (FrameTime >= 1000) {
        FPS := Floor(FrameCount * (1000 / FrameTime))
        ControlSetText, Static8, %FPS%, Pong AHK Game
        FrameCount := 0
        StartTime := A_TickCount
    }
}


