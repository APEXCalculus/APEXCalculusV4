import graph3;
import apexstyle;

import palette;
 
// ASY file for figlinescalarfield2_3D.asy in Chapter 10
// The path is an elliptical helix <cos t, 2sin t, t/pi>; no specific surface.
// 
// This draws the  surface of the area we seek.

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(14.4,-6.86,4);
//(7.63,8.65,5);
//currentprojection=orthographic(2.5,4.6,1.9);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={2};
defaultpen(0.5mm);
pair xbounds=(-.2,2.5);
pair ybounds=(-.2,2.5);
pair zbounds=(-.1,2.1);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));



real r(real t) {return 3exp(-0.1*t);}
real x(real t) {return 1+cos(t);}
real y(real t) {return 1+sin(t);}
real z(real t) {return 1+sin(2*t);}

path3 p=graph(x,y,z,0,2*pi,50,operator ..);

tube T=tube(p,.05);
surface s=T.s;
s.colors(palette(s.map(ypart)+s.map(zpart),Gradient(white,black)));
draw(s,render(merge=true));
//dot((1,1.25,1.2),black);
draw(shift(1,1.25,1.2)*scale3(.05)*unitsphere);
//draw(T.center,thin());


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