# SpaceInvader
Space Invaders made in Processing
Design Doc Link: https://docs.google.com/document/d/16W1Vs0UT6QlZzv0erRepBLITvG0960s7goQJqurOZz4/edit?usp=sharing 

Group: Small Time

Member: Iftakar Mahamud

Class: APCS Pd3

Summary: 
I will be making a replica of the classic game Space Invaders in Processing. There will be one player at the bottom of the screen that can move and shoot once the relevant keys are pressed, there will be enemies that are on the upper portion of the screen that move and shoot on their own. The players and enemies will be able to damage each other when they’re bullet lands. There will also be barriers between the enemies and the player that take damage so the player can take shelter under it, but eventually they will be broken after taking too much damage.

Compile: Open any one of the .pde files in processing

Run: Press the triangle on the top left

Play the Game: 

Press A or LEFT ARROW to move left

Press D or RIGHT ARROW to move right

Click mouse button to shoot

For presentation purposes, it starts at level 4, to start at beginning, go to the setup and change "level = 4" to "level = 0"

Development Log:

Saturday May 28: only made classes, did simplest one line methods.

Sunday May 30: Mostly completed evey class except main SpaceInvader class.

Monday May 30: did SpaceInvader class and tweaked other classes slightly and made demo branch. Now the game is slightly playable and there are enemies that shoot back and a score counter.

Wednesday June 1: Barriers work now, first basic enemy doesnt shoot laser anymore (working as intended now), bullets register better when near enemies & barriers, added end screen for winning & losing 

Friday June 3: Player has 3 lives now

Saturday June 4: Text & icons on top and bottom mimcs actual game now, basic enemies movbe in unison now (they all move down at the same time), player is green now and enemies are white now

Sunday June 5: barriers have double the hp as before, enemies get faster when there are less of them now, added velocity variables and get & set methods for velocity to Characters class

Wednesday June 8: Added different text messages when game over, cleaned up code for setup, levels added (enemies respawn)

Thursday June 9: Added working restart button after player dies, bullets slightly faster, added Intermediate enemies

Friday June 10: Basic movement is in instyances now, like actual game, intermediates can shoot now

Saturday June 11: Added avatars for player and enemies, added Hard enemies

Sunday June 12: added sound when shooting for players and enemies
