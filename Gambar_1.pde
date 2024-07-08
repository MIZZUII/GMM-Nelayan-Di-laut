// Deklarasi variabel global
Character[] characters = new Character[3]; // Array untuk menyimpan 3 objek karakter
boolean onBeach = false; // Variabel boolean untuk mengecek apakah latar belakang pantai atau ruang tamu

void setup() {
  size(1280, 720); // Ukuran jendela 1280x720 piksel
  // Inisialisasi karakter dengan warna celana yang berbeda
  characters[0] = new Character(width / 2 - 300, height - 200, color(255, 0, 0), color(0, 0, 255)); // Celana biru
  characters[1] = new Character(width / 2, height - 200, color(255, 105, 180), color(0, 255, 0)); // Celana hijau
  characters[2] = new Character(width / 2 + 300, height - 200, color(128, 0, 128), color(255, 255, 0)); // Celana kuning
}

void draw() {
  drawRoom(); // Tetap gambar latar belakang ruang tamu
  
  for (int i = 0; i < characters.length; i++) {
    characters[i].display(); // Tampilkan karakter
    characters[i].moveToSofa(); // Semua karakter bergerak menuju sofa
  }
}

void drawRoom() {
  background(#F8D4BC); // Latar belakang warna biru muda untuk ruang tamu
  fill(#D1916E);
  rect(0, 500, width, 270); // Gambar lantai
  fill(#E3A886);
  rect(0, 505, width, 2); // Gambar garis-garis di lantai
  rect(0, 515, width, 3); 
  rect(0, 525, width, 4); 
  rect(0, 540, width, 4); 
  rect(0, 560, width, 4); 
  rect(0, 580, width, 4); 
  rect(0, 580, width, 4);
  rect(0, 610, width, 5);
  rect(0, 645, width, 5);
  rect(0, 685, width, 5);
  
  fill(#989085);
  rect(525,305,250,140); // Bagian tengah sofa
  fill(#7F776C); // Warna sofa
  rect(525,375,-80,150); // Bagian kiri sofa
  rect(775,375,80,150); // Bagian kanan sofa
  rect(525,435,250,90); // Bagian bawah sofa
  rect(525,375,-122,-40); // Bagian atas kiri sofa
  rect(775,335,122,40); // Bagian atas kanan sofa
  
  fill(150, 75, 0); // Warna meja
  rect(950, 405, 300, 20); // Gambar meja
  fill(100); 
  rect(960, 425, 20, 100); // Kaki meja
  rect(1220, 425, 20, 100); // Kaki meja lainnya
  rect(1000, 425, 20, 100); // Kaki meja lainnya
  rect(1180, 425, 20, 100); // Kaki meja lainnya
  
  fill(150, 0, 0); // Warna radio
  rect(955, 305, 150, 100); // Gambar radio
  fill(155, 155 ,155);
  rect(990, 325, 80, 30); // Layar radio
  fill(0, 143, 57);
  ellipse(1010, 380, 20, 20); // Tombol radio
  ellipse(1050, 380, 20, 20); // Tombol radio
  fill(10, 10, 10);
  ellipse(1010,363,15,5); // Tombol radio
  ellipse(1030,363,15,5); // Tombol radio
  ellipse(1050,363,15,5); // Tombol radio
  
  stroke(130); // Warna lampu
  fill(150);
  rect(1177,240,6,150); // Tiang lampu
  
  stroke(130);
  fill(200,195,0);
  rect(1150,240,60,80); // Bagian lampu
  stroke(200,195,0);
  triangle(1150,240,1150,320,1120,320); // Bagian lampu
  triangle(1210,240,1210,320,1240,320); // Bagian lampu
  stroke(80);
  fill(90);
  ellipse(1177,397,100,20); // Bagian dasar lampu
  
  fill(#494843);
  rect(100, 525, 80, -70); // Pot tanaman
  rect(85, 445, 110, 10); // Pot tanaman
  
 fill(#A27450);
  rect(-50, -50, 280, 400); // Frame jendela
  fill(#000000);
  rect(-50, -50, 275, 395); // Jendela
  fill(#CDD1D4);
  rect(-10, 270, 75, 75); // Luar jendela
  rect(70, 270, 75, 75);
  rect(150, 270, 75, 75);
  rect(-10, 190, 75, 75);
  rect(70, 190, 75, 75);
  rect(150, 190, 75, 75);
  rect(-10, 110, 75, 75);
  rect(70, 110, 75, 75);
  rect(150, 110, 75, 75);
  rect(-10, 30, 75, 75);
  rect(70, 30, 75, 75);
  rect(150, 30, 75, 75);
  rect(-10, -50, 75, 75);
  rect(70, -50, 75, 75);
  fill(#E5E9ED);
  noStroke();
  rect (-10, 110, 75, 50);
  rect (70, 110, 35, 50);
  rect (130, 110, 15, 50);
  rect (150, 110, 75, 50);
  rect (-10, 70, 75, 35);
  rect (70, 70, 15, 35);
  rect (130, 55, 15, 50);
  rect (150, 55, 75, 50);
  fill (#FEFEFE);
  rect (105, 110, 25, 50);
  rect (-10, 30, 75, 40);
  rect (70, 30, 60, 40);
  rect (85, 65, 45, 40);
  rect (130, 30, 15, 25);
  rect (150, 30, 75, 25);
  rect (-10, -50, 75, 75);
  rect (70, -50, 75, 75);
  rect (150, -50, 75, 75);
  fill(#000000);
  rect(305, 50, 100, 100); // Frame Lukisan 1
  fill(#D0EBE4);
  rect(315, 60, 80, 80); // Lukisan 1
  fill(#000000);
  rect(325, 170, 80, 100); // Frame Lukisan 2
  fill(#FCFDF8);
  rect(335, 180, 60, 80); // Lukisan 2
  fill(#000000);
  rect(435, 50, 200, 220); // Frame Lukisan 3
  fill(#DAA877);
  rect(445, 60, 180, 200); // Lukisan 3
  fill(#000000);
  rect(660, 50, 70, 90); // Frame Lukisan 4
  fill(#D0EBE2);
  rect(670, 60, 50, 70); // Lukisan 4
  fill(#000000);
  rect(660, 180, 120, 80); // Frame Lukisan 5
  fill(#869F5B);
  rect(670, 190, 100, 60);
  
  
  fill(#74A41A); // Warna tanaman
  rect(135, 375, 15, 70); // Batang tanaman
  fill(#FBD704); // Warna bunga
  ellipse(140, 320, 50, 50); // Bunga
  ellipse(170, 320, 50, 50);
  ellipse(110, 320, 50, 50);
  ellipse(140, 290, 50, 50);
  ellipse(140, 350, 50, 50);
  fill(180, 167, 214); // Warna tengah bunga
  circle(140, 320, 20); // Tengah bunga
  
  drawClock();  
}

void drawClock() {
  int radius = 50; // Radius jam
  int cx = width - 200; // Posisi X pusat jam
  int cy = 100; // Posisi Y pusat jam
  
  fill(255);
  stroke(0); // Mengatur warna stroke menjadi hitam
  strokeWeight(4); // Mengatur ketebalan stroke
  ellipse(cx, cy, radius*2, radius*2); // Lingkaran jam
  
  // Gambar angka jam
  for (int i = 1; i <= 12; i++) {
    float angle = radians(30 * i - 90);
    float x = cx + cos(angle) * (radius - 20);
    float y = cy + sin(angle) * (radius - 20);
    fill(0);
    textAlign(CENTER, CENTER);
    text(i, x, y);
  }
  
  // Ambil waktu saat ini
  int s = second();
  int m = minute();
  int h = hour() % 12;
  
  // Gambar jarum detik
  float secondAngle = map(s, 0, 60, 0, TWO_PI) - HALF_PI;
  stroke(255, 0, 0);
  strokeWeight(2);
  line(cx, cy, cx + cos(secondAngle) * (radius - 10), cy + sin(secondAngle) * (radius - 10));
  
  // Gambar jarum menit
  float minuteAngle = map(m, 0, 60, 0, TWO_PI) - HALF_PI;
  stroke(0);
  strokeWeight(4);
  line(cx, cy, cx + cos(minuteAngle) * (radius - 15), cy + sin(minuteAngle) * (radius - 15));
  
  // Gambar jarum jam
  float hourAngle = map(h + norm(m, 0, 60), 0, 12, 0, TWO_PI) - HALF_PI;
  strokeWeight(6);
  line(cx, cy, cx + cos(hourAngle) * (radius - 20), cy + sin(hourAngle) * (radius - 20));
  
  // Gambar pusat jam
  strokeWeight(1);
  fill(0);
  ellipse(cx, cy, 10, 10);
}

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
    noStroke();
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
  
  void moveToSofa() {
    if (x < 525) {
      x += moveSpeed; // Bergerak ke kanan
    } else if (x > 775) {
      x -= moveSpeed; // Bergerak ke kiri
    }
  }
}
