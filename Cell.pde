class Cell {

  float x, y;
  float w;
  String state;
  String previous;
  int timeInfected=0;

  Cell(float x_, float y_, float w_) {
    x = x_;
    y = y_;
    w = w_;
   float r= random(1);
   if(r<0.001) {  //There is a 0.1% chance that someone is "born" immune to the disease.
    state ="IMMUNE" ;
   }else {
      state="SUSCEPTIBLE";
   }
    previous = state;
  }
  
  void savePrevious() {
    previous = state; 
  }
  void calculatetimeInfected() {
    if (state=="INFECTED")timeInfected+=1;
  }

  void newState(String s) {
    state = s;
  }
//The display function for coloring the cells. I've toyed with a few different ideas
//but I really like depicting healthy cells as white(same as immune). Blue does make
//it more easy to understand though..
 
 
 void display() {/*
    if (previous == 0 && state == 1) fill(0,0,255);
    else if (state == 1) fill(0);
    else if (previous == 1 && state == 0) fill(255,0,0);
    else fill(255); 
    */
    if (state=="SUSCEPTIBLE") fill(255);
    if(state=="INFECTED")fill(/*#FA4205*/255,0,0);
    if(state=="DEAD")fill(0);
    if(state=="IMMUNE")fill(255);
    stroke(255);
    strokeWeight(1);
    rect(x, y, w, w);
    

     
  }

  
    
}
