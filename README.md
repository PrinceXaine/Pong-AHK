# Pong-AHK
- My attempt at remaking the classic Pong game in Autohotkey.

![image](https://github.com/user-attachments/assets/7c5dfc62-c418-4a55-ad7b-a93abd825d19)

# Requirements (Autohotkey)
- Requires Autohotkey v1.1
- Download Link: https://www.autohotkey.com/download/1.1/AutoHotkey112207_Install.exe
- Download Pong.zip, extract the files and run Pong.AHK.

# Requirements (Executable)
- Windows OS.
- Download Pong.zip, extract the files and run Pong.EXE.

# PC Requirements
- Intel® Core™ i3-530 Processor or better. (2 Cores - 4 Threads)
- This program was coded to take advantage of 4 threads.
- While the game will run on less than 4 threads, it is not recommended.

# How to Play:
- Your rudder is on the left. Use your mouse to move it up and down.
- The first player to 11 or more points with a lead of 2 points or more is the victor.

# Current Features:
- A complete Pong game with scoring created in Autohotkey v1.1
- Mouse is locked to the game.
- AI with some degree of imperfection.
- Game gradually gets faster as it plays.
- FPS Counter
- A working Pause Menu. Also unlocks your mouse.

# Latest Updates:
- Script Optimization
- Pause Menu
- FPS Counter
- Win/Lose Game Logic

# Technical Information
- The pong application was split up into 5 parts.
  - Pong (master file): The game window.
  - AI Logic: Controls the AI Rudder.
  - Ball Logic: Controls all of the ball's physics.
  - User Logic: Player Rudder
  - PauseGame: Allows the various scripts to pause in-sync.

# Multi-Threading Benefits
 - Greatly increased performance of the game.
 - Clean Scripts.
