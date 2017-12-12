# ***Day 11 Assignment - API/Load tests***

## tictactoe-game-player.js
### How the code switches sides of the game

> The function playOSide() is a nested (inner) function of the function > playGame(done) (Outer). The first thing that is
> done after calling playGame is going to userA.expectGameCreated() and that is where everything begins.
> The outer function calls the inner function which in return returns the control to the outer function. That way the players take turns at making moves as the outer functions call the inner function and returns control. The inner outer function represents side O and the outer function represents side x.

### Altering the code to fail the tests

> Altering the code as instructed did not have any effect on the tests. However, it is expeceted that this would trigger the compareIncompleteGameEvents helper function in tictactoe.loadtest.js which would fail the test.


## test-api.js
### Tracing the calls
> I put console.log() commands where the code was run after calling cleanDatabase. See code.

## user-api.js
### push/pop functions

> The push/pop commands take events given and put them into arrays (push), thus creating a list of events that are removed (pop) sequentially as the test is performed. This data structure is essential for maintaining a list of events when executing the test. Without the pop/push commands the test would have to be implemented in a whole other way.

## tictactoe.loadtest.js
### Finding the appropriate numbers

> After a lot of attempts and experiments I found the ideal numbers for the test to run. Having the time limit as 15000ms and count as 70 the test goes through green as well as putting maximum load on the system. Changing count to 75 would fail the test.
