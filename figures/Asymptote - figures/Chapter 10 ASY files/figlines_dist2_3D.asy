import graph3;

//ASY file for figlines_dist23D.asy in Chapter 10

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

// setup and draw the axes
//real[] myxchoice={2,4};
//real[] myychoice={0,10};
//real[] myzchoice={-5,5};
defaultpen(0.5mm);
//pair xbounds=(-1,4.5);
//pair ybounds=(-1,11);
//pair zbounds=(-5.5,5.5);

//xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
//yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

//label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
//label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


// Use lines L1 1+3t,2-t,t  and L2 -2+4t,3+t,5+2t
//draw P1 (t=0) and vector d1 at P1 (t=1)
dotfactor=3;dot((1,2,0));label("$P_1$",(1,2,0),N);
draw((1,2,0)--(4,1,1),red,Arrow3(size=2mm));
label("$\vec{d}_1$",(4,1,1),N);
//draw P2 (t=-1.5) and vector d2 at P2 (t=-0.5)
dotfactor=3;dot((-8,1.5,2));label("$P_2$",(-8,1.5,2),N);
draw((-8,1.5,2)--(-4,2.5,4),red,Arrow3(size=2mm));
label("$\vec{d}_2$",(-4,2.5,4),N);

//draw vector P1 to P2
draw((1,2,0)--(-8,1.5,2),black,Arrow3(size=2mm));
label("$\overrightarrow{P_1 P_2}$",(-3.5,1.75,1),W);

//draw the lines 1+3t,2-t,t  and -2+4t,3+t,5+2t
draw((-5,4,-2)--(7,0,2),blue);//L1
draw((-14,0,-1)--(2,4,7),blue);//L2



// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-2,2,operator ..);

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);