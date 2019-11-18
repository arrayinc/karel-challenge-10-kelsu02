/* File: Challenge-10.k
 ---------------------------
In this exercise, your job is to get Karel to create a checkerboard pattern of
beepers inside an empty rectangular world.

This problem has a nice decomposition structure along with some interesting
algorithmic issues. As you think about how you will solve the problem,
you should make sure your solution works with checkerboards that are different
in size from the standard 8×8 checkerboard shown in the example. Odd-sized
checkerboards are tricky, and you should make sure that your program generates
the following pattern in a 5×3 world. 

Another special case you need to consider is that of a world that is only
one column wide or one row high.
*/
import "turns";

function turnNorth() {
	while (notFacingNorth()) {
		turnLeft();
	}
}

function turnSouth() {
	while (notFacingSouth()) {
		turnLeft();
	}
}

function turnEast() {
	while (notFacingEast()) {
		turnLeft();
	}	
}

function turnWest() {
	while (notFacingWest()) {
		turnLeft();
	}
}

function checkEast() {
	turnEast();
	if (noBeepersPresent()) {
		turnEast();
		putBeeper();
	} else {
		move();
	}
	while (frontIsClear()) {
		move();
		if (frontIsClear()) {
			move();
			putBeeper();
		}
	}
	turnNorth();
}

function checkWest() {
	if (beepersPresent()) {
		move();
		turnWest();
		while (frontIsClear()) {
				move();
				putBeeper();
				move();
		}	
	} else {
		move();
		turnWest();
			while (frontIsClear()) {
				putBeeper();
			if (frontIsClear()) {
				move();
				if (frontIsClear()) {
					move();
				}
			}	
		}
	}
	turnNorth();
}


function Solve() {
	while (frontIsClear()) {
		checkEast();
		checkWest();
		turnNorth();
		if (frontIsClear()) {
			move();
		}
	}
	turnSouth();
	move();
	if (noBeepersPresent()) {
		turnAround();
		move();
		turnEast();
		checkEast();
	}
}
