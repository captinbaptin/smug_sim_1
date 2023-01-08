/*
WARNING this code is quite illegible and bad
this was one of the first things i programmed so theres lots of bad practice in here
theres also remnants of functions that have nothing to do with the finished game 
*/

PImage[] smug;
int smugnum = 30; //number of smug in data
int smugWidth;
int[] smugAdj =  {20, 23, 25, 18, 19, //relative size of smugs
                  20, 20, 23, 23, 24,
                  23, 24, 28, 26, 23,
                  25, 22, 24, 26, 25,
                  21, 19, 27, 24, 26,
                  20, 24, 20, 22, 24};
float[] Leyex =  {0.365, 0.394, 0.433, 0.279, 0.263, //x pos of left eye
                  0.416, 0.218, 0.389, 0.458, 0.345,
                  0.361, 0.278, 0.427, 0.444, 0.311,
                  0.278, 0.497, 0.287, 0.341, 0.424,
                  0.420, 0.291, 0.339, 0.390, 0.413,
                  0.291, 0.341, 0.269, 0.347, 0.410};
float[] Leyey =  {0.492, 0.359, 0.463, 0.597, 0.393, //y pos of left eye
                  0.534, 0.481, 0.658, 0.468, 0.553,
                  0.495, 0.533, 0.449, 0.569, 0.492,
                  0.456, 0.531, 0.414, 0.398, 0.491,
                  0.253, 0.410, 0.506, 0.524, 0.246,
                  0.576, 0.412, 0.420, 0.574, 0.544};
float[] Reyex =  {0.689, 0.666, 0.651, 0.808, 0.728, //x pos of right eye
                  0.765, 0.593, 0.680, 0.787, 0.678,
                  0.633, 0.530, 0.682, 0.650, 0.600,
                  0.691, 0.711, 0.699, 0.661, 0.668,
                  0.823, 0.791, 0.669, 0.689, 0.734,
                  0.599, 0.542, 0.691, 0.715, 0.717};
float[] Reyey =  {0.463, 0.484, 0.466, 0.541, 0.526, //y pos of right eye
                  0.549, 0.454, 0.595, 0.334, 0.577,
                  0.503, 0.462, 0.491, 0.534, 0.487,
                  0.485, 0.579, 0.401, 0.463, 0.543,
                  0.242, 0.391, 0.506, 0.520, 0.515,
                  0.554, 0.650, 0.404, 0.476, 0.588};
int[] mouth =    {1, 0, 0, 0, 0, //which have mouths
                  1, 0, 0, 1, 0,
                  0, 0, 0, 0, 0,
                  1, 0, 0, 0, 0,
                  0, 0, 0, 1, 1,
                  0, 1, 0, 0, 1};
float[] mouthx = {0.535, 0.000, 0.000, 0.000, 0.000, //mouth x pos
                  0.572, 0.000, 0.000, 0.636, 0.000,
                  0.000, 0.000, 0.000, 0.000, 0.000,
                  0.454, 0.000, 0.000, 0.000, 0.000,
                  0.000, 0.000, 0.000, 0.528, 0.466,
                  0.000, 0.302, 0.000, 0.000, 0.510};
float[] mouthy = {0.649, 0.000, 0.000, 0.000, 0.000, //mouth y pos
                  0.729, 0.000, 0.000, 0.714, 0.000,
                  0.000, 0.000, 0.000, 0.000, 0.000,
                  0.832, 0.000, 0.000, 0.000, 0.000,
                  0.000, 0.000, 0.000, 0.798, 0.697,
                  0.000, 0.645, 0.000, 0.000, 0.776};
int[] other =    {0, 0, 0, 0, 0, //which have others
                  0, 1, 0, 0, 0, //1 mug
                  0, 2, 0, 0, 3, //2 point  3 mug
                  0, 0, 4, 0, 0, //4 hand
                  0, 0, 0, 0, 0,
                  5, 0, 0, 0, 0}; //5 mouth side
float[] otherx = {0.000, 0.000, 0.000, 0.000, 0.000, //other x pos
                  0.000, 0.600, 0.000, 0.000, 0.000,
                  0.000, 0.597, 0.000, 0.000, 0.230,
                  0.000, 0.000, 0.438, 0.000, 0.000,
                  0.000, 0.000, 0.000, 0.000, 0.000,
                  0.499, 0.000, 0.000, 0.000, 0.000};
float[] othery = {0.000, 0.000, 0.000, 0.000, 0.000, //other y pos
                  0.000, 0.781, 0.000, 0.000, 0.000,
                  0.000, 0.740, 0.000, 0.000, 0.818,
                  0.000, 0.000, 0.721, 0.000, 0.000,
                  0.000, 0.000, 0.000, 0.000, 0.000,
                  0.810, 0.000, 0.000, 0.000, 0.000};
Smug[] smugs;
float smugspawnrate = 0.002;
float smugTraceSpeed;
float smugJumpSpeed;
float smugMoveSpeed;
float smugGrav;
float smugJumpSideSpeed;


PImage laserbeam, laserbase;
int maxLasers = 100;
Laser[] lasers;
int laser1 = 0, laser2 = 0;
int laserx1 = 0, laserx2 = 0, lasery1 = 0, lasery2 = 0;
float laserrot1 = 0, laserrot2 = 0;
int shieldrate = 5;
float laserrotspeed = 0.01;
int laserlongth;
int laserSpeed = 5;
float pi = 3.1415926535897932;

PImage bolt;
int maxBolts = 100;
Bolt[] bolts;
int boltSpeed = 0;
int boltx = 0, bolty = 0;
int boltcount = 0;
float boltcolrad;
int boltDam = 128;

PImage sphere;
int maxSpheres = 100;
Sphere[] spheres;
float sphereSpeed = 0; float sphereSpeedy;
float sphereAcc = 0;
float spherecolrad;
int sphereDam = 64;

PImage fireball;
int maxFireballs = 100;
Fireball[] fireballs;
float fireballSpeed = 0;
float firecolrad;
float fireSpeed = 20;
float fireOdds = 0.03;
int fireDam = 128;

PImage greenball;
int maxGreenballs = 100;
Greenball[] greenballs;
float gravity = 0;
float greenballSpeed = 0;
float greenballJump = 0;
float greencolrad;
int greenDam = 64;

float otherOdds = 0.05;


PImage clock;
int maxClocks = 100;
Clock[] clocks;
float clockcolrad;
int clockstronk = 300;
float clockspawnrate = 0.005;
int clocktime = 900;

