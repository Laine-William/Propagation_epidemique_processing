Population population;

void setup() {
  
  pixelDensity(displayDensity());
  
  size(1000, 800);
  
  population = new Population(200);
  
  background(255);
}

void draw() {
  
  noStroke();
  
  fill(255);
  
  rect(0, 100, width, height - 100);
  
  population.dessiner();
  population.bouger();
  population.contact();
  population.guerir();
  
  if (frameCount % 5 == 0) {
  
    population.dessinerStatistique();
  }
  
  if (frameCount == 600) {
    
   population.confiner(0.9);
   
   stroke(0);
   
   line(population.statistiqueX, 100, population.statistiqueX, 0);
   }
}
