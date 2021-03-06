class Module {
  constructor( x,  y, modColor){
    this.x = x;
    this.y = y;
    this.modColor=modColor;
  }
  // Custom methods for drawing the object
   mouseClick() {    
   if ((mouseX >= this.x && mouseX <= this.x+100 && 
      mouseY >= this.y && mouseY <= this.y+100) &&
    (locked && mouseIsPressed && (mouseButton == LEFT))) {
        this.modColor=200;       
         
      }
   }
  update() {
   fill(this.modColor);
    rect(this.x, this.y, unitSize, unitSize); 
  }
}
//  //  //  // 
let bx;
let by;
let boxSize = 100;
let overBox = false;
let locked = false;
let xOffset = 0.0; 
let yOffset = 0.0; 
let unit = 100; // -> width / unit;
let unitSize=100; 
let count;
         
let mods = [];

function setup () {
   createCanvas(500, 500);
   rectMode(CORNER);
 bx = width/2.0;
  by = height/2.0;
 stroke(100);
 
 let wideCount = width / unit;
  let highCount = height / unit;
  count = wideCount * highCount;
    let index = 0;
  for (let y = 0; y < highCount; y++) {
    for (let x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit,20);
    }
  }
}
function draw() {
  background(0);
 for (let i = 0; i < count; i++) {
    mods[i].mouseClick();
    mods[i].update();    
   }
 // //  //  //  //
 // Test if the cursor is over the box 
  if (mouseX > bx && mouseX < bx+boxSize && 
      mouseY > by && mouseY < by+boxSize) {
    overBox = true;  
  } else {    overBox = false;  }
  // Draw the box
  fill(200);
  rect(bx, by, boxSize, boxSize);
}
 function mousePressed() {
  if(overBox) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
}
 function mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}
function mouseReleased() {
  locked = false;
}
