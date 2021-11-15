class Plague {


  int w = 4;
  int columns, rows;
  float lethality=0.05; //Maximum 1
  float infectionC=0.02; //A constant that determines how infectious the pathogen is
  float survivalRate=0.02;// The probability that an infected cell survives the infection
  //float noticability;
  int totalCells;
  int infected, dead, susceptible, immune ; //these variables represent the amount of neighbors with these states so max=9
  float deadperc;
  float incubationPeriod;
  // Plague board
  Cell[][] board;
  int patient0col, patient0row; //These 2 ints define the starting position of the plague
  int deadtotal, infectedtotal, susceptibletotal, immunetotal;//info variables are equal to the total amount of cells with the state
  Plague() {
    // Initialize rows, columns,set-up arrays and choose the location of patient 0
    columns = width/w;
    rows = height/w;
    totalCells=columns*rows;
    board = new Cell[columns][rows];
    patient0col=columns/2; 
    patient0row=rows/2;    
    init();
  }

  void init() { //Initialising the world and infect the chosen patient 0 cell. 
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j] = new Cell(i*w, j*w, w);
      }
    }
    board[patient0col][patient0row].state="INFECTED"; //Patient 0
  }
  
  
  //Calculate functions : These functions calculate the total amount of cells with
  //every state.

  int calculateDead() {
    deadtotal=0;
    for (int x=0; x<columns; x++) {
      for (int y=0; y<rows; y++) {
        if ( board[x][y].state=="DEAD") {
          deadtotal+=1;
        }
      }
    }
    return deadtotal;
  }

  int calculateInfected() {
    infectedtotal=0;
    for (int x=0; x<columns; x++) {
      for (int y=0; y<rows; y++) {
        if ( board[x][y].state=="INFECTED") {
          infectedtotal+=1;
        }
      }
    }
    return infectedtotal;
  }

  int calculateSusceptible() {
    susceptibletotal=0;
    for (int x=0; x<columns; x++) {
      for (int y=0; y<rows; y++) {

        if ( board[x][y].state=="SUSCEPTIBLE") {
          susceptibletotal+=1;
        }
      }
    }
    return susceptibletotal;
  }

  int calculateImmune() {
    immunetotal=0;
    for (int x=0; x<columns; x++) {
      for (int y=0; y<rows; y++) {

        if ( board[x][y].previous=="IMMUNE") {
          immunetotal+=1;
        }
      }
    }
    return immunetotal;
  }




        // The process the diseases spreads and kills
  void live() {



    for ( int i = 0; i < columns; i++) {
      for ( int j = 0; j < rows; j++) {
        board[i][j].savePrevious();
        board[i][j]. calculatetimeInfected();
      }
    }


    // Loop through every spot in the 2D array 
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {

        //Calculate amount of infected,healthy,immune and dead neighbors that every cell has
        infected = 0;
        dead=0;
        susceptible=0;
        immune=0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            if ( board[(x+i+columns)%columns][(y+j+rows)%rows].previous=="INFECTED") {
              infected+=1;
            } else if ( board[(x+i+columns)%columns][(y+j+rows)%rows].previous=="DEAD") {
              dead+=1;
            } else if ( board[(x+i+columns)%columns][(y+j+rows)%rows].previous=="SUSCEPTIBLE") {
              susceptible+=1;
            } else if (board[(x+i+columns)%columns][(y+j+rows)%rows].previous=="IMMUNE") {
              immune+=1;
            }
          }
        }

        // The rules of my plague
        //Spread rules :

        for (int k=1; k<10; k++) {
          if ((board[x][y].state == "SUSCEPTIBLE") && (infected==k)) { //If your healthy and have k infected neighbors
            float r=random(1);
            if (r<k*infectionC) board[x][y].newState("INFECTED"); //there is a k*infectionC probability you also get infected
          }//To be honest, when the plague starts from one place only, a cell is almost never going to have more than 4 infected neighbors so the for-loop is kinda overkill
        }
        //Death or survival rules :
        incubationPeriod=(randomGaussian()*50)+150; //Incubation period has a  mean of 150 and a stddev of 30
        if ((board[x][y].state =="INFECTED") &&(board[x][y].timeInfected>incubationPeriod)) {//need to play with the stddev value
          float ran= random(1);
          float rn=random(1);
          if (ran<lethality) {
            board[x][y].newState("DEAD");
          } else if (rn<survivalRate) {
            board[x][y].newState("IMMUNE");
          }
        }
      }
    }
  }




  //Calling display for every cell
  void display() {
    for ( int i = 0; i < columns; i++) {
      for ( int j = 0; j < rows; j++) {
        board[i][j].display();
      }
    }
  }
}
