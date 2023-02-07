class Population {
  
  Individu[] individus;
  
  int statistiqueX;

  Population(int taille) {
    
    individus = new Individu[taille];
    
    for (int i = 0; i < taille; i++) {
      
      individus[i] = new Individu();
    }
    
    individus[0].infecter();
    
    statistiqueX = 0;
  }

  void dessiner() {
    
    for (int i = 0; i < individus.length; i++) {
      
      individus[i].dessiner();
    }
  }

  void bouger() {
    
    for (int i = 0; i < individus.length; i++) {
      
      individus[i].bouger();
    }
  }

  void guerir() {
    
    for (int i = 0; i < individus.length; i++) {
      
      individus[i].guerir();
    }
  }

  void confiner(float tauxConfinement) {
    
    for (int i = 0; i < individus.length; i++) {
      
      if (random(1) < tauxConfinement) {
        
        individus[i].confiner();
      }
    }
  }

  void contact() {
    
    for (int i = 0; i < individus.length; i++) {
      
      for (int j = i + 1; j < individus.length; j++) {
        
        individus[i].contact(individus[j]);
      }
    }
  }
  
  void dessinerStatistique() {
    
    int[] nombreParEtat = new int[3];
    
    for (int i = 0; i < individus.length; i++) {
      
      nombreParEtat[individus[i].etat]++;
    }
    float positionY1 = map(nombreParEtat[INFECTE], 0, individus.length, 100, 0);
    
    float positionY2 = map(nombreParEtat[INFECTE] + nombreParEtat[SAIN], 0, individus.length, 100, 0);
    
    stroke(COULEURS[INFECTE]);
    
    line(statistiqueX, 100, statistiqueX, positionY1);
    
    stroke(COULEURS[SAIN]);
    
    line(statistiqueX, positionY1, statistiqueX, positionY2);
    
    stroke(COULEURS[REMIS]);
    
    line(statistiqueX, positionY2, statistiqueX, 0);
    
    statistiqueX++;
  }
}
