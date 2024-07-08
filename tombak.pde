void setup() {
  size(1280, 720);
  background(255);
  drawSpear();
}

void drawSpear() {
  int centerX = width / 2;
  int centerY = height / 2;

  // Spear tip
  fill(150); // Grey color for the spear tip
  beginShape();
  vertex(centerX, centerY - 250);
  vertex(centerX - 30, centerY - 150);
  vertex(centerX + 30, centerY - 150);
  endShape(CLOSE);
  
  // Spear shaft
  fill(139, 69, 19); // Brown color for the spear shaft
  rect(centerX - 5, centerY - 150, 10, 400);
  
  // Cross bands on the spear tip
  fill(139, 69, 19); // Same brown color
  beginShape();
  vertex(centerX - 5, centerY - 160);
  vertex(centerX + 5, centerY - 160);
  vertex(centerX + 10, centerY - 150);
  vertex(centerX - 10, centerY - 150);
  endShape(CLOSE);

  beginShape();
  vertex(centerX + 5, centerY - 160);
  vertex(centerX - 5, centerY - 160);
  vertex(centerX - 10, centerY - 170);
  vertex(centerX + 10, centerY - 170);
  endShape(CLOSE);

  // Bottom decoration
  fill(192, 192, 192); // Light grey color for the bottom decoration
  beginShape();
  vertex(centerX - 10, centerY + 250);
  vertex(centerX + 10, centerY + 250);
  vertex(centerX + 5, centerY + 270);
  vertex(centerX - 5, centerY + 270);
  endShape(CLOSE);
}
