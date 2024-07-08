// Kelas Character
class Character {
  float x, y; // Koordinat posisi karakter
  float targetX; // Koordinat target X karakter
  float moveSpeed = 2; // Kecepatan gerakan karakter
  color shirtColor; // Warna baju karakter
  color pantsColor; // Warna celana karakter
  
  Character(float startX, float startY, color shirtC, color pantsC) {
    x = startX; // Inisialisasi posisi X
    y = startY; // Inisialisasi posisi Y
    targetX = x; // Inisialisasi target posisi X
    shirtColor = shirtC; // Inisialisasi warna baju
    pantsColor = pantsC; // Inisialisasi warna celana
  }
  
  void display() {
    fill(255, 224, 189); // Warna kulit
    ellipse(x, y - 100, 80, 80); // Kepala
    
    fill(0); // Warna hitam
    ellipse(x - 20, y - 110, 10, 10); // Mata kiri
    ellipse(x + 20, y - 110, 10, 10); // Mata kanan
    
    // Tambahkan rambut dan mulut berdasarkan warna baju
    if (shirtColor == color(255, 0, 0)) {
      // Rambut cowo (baju merah)
      fill(0); // Warna rambut hitam
      beginShape();
      vertex(x - 40, y - 120);
      vertex(x + 40, y - 120);
      vertex(x + 20, y - 160);
      vertex(x - 20, y - 160);
      endShape(CLOSE);
    } else if (shirtColor == color(255, 105, 180) || shirtColor == color(128, 0, 128)) {
      // Rambut cewe (baju pink dan ungu)
      fill(255, 182, 193); // Warna rambut merah muda
      beginShape();
      vertex(x - 40, y - 120);
      vertex(x + 40, y - 120);
      vertex(x + 20, y - 160);
      vertex(x - 20, y - 160);
      endShape(CLOSE);
    }
    
    // Tambahkan mulut
    fill(255, 0, 0); // Warna mulut merah
    arc(x, y - 90, 30, 20, 0, PI); // Bentuk mulut
    
    fill(shirtColor); // Warna baju
    rect(x - 30, y - 60, 60, 100); // Baju
    
    fill(pantsColor); // Warna celana
    rect(x - 30, y + 40, 60, 40); // Celana
    
    fill(255, 224, 189); // Warna kulit tangan
    rect(x - 50, y - 60, 20, 60); // Tangan kiri
    rect(x + 30, y - 60, 20, 60); // Tangan kanan
    
    fill(shirtColor); // Warna baju
    rect(x - 50, y - 60, 20, 20); // Sambungan tangan kiri
    rect(x + 30, y - 60, 20, 20); // Sambungan tangan kanan
    
    fill(255, 224, 189); // Warna kulit kaki
    rect(x - 20, y + 80, 20, 40); // Kaki kiri
    rect(x + 0, y + 80, 20, 40); // Kaki kanan
    
    fill(0); // Warna sepatu hitam
    rect(x - 20, y + 120, 20, 10); // Sepatu kiri
    rect(x + 0, y + 120, 20, 10); // Sepatu kanan
  }
  
  void moveToMiddle() {
    if (x < 480) {
      x += moveSpeed; // Bergerak ke kanan
    } else if (x > 775) {
      x -= moveSpeed; // Bergerak ke kiri
    }
  }
}

Character[] characters = new Character[3]; // Array untuk menyimpan 3 objek karakter

float[] waveX;
float[] waveY;
int waveCount = 5; // Jumlah ombak

float[] cloudX;
float[] cloudY;
int cloudCount = 5; // Jumlah awan

float boatX;
float boatY = 200; // Posisi vertikal kapal layar

boolean movingLeft = true; // Untuk mengontrol arah gerakan kapal
int stopTimeStart; // Waktu mulai berhenti kapal
boolean stopForFiveSeconds = false; // Apakah kapal sedang berhenti

