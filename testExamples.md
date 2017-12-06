# **Unit test mockups**

## Template
> GIVEN \<Event> \
> WHEN \<Command> \
> THEN \<Event>


## Illegal moves
> TEST #1

  	GIVEN
    Game has been created/started

  	WHEN
    Player inserts negative coordinates

  	THEN
    An error is displayed notifying player of illegal move


> TEST #2

  	GIVEN
    Game has been created/started

  	WHEN
    Player inserts coordinates > 2

  	THEN
    An error is displayed notifying player of illegal move

 > TEST #3

  	GIVEN
    Game has been created,
    Player, side X, makes a move at 1,1

  	WHEN
    Player, side O, makes a move at 1,1

  	THEN
    An error is displayed notifying player of illegal move

> TEST #4

  	GIVEN
    Game has been created
    Player, side X, has made a move

  	WHEN
    Player, side X, makes a move

  	THEN
    An error is displayed notifying player, side X, it is not this move


## Create and join game

> TEST #5

  	GIVEN
    Nothing has been done yet

  	WHEN
    Player creates a game

  	THEN
    A game is created



> TEST #6

  	GIVEN
    Game has been created,
    A player has joined game

  	WHEN
    A second player joins game

  	THEN
    A game is joined.

> TEST #7

  	GIVEN
    Game has been created,
    Two players have joined game

  	WHEN
    A third player attempts to join game

  	THEN
    An error is displayed notifying player of a full game


## Draws and wins

> TEST #8

  	GIVEN
    Game has been created

  	WHEN
    Player makes first move

  	THEN
    Move is made

> TEST #9

  	GIVEN
    Game has been created
    Both players have made four moves each, no victory yet
    Next turn is player, side X

  	WHEN
    Player X makes a move at the last unoccupied square
    without winning

  	THEN
    It is a draw, no one wins

> TEST #10

  	GIVEN
    Game has been created
    Both players have made four moves each, no victory yet
    Next turn is player, side X

  	WHEN
    Player, side X, makes a move at the last unoccupied square
    ensuring his victory

  	THEN
    The game is won by player, side X

> TEST #11

  	GIVEN
    Game has been created
    One player has made two moves that placed two X/Os vertically into the same column

  	WHEN
    This same player places the third X/O vertically beside/in between of the other two

  	THEN
    Game is won by that same player

> TEST #12

  	GIVEN
    Game has been created
    One player has made two moves that placed two X/Os horizontally into the same row

  	WHEN
    This same player places the third X/O horizontally beside/in between of the other two

  	THEN
    Game is won by that same player

> TEST #13

  	GIVEN
    Game has been created
    One player has made two moves that placed two X/Os obliquely in-line, from upper-left corner to lower-right corner of grid

  	WHEN
    This same player places the third X/O obliquely beside/in between of the other two

  	THEN
    Game is won by that same player

> TEST #14

  	GIVEN
    Game has been created
    One player has made two moves that placed two X/Os obliquely in-line, from lower-left corner to upper-right corner of grid

  	WHEN
    This same player places the third X/O obliquely beside/in between of the other two

  	THEN
    Game is won by that same player
