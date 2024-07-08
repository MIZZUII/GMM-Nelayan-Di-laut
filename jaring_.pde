void setup() {
  size(1280, 720);
  background(255);
  stroke(0, 0, 255); // Blue color
  noFill();
  translate(width / 2, height / 2); // Move origin to the center
  
  int layers = 6; // Number of layers in the web
  int radialLines = 12; // Number of radial lines
  float radiusStep = 50; // Distance between layers
  
  // Draw the radial lines
  for (int i = 0; i < radialLines; i++) {
    float angle = TWO_PI / radialLines * i;
    line(0, 0, cos(angle) * layers * radiusStep, sin(angle) * layers * radiusStep);
  }
  
  // Draw the concentric layers with arcs
  for (int j = 1; j <= layers; j++) {
    float radius = radiusStep * j;
    for (int i = 0; i < radialLines; i++) {
      float angle1 = TWO_PI / radialLines * i;
      float angle2 = TWO_PI / radialLines * (i + 1);
      arc(0, 0, radius * 2, radius * 2, angle1, angle2);
    }
  }
}

void draw() {
  // Nothing needed here
}
