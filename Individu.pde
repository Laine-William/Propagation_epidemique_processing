final int SAIN = 0;
final int INFECTE = 1;
final int REMIS = 2;

final int TEMPS_INFECTION = 500;

final color[] COULEURS = {
  
  color(174, 239, 252),
  color(239, 51, 64),
  color(117, 59, 189)
};

class Individu {
  
  float rayon;
  
  float positionX, positionY;
  float vitesseX, vitesseY;
  
  int etat;
  int tempsRestant;
  
  Individu() {
    
    rayon = 5;
    
    positionX = random(width);
    
    positionY = random(100 + 2 * rayon, height);
    
    float alpha = random(TWO_PI);
    
    vitesseX = cos(alpha);
    vitesseY = sin(alpha);
    
    etat = SAIN;
  }
  
  void dessiner() {
    
    noStroke();
    
    fill(COULEURS[etat]);
    
    ellipseMode(RADIUS);
    
    ellipse(positionX, positionY, rayon, rayon);
  }
  
  void bouger() {
    
    positionX += vitesseX;
    positionY += vitesseY;
    
    if (positionX < 0 || positionX > width) {
      
      vitesseX = -vitesseX;
    }
    
    if (positionY < 100 + 2 * rayon || positionY > height) {
      
      vitesseY = - vitesseY;
    }
  }
  
  void infecter() {
    
    if (etat == SAIN) {
      
      etat = INFECTE;
      
      tempsRestant = TEMPS_INFECTION;
    }
  }
  
  void contact(Individu autre) {
    
    float deplacement = dist(positionX, positionY, autre.positionX, autre.positionY);
    
    if (deplacement < rayon + autre.rayon) {
    
      if (etat == INFECTE) {
      
        autre.infecter();
      
      } else if (autre.etat == INFECTE) {
        
        infecter();
      }
    }
  }
  
  void guerir() {
    
    if (etat == INFECTE) {
    
      tempsRestant--;
      
      if (tempsRestant == 0) {
      
        etat = REMIS;
      }
    }
  }
  
  void confiner() {
    
    vitesseX = 0;
    vitesseY = 0;
  }
}
