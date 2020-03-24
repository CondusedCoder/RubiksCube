import peasy.*;
PeasyCam cam;








// top bottom right left front back
final int UPP = 0;
final int DWN = 1;
final int RGT = 2;
final int LFT = 3;
final int FRT = 4;
final int BCK = 5;

color[] colours = {
#FFFFFF, #FFFF00,
#FF0000, #FFA500,
#00FF00, #0000FF

};











int dim = 3;





Cubie[] cube = new Cubie[dim * dim * dim];

void setup() {

  size(600, 600, P3D);
   cam = new PeasyCam(this, 400);
   int index = 0;
   for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, x, y, z);
        index++;
      }
    }
   }
         
}






                                                                

  
void turnZ(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.y);
      qb.Update(round(matrix.m02), round(matrix.m12), round(qb.z));
      qb.turnFacesZ();
    }
  }
}
void turnY(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.z);
      qb.Update(round(matrix.m02), qb.y, round(matrix.m12));
      qb.turnFacesY();
      
    }
  }
}

void turnX(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.y, qb.z);
      qb.Update(qb.x, round(matrix.m02), round(matrix.m12));
      qb.turnFacesX();
      
      
    }
  }
}

void keyPressed() {
if (key == '1') {
  turnZ(1,1);
  
}
if (key == '2') {
  turnZ(-1,1);
  
}
if (key == '3') {
  turnY(1,1);
  
}
if (key == '4') {
  turnY(-1,1);
  
}
if (key == '5') {
  turnX(1,1);
  
}
if (key == '6') {
  turnX(-1,1);
  
}





}
     
   

void draw() {
  background(220);
  scale(100);
 
   for (int i = 0; i < cube.length; i++) {
   
      
      
        cube[i].show();
      
    
  }
}
  
  
  
  
  
  
  
  
