//Inverted pendulum controlled using a PID controller simulation
//Autor Adrian J Guel-Cortez 2021
// the simulation uses the model from https://ctms.engin.umich.edu/CTMS/index.php?example=InvertedPendulum&section=SystemModeling
// the code also contains a classical recursive PID controller and a simple full-state feedback control that you can uncomment to see the control actions

float x1=10,x2=1,x3=PI+0.01,x4=0.2;
float g=9.81,M = 0.5,m = 0.2,b = 0.1,I = 0.006,l = 0.3,laux=100;
float kp=10,kd=2,ki=10,k1=-1.0000,k2=-1.6567,k3=18.6854,k4=3.4594;
float ek=0,ek1=0,ek2=0,uk1=0;
float r=PI,h=0.01,F=0;

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
  //saveFrame("line-######.png");
  //Euler method
  x1=x1+h*(x2);
  x2=x2+h*(-(b*x2-F)*(I+l*l*m)+l*m*(x4*(I+l*l*m)+g*l*m*cos(x3))*sin(x3))/((I+l*l*m)*(m+M)-l*l*m*m*cos(x3)*cos(x3));
  x3=x3+h*(x4);
  x4=x4+h*(2*l*m*(g*(M+m)*sin(x3)+cos(x3)*(-b*x2+F+x4*x4*l*m*sin(x3))))/(-2*I*(m+M)-l*l*m*(m+2*M)+l*l*m*m*cos(2*x3));
//Full-state feeedback controller
//F=-(k1*x1+k2*x2+k3*(x3-r)+k4*x4);

//recursive PID control
//ek=r-x3;
//F=uk1+(kp+ki*h+kd/h)*ek+(-2*kd/h-kp)*ek1+(kd/h)*ek2;  
//uk1=F;
//ek2=ek1;
//ek1=ek;
}  
