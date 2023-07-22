# Simon
A Short-Term Memory Skills-Based Game.

# How to setup Ripes
Ripes is a computer architecture simulator and assembly editor. It is used for the RISC-V instruction set architecture.
Download instructions-
1)	Go to the following link on GitHub -https://github.com/mortbopet/Ripes/releases/tag/v2.2.5
2)	Select the link to the correct version according to your operating system. 
For windows, select Ripes-v2.2.5-win-x86_64.zip 
For mac, select Ripes-v2.2.5-mac-x86_64.zip 
For linux, select Ripes-v2.2.5-linux-x86_64.AppImage.
3)	Now open Ripes, click on “Select Processor” and choose the “Single-cycle processor”.  
4)	Now, setup is complete.
How to setup Simon
1)	Open Ripes and load the game file into Ripes by clicking on “Simon.s”, then “Load Program” and select “Source File” for the file. Choose the file “Simon.s”.  Simon is now setup.

# Introduction
Number of players (1 or more)
Playing time (Approximately 30 seconds/player)
Age (8+) 

Simon is a short-term memory skill-based game which one or more players can play. The game has 4 coloured touch-sensitive buttons which light up to create a sequence which the player has to repeat. If the player correctly matches the sequence, the game indicates its success by issuing a green colour flash. However, when the user incorrectly matches a particular sequence, the turn ends and a red colour warning is flashed. 

# Playing The Game-
LEDs and d-pad:
For the current assembly-based version, the touch-sensitive buttons are represented by a d-pad and the 4 LEDs represent the colours that light up. Each of the d-pad keys maps to a single LED.

As shown above, the first four diagrams represent the LEDs with different colours. Each of them corresponds to a position marked on the d-pad. 
1)	The first LED corresponds to the up key.
2)	The second LED corresponds to the down key.
3)	The third LED corresponds to the left key.
4)	The fourth LED corresponds to the right key.

1.	Starting the game- 
The game starts by clicking the fast execution button “>>”. Then, the game prompts the user to know the number of players who would be playing this round. The number of players playing can be 1 or more.

For example- On starting the game, the console asks “How many players want to play?” if the player enters 5, the console allows 5 players to play the game.

2.	Informing the player-
The player whose turn is next is informed by the console of Ripes. For this, the console displays the message, “Next up is player” along with their player number. Now, the next player is informed to go next.

3.	Player starts playing-
Now, as the player starts playing, the game starts to light up the LEDs in a random sequence of size 4. After the LEDs have finished displaying the sequence, the player is required to reproduce the same sequence by clicking on the d-pad keys. 
 
For every correct key press, all four LEDs flash green and the player can enter the keys corresponding to the remaining sequence. However, if the wrong key is pressed, all four LEDs flash in red twice and the player’s turn immediately ends. 
 
(Code Enhancement): Each key press is timed at 5 seconds; thus, all key presses must be done within this given timeframe. If any key press takes 5 seconds or more, the current player’s turn ends with a message displaying “You took longer than the allotted time”. Otherwise, the game proceeds as usual.

The number of times the player pressed the correct key of the d-pad is stored as the score for the player which will be displayed in the end as a summary of total scores. Now, the next player if any goes next.

4.	End of the round-
When all players have played, the console in Ripes displays the score for each player as a summary. 

In the end, the console prompts with the question if they want to play the game again. If yes, the player can enter 1 and the game restarts otherwise the player can enter any other input to end the program.

# Troubleshoot-
In Mac/Windows, Ripes might not work correctly during the fast execution.
To troubleshoot that, one suggestion is to delete and reinstall Ripes by repeating the setup process.
Another suggestion is to run Ripes on the lab machines on Linux. This can be done by downloading the Linux setup file from the releases page. Then the ripes folder must be given permission to be executed using thsse command chmod+x in the terminal. Then enter ./<name of the file>  in the terminal to run it.
