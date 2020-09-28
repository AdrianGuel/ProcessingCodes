float x1=600;
float x2=0.1;
float k=2;
float b=0.5;
float m=1;
float uk=0,ukm1=0,h=0.1;
float ek=0,ekm1=0,ekm2,r=300;
float kp=1,kd=2,ki=5,q0,q1,q2;

void setup() {
   size(800,200);
   smooth();
   q0=kp+kd/h+ki*h;
   q1=-kp-2*kd/h;
   q2=kd/h;
}

void draw(){
    background(255);
    x1=x1+h*x2;
    x2=x2+h*(-(k/m)*x1-(b/m)*x2+uk/m);
    ek=r-x1;
    uk=ukm1+q0*ek+q1*ekm1+q2*ekm2;
    ekm2=ekm1;
    ekm1=ek;
    ukm1=uk;
    stroke(100);
    strokeWeight(4);
    fill(0);
    if (x1>800){
    x1=800;}
    if (x1<0){
    x1=0;
    }
    ellipse(x1,height/2,20,20);  
    //saveFrame("line-######.png");
}
