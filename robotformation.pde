//Code of line robot formation
//Autor: Adrian-Josue Guel-Cortez
//Please cite the following work if you use this code in your project or presentation:
//Ramos-Avila, Daniel, César Rodrıguez, Jonathan Hernández-Carrillo, A. J. Guel-Cortez, 
//Mihir Sen, César Méndez-Barrios, Emilio González-Galván, and Bill Goodwine.
//"Experiments with PD-controlled robots in ring formation." 2019

import grafica.*;
int Nrobots=10;
float[] x1= new float[Nrobots];
float[] x2=new float[Nrobots];
float kp=10,kd=5;
float[] b=new float[Nrobots];
float[] m=new float[Nrobots];
float[] F=new float[Nrobots];
float d=100,t=0;
int i=0;
void setup() {
   size(2000,350);
   smooth();
   for (int i=0;i<Nrobots;i++){
     m[i]=random(1,1);
     x1[i]=random((1500/Nrobots)*i,(1500/Nrobots)*(i+1));
     x2[i]=0;
     b[i]=random(0,2);
     F[i]=0;
   }
   //x1[Nrobots-1]=1500;
}

void draw(){
    background(255);
    for (int i=0;i<Nrobots-1;i++){
    x1[i]=x1[i]+0.1*x2[i];
    x2[i]=x2[i]+0.1*(1/m[i])*(-b[i]*x2[i]+F[i]);
    F[i]=kp*(-d-(x1[i]-x1[i+1]))-kd*(x2[i]-x2[i+1]);
    }
    t+=0.1;
    F[Nrobots-1]=0;//100*sin(3*t)+randomGaussian()*10;
    x1[Nrobots-1]=x1[Nrobots-1]+0.1*x2[Nrobots-1];
    x2[Nrobots-1]=x2[Nrobots-1]+0.1*(1/m[Nrobots-1])*(-b[Nrobots-1]*x2[Nrobots-1]+F[Nrobots-1]);
    delay(100);
    stroke(100);
    strokeWeight(4);
    for (int i=0;i<Nrobots;i++){
    ellipse(x1[i],height/2,10*m[i],10*m[i]);
    if (i==Nrobots-2){ fill(155);
    }
    else{fill(0);}
    }
    //line(x1, height/2,x3, height/2);
    //saveFrame("line-######.png");
}