PImage shield, shieldOn;
int maxShields = 100;
Shield[] shields;
float shieldcolrad;
float shieldspawnrate = 0.002;
int shieldtime = 900;

PImage coin;
int maxCoins = 100;
Coin[] coins;
float coincolrad;
int coinval = 1;
float coinspawnrate = 0.01;
int cointime = 900;


PImage player1, player2, player3, player4;
float playerx, playery;
float playerxs = 0, playerys = 0;
float playerAcc = 5;
float playerDrag = 1;
int timeLeft = 3600;
int score = 0;
int shieldLeft = 0;
float playercolrad;
int over = 0;

String[] scores;
int numscores = 10;
int overthisframe = 0;

int textSize;


PImage star;
int[] starsx;
int[] starsy;
int starsk = 100; //number of stars per screen area


int t = 0;
float lastx = 0, lasty = 0;
int lasts = 0;

boolean u = false, w = false, a = false, s = false, d = false, right = false, left = false, up = false, down = false, space = false;


void setup() {
  fullScreen(P2D);
  //size(1280, 720, P2D);
  noSmooth();
  textSize(50);
  stroke(0);
  noStroke();
  fill(255);
  
  //exportsmugdata2();
  
  smug = new PImage[smugnum];
  for(int i = 0; i < smugnum; i++) {
    smug[i] = loadImage((i+1) + ".png");
    smugWidth = width*smugAdj[i]/160; //160
    int newh = smug[i].height*smugWidth/smug[i].width;
    smug[i].resize(smugWidth, newh);
  }
  smugs = new Smug[smugnum];
  for(int i = 0; i < smugnum; i++) {
    smugs[i] = new Smug(0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  smugTraceSpeed = float(width)/1920;
  smugJumpSpeed = 2*float(width)/1920;
  smugJumpSideSpeed = 0.25*float(width)/1920;
  smugMoveSpeed = 1.5*float(width)/1920;
  smugGrav = 0.015*float(width)/3840;
  
  laserbeam = loadImage("laser beam.png"); laserbeam.resize(1, width/240); //all images scale with width
  laserbase = loadImage("laser base2.png"); laserbase.resize(laserbase.width*width/7680, laserbase.width*width/7680); //scale with width
  laserlongth = 600*width/1920;
  lasers = new Laser[maxLasers];
  for(int i = 0; i < maxLasers; i++) {
    lasers[i] = new Laser(0, 0, 0, 0, 0, 0);
  }
  
  bolt = loadImage("green bolt.png"); bolt.resize(bolt.width*width/1920, bolt.height*width/1920); //scale with width
  boltSpeed = 10*width/1920;
  boltcolrad = bolt.width/4; //just the bolt body has collision
  bolts = new Bolt[maxBolts];
  for(int i = 0; i < maxBolts; i++) {
    bolts[i] = new Bolt(0, 0, 0);
  }
  
  sphere = loadImage("blu sphere.png"); sphere.resize(sphere.width*width/7680, sphere.height*width/7680);
  sphereSpeed = 10*width/1920; sphereSpeedy = sphereSpeed*0.3;
  sphereAcc = 0.1*width/1920;
  spherecolrad = sphere.width/2;
  spheres = new Sphere[maxSpheres];
  for(int i = 0; i < maxSpheres; i++) {
    spheres[i] = new Sphere(0, 0, 0, 0, 0);
  }
  
  fireball = loadImage("fireball.png"); fireball.resize(fireball.width*width/3840, fireball.height*width/3840);
  fireballSpeed = 10*width/1920;
  firecolrad = fireball.width/2;
  fireballs = new Fireball[maxFireballs];
  for(int i = 0; i < maxFireballs; i++) {
    fireballs[i] = new Fireball(0, 0, 0, 0, 0);
  }
  
  greenball = loadImage("greenball.png"); greenball.resize(greenball.width*width/1920, greenball.height*width/1920);
  gravity = 0.5*float(width)/1920;
  greenballSpeed = 2*width/1920;
  greenballJump = 10*width/1920;
  greencolrad = greenball.width/2;
  greenballs = new Greenball[maxGreenballs];
  for(int i = 0; i < maxGreenballs; i++) {
    greenballs[i] = new Greenball(0, 0, 0, 0, 0);
  }
  
  
  clock = loadImage("clock.png"); clock.resize(clock.width*width/1920, clock.height*width/1920);
  clockcolrad = clock.width/2;
  clocks = new Clock[maxClocks];
  for(int i = 0; i < maxClocks; i++) {
    clocks[i] = new Clock(0, 0, 0, 0);
  }
  
  shield = loadImage("shield.png"); shield.resize(shield.width*width/1920, shield.height*width/1920);
  shieldOn = loadImage("shield.png"); shieldOn.resize(shieldOn.width*width/1600, shieldOn.height*width/1600);
  shieldcolrad = shield.width/2;
  shields = new Shield[maxShields];
  for(int i = 0; i < maxShields; i++) {
    shields[i] = new Shield(0, 0, 0, 0);
  }
  
  coin = loadImage("coin.png"); coin.resize(coin.width*width/1920, coin.height*width/1920);
  coincolrad = coin.width/2;
  coins = new Coin[maxCoins];
  for(int i = 0; i < maxCoins; i++) {
    coins[i] = new Coin(0, 0, 0, 0);
  }
  
  player1 = loadImage("happy.png"); player2 = loadImage("hmm.png"); player3 = loadImage("thinking.png"); player4 = loadImage("concern.png");
  player1.resize(player4.width*width/7680, player4.height*width/7680); player2.resize(player4.width*width/7680, player4.height*width/7680); player3.resize(player4.width*width/7680, player4.height*width/7680); player4.resize(player4.width*width/7680, player4.height*width/7680);
  playerx = width/2; playery = height/2;
  playercolrad = player1.width/2;
  playerAcc *= float(width)/1920;
  playerDrag *= float(width)/1920;
  
  scores = new String[numscores];
  
  textSize = width/48;
  
  
  star = loadImage("star.png");
  starsk = starsk*width*height/250000;
  starsx = new int[starsk]; starsy = new int[starsk];
  for(int i = 0; i < starsk; i++) {
    starsx[i] = int(random(width-star.width)); starsy[i] = int(random(height-star.height));
  }
  
}

void draw() {
  background(0);
  drawStars();
  atkPys();
  smugPys();
  if(over == 0) {
    playerMove();
    coll();
    if(timeLeft < 0) { gameOver(); }
  }
  delet();
  if(over == 0) {
    spawnColec();
    spawnSmug();
    smugAtk();
  }
  
  displayStuff();
  displayPlayer();
  displayText();
  timeLeft--;
  if(over != 0 && space == true) { reset(); }
  overthisframe--; if(overthisframe < 0) { overthisframe = 0; }
}


void drawStars() {
  for(int i = 0; i < starsx.length; i++) {
    image(star, starsx[i], starsy[i]);
  }
}


void atkPys() { //updates attack objects
  for(int i = 0; i < lasers.length; i++) {
    if(lasers[i].type != 0) {
      lasers[i].tar(playerx, playery);
    }
  }
  for(int i = 0; i < bolts.length; i++) {
    if(bolts[i].on != 0) {
      bolts[i].move(boltSpeed, boltSpeed);
      bolts[i].deloff();
    }
  }
  for(int i = 0; i < spheres.length; i++) {
    if(spheres[i].on != 0) {
      spheres[i].acc(playerx, playery);
      spheres[i].move();
      spheres[i].deloff();
    }
  }
  for(int i = 0; i < fireballs.length; i++) {
    if(fireballs[i].on != 0) {
      fireballs[i].move();
      fireballs[i].deloff();
    }
  }
  for(int i = 0; i < greenballs.length; i++) {
    if(greenballs[i].on != 0) {
      greenballs[i].grav();
      greenballs[i].move();
      greenballs[i].deloff();
    }
  }
}

void smugPys() {
  for(int i = 0; i < smugs.length; i++) {
    if(smugs[i].on != 0) {
      smugs[i].move();
      smugs[i].timer--;
      smugs[i].deloff();
    }
  }
}

void playerMove() {
  if(w == true || up == true) {
    playerys -= playerAcc;
  }
  if(s == true || down == true) {
    playerys += playerAcc;
  }
  if(a == true || left == true) {
    playerxs -= playerAcc;
  }
  if(d == true || right == true) {
    playerxs += playerAcc;
  }
  if(playerxs < 0) {
    playerxs += playerDrag*sqrt(-playerxs);
  }
  else {
    playerxs -= playerDrag*sqrt(playerxs);
  }
  if(playerys < 0) {
    playerys += playerDrag*sqrt(-playerys);
  }
  else {
    playerys -= playerDrag*sqrt(playerys);
  }
  playerx += playerxs;
  playery += playerys;
  if(playerx-playercolrad < 0) {
    playerxs = - playerxs;
    playerx = playercolrad;
  }
  else if(playerx + playercolrad > width) {
    playerxs = - playerxs;
    playerx = width - playercolrad;
  }
  if(playery-playercolrad < 0) {
    playerys = - playerys;
    playery = playercolrad;
  }
  else if(playery + playercolrad > height) {
    playerys = - playerys;
    playery = height - playercolrad;
  }
}

void coll() { //collision between player and objects
  for(int i = 0; i < bolts.length; i++) {
    if(bolts[i].on != 0) {
      if(bolts[i].col(playerx, playery) == 1) {
        if(shieldLeft > 0) {
          shieldLeft -= boltDam;
          if(shieldLeft < 0) { shieldLeft = 0; }
          bolts[i].on = 0;
        }
        else {
          gameOver();
        }
      }
    }
  }
  for(int i = 0; i < spheres.length; i++) {
    if(spheres[i].on != 0) {
      if(spheres[i].col(playerx, playery) == 1) {
        if(shieldLeft > 0) {
          shieldLeft -= sphereDam;
          if(shieldLeft < 0) { shieldLeft = 0; }
          spheres[i].on = 0;
        }
        else {
          gameOver();
        }
      }
    }
  }
  for(int i = 0; i < fireballs.length; i++) {
    if(fireballs[i].on != 0) {
      if(fireballs[i].col(playerx, playery) == 1) {
        if(shieldLeft > 0) {
          shieldLeft -= fireDam;
          if(shieldLeft < 0) { shieldLeft = 0; }
          fireballs[i].on = 0;
        }
        else {
          gameOver();
        }
      }
    }
  }
  for(int i = 0; i < greenballs.length; i++) {
    if(greenballs[i].on != 0) {
      if(greenballs[i].col(playerx, playery) == 1) {
        if(shieldLeft > 0) {
          shieldLeft -= greenDam;
          if(shieldLeft < 0) { shieldLeft = 0; }
          greenballs[i].on = 0;
        }
        else {
          gameOver();
        }
      }
    }
  }
  for(int i = 0; i < clocks.length; i++) {
    if(clocks[i].on != 0) {
      if(clocks[i].col(playerx, playery) == 1) {
        timeLeft += clockstronk;
        clocks[i].on = 0;
      }
    }
  }
  for(int i = 0; i < shields.length; i++) {
    if(shields[i].on != 0) {
      if(shields[i].col(playerx, playery) == 1) {
        shieldLeft = 255;
        shields[i].on = 0;
      }
    }
  }
  for(int i = 0; i < coins.length; i++) {
    if(coins[i].on != 0) {
      if(coins[i].col(playerx, playery) == 1) {
        score += coinval;
        coins[i].on = 0;
      }
    }
  }
  for(int i = 0; i < smugs.length; i++) {
    if(smugs[i].on != 0) {
      int t1 = int(smugs[i].x)-(smug[smugs[i].which].width/2), t2 = int(smugs[i].x)+(smug[smugs[i].which].width/2), t3 = int(smugs[i].y)-(smug[smugs[i].which].height/2), t4 = int(smugs[i].y)+(smug[smugs[i].which].height/2);
      int jej = 0;
      if(playerx > t1 && playerx < t2 && playery > t3-playercolrad && playery < t4 + playercolrad) {
        jej = 1;
      }
      else if(playery > t3 && playery < t4 && playerx > t1 - playercolrad && playerx < t2 + playercolrad) {
        jej = 1;
      }
      else if(sqrt((playerx-t1)*(playerx-t1)+(playery-t3)*(playery-t3)) < playercolrad) {
        jej = 1;
      }
      else if(sqrt((playerx-t1)*(playerx-t1)+(playery-t4)*(playery-t4)) < playercolrad) {
        jej = 1;
      }
      else if(sqrt((playerx-t2)*(playerx-t2)+(playery-t3)*(playery-t3)) < playercolrad) {
        jej = 1;
      }
      else if(sqrt((playerx-t2)*(playerx-t2)+(playery-t4)*(playery-t4)) < playercolrad) {
        jej = 1;
      }
      if(jej == 1) {
        if(shieldLeft > 0) {
          shieldLeft -= shieldrate;
          if(shieldLeft < 0) {
            shieldLeft = 0;
          }
        }
        else {
          gameOver();
        }
      }
    }
  }
  for(int i = 0; i < lasers.length; i++) {
    if(lasers[i].type != 0) {
      if(lasers[i].col(playerx, playery) == 1) {
        if(shieldLeft > 0) {
          shieldLeft -= shieldrate;
          if(shieldLeft < 0) {
            shieldLeft = 0;
          }
        }
        else {
          gameOver();
        }
      }
    }
  }
}

void delet() { //ages collectables and deletes uncollected ones
  for(int i = 0; i < clocks.length; i++) {
    if(clocks[i].on != 0) {
      clocks[i].timer--;
      if(clocks[i].timer == 0) {
        clocks[i].on = 0;
      }
    }
  }
  for(int i = 0; i < shields.length; i++) {
    if(shields[i].on != 0) {
      shields[i].timer--;
      if(shields[i].timer == 0) {
        shields[i].on = 0;
      }
    }
  }
  for(int i = 0; i < coins.length; i++) {
    if(coins[i].on != 0) {
      coins[i].timer--;
      if(coins[i].timer == 0) {
        coins[i].on = 0;
      }
    }
  }
}


void spawnColec() {
  if(random(1) < clockspawnrate) {
    for(int i = 0; i < clocks.length; i++) {
      if(clocks[i].on == 0) {
        clocks[i].gen();
        i = clocks.length;
      }
    }
  }
  if(random(1) < shieldspawnrate) {
    for(int i = 0; i < shields.length; i++) {
      if(shields[i].on == 0) {
        shields[i].gen();
        i = shields.length;
      }
    }
  }
  if(random(1) < coinspawnrate) {
    for(int i = 0; i < coins.length; i++) {
      if(coins[i].on == 0) {
        coins[i].gen();
        i = coins.length;
      }
    }
  }
}

void spawnSmug() {
  if(random(1) < smugspawnrate*sqrt(10000+score)/100) {
    for(int i = 0; i < smugs.length; i++) {
      if(smugs[i].on == 0) {
        smugs[i].gen();
        i = smugs.length;
      }
    }
  }
}

void smugAtk() {
  for(int i = 0; i < smugs.length; i++) {
    if(smugs[i].on != 0) {
      if(smugs[i].type == 0) {
        if(smugs[i].timer > 0 && smugs[i].x > smug[smugs[i].which].width/4 && smugs[i].x < width-(smug[smugs[i].which].width/4) && smugs[i].y > smug[smugs[i].which].height/4 && smugs[i].y < height-(smug[smugs[i].which].height/4)) {
          smugs[i].lase();
          if(random(1) < fireOdds) {
            smugs[i].genfire();
          }
          if(random(1) < otherOdds) {
            smugs[i].genother();
          }
        }
      }
      else if(smugs[i].type == 1) {
        if(smugs[i].x > smug[smugs[i].which].width/4 && smugs[i].x < width-(smug[smugs[i].which].width/4) && smugs[i].y > smug[smugs[i].which].height/4 && smugs[i].y < height-(smug[smugs[i].which].height/4)) {
          smugs[i].lase();
          if(random(1) < fireOdds) {
            smugs[i].genfire();
          }
          if(random(1) < otherOdds) {
            smugs[i].genother();
          }
        }
      }
      else if(smugs[i].type == 2) {
        if(smugs[i].x > smug[smugs[i].which].width/4 && smugs[i].x < width-(smug[smugs[i].which].width/4) && smugs[i].y > smug[smugs[i].which].height/4 && smugs[i].y < height-(smug[smugs[i].which].height/4)) {
          smugs[i].lase();
          if(random(1) < fireOdds) {
            smugs[i].genfire();
          }
          if(random(1) < otherOdds) {
            smugs[i].genother();
          }
        }
      }
      else if(smugs[i].type == 3) {
        if(smugs[i].x > smug[smugs[i].which].width/4 && smugs[i].x < width-(smug[smugs[i].which].width/4) && smugs[i].y > smug[smugs[i].which].height/4 && smugs[i].y < height-(smug[smugs[i].which].height/4)) {
          smugs[i].lase();
          if(random(1) < fireOdds) {
            smugs[i].genfire();
          }
          if(random(1) < otherOdds) {
            smugs[i].genother();
          }
        }
      }
    }
  }
}


void displayStuff() {
  for(int i = 0; i < clocks.length; i++) {
    if(clocks[i].on != 0) {
      clocks[i].display();
    }
  }
  for(int i = 0; i < shields.length; i++) {
    if(shields[i].on != 0) {
      shields[i].display();
    }
  }
  for(int i = 0; i < coins.length; i++) {
    if(coins[i].on != 0) {
      coins[i].display();
    }
  }
  for(int i = 0; i < smugs.length; i++) {
    if(smugs[i].on != 0) {
      smugs[i].display();
    }
  }
  for(int i = 0; i < lasers.length; i++) {
    if(lasers[i].type != 0) {
      lasers[i].displaybase();
    }
  }
  for(int i = 0; i < lasers.length; i++) {
    if(lasers[i].type != 0) {
      lasers[i].displaybeam();
    }
  }
  for(int i = 0; i < bolts.length; i++) {
    if(bolts[i].on != 0) {
      bolts[i].display();
    }
  }
  for(int i = 0; i < greenballs.length; i++) {
    if(greenballs[i].on != 0) {
      greenballs[i].display();
    }
  }
  for(int i = 0; i < fireballs.length; i++) {
    if(fireballs[i].on != 0) {
      fireballs[i].display();
    }
  }
  for(int i = 0; i < spheres.length; i++) {
    if(spheres[i].on != 0) {
      spheres[i].display();
    }
  }
}

void displayPlayer() { //player is drawn with width instead of height offset as to be centered with the center of the face
  if(timeLeft > 3600) {
    image(player1, int(playerx-(player1.width/2)), int(playery-(player1.width/2)));
  }
  else if(timeLeft > 1800) {
    image(player2, int(playerx-(player1.width/2)), int(playery-(player1.width/2)));
  }
  else if(timeLeft > 900) {
    image(player3, int(playerx-(player1.width/2)), int(playery-(player1.width/2)));
  }
  else {
    image(player4, int(playerx-(player1.width/2)), int(playery-(player1.width/2)));
  }
  tint(255, shieldLeft);
  image(shieldOn, playerx-(shieldOn.width/2), playery-(shieldOn.height/2));
  noTint();
}

void displayText() {
  if(over == 0) {
    if(timeLeft < 900) {
      fill(255, 128, 128);
    }
    else {
      fill(128, 255, 128);
    }
    String buff1 = "", buff2 = "", buff3 = "", buff4 = "";
    if(timeLeft/216000 < 10) {
      buff1 = "0" + str(timeLeft/216000);
    }
    else {
      buff1 = str(timeLeft/216000);
    }
    if((timeLeft%216000)/3600 < 10) {
      buff2 = "0" + str((timeLeft%216000)/3600);
    }
    else {
      buff2 = str((timeLeft%216000)/3600);
    }
    if((timeLeft%3600)/60 < 10) {
      buff3 = "0" + str((timeLeft%3600)/60);
    }
    else {
      buff3 = str((timeLeft%3600)/60);
    }
    if(timeLeft%60 < 10) {
      buff4 = "0" + str(timeLeft%60);
    }
    else {
      buff4 = str(timeLeft%60);
    }
    textAlign(LEFT);
    text(buff1 + ":" + buff2 + ":" + buff3 + ":" + buff4, textSize*3/2, textSize*3/2);
    fill(255, 64, 255);
    textAlign(RIGHT);
    text(score, width-textSize*3/2, textSize*3/2);
  }
  else {
    textAlign(CENTER);
    fill(255, 64, 64);
    text("Toppest Places", width/2, (height/6)-((textSize*3)/2));
    for(int i = 0; i < scores.length; i++) {
      if(over-1 == i) { fill(64, 255, 255); }
      else { fill(255, 64, 255); }
      text("#" + str(i+1) + "   " + scores[i], width/2, ((height/6)+(height*(i+1)*3/(scores.length*4)))-((textSize*3)/2));
    }
    fill(255, 64, 64);
    text("press space to play again", width/2, height-(textSize*2));
  }
}



void gameOver() {
  if(overthisframe == 0) {
    over = 100;
    scores = loadStrings("high scores.txt");
    int temp = 0;
    for(int i = 0; i < scores.length; i++) {
      if(score > int(scores[i])) {
        for(int j = scores.length-1; j > i; j--) {
          scores[j] = scores[j-1];
        }
        scores[i] = str(score);
        temp = i;
        i = scores.length;
        saveStrings("data/high scores.txt", scores);
      }
    }
    over = temp + 1;
  }
  overthisframe++;
}

void reset() {
  over = 0;
  score = 0;
  shieldLeft = 0;
  timeLeft = 3600;
  playerx = width/2;
  playery = height/2;
  for(int i = 0; i < smugs.length; i++) {
    smugs[i].on = 0;
  }
  for(int i = 0; i < lasers.length; i++) {
    lasers[i].type = 0;
  }
  for(int i = 0; i < bolts.length; i++) {
    bolts[i].on = 0;
  }
  for(int i = 0; i < spheres.length; i++) {
    spheres[i].on = 0;
  }
  for(int i = 0; i < fireballs.length; i++) {
    fireballs[i].on = 0;
  }
  for(int i = 0; i < greenballs.length; i++) {
    greenballs[i].on = 0;
  }
  for(int i = 0; i < clocks.length; i++) {
    clocks[i].on = 0;
  }
  for(int i = 0; i < shields.length; i++) {
    shields[i].on = 0;
  }
  for(int i = 0; i < coins.length; i++) {
    coins[i].on = 0;
  }
}


void keyPressed() {
  if(key == 'w') {
    w = true;
  }
  if(key == 'a') {
    a = true;
  }
  if(key == 's') {
    s = true;
  }
  if(key == 'u') {
    u = true;
    //saveFrame();
  }
  if(key == 'd') {
    d = true;
  }
  if(key == ' ') {
    space = true;
  }
  if(key == CODED) {
    if(keyCode == UP) {
      up = true;
    }
    if(keyCode == DOWN) {
      down = true;
    }
    if(keyCode == RIGHT) {
      right = true;
    }
    if(keyCode == LEFT) {
      left = true;
    }
  }
}

void keyReleased() {
  if(key == 'w') {
    w = false;
  }
  if(key == 'a') {
    a = false;
  }
  if(key == 's') {
    s = false;
  }
  if(key == 'd') {
    d = false;
  }
  if(key == 'u') {
    u = false;
  }
  if(key == ' ') {
    space = false;
  }
  if(key == CODED) {
    if(keyCode == UP) {
      up = false;
    }
    if(keyCode == DOWN) {
      down = false;
    }
    if(keyCode == RIGHT) {
      right = false;
    }
    if(keyCode == LEFT) {
      left = false;
    }
  }
}





class Smug {
  int which; //which smug
  float x, y; //pos
  float xs, ys; //vel
  int timer;
  int laser1, laser2; //laser number
  int chiral;
  int chi2;
  int on; //0 is not used
  int type;
  int lase;
  Smug(int tw, int tx, int ty, int tl1, int tl2, int tc, int tc2, int to, int tt, int tl) {
    which = tw; x = tx; y = ty; laser1 = tl1; laser2 = tl2; chiral = tc; chi2 = tc2; on = to; type = tt; lase = tl;
  }
  void gen() {
    on = 1;
    xs = 0; ys = 0; x = 0; y = 0; timer = 0; chi2 = 0; //catch lingering info
    laser1 = lasers.length; laser2 = lasers.length; //set out of bounds to designate unused
    lase = laserlongth;
    type = int(random(4));
    chiral = int(random(2));
    int temp = 0;
    while(temp == 0) {
      int meme = int(random(smugs.length));
      for(int i = 0; i < smugs.length; i++) {
        if(meme == smugs[i].which && smugs[i].on != 0) {
          meme = smugs.length;
        }
      }
      if(meme != smugs.length) { which = meme; temp++; }
    }
    if(type == 0 || type == 1) {
      if(random((height-smug[which].height)+(width-smug[which].width)) < height-smug[which].height) {
        chi2 = 0;
        if(chiral == 0) { x = -smug[which].width/2; }
        else { x = width+smug[which].width/2; }
        y = (smug[which].height/2)+int(random(height-smug[which].height));
      }
      else {
        chi2 = 1;
        x = (smug[which].width/2)+int(random(width-smug[which].width));
        y = height+smug[which].height/2;
      }
      if(type == 0) {
        timer = 300+int(random(300));
      }
      else {
        timer = 60;
        if(chi2 == 0) {
          if(chiral == 0) { xs = smugMoveSpeed+random(smugMoveSpeed); }
          else { xs = -smugMoveSpeed-random(smugMoveSpeed); }
        }
        else { ys = -smugMoveSpeed-random(smugMoveSpeed); }
      }
    }
    else if(type == 2) {
      timer = 60;
      x = int(random(width));
      y = height+(smug[which].height/2);
      if(x < width/2) { xs = smugMoveSpeed+random(smugMoveSpeed); }
      else { xs = -smugJumpSideSpeed-random(smugJumpSideSpeed); }
      ys = -smugJumpSpeed-random(smugJumpSpeed);
    }
    else if(type == 3) {
      if(random((height-smug[which].height)+(width-smug[which].width)) < height-smug[which].height) {
        if(chiral == 0) { x = -smug[which].width/2; }
        else { x = width+smug[which].width/2; }
        y = int(random(height));
      }
      else {
        if(int(random(2)) == 0) { y = -smug[which].height/2; }
        else { y = height+smug[which].height/2; }
        x = int(random(width));
      }
      timer = 300+int(random(300));
    }
  }
  void move() {
    if(type == 0) {
      if(timer > 0) {
        if(chi2 == 1) {
          if(y > height-(smug[which].height/2)) { acmove(0, -smugMoveSpeed);}
        }
        else {
          if(chiral == 0) {
            if(x < smug[which].width/2) { acmove(smugMoveSpeed, 0); }
          }
          else {
            if(x > width-(smug[which].width/2)) { acmove(-smugMoveSpeed, 0); }
          }
        }
      }
      else {
        if(x < width/2) { acmove(-smugMoveSpeed, 0); }
        else { acmove(smugMoveSpeed, 0); }
        if(y < height/2) { acmove(0, -smugMoveSpeed); }
        else { acmove(0, smugMoveSpeed); }
      }
    }
    else if(type == 1) {
      acmove(xs, ys);
    }
    else if(type == 2) {
      acmove(xs, ys); ys += smugGrav;
    }
    else if(type == 3) {
      if(timer > 0) {
        if(x < playerx) { acmove(smugTraceSpeed, 0); }
        else { acmove(-smugTraceSpeed, 0); }
        if(y < playery) { acmove(0, smugTraceSpeed); }
        else { acmove(0, -smugTraceSpeed); }
      }
      else {
        if(x < playerx) { acmove(-smugTraceSpeed, 0); }
        else { acmove(smugTraceSpeed, 0); }
        if(y < playery) { acmove(0, -smugTraceSpeed); }
        else { acmove(0, smugTraceSpeed); }
      }
    }
  }
  void acmove(float w, float z) { //actually moves it (called by move)
    x += w; y += z;
    if(laser1 != lasers.length) {
      lasers[laser1].move(w, z);
    }
    if(laser2 != lasers.length) {
      lasers[laser2].move(w, z);
    }
  }
  void deloff() {
    if(type == 0 && timer < 0) {
      if(x < -smug[which].width/2 || x > width+(smug[which].width/2) || y < -smug[which].height/2 || y > height+(smug[which].height/2)) { on = 0; }
    }
    if(type == 1 && timer < 0) {
      if(x < -smug[which].width/2 || x > width+(smug[which].width/2) || y < -smug[which].height/2 || y > height+(smug[which].height/2)) { on = 0; }
    }
    if(type == 2 && timer < 0) {
      if(y > height+(smug[which].height/2)) { on = 0; }
    }
    if(type == 3 && timer < 0) {
      if(x < -smug[which].width/2 || x > width+(smug[which].width/2) || y < -smug[which].height/2 || y > height+(smug[which].height/2)) { on = 0; }
    }
    if(on == 0) {
      if(laser1 != lasers.length) { lasers[laser1].del(); }
      if(laser2 != lasers.length) { lasers[laser2].del(); }
    }
  }
  void genlas() {
    if(laser1 == lasers.length) {
      for(int i = 0; i < lasers.length; i++) {
        if(lasers[i].type == 0) {
          laser1 = i;
          lasers[i].asign(x, y, which, 0, chiral);
          i = lasers.length;
        }
      }
    }
    if(laser2 == lasers.length) {
      for(int i = 0; i < lasers.length; i++) {
        if(lasers[i].type == 0) {
          laser2 = i;
          lasers[i].asign(x, y, which, 1, chiral);
          i = lasers.length;
        }
      }
    }
  }
  void lase() {
    if(laser1 == lasers.length || laser2 == lasers.length) {
      genlas();
    }
    else {
      if(laser1 != lasers.length) {
        if(lasers[laser1].base < 255) { lasers[laser1].base += laserSpeed; }
        else if (lasers[laser1].longth < laserlongth) { lasers[laser1].longth += laserSpeed; }
      }
      if(laser2 != lasers.length) {
        if(lasers[laser2].base < 255) { lasers[laser2].base += laserSpeed; }
        else if (lasers[laser2].longth < laserlongth) { lasers[laser2].longth += laserSpeed; }
      }
    }
  }
  void genfire() {
    if(mouth[which] == 1) {
      for(int i = 0; i < fireballs.length; i++) {
        if(fireballs[i].on == 0) {
          if(chiral == 0) {
            fireballs[i].gen(x-(smug[which].width/2)+(float(smug[which].width)*mouthx[which]), y-(smug[which].height/2)+(float(smug[which].height)*mouthy[which]));
          }
          else {
            fireballs[i].gen(x-(smug[which].width/2)+(float(smug[which].width)*(1-mouthx[which])), y-(smug[which].height/2)+(float(smug[which].height)*mouthy[which]));
          }
          i = fireballs.length;
        }
      }
    }
  }
  void genother() {
    if(other[which] == 1 || other[which] == 3) {
      for(int i = 0; i < greenballs.length; i++) {
        if(greenballs[i].on == 0) {
          if(chiral == 0) {
            greenballs[i].gen(x-(smug[which].width/2)+(float(smug[which].width)*otherx[which]), y-(smug[which].height/2)+(float(smug[which].height)*othery[which]));
          }
          else {
            greenballs[i].gen(x-(smug[which].width/2)+(float(smug[which].width)*(1-otherx[which])), y-(smug[which].height/2)+(float(smug[which].height)*othery[which]));
          }
          i = greenballs.length;
        }
      }
    }
    else if(other[which] == 2) {
      for(int i = 0; i < spheres.length; i++) {
        if(spheres[i].on == 0) {
          if(chiral == 0) {
            spheres[i].gen(x-(smug[which].width/2)+(float(smug[which].width)*otherx[which]), y-(smug[which].height/2)+(float(smug[which].height)*othery[which]), chiral);
          }
          else {
            spheres[i].gen(x-(smug[which].width/2)+(float(smug[which].width)*(1-otherx[which])), y-(smug[which].height/2)+(float(smug[which].height)*othery[which]), chiral);
          }
          i = greenballs.length;
        }
      }
    }
    else if(other[which] == 4) {
      for(int i = 0; i < bolts.length; i++) {
        if(bolts[i].on == 0) {
          if(chiral == 0) {
            bolts[i].gen(x-(smug[which].width/2)+(float(smug[which].width)*otherx[which]), y-(smug[which].height/2)+(float(smug[which].height)*othery[which]), chiral);
          }
          else {
            bolts[i].gen(x-(smug[which].width/2)+(float(smug[which].width)*(1-otherx[which])), y-(smug[which].height/2)+(float(smug[which].height)*othery[which]), chiral);
          }
          i = bolts.length;
        }
      }
    }
    else if(other[which] == 5) {
      for(int i = 0; i < fireballs.length; i++) {
        if(fireballs[i].on == 0) {
          if(chiral == 0) {
            if(playerx > x-(smug[which].width/2)+(float(smug[which].width)*otherx[which])) {
              fireballs[i].gen(x-(smug[which].width/2)+(float(smug[which].width)*otherx[which]), y-(smug[which].height/2)+(float(smug[which].height)*othery[which]));
              i = fireballs.length;
            }
          }
          else {
            if(playerx < x-(smug[which].width/2)+(float(smug[which].width)*otherx[which])) {
              fireballs[i].gen(x-(smug[which].width/2)+(float(smug[which].width)*(1-otherx[which])), y-(smug[which].height/2)+(float(smug[which].height)*othery[which]));
              i = fireballs.length;
            }
          }
        }
      }
    }
  }
  void display() {
    if(chiral == 0) {
      image(smug[which], int(x)-(smug[which].width/2), int(y)-(smug[which].height/2));
    }
    else {
      pushMatrix();
      translate(int(x), int(y));
      scale(-1, 1);
      image(smug[which], -(smug[which].width/2), -(smug[which].height/2));
      popMatrix();
    }
  }
}

class Laser {
  float x, y; //pos
  int type; //how it's rendered 0 is not rendered
  int longth; // how long
  float rot; //rotation radians
  int base; //base opacity
  Laser(int tx, int ty, int tt, int tl, float tr, int tb) {
    x = tx; y = ty; type = tt; longth = tl; rot = tr; base = tb;
  }
  void ext(int z) { longth += z; }
  void rot(float z) { rot += z; }
  void glow(int z) { base += z; }
  void move(float xp, float yp) { x += xp; y += yp; }
  void tar(float w, float z) {
    float yr = (cos(-rot)*(z-y))+(sin(-rot)*(w-x));
    if(yr > 0) {
      rot += laserrotspeed;
    }
    else {
      rot -= laserrotspeed;
    }
  }
  int col(float w, float z) {
    int ans = 0;
    float xr = ((w-x)*cos(-rot))-((z-y)*sin(-rot));
    float yr = (cos(-rot)*(z-y))+(sin(-rot)*(w-x));
    float laserw = (laserbeam.height/2)*0.8;
    if(xr > 0 && xr < longth && yr > -laserw-playercolrad && yr < laserw+playercolrad) {
      ans = 1;
    }
    else if(xr > -playercolrad && xr < longth+playercolrad && yr > -laserw && yr < laserw) {
      ans = 1;
    }
    else if(sqrt(((xr)*(xr))+((yr-laserw)*(yr-laserw))) < playercolrad) {
      ans = 1;
    }
    else if(sqrt(((xr)*(xr))+((yr+laserw)*(yr+laserw))) < playercolrad) {
      ans = 1;
    }
    else if(sqrt(((xr-longth)*(xr-longth))+((yr-laserw)*(yr-laserw))) < playercolrad) {
      ans = 1;
    }
    else if(sqrt(((xr-longth)*(xr-longth))+((yr+laserw)*(yr+laserw))) < playercolrad) {
      ans = 1;
    }
    return(ans);
  }
  void del() { type = 0; }
  void asign(float w, float z, int which, int lr, int chi) {
    longth = 0; rot = 0; base = 0; //rid of lingering data
    type = 1;
    if(lr == 0) {
      if(chi == 0) {
        x = w - (smug[which].width/2) + (smug[which].width*Leyex[which]);
        y = z - (smug[which].height/2) + (smug[which].height*Leyey[which]);
      }
      else if(chi == 1){
        x = w - (smug[which].width/2) + (smug[which].width*(1-Leyex[which]));
        y = z - (smug[which].height/2) + (smug[which].height*Leyey[which]);
      }
    }
    else if(lr == 1) {
      if(chi == 0) {
        x = w - (smug[which].width/2) + (smug[which].width*Reyex[which]);
        y = z - (smug[which].height/2) + (smug[which].height*Reyey[which]);
      }
      else if(chi == 1){
        x = w - (smug[which].width/2) + (smug[which].width*(1-Reyex[which]));
        y = z - (smug[which].height/2) + (smug[which].height*Reyey[which]);
      }
    }
    float tx = playerx - x;
    float ty = playery - y;
    float sb =sqrt((tx*tx)+(ty*ty));
    if(sb != 0) {
      if(playerx > x) { rot = asin(ty/sb); }
      else { rot = asin((y-playery)/sb)+pi; }
    }
  }
  void displaybase() {
    pushMatrix();
    translate(int(x), int(y));
    rotate(rot);
    tint(base);
    image(laserbase, -laserbase.width/2, -laserbase.height/2);
    noTint();
    popMatrix();
  }
  void displaybeam() {
    pushMatrix();
    translate(int(x), int(y));
    rotate(rot);
    for(int i = 0; i < longth; i++) {
      image(laserbeam, i, -laserbeam.height/2);
    }
    popMatrix();
  }
}

class Bolt {
  int x, y; //pos
  int chi;
  int on; //in use 0 not in use
  Bolt(int tx, int ty, int to) {
    x = tx; y = ty; on = to;
  }
  void move(int w, int z) { if(chi == 0) { x += w; y -= z; } else { x -= w; y -= z; } }
  int col(float w, float z) {
    int ans = 0;
    float kek = sqrt((float(x)-w)*(float(x)-w)+(float(y)-z)*(float(y)-z));
    if(kek < boltcolrad+playercolrad) {
      ans = 1;
    }
    return(ans);
  }
  void deloff() {
    if(x < -(bolt.width/2) || x > width+(bolt.width/2) || y < -(bolt.height/2) || y > height-(bolt.height/2)) {
      on = 0;
    }
  }
  void gen(float w, float z, int chir) {
    on = 1;
    x = int(w); y = int(z);
    chi = chir;
  }
  void display() {
    if(chi == 0) {
      image(bolt, x-(bolt.width/2), y-(bolt.height/2));
    }
    else {
      pushMatrix();
      translate(x, y);
      scale(-1, 1);
      image(bolt, -(bolt.width/2), -(bolt.height/2));
      popMatrix();
    }
  }
}

class Sphere {
  float x, y; //pos
  float xs, ys; //speed
  int on; //0 not in use
  Sphere(float tx, float ty, float txs, float tys, int to) {
    x = tx; y = ty; xs = txs; ys = tys; on = to;
  }
  void acc(float w, float z) {
    if(w < x) { xs -= sphereAcc; }
    else { xs += sphereAcc; }
    if(z < y) { ys -= sphereAcc; }
    else { ys += sphereAcc; }
  }
  void move() { x += xs; y += ys; }
  int col(float w, float z) {
    int ans = 0;
    float kek = sqrt((x-w)*(x-w)+(y-z)*(y-z));
    if(kek < spherecolrad+playercolrad) {
      ans = 1;
    }
    return(ans);
  }
  void deloff() {
    if(x < -(sphere.width/2) || x > width+(sphere.width/2) || y < -(sphere.height/2) || y > height+(sphere.height/2)) {
      on = 0;
    }
  }
  void gen(float w, float z, int chi) {
    on = 1;
    x = w; y = z;
    if(chi == 0) {
      xs = sphereSpeed; ys = -sphereSpeedy;
    }
    else {
      xs = -sphereSpeed; ys = -sphereSpeedy;
    }
  }
  void display() {
    image(sphere, int(x)-(sphere.width/2), int(y)-(sphere.height/2));
  }
}

class Fireball {
  float x, y; //pos
  float xs, ys; //vel
  int on; //0 not in use
  Fireball(float tx, float ty, float txs, float tys, int to) {
    x = tx; y = ty; xs = txs; ys = tys; on = to;
  }
  void move() { x += xs; y += ys; }
  int col(float w, float z) {
    int ans = 0;
    float kek = sqrt((x-w)*(x-w)+(y-z)*(y-z));
    if(kek < firecolrad+playercolrad) {
      ans = 1;
    }
    return(ans);
  }
  void deloff() {
    if(x < -(fireball.width/2) || x > width+(fireball.width/2) || y < -(fireball.height/2) || y > height+(fireball.height/2)) {
      on = 0;
    }
  }
  void gen(float w, float z) {
    on = 1;
    x = w; y = z;
    xs = fireSpeed*(playerx-x)/width;
    ys = fireSpeed*(playery-y)/width;
  }
  void display() {
    image(fireball, int(x)-(fireball.width/2), int(y)-(fireball.height/2));
  }
}

class Greenball {
  float x, y; //pos
  float xs, ys; //vel
  int on; //0 not in use
  Greenball(float tx, float ty, float txs, float tys, int to) {
    x = tx; y = ty; xs = txs; ys = tys; on = to;
  }
  void grav() { ys += gravity;}
  void move() { x += xs; y += ys; }
  int col(float w, float z) {
    int ans = 0;
    float kek = sqrt((x-w)*(x-w)+(y-z)*(y-z));
    if(kek < greencolrad+playercolrad) {
      ans = 1;
    }
    return(ans);
  }
  void deloff() {
    if(x < -(greenball.width/2) || x > width+(greenball.width/2) || y < -(greenball.height/2) || y > height+(greenball.height/2)) {
      on = 0;
    }
  }
  void gen(float w, float z) {
    on = 1;
    x = w; y = z;
    xs = greenballSpeed+random(greenballSpeed); if(int(random(2)) == 0) { xs = -xs; }
    ys = -greenballJump-random(greenballJump);
  }
  void display() {
    image(greenball, int(x)-(greenball.width/2), int(y)-(greenball.height/2));
  }
}


class Clock {
  int x, y; //pos
  int timer; //frames left
  int on; //0 not in use
  Clock(int tx, int ty, int tt, int to) {
  x = tx; y = ty; timer = tt; on = to;
  }
  void gen() {
    on = 1;
    x = (clock.width/2)+int(random(width-clock.width));
    y = (clock.height/2)+int(random(height-clock.height));
    timer = clocktime;
  }
  int col(float w, float z) {
    int ans = 0;
    float kek = sqrt((float(x)-w)*(float(x)-w)+(float(y)-z)*(float(y)-z));
    if(kek < clockcolrad+playercolrad) {
      ans = 1;
    }
    return(ans);
  }
  void display() {
    if(timer > 300 || timer%10 > 4) {
      image(clock, x-(clock.width/2), y-(clock.height/2));
    }
  }
}

class Shield {
  int x, y; //pos
  int timer; //frames left
  int on; //0 not in use
  Shield(int tx, int ty, int tt, int to) {
  x = tx; y = ty; timer = tt; on = to;
  }
  void gen() {
    on = 1;
    x = (shield.width/2)+int(random(width-shield.width));
    y = (shield.height/2)+int(random(height-shield.height));
    timer = shieldtime;
  }
  int col(float w, float z) {
    int ans = 0;
    float kek = sqrt((float(x)-w)*(float(x)-w)+(float(y)-z)*(float(y)-z));
    if(kek < shieldcolrad+playercolrad) {
      ans = 1;
    }
    return(ans);
  }
  void display() {
    if(timer > 300 || timer%10 > 4) {
      image(shield, x-(shield.width/2), y-(shield.height/2));
    }
  }
}

class Coin {
  int x, y; //pos
  int timer; //frames left
  int on; //0 not in use
  Coin(int tx, int ty, int tt, int to) {
  x = tx; y = ty; timer = tt; on = to;
  }
  void gen() {
    on = 1;
    x = (coin.width/2)+int(random(width-coin.width));
    y = (coin.height/2)+int(random(height-coin.height));
    timer = cointime;
  }
  int col(float w, float z) {
    int ans = 0;
    float kek = sqrt((float(x)-w)*(float(x)-w)+(float(y)-z)*(float(y)-z));
    if(kek < coincolrad+playercolrad) {
      ans = 1;
    }
    return(ans);
  }
  void display() {
    if(timer > 300 || timer%10 > 4) {
      image(coin, x-(coin.width/2), y-(coin.height/2));
    }
  }
}
