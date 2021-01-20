float x1=PI/2;
float x2=0.1;
float g=9.81;
float L=100;
float m=1;
float h=0.1;

void setup() {
   size(800,500);
}

void draw(){
    background(255);
    x1=x1+h*x2;
    x2=x2+h*(-(g/L)*sin(x1));
    //delay(100);
    stroke(100);
    strokeWeight(4);
    fill(0);
    line(width/2,height/2,width/2+L*sin(x1),height/2+L*cos(x1));
    ellipse(width/2+L*sin(x1),height/2+L*cos(x1),20,20);
    //saveFrame("line-######.png");
}
