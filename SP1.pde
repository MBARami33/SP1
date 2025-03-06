PImage[] flags = new PImage[16]; // Array til at gemme flagene
String[] countries = {
  "Russia", "Saudi Arabia", "Egypt", "Uruguay", 
  "Portugal", "Spain", "Morocco", "Iran", 
  "France", "Australia", "Peru", "Denmark", 
  "Argentina", "Iceland", "Croatia", "Nigeria"
};

// Filnavne baseret på dine filer (alle er .png)
String[] fileNames = {
  "Russia Flag.png", "Saudi Arabia Flag.png", "Egypt Flag.png", "Uruguay Flag.png",
  "Portugal Flag.png", "Spain Flag.png", "Morocco Flag.png", "Iran Flag.png",
  "France Flag.png", "Australia Flag.png", "Peru Flag.png", "Denmark Flag.png",
  "Argentina Flag.png", "Iceland Flag.png", "Croatia Flag.png", "Nigeria Flag.png"
};

void setup() {
  size(1000, 500); // Adjusted window size to fit everything tightly
  background(30, 50, 90); // Mørk blå baggrund

  textAlign(CENTER, CENTER); // Tekst centreres
  
  // Indlæs flag ved hjælp af en for-løkke
  for (int i = 0; i < flags.length; i++) {
    flags[i] = loadImage("flags/" + fileNames[i]); // Indlæs fra undermappen "flags"
    if (flags[i] == null) {
      println("Fejl: Kunne ikke indlæse billede for " + countries[i]);
    }
  }

  // Linje i midten
  stroke(255);
  strokeWeight(3);
  line(490, 0, 490, 500); // Adjusted line height to match new window size

  // Tegn grupperne
  drawGroup(50, 30, "GROUP A", new String[]{"RUSSIA", "SAUDI ARABIA", "EGYPT", "URUGUAY"}, color(170, 210, 230)); // Lys blå farve til gruppenavn A
  drawGroup(50, 200, "GROUP B", new String[]{"PORTUGAL", "SPAIN", "MOROCCO", "IRAN"}, color(255, 255, 100)); // Gul farve til gruppenavn B (y = 200)
  drawGroup(500, 30, "GROUP C", new String[]{"FRANCE", "AUSTRALIA", "PERU", "DENMARK"}, color(170, 210, 230)); // Lys blå farve til gruppenavn C
  drawGroup(500, 200, "GROUP D", new String[]{"ARGENTINA", "ICELAND", "CROATIA", "NIGERIA"}, color(255, 255, 100)); // Gul farve til gruppenavn D (y = 200)

  // Tegn farvede rektangler
  drawColoredRectangles();
}

// Funktion til at tegne en gruppe
void drawGroup(int x, int y, String groupName, String[] countries, int groupNameColor) {
  // Text Farve for gruppenavn
  fill(groupNameColor); // Farve for gruppenavn (lys blå eller gul)
  textSize(20);

  // Calculate the center position for the group name
  float groupNameX = x + 215; // Center of the group's bounding box (430 / 2 = 215)
  float groupNameY = y - 20; // Position above the boxes
  textAlign(CENTER, CENTER); // Center the text horizontally and vertically
  text(groupName, groupNameX, groupNameY); // Gruppens navn centreres over boksene

  // Tegn bokse og tekst
  for (int i = 0; i < countries.length; i++) {
    fill(255); // Hvid farve til boksene
    noStroke();
    rect(x, y + i * 30, 430, 25); // Tegn boks med meget mindre afstand (30 pixels) og mindre højde (25 pixels)

    // Declare flagWidth and flagHeight
    int flagWidth = 50; // Fixed width for all flags
    int flagHeight = 25; // Fixed height for all flags

    // Tegn flag (align with the white rectangle and match height)
    int index = getCountryIndex(countries[i]);
    if (index != -1 && flags[index] != null) {
      // Draw the flag aligned to the left edge of the white rectangle
      image(flags[index], x, y + i * 30, flagWidth, flagHeight);
    }

    // Tegn landenavn (centreret)
    fill(0); // Sort farve til tekst
    textSize(12); // Smaller text size
    textAlign(LEFT, CENTER); // Tekst justeres til venstre
    text(countries[i], x + flagWidth + 10, y + i * 30 + 12); // Tekst placeres til højre for flaget
  }
}

// Funktion til at tegne farvede rektangler
void drawColoredRectangles() {
  // GROUP A rektangler
  fill(170, 210, 230); // Lys blå farve
  noStroke();
  rect(460, 30, 20, 25);
  rect(460, 60, 20, 25); // Adjusted y-position for smaller spacing (30 pixels)
  rect(460, 90, 20, 25);
  rect(460, 120, 20, 25);

  // GROUP B rektangler
  fill(255, 255, 100); // Gul farve
  rect(460, 200, 20, 25);
  rect(460, 230, 20, 25); // Adjusted y-position for smaller spacing (30 pixels)
  rect(460, 260, 20, 25);
  rect(460, 290, 20, 25);

  // GROUP C rektangler
  fill(170, 210, 230); // Lys blå farve
  rect(910, 30, 20, 25);
  rect(910, 60, 20, 25); // Adjusted y-position for smaller spacing (30 pixels)
  rect(910, 90, 20, 25);
  rect(910, 120, 20, 25);

  // GROUP D rektangler
  fill(255, 255, 100); // Gul farve
  rect(910, 200, 20, 25);
  rect(910, 230, 20, 25); // Adjusted y-position for smaller spacing (30 pixels)
  rect(910, 260, 20, 25);
  rect(910, 290, 20, 25);
}

// Funktion til at finde indeks for et land
int getCountryIndex(String country) {
  for (int i = 0; i < countries.length; i++) {
    if (countries[i].equalsIgnoreCase(country)) {
      return i;
    }
  }
  return -1; // Returner -1 hvis landet ikke findes
}
