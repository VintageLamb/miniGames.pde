/*
counter++; 
if(pivot==limR){
  limR= _list.pop();
  if(limR==_list.get(_list.size()-1) ) _list.pop();
  pivot=_list.get(_list.size()-1);
  slider=pivot;
               } 
*/

boolean trigger;
IntList _list;

ArrayList listRand;
int newRand;

boolean flag;

int counter;
int moduleSize = 15;
int pivot = 1;
int slider=2;

 int vTemp;
//button
int buttonX=25, buttonY=325; 
int buttonSize = 50;     
boolean boolButton = false;

int count;
Module[] mods;

void setup() {
  size(500, 400);
  listRand = new ArrayList(10);
  _list=new IntList();
 mods = new Module[moduleSize];
 
 mods[0] = new Module(1*30,  randFoo()*10 );
 mods[1] = new Module(2*30,  randFoo()*10 );
 mods[2] = new Module(3*30,  randFoo()*10 );
 mods[3] = new Module(4*30,  randFoo()*10 );
 mods[4] = new Module(5*30,  randFoo()*10 );
 mods[5] = new Module(6*30,  randFoo()*10 );
 mods[6] = new Module(7*30,  randFoo()*10 );
 mods[7] = new Module(8*30,  randFoo()*10 );
 mods[8] = new Module(9*30,  randFoo()*10 );
 mods[9] = new Module(10*30, randFoo()*10 ); 
 mods[10] = new Module(11*30,  randFoo()*10 );
 mods[11] = new Module(12*30,  randFoo()*10 );
 mods[12] = new Module(13*30,  randFoo()*10 );
 mods[13] = new Module(14*30,  randFoo()*10 );
 mods[14] = new Module(15*30, randFoo()*10 ); 
  
  /*
 mods = new Module[moduleSize];
 mods[0] = new Module(1*30,  50);
 mods[1] = new Module(2*30,  70);
 mods[2] = new Module(3*30,  10);
 mods[3] = new Module(4*30,  20);
 mods[4] = new Module(5*30,  30);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  80);
 mods[7] = new Module(8*30,  90);
 mods[8] = new Module(9*30,  40);
 mods[9] = new Module(10*30, 100);
 
 //*/
}

void draw() { 
  background(50);
   buttonUpdate();  
   for (Module mod : mods) {  mod.display();  }
  
   // paddle
  rect (slider*30, 85, 20, 5);
  rect (pivot*30, 75, 20, 5);
  
  textSize(25);
  text(counter,300,350);
  // draw button
  fill(150);
  rect(buttonX,buttonY,buttonSize,buttonSize);
   if(boolButton && mousePressed)  
  { 
    fill(200);
    rect(buttonX,buttonY,buttonSize,buttonSize);
   }
// println(flag);
}

class Module {
 int xOffset; 
 int rectHight;
  
// Contructor
   Module(int xOffsetTemp, int rectHightTemp) {
    xOffset = xOffsetTemp;  
    rectHight=rectHightTemp;
  }  
  // Custom method for drawing the object
  void display() {
   fill(255);
   rect(xOffset , 100, 20, rectHight);
   }
}

// button
void mouseReleased() {
 if(boolButton)
 {
  
 if(!flag){ if(slider<moduleSize+1)  slider++; }
   if(flag){ 
           slider--;
           if(slider<pivot){ 
                           flag=false; 
                           pivot++; 
                           slider=pivot;
                           }
           }
  }///
 if(slider==pivot-1 &&
     mods[slider-1].rectHight<mods[pivot-1].rectHight){
   flag=false;            
   slider=pivot;
   } 
  
}///
 
 void mousePressed() { 
 if(boolButton)
 {  
 counter++; 
 println(_list);
  if(slider>=moduleSize+1) {
    slider=moduleSize+1;  
    _list.append(pivot);
      pivot++; slider=pivot;}
  
  else{
    if(mods[slider-1].rectHight < mods[pivot-1].rectHight)
       { flag=true;
        vTemp= mods[slider-1].rectHight;
        mods[slider-1].rectHight=mods[slider-2].rectHight;
        mods[slider-2].rectHight=vTemp;  }
     }   
  }
}

 void buttonUpdate() {
  if ( overButton(buttonX, buttonY, buttonSize, buttonSize)  ) {
    boolButton = true;
  } else {
   boolButton = false;
  }
}
boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
} else {
  return false;
  }
} 


int randFoo(){
  newRand = int(random(1,16));
  if(!listRand.contains(newRand) )  listRand.add(newRand );
    else newRand=randFoo();
    return newRand;
}
