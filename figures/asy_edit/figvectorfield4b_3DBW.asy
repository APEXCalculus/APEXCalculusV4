import graph3;
import apexstyle;

import palette;
 


// ASY file for figlinescalarfield2_3D.asy in Chapter 10
// The path is an elliptical helix <cos t, 2sin t, t/pi>; no specific surface.
// 
// This draws the  surface of the area we seek.

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(10.5,-9,18.3);
//(7.63,8.65,5);
//currentprojection=orthographic(10.5,-9,18.3);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={3};
defaultpen(0.5mm);
pair xbounds=(-1.1,1.1);
pair ybounds=(-1.1,1.1);
pair zbounds=(-1,4);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


//currentlight=(1,-1,0.5);

real f(pair z) {return -z.x^2-2*z.y^2+3;}

path3 gradient(pair z) {
  static real dx=sqrtEpsilon, dy=dx;
  return (0,0,0)--((f(z+dx)-f(z-dx))/2dx,(f(z+I*dy)-f(z-I*dy))/2dy,0);
}

pair a=(-.9,-.9);
pair b=(.9,.9);

triple F(pair z) {return (z.x,z.y,0);}

add(vectorfield(gradient,F,a,b,12,12,rgb(.3,.3,.3)));

pen p=rgb(0,0,.7);
draw(surface(f,a,b,Spline),rgb(.6,.6,1)+opacity(.7),meshpen=p);
//draw(surface(f,a,b,Spline),gray+opacity(0.5));

//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);

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
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,palergb(.3,.3,.3)+opacity(.5),meshpen=p,render(merge=true));

//draw(s,palergb(.3,.3,.3));
//draw(s,lightrgb(.3,.3,.3),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.3,.3,.3));