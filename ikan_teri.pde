float[] fishX = new float[5];
float[] fishY = new float[5];
float[] fishSpeed = new float[5];

void setup() {
  size(1280, 720);
  for (int i = 0; i < fishX.length; i++) {
    fishX[i] = random(width);
    fishY[i] = random(height);
    fishSpeed[i] = random(1, 3);
  }
}

void draw() {
  background(200, 230, 255); // Warna latar belakang biru muda seperti air
  drawWaves();
  for (int i = 0; i < fishX.length; i++) {
    drawFish(fishX[i], fishY[i]);
    fishX[i] += fishSpeed[i];
    if (fishX[i] > width) {
      fishX[i] = -60; // Mengulangi ikan dari sisi kiri
      fishY[i] = random(height); // Mengubah posisi vertikal ikan secara acak
    }
  }
}

void drawFish(float x, float y) {
  noStroke();
  fill(192, 192, 192); // Warna tubuh ikan teri (abu-abu)
  
  // Menggambar tubuh ikan
  beginShape();
  vertex(x + 60, y); // Kepala
  bezierVertex(x + 40, y - 20, x - 40, y - 20, x - 60, y); // Bagian atas tubuh
  bezierVertex(x - 40, y + 20, x + 40, y + 20, x + 60, y); // Bagian bawah tubuh
  endShape(CLOSE);

  // Menggambar ekor ikan
  beginShape();
  vertex(x - 60, y);
  vertex(x - 75, y - 15);
  vertex(x - 75, y + 15);
  endShape(CLOSE);

  // Menggambar mata ikan
  fill(0); // Warna hitam untuk mata
  ellipse(x + 50, y - 5, 5, 5); // Mata ikan teri
}

void drawWaves() {
  noFill();
  stroke(0, 119, 190); // Warna gelombang air biru tua
  for (int y = 50; y < height; y += 50) {
    beginShape();
    for (int x = 0; x <= width; x += 20) {
      float yOffset = 10 * sin(TWO_PI * (x + frameCount * 0.1) / 200);
      vertex(x, y + yOffset);
    }
    endShape();
  }
}
