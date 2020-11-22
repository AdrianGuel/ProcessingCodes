//Inverted pendulum controlled using a PID controller simulation
//Autor Adrian J Guel-Cortez 2020

float x1=0,x2=0.3,x3=PI+.001,x4=0.2;
float g=9.81,M = 0.5,m = 0.2,b = 0.1,I = 0.006,l = 0.3,laux=100;
float kp=100,kd=10,ki=1,k1=-1.0000,k2=-1.6567,k3=18.6854,k4=3.4594;
float ek=0,ek1=0,ek2=0,uk1=0;
float r=PI,h=0.1,F=0;

void setup(){
 size(800,500);
 smooth();
}

void draw(){
  background(255);
  stroke(100);
  strokeWeight(4);
  fill(0);
  rect(width/2+10*x1-55/2,height/2-20/2,55,20);
  line(width/2+10*x1,height/2,width/2+10*x1+laux*sin(x3),height/2+laux*cos(x3));
  ellipse(width/2+10*x1+laux*sin(x3),height/2+laux*cos(x3),20,20);
  saveFrame("line-######.png");
  //Euler method
  x1=x1+h*(x2);
  x2=x2+h*(((I+l*l*m)*(-b*x2+F+x4*x4*l*m*sin(x3))+ 
     l*m*cos(x3)*(-b*x2+F+(x4*x4+g)*l*m*sin(x3)))/((m+M)*(I+ 
     l*l*m+l*m*cos(x3))));
  x3=x3+h*(x4);
  x4=x4+h*(-(g*l*m*sin(x3))/(I+(l*l)*m+l*m*cos(x3)));
//PD control
//F=-(k1*x1+k2*x2+k3*x3+k4*x4);
//F=kp*(r-x3)+kd*(-x4);
//PID control recursivo
ek=r-x3;
F=uk1+(kp+kp*h/ki+kp*kd/h)*ek+(-2*kp*kd/h-kp)*ek1+(kp*kd/h)*ek2;  
uk1=F;
ek2=ek1;
ek1=ek;
  if (x1<0){
    x1=0;
  }
  if (x1>width){
    x1=width;
  }
}  