void setup() {
  size(1280, 720);
  waveX = new float[waveCount];
  waveY = new float[waveCount];

  // Inisialisasi posisi awal ombak dengan jarak yang merata
  for (int i = 0; i < waveCount; i++) {
    waveX[i] = i * (width / waveCount); // Membagi layar menjadi waveCount bagian dan mengatur posisi awal ombak
    waveY[i] = height - 225 + random(-20, 20); // Tinggi ombak bervariasi sedikit
  }

  cloudX = new float[cloudCount];
  cloudY = new float[cloudCount];

  // Inisialisasi posisi awal awan dengan jarak yang merata
  for (int i = 0; i < cloudCount; i++) {
    cloudX[i] = i * (width / cloudCount) + random(0, width / cloudCount - 100); // Membagi layar menjadi cloudCount bagian dan mengatur posisi awal awan
    cloudY[i] = random(100, 250); // Tinggi awan acak antara 100 dan 250 piksel
  }

  boatX = width + 100; // Inisialisasi posisi kapal layar di luar layar sebelah kanan
  
  // Inisialisasi karakter
  characters[0] = new Character(400, height - 150, color(255, 0, 0), color(0, 0, 255)); // Karakter 1 (baju merah)
  characters[1] = new Character(600, height - 150, color(255, 105, 180), color(0, 255, 0)); // Karakter 2 (baju pink dan celana hijau)
  characters[2] = new Character(800, height - 150, color(128, 0, 128), color(255, 255, 0)); // Karakter 3 (baju ungu dan celana biru)
}

void draw() {
  background(#C3E9DE); // Latar belakang langit biru
  fill(#F0E49C);
  rect(0, height - 150, width, 150); // Pasir pantai
  fill(#18A3C4);
  rect(0, height - 300, width, 150); // Laut

  fill(255); // Warna ombak putih
  noStroke();

  // Gambar ombak dan gerakkan ke kanan
  for (int i = 0; i < waveCount; i++) {
    rect(waveX[i], waveY[i], 200, 10); // Gambar ombak sebagai rectangle
    waveX[i] += 2; // Gerakkan ombak ke kanan

    // Jika ombak keluar dari layar, kembalikan ke kiri
    if (waveX[i] > width) {
      waveX[i] = -30;
    }
  }

  fill(255); // Warna awan putih
  noStroke();

  // Gambar awan dan gerakkan ke kanan
  for (int i = 0; i < cloudCount; i++) {
    ellipse(cloudX[i], cloudY[i], 60, 40); // Gambar awan sebagai ellipse
    ellipse(cloudX[i] + 20, cloudY[i] + 10, 60, 40);
    ellipse(cloudX[i] - 20, cloudY[i] + 10, 60, 40);
    cloudX[i] += 1; // Gerakkan awan ke kanan

    // Jika awan keluar dari layar, kembalikan ke kiri
    if (cloudX[i] > width + 30) {
      cloudX[i] = -60;
    }
  }
  
  // Gambar matahari terbenam
  fill(#EFBC61);
  arc(width / 2, height - 300, 150, 150, PI, TWO_PI); // Setengah lingkaran di tengah atas laut
  
  // Gambar matahari terbenam
  fill(#F9DC74);
  arc(width / 2, height - 300, 125, 125, PI, TWO_PI); // Setengah lingkaran di tengah atas laut

  // Gambar kapal layar
  pushMatrix();
  translate(boatX, boatY);
  fill(#98AA92);
  quad(50, 200, 250, 200, 200, 230, 100, 230); // Badan kapal
  fill(#82C2C1);
  triangle(90, 180, 150, 80, 150, 190); // Layar kapal
  triangle(155, 50, 220, 190, 155, 190); // Layar kapal
  popMatrix();

  // Mengontrol pergerakan kapal
  if (!stopForFiveSeconds) {
    if (movingLeft) {
      boatX -= 2; // Gerakkan kapal ke kiri
      // Jika kapal mencapai batas kiri (boatX < 250), berhenti selama 5 detik
      if (boatX < 250) {
        stopForFiveSeconds = true; // Set berhenti selama 5 detik
        stopTimeStart = millis(); // Catat waktu mulai berhenti
      }
    } else {
      boatX += 2; // Gerakkan kapal ke kanan
      // Jika kapal mencapai batas kanan (boatX > width + 100), kembalikan ke kiri lagi
      if (boatX > width + 100) {
        movingLeft = true;
      }
    }
  } else {
    // Berhenti selama 5 detik
    if (millis() - stopTimeStart > 5000) {
      stopForFiveSeconds = false; // Hentikan berhenti setelah 5 detik
      movingLeft = false; // Set arah gerakan ke kanan setelah berhenti
    }
  }

  // Pulau
  fill(#F0E49C);
  arc(175, height - 300, 250, 100, PI, TWO_PI);
  
  // Tampilkan karakter
  for (int i = 0; i < characters.length; i++) {
    characters[i].display();
    characters[i].moveToMiddle();
  }
}
