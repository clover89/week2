# ***Week 3 - report***

> Due to a series of unfortunate events I messed this week up pretty badly. On Monday I finished everything except for getting the API and load tests to run on Jenkins. The majority of Tuesday was spent on getting Jenkins to run those tests. After a lot of attempts I gave up late in the evening. I got caught a sudden sickness on Wednesday and the entirety of Thursday was spent on reading for the final exam. That is two days of not working on the assignment.
>
> On Friday I was sure I would be able to finish at least on more day worth of assignments (20 - 40 pts) after having finished the exam. I, however, ran out of luck. I was just very unlucky this week, first the sickness and then my Jenkins instance decided to give up on me.
>
> It had gotten insanely slow. All cleaning efforts did not have any effect, restarting the app and/or the instance had no effect either. And because of a little screwup on my behalf I lost access rights to the Jenkins user which made everything very difficult.
>
> Thus, the previous half of Friday went into trying to fix this, which didn't work out. So the later half went into getting a new Jenkins instance up and running. It was very troublesome the first time (last week) while it was a little bit less troublesome this time but still took me a lot of time. I kept encountering various obstacles and ended up spending the rest of the day getting the pipeline up and running again.
>
> This is written at 00:48, December 16th, at this moment I still have problems getting the deployment step to work. It doesn't look like I will manage to finish anything else in time.
>
> \*\*\*\* happens I guess. Merry Christmas!

## Jenkins instance
> See Canvas submission comment

## TicTacToe instance
> Not available due to problems mentioned above

## Datadog instance
> Never made it that far.

## Finished assignments
* Completed the migrations needed for the application to work
  * There was a missing column in table eventlog. Created a migration script which adds column aggregate_id.
* On Git push Jenkins pulls my code and the Tic Tac Toe application is deployed through a build pipeline, but only if all my tests are successful
  * This worked perfectly until Jenkins died as described above. The current Jenkins instance is for some reason unable to deploy properly. It still pulls automatically on Git push and does all steps properly except for deployment.
* Filled out the Assignments: for the API and Load tests
  * See apitest/assignment.md for answers
* The API and Load test run in my build pipeline on Jenkins and everything is cleaned up afterwards
  * The tests run fine on my machine. I tried very hard to get them running on Jenkins but no luck.

## Unfinished assignments
* My test reports are published in Jenkins
* My Tic Tac Toe game works, two people can play a game till the end and be notified who won.
* My TicCell is tested
* I've set up Datadog 
