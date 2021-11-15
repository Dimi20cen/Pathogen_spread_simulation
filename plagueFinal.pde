
Plague plague;
int healthy;

void setup() {
  
  size(800, 800);
  plague = new Plague();
  frameRate(16);
  healthy=0;
}

void draw() {

  background(255);
 // println(frameRate);
   
//  Displaying info :
 plague.live(); //Spread and die/survive function. The initialisation funtion is called once in the beginning of plague so it doesn't have to be called again. This is the "meat" of the program
 plague.display(); 
 //Calculate info to display
 plague.calculateInfected();
 plague.calculateSusceptible();
 plague.calculateDead();
 plague.calculateImmune();
 healthy=plague.susceptibletotal+plague.immunetotal;
 fill(0);
 textSize(15);
 text("Healthy : "+healthy,30,25);
 text("Immune : "+plague.immunetotal,30,45);
 text("Susceptible : "+plague.susceptibletotal,30,65);
 text("Infected : "+plague.infectedtotal,30,85);
 text("Dead : "+plague.deadtotal,30,105);
}

// reset board when mouse is pressed
void mousePressed() { 
  //saveFrame("plagueFinal.jpg");
  plague.init();
}
