# Pong-AHK
- My attempt at remaking the classic Pong game in Autohotkey.

![image](https://github.com/user-attachments/assets/2087fe3b-6474-4d47-b0fd-583766304454)

# Requirements:
- Requires Autohotkey v1.1
- Download Link: https://www.autohotkey.com/download/1.1/AutoHotkey112207_Install.exe
- Download Pong.zip, extract the files and run Pong.AHK. That's it.

# How to Play:
- You and the opponent hit the ball back and forth until the player or AI misses the ball and scores a point. Rinse and repeat.

# Current Features:
- A complete Pong game with scoring created in Autohotkey v1.1
- The AI was initially following the ball perfectly, but I added some variance to the AI's accuracy.
- Mouse is locked into the game when you start. You can press ESC at any time to exit.
- Game gradually gets faster as it plays.

# How it was Achieved:
- The pong application was split up into 4 parts.
  - Pong.ahk (master file)
  - AI Logic.ahk (Computer Logic)
  - Ball Logic.ahk (Ball Physics)
  - User Logic.ahk (Player Rudder)
    
 - This kept the scripts separated and lightweight.
 - This simualted "multi-threading" in AHK.
