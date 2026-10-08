// =====================================================
// THE LOST CAVE  -  a text adventure (Processing)
// How to play: read the screen, press 1 or 2 to choose.
//              on result screens, press the SPACE bar to continue.
// =====================================================

int scene = 0;   // which part of the story we are on
int gold  = 0;   // PROGRESS: how much treasure you've collected
int roll  = 0;   // holds the result of a random event (0 or 1)

void setup() {
  size(640, 420);
  textSize(18);
}

void draw() {
  background(20);
  fill(255);

  // ---------- SCENE 0 : DECISION 1 ----------
  if (scene == 0) {
    text("THE LOST CAVE\n\n" +
         "You step into a dark cave, hunting for treasure.\n" +
         "The path splits in two.\n\n" +
         "1) Take the LEFT tunnel\n" +
         "2) Take the RIGHT tunnel", 40, 60);
  }

  // ---------- SCENE 1 : RANDOM EVENT 1 result ----------
  else if (scene == 1) {
    if (roll == 0) {
      text("A rope bridge crosses a deep pit...\n\n" +
           "The bridge HOLDS. You cross safely.\n\n" +
           "(press SPACE to continue)", 40, 60);
    } else {
      text("A rope bridge crosses a deep pit...\n\n" +
           "The bridge SNAPS! You scramble up but\n" +
           "drop some gold. (-5 gold)\n\n" +
           "(press SPACE to continue)", 40, 60);
    }
  }

  // ---------- SCENE 2 : DECISION 2 ----------
  else if (scene == 2) {
    text("Your path is blocked by a heavy metal door.\n" +
         "To your right, a dark, narrow hole leads further down.\n\n" +
         "1) Try to pick the lock on the door\n" +
         "2) Climb down the dark hole", 40, 60);
  }

  // ---------- SCENE 3 : DECISION 3 ----------
  else if (scene == 3) {
    text("You enter a dusty chamber and spot a mysterious\n" +
         "treasure chest sitting on a stone pedestal.\n\n" +
         "1) Open the chest\n" +
         "2) Leave it alone and sneak past", 40, 60);
  }

  // ---------- SCENE 4 : RANDOM EVENT 2 result ----------
  else if (scene == 4) {
    if (roll == 0) {
      text("You pry open the chest...\n\n" +
           "It's full of dazzling jewels! (+15 gold)\n\n" +
           "(press SPACE to continue)", 40, 60);
    } else if (roll == 1) {
      text("You pry open the chest...\n\n" +
           "It's a trap! A dart hits you and you drop\n" +
           "some of your coins in a panic. (-5 gold)\n\n" +
           "(press SPACE to continue)", 40, 60);
    } else if (roll == 2) {
      text("You wisely ignore the chest and walk past.\n\n" +
           "Better safe than sorry.\n\n" +
           "(press SPACE to continue)", 40, 60);
    }
  }

  // ---------- SCENE 5 : DECISION 4 ----------
  else if (scene == 5) {
    text("You are nearing the exit, but a swarm of giant bats\n" +
         "is guarding a final pile of shiny coins!\n\n" +
         "1) Fight the bats for the gold\n" +
         "2) Sneak past them quietly to the exit", 40, 60);
  }

  // ---------- SCENE 6 : ENDING ----------
  else if (scene == 6) {
    if (gold >= 20) {
      text("You escape the cave loaded with treasure!\n\nGOOD ENDING", 40, 60);
    } else if (gold >= 1) {
      text("You make it out with a little gold.\n\nOKAY ENDING", 40, 60);
    } else {
      text("You crawl out empty-handed and shaken.\n\nBAD ENDING", 40, 60);
    }
  }

  // PROGRESS BAR: gold is always visible at the bottom
  fill(255, 215, 0); // Gold color
  text("Gold: " + gold, 40, height - 30);
}

void keyPressed() {

  // ----- SCENE 0 : handle DECISION 1, then roll RANDOM EVENT 1 -----
  if (scene == 0) {
    if (key == '1') {
      gold = gold + 10;          // left tunnel = treasure
    }
    // (right tunnel = nothing, so no change)

    roll = int(random(2));       // RANDOM: 0 or 1, decided by chance
    if (roll == 1) {
      gold = gold - 5;           // bridge snapped
    }
    scene = 1;
  }

  // ----- SCENE 1 : press SPACE to move on -----
  else if (scene == 1 && key == ' ') {
    scene = 2;
  }

  // ----- SCENE 2 : DECISION 2 -----
  else if (scene == 2) {
    if (key == '1') {
      gold = gold + 5;           // successfully picked the lock and found a stash
    }
    scene = 3;
  }

  // ----- SCENE 3 : DECISION 3, then roll RANDOM EVENT 2 -----
  else if (scene == 3) {
    if (key == '1') {
      // They chose to open it, so we roll to see if it's a trap
      roll = int(random(2));       
      if (roll == 0) {
        gold = gold + 15;        // lucky: treasure!
      } else {
        gold = gold - 5;         // unlucky: trap!
      }
    } else {
      // They bypassed the chest. We set roll to 2 so Scene 4 knows what text to show.
      roll = 2;                  
    }
    scene = 4;
  }

  // ----- SCENE 4 : press SPACE to move on -----
  else if (scene == 4 && key == ' ') {
    scene = 5;
  }

  // ----- SCENE 5 : DECISION 4 -----
  else if (scene == 5) {
    if (key == '1') {
      gold = gold + 10;          // beat the bats, got the gold
    }
    scene = 6;                   // go to the ending
  }
}
