    #NoEnv
    #SingleInstance force
    SendMode Input
    SetWorkingDir %A_ScriptDir%\data
    SetWinDelay, -1
    SetControlDelay, -1
    SetKeyDelay, -1
    SetMouseDelay, -1
    SetBatchLines, -1

    FrameTime := 0
    StartTime := A_TickCount
    FrameCount := 0
    Hotkey, ESC, off

    first:
    LoopCount := 20
    sleep 1000
    ControlGetPos, Static1X, Static1Y,,, Static1, Pong AHK Game
    ControlGetPos, Static3X, Static3Y,,, Static3, Pong AHK Game
    ControlGetPos, Static4X, Static4Y,,, Static4, Pong AHK Game
        TryAgain:
            random, XMult, -1, 1
            random, YMult, -3, 3
            if (XMult = 0||YMult = 0)
                {
                    gosub TryAgain
                }
            
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
    ControlGetPos, Static1X, Static1Y,,, Static1, Pong AHK Game
    ControlGetPos, Static3X, Static3Y,,, Static3, Pong AHK Game
    ControlGetPos, Static4X, Static4Y,,, Static4, Pong AHK Game
    
    if (Static4Y <= 25)
        {
            YMult := YMult * -1
            ControlMove, Static4, %Static4X%, %Static4Y%,,, Pong AHK Game  
        }
        if (Static4Y >= 600)
        {
            YMult := YMult * -1
            ControlMove, Static4, %Static4X%, %Static4Y%,,, Pong AHK Game
        }

    LeftRudderPosX := Static1X + 5
    LeftRudderPosXOut := Static1X + 4
    LeftRudderPosYBtm := Static1Y + 95
    RightRudderPosX := Static3X - 16
    RightRudderPosXOut := Static3X - 15
    RightRudderPosYBtm := Static3Y + 95
    if (Static4X < LeftRudderPosX) && (Static4Y > Static1Y - 15) && (Static4Y < LeftRudderPosYBtm)
            {
                XMult := XMult * -1
                LoopCount--
            } else if (Static4X > RightRudderPosX) && (Static4Y > Static3Y - 15) && (Static4Y < RightRudderPosYBtm)
            {
                XMult := XMult * -1
                LoopCount--
            } else if (Static4X > RightRudderPosXOut)
                {
                    ControlGetText, Player1Score, Static5, Pong AHK Game
                    Player1Score := Player1Score + 1
                    ControlSetText, Static5, %Player1Score%, Pong AHK Game
                    ControlMove, Static4, 300, 300,,, Pong AHK Game
                    if (Player1Score >= 11 && Player1Score >= Player2Score + 2)
                    {
                        Hotkey, ESC, on
                        msgbox, 4, Game Over, You Win! Play again?
                        ifmsgbox Yes 
                        {
                            Hotkey, ESC, off
                            Player1Score = 0
                            Player2Score = 0
                            ControlSetText, Static5, %Player1Score%, Pong AHK Game
                            ControlSetText, Static6, %Player1Score%, Pong AHK Game
                        }
                        Else
                        {
                            winclose, Pong AHK Game
                        }
                    }
                    gosub, first
                } else if (Static4X < LeftRudderPosXOut)
                    {
                    ControlGetText, Player2Score, Static6, Pong AHK Game
                    Player2Score := Player2Score + 1
                    ControlSetText, Static6, %Player2Score%, Pong A
                    if (Player2Score >= 11 && Player2Score >= Player1Score + 2)
                        {
                        Hotkey, ESC, on
                        msgbox, 4, Game Over, You Lose! Play again?
                        ifmsgbox Yes 
                        {
                            Hotkey, ESC, off
                            Player1Score = 0
                            Player2Score = 0
                            ControlSetText, Static5, %Player1Score%, Pong AHK Game
                            ControlSetText, Static6, %Player1Score%, Pong AHK Game
                        }
                        Else
                        {
                            winclose, Pong AHK Game
                        }
                        }
                    ControlMove, Static4, 300, 300,,, Pong AHK Game
                    gosub, first
                    }

    Static4X := Static4X + XMult
    Static4Y := Static4Y + YMult
    if (LoopCount <= 0)
    {
        LoopCount = 1
    }
    loop %loopCount%
    {
    ControlMove, Static4, %Static4X%, %Static4Y%,,, Pong AHK Game
    }

    FrameTime := A_TickCount - StartTime
    if (FrameTime >= 1000) {
        FPS := Floor(FrameCount * (1000 / FrameTime))
        ControlSetText, Static7, %FPS%, Pong AHK Game
        FrameCount := 0
        StartTime := A_TickCount
    }
    }
return

ESC::
Return