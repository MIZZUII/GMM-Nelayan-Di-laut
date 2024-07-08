float[] cloudX = {150, 400, 800}; // Array untuk menyimpan posisi X awan
float[] cloudY = {100, 80, 120}; // Array untuk menyimpan posisi Y awan
float[] cloudSpeed = {1, 0.7, 0.9}; // Kecepatan bergerak untuk setiap awan
float waveOffset = 0; // Offset untuk animasi gelombang laut
float sunSize = 120; // Ukuran matahari

float[] fishX = new float[5];
float[] fishY = new float[5];
float[] fishSpeed = new float[5];

void setup() {
  size(1280, 720);
  background(255);

  fill(135, 206, 235); 
  noStroke();
  rect(0, 0, width, height / 2);
  
  fill(0, 191, 255); 
  rect(0, height / 2, width, height / 2);

  // Initialize fish positions and speeds
  for (int i = 0; i < fishX.length; i++) {
    fishX[i] = random(width);
    fishY[i] = random(height / 2 + 100, height - 50); // Fish start in the lower part of the screen
    fishSpeed[i] = random(1, 3);
  }
}

void draw() {
  background(255);
  
  fill(135, 206, 235);
  noStroke();
  rect(0, 0, width, height / 2);
  
  drawWaves(); // Menggambar gelombang laut yang bergerak
  drawSand(); // Menggambar bagian pasir

  fill(255);
  // Menggambar setiap awan berdasarkan array posisi X dan Y
  for (int i = 0; i < cloudX.length; i++) {
    ellipse(cloudX[i], cloudY[i], 100, 50);
    ellipse(cloudX[i] + 50, cloudY[i], 100, 50);
    ellipse(cloudX[i] + 25, cloudY[i] - 20, 100, 50);
    
    // Memperbarui posisi X awan berdasarkan kecepatan masing-masing
    cloudX[i] += cloudSpeed[i];
    if (cloudX[i] > width) {
      cloudX[i] = -100; // Mengatur ulang posisi jika awan melewati batas kanan layar
    }
  }

  // Menggambar matahari
  fill(255, 255, 0); 
  ellipse(width - 100, 100, sunSize, sunSize); 

  drawBoat(300, height / 2 - 20); // Menjalankan fungsi untuk menggambar perahu

  // Draw and move fish
  for (int i = 0; i < fishX.length; i++) {
    drawFish(fishX[i], fishY[i]);
    fishX[i] += fishSpeed[i];
    if (fishX[i] > width) {
      fishX[i] = -60; // Mengulangi ikan dari sisi kiri
      fishY[i] = random(height / 2 + 100, height - 50); // Mengubah posisi vertikal ikan secara acak
    }
  }
}

void drawBoat(float x, float y) {
  fill(139, 69, 19); // Warna coklat untuk perahu
  noStroke();
  beginShape();
  vertex(x, y);
  vertex(x + 500, y);
  vertex(x + 425, y + 100);
  vertex(x + 75, y + 100);
  endShape(CLOSE);

  drawFisherman(x + 250, y); // Menambahkan nelayan di perahu
}

void drawFisherman(float x, float y) {
  fill(255, 228, 196); // Warna kulit untuk kepala nelayan
  ellipse(x, y - 70, 50, 50); // Kepala nelayan

  fill(255, 165, 0); // Warna oranye untuk tubuh nelayan
  rect(x - 25, y - 55, 50, 70); // Tubuh nelayan

  fill(0); // Warna hitam untuk kaki nelayan
  rect(x - 25, y + 15, 15, 40); // Kaki kiri nelayan yang duduk
  rect(x + 10, y + 15, 15, 40); // Kaki kanan nelayan yang duduk

  // Menggambar tangan dan pancingan
  stroke(255, 228, 196); // Warna kulit untuk tangan
  strokeWeight(6);
  line(x - 15, y - 45, x - 65, y - 70); // Tangan kiri
  line(x + 15, y - 45, x + 65, y - 70); // Tangan kanan

  strokeWeight(3);
  line(x + 65, y - 70, x + 150, y - 150); // Pancingan
  noFill();
  beginShape();
  vertex(x + 150, y - 150);
  bezierVertex(x + 160, y - 160, x + 190, y - 160, x + 200, y - 150); // Ujung tali pancingan
  endShape();

  // Menggambar mata nelayan
  fill(0); // Warna hitam untuk mata
  ellipse(x - 10, y - 75, 7, 7); // Mata kiri
  ellipse(x + 10, y - 75, 7, 7); // Mata kanan

  // Menggambar mulut nelayan
  fill(255, 0, 0); // Warna merah untuk mulut
  arc(x, y - 60, 20, 10, 0, PI); // Mulut nelayan (senyum)

  // Menggambar caping atau topi
  fill(139, 69, 19); // Warna coklat untuk caping
  beginShape();
  vertex(x - 40, y - 65); // Ujung kiri caping
  vertex(x + 40, y - 65); // Ujung kanan caping
  vertex(x, y - 100); // Puncak caping
  endShape(CLOSE);
}

void drawWaves() {
  fill(0, 191, 255);
  noStroke();
  
  // Menggambar pola gelombang
  beginShape();
  for (int x = 0; x <= width; x += 10) {
    float y = height / 2 - 50 + 20 * sin(TWO_PI * (x + waveOffset) / 200); // Menyesuaikan posisi gelombang
    vertex(x, y);
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  
  waveOffset += 2; // Menggerakkan pola gelombang
}

void drawSand() {
  fill(194, 178, 128); // Warna pasir (beige)
  noStroke();
  rect(0, height - 50, width, 50); // Menggambar bagian pasir di bagian bawah layar
}

void drawFish(float x, float y) {
  noStroke();
  fill(192, 192, 192); // Warna tubuh ikan teri (abu-abu)
  
  // Menggambar tubuh ikan yang lebih kecil
  beginShape();
  vertex(x + 30, y); // Kepala
  bezierVertex(x + 20, y - 10, x - 20, y - 10, x - 30, y); // Bagian atas tubuh
  bezierVertex(x - 20, y + 10, x + 20, y + 10, x + 30, y); // Bagian bawah tubuh
  endShape(CLOSE);

  // Menggambar ekor ikan yang lebih kecil
  beginShape();
  vertex(x - 30, y);
  vertex(x - 40, y - 7.5);
  vertex(x - 40, y + 7.5);
  endShape(CLOSE);

  // Menggambar mata ikan yang lebih kecil
  fill(0); // Warna hitam untuk mata
  ellipse(x + 25, y - 2.5, 2.5, 2.5); // Mata ikan teri
}
