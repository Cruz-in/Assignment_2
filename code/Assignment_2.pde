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

  // ---------- SCENE 0 : DECISION 1  (fully written - your model) ----------
  if (scene == 0) {
    text("THE LOST CAVE\n\n" +
         "You step into a dark cave, hunting for treasure.\n" +
         "The path splits in two.\n\n" +
         "1) Take the LEFT tunnel\n" +
         "2) Take the RIGHT tunnel", 40, 60);
  }

  // ---------- SCENE 1 : RANDOM EVENT 1 result  (fully written - your model) ----------
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

  // ---------- SCENE 2 : DECISION 2  (TODO: rewrite this text) ----------
  else if (scene == 2) {
    text("DECISION 2  (rewrite me!)\n\n" +
         "Describe a new situation here.\n\n" +
         "1) First option\n" +
         "2) Second option", 40, 60);
  }

  // ---------- SCENE 3 : DECISION 3  (TODO: rewrite this text) ----------
  else if (scene == 3) {
    text("DECISION 3  (rewrite me!)\n\n" +
         "Another situation here.\n\n" +
         "1) First option\n" +
         "2) Second option", 40, 60);
  }

  // ---------- SCENE 4 : RANDOM EVENT 2 result  (TODO: rewrite this text) ----------
  else if (scene == 4) {
    if (roll == 0) {
      text("RANDOM EVENT 2 (rewrite me!)\n\n" +
           "The lucky thing happened.\n\n" +
           "(press SPACE to continue)", 40, 60);
    } else {
      text("RANDOM EVENT 2 (rewrite me!)\n\n" +
           "The unlucky thing happened. (-5 gold)\n\n" +
           "(press SPACE to continue)", 40, 60);
    }
  }

  // ---------- SCENE 5 : DECISION 4  (TODO: rewrite this text) ----------
  else if (scene == 5) {
    text("DECISION 4  (rewrite me!)\n\n" +
         "Your last situation here.\n\n" +
         "1) First option\n" +
         "2) Second option", 40, 60);
  }

  // ---------- SCENE 6 : ENDING  (works - you can reword the messages) ----------
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
  fill(255, 215, 0);
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

  // ----- SCENE 2 : DECISION 2  (TODO: set your gold changes) -----
  else if (scene == 2) {
    if (key == '1') {
      gold = gold + 10;          // change this to whatever option 1 does
    }
    scene = 3;
  }

  // ----- SCENE 3 : DECISION 3, then roll RANDOM EVENT 2  (TODO) -----
  else if (scene == 3) {
    if (key == '1') {
      gold = gold + 10;          // change this to whatever option 1 does
    }
    roll = int(random(2));       // second random event
    if (roll == 1) {
      gold = gold - 5;           // change this to the unlucky result
    }
    scene = 4;
  }

  // ----- SCENE 4 : press SPACE to move on -----
  else if (scene == 4 && key == ' ') {
    scene = 5;
  }

  // ----- SCENE 5 : DECISION 4  (TODO) -----
  else if (scene == 5) {
    if (key == '1') {
      gold = gold + 10;          // change this to whatever option 1 does
    }
    scene = 6;                   // go to the ending
  }
}
