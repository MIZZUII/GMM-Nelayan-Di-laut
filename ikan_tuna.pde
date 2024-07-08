float xPos = 0; // initial x position of the fish
Particle[] particles = new Particle[50]; // array to store particles

void setup() {
  size(1280, 720);
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(random(400, 900), random(330, 390), random(5, 15)); // initialize particles randomly around the fish
  }
}

void draw() {
  background(0, 102, 204); // redraw the background to animate fish

  // Draw underwater details like sand or coral reefs
  drawUnderwaterDetails();

  // Update and display particles for water waves effect
  for (int i = 0; i < particles.length; i++) {
    particles[i].move();
    particles[i].display();
  }

  translate(xPos, 0); // translate fish according to xPos

  // Draw the fish with its details
  drawFish();

  // Update fish position for animation
  xPos += 1; // adjust speed of fish here

  // Reset fish position to the left side of the screen
  if (xPos > width + 100) { // 100 is extra space to ensure fish is off-screen before resetting
    xPos = -300; // reset fish position off-screen to the left
  }
}

void drawUnderwaterDetails() {
  // Draw underwater details like sand or coral reefs
  fill(194, 178, 128); // sand color
  noStroke();
  rect(0, height - 50, width, 50); // sand at the bottom
}

void drawFish() {
  // Draw the body
  fill(173, 216, 230); // light blue color
  noStroke();
  beginShape();
  vertex(300, 360); // tail start
  bezierVertex(400, 260, 880, 260, 1000, 360); // top body curve
  bezierVertex(880, 460, 400, 460, 300, 360); // bottom body curve
  endShape(CLOSE);

  // Draw the upper dorsal fin
  fill(0, 0, 128); // dark blue color
  beginShape();
  vertex(600, 280);
  vertex(620, 200);
  vertex(640, 280);
  endShape(CLOSE);

  // Draw the lower dorsal fin
  beginShape();
  vertex(600, 440);
  vertex(620, 520);
  vertex(640, 440);
  endShape(CLOSE);

  // Draw the tail fin
  fill(0, 0, 128); // dark blue color
  beginShape();
  vertex(300, 360);
  vertex(150, 300);
  vertex(150, 420);
  endShape(CLOSE);

  // Draw the pectoral fin
  fill(0, 0, 128); // dark blue color
  beginShape();
  vertex(870, 360);
  vertex(930, 390);
  vertex(880, 360);
  endShape(CLOSE);

  // Draw the eye
  fill(0);
  ellipse(950, 360, 30, 30);
  fill(255);
  ellipse(955, 355, 10, 10);

  // Draw the gills
  stroke(0);
  noFill();
  arc(900, 360, 50, 50, radians(60), radians(120));
  arc(870, 360, 50, 50, radians(60), radians(120));

  // Draw scales
  stroke(100, 149, 237); // cornflower blue color
  for (int i = 400; i <= 900; i += 20) {
    for (int j = 330; j <= 390; j += 20) {
      ellipse(i, j, 10, 10);
    }
  }

  // Draw horizontal stripes on the body
  stroke(0, 0, 128); // dark blue color
  strokeWeight(2);
  line(400, 340, 900, 340);
  line(400, 380, 900, 380);
}

class Particle {
  float x, y; // position
  float size; // size of the particle
  float speed; // speed of movement

  Particle(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = random(1, 3);
  }

  void move() {
    y += speed;
    if (y > 400) { // reset particle position above the screen
      y = random(330, 390);
      x = random(400, 900);
    }
  }

  void display() {
    noStroke();
    fill(0, 102, 204, 150); // translucent blue
    ellipse(x, y, size, size);
  }
}
