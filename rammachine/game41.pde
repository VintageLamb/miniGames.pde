int[] _mas ={0,2,0,0,0,0,0};
//int []mas_stor={0,0,0,0,0,0,0};
int _mas_stor;
//int global_i=0;
int global_i=1;
boolean flag;
boolean i_flag;

Module [] mods;

void setup() {
frameRate(10);
size(500, 400);
mods = new Module[7];

mods[0] = new Module(50);
mods[1] = new Module(70);
mods[2] = new Module(90);
mods[3] = new Module(110);
mods[4] = new Module(130);
mods[5] = new Module(150);
mods[6] = new Module(170);
}
void draw() {
background(50);

_mas_stor=_mas[global_i];
mods[global_i].update(); 

mods[0].display();
mods[1].display();
mods[2].display();
mods[3].display();
mods[4].display();
mods[5].display();
mods[6].display();

println(_mas);
}

void keyPressed() {
  if (keyCode == UP) {
        _mas[global_i]++;            
   } 
   if (keyCode == DOWN) {
         _mas[global_i]--;
   }
  if (keyCode == LEFT) {
        global_i--;            
   } 
   if (keyCode == RIGHT) {
         global_i++;
   } 
   println(global_i);  
 }

class Module {
int i;
int x;
int y;
int[] data = new int[]{0,0,0,0,0,0,0};
// Contructor
Module(int x){
   this.x = x;
    y=100;
  }
void update() {
data[i]=_mas_stor;
}    
void display() {
 text(data[i], x, y);
 }
}
