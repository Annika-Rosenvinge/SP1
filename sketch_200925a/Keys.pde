class Keys {
  //egenskaber
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;

  //kontruktør
  Keys() {
  }

  // metoder
  // Disse 2 metoder gør så spilleren kan rykke sig
  // Den øverste er hvis man trykker på en tast, så bliver boolean = true og det betyder,
  // at spillleren rykker sig den vej, denne her metode for tildelt under game tab.
  void onKeyPressed(char k) {
    if (k=='a' || k=='A') {
      aDown=true;
    }
    if (k=='s' || k=='S') {
      sDown=true;
    }
    if (k=='w' || k=='W') {
      wDown=true;
    }
    if (k=='d' || k=='D') {
      dDown=true;
    }
  }
  // denne her metode fortæller at når tasten ikke længere presses eller holdes inde, 
  // altså hvis en eller flere af boolean's = false; 
  // så skal den ikke længere rykke sig den vej den får tildelt under game tab.
  void onKeyReleased(char k) {
    if (k=='a' || k=='A') {
      aDown=false;
    }
    if (k=='s' || k=='S') {
      sDown=false;
    }
    if (k=='w' || k=='W') {
      wDown=false;
    }
    if (k=='d' || k=='D') {
      dDown=false;
    }
  }
}
