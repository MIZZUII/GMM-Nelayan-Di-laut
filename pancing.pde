int canvasWidth = 1280;
int canvasHeight = 720;
int centerX = canvasWidth / 2;
int centerY = canvasHeight / 2;

float scaleFactor = 1.5;

// Adjust the rod and hook coordinates relative to the center of the canvas
int rodX1 = centerX - (int)(100 * scaleFactor);
int rodY1 = centerY + (int)(100 * scaleFactor);
int rodX2 = centerX + (int)(100 * scaleFactor);
int rodY2 = centerY - (int)(100 * scaleFactor);
int hookX = centerX + (int)(150 * scaleFactor);
int hookY = centerY;

void setup() {
  size(1280, 720);
  background(#3271a8);
  
  // Warna dan ketebalan batang pancing
  stroke(139, 69, 19); // warna coklat
  strokeWeight(4 * scaleFactor);
  
  // Gambar batang pancing
  line(rodX1, rodY1, rodX2, rodY2);
  
  // Warna dan ketebalan benang pancing
  stroke(180, 180, 180); // warna abu-abu
  strokeWeight(2 * scaleFactor);
  
  // Gambar benang pancing
  noFill();
  beginShape();
  curveVertex(rodX2, rodY2);
  curveVertex(rodX2, rodY2);
  curveVertex(rodX2 + (int)(20 * scaleFactor), rodY2 + (int)(50 * scaleFactor));
  curveVertex(hookX - (int)(20 * scaleFactor), hookY - (int)(20 * scaleFactor));
  curveVertex(hookX, hookY);
  curveVertex(hookX, hookY);
  endShape();
  
  // Gambar kail
  strokeWeight(3 * scaleFactor);
  line(hookX, hookY, hookX + (int)(10 * scaleFactor), hookY + (int)(20 * scaleFactor)); // garis vertikal kail
  arc(hookX + (int)(10 * scaleFactor), hookY + (int)(20 * scaleFactor), 20 * scaleFactor, 20 * scaleFactor, PI, TWO_PI); // lengkungan kail
  
  // Gambar reel
  fill(160, 160, 160);
  noStroke();
  ellipse(rodX1 + (int)(10 * scaleFactor), rodY1 - (int)(10 * scaleFactor), 20 * scaleFactor, 20 * scaleFactor);
  stroke(160, 160, 160);
  strokeWeight(3 * scaleFactor);
  line(rodX1 + (int)(20 * scaleFactor), rodY1 - (int)(10 * scaleFactor), rodX1 + (int)(35 * scaleFactor), rodY1 - (int)(10 * scaleFactor));
}
