import graph3;

//ASY file for figcrosspparallelpiped.asy in Chapter 10
// NOT SHADED!!


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

// setup and draw the axes
//real[] myxchoice={};
//real[] myychoice={};
//real[] myzchoice={};
defaultpen(0.5mm);
//xaxis3("$x$",-0.5,1,black,OutTicks(myxchoice),Arrow3(size=3mm));
//yaxis3("$y$",-1,1,black,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("$z$",-0.5,1.5,black,OutTicks(myzchoice),Arrow3(size=3mm));

//Draw the parallelepiped with u=<1,1,0>, v=<-1,1,0>, w=<0,1,1>
draw((0,0,0)--(1,1,0), Arrow3(size=3mm));// u
label("$\vec{u}$",(1,1,0),W);
draw((0,0,0)--(-1,1,0), Arrow3(size=3mm));// v
label("$\vec{v}$",(-1,1,0),N);
draw((0,0,0)--(0,1,1), Arrow3(size=3mm));// w
label("$\vec{w}$",(0,1,1),W);
//shifted u to get the other edges of the box
draw((-1,1,0)--(0,2,0));// u shifted to v
draw((0,1,1)--(1,2,1));// u shifted to w
draw((-1,2,1)--(0,3,1));// u shifted to v+w
//shifted v to get the other edges of the box
draw((1,1,0)--(0,2,0));// v shifted to u
draw((0,1,1)--(-1,2,1));// v shifted to w
draw((1,2,1)--(0,3,1));// v shifted to u+w
//shifted w to get the other edges of the box
draw((1,1,0)--(1,2,1));// w shifted to u
draw((-1,1,0)--(-1,2,1));// w shifted to v
draw((0,2,0)--(0,3,1));// w shifted to u+v



// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));
