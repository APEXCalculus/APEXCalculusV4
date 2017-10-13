import graph3;

//ASY file for figdouble_intro23D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={-1,1};
real[] myzchoice={2};
defaultpen(0.5mm);

pair xbounds=(-1,2.5);
pair ybounds=(-1.25,1.25);
pair zbounds=(0,2.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface//{z=-.5*(x-1)^2-.5*(y)^2+2};
triple f(pair t) {
  return (t.x,t.y,-.5*(t.x-1)^2-.5*(t.y)^2+2);
}
surface s=surface(f,(-0.221,-1),(2.2,1),12,20,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//draw the grid in the xy-plane
//along fixed x
draw((0,-.3,0) -- (0,.3,0));
draw((.2,-.4,0) -- (.2,.4,0));
draw((0.4,-.6,0) -- (.4,.6,0));
draw((0.6,-.7,0) -- (.6,.7,0));
draw((.8,-.8,0) -- (.8,.8,0));
draw((1,-.8,0) -- (1,.8,0));
draw((1.2,-.8,0) -- (1.2,.8,0));
draw((1.4,-.8,0) -- (1.4,.8,0));
draw((1.6,-.7,0) -- (1.6,.7,0));
draw((1.8,-.6,0) -- (1.8,.6,0));
draw((2,-.4,0) -- (2,.4,0));
//along fixed y
draw((.8,.8,0) -- (1.4,.8,0));
draw((.6,.7,0) -- (1.6,.7,0));
draw((.4,.6,0) -- (1.8,.6,0));
draw((.4,.5,0) -- (1.8,.5,0));
draw((.2,.4,0) -- (2,.4,0));
draw((0,.3,0) -- (2,.3,0));
draw((0,.2,0) -- (2,.2,0));
draw((0,.1,0) -- (2,.1,0));
draw((.8,-.8,0) -- (1.4,-.8,0));
draw((.6,-.7,0) -- (1.6,-.7,0));
draw((.4,-.6,0) -- (1.8,-.6,0));
draw((.4,-.5,0) -- (1.8,-.5,0));
draw((.2,-.4,0) -- (2,-.4,0));
draw((0,-.3,0) -- (2,-.3,0));
draw((0,-.2,0) -- (2,-.2,0));
draw((0,-.1,0) -- (2,-.1,0));

//Draw curve on top of the grid in xy plane ({cos(x)*(1+cos(2*x))},{sin(x)*(1+cos(2*x))},0);
triple g(real t) {return (cos(t)*(1+cos(2*t)),sin(t)*(1+cos(2*t)),0);}
path3 mypath=graph(g,-pi/2,pi/2,operator ..);
draw(mypath,2bp+blue);

//Draw curve on the surface //{z=-.5*(cos(t)*(1+cos(2*t))-1)^2-.5*(sin(t)*(1+cos(2*t)))^2+2};
triple f(pair t) {
  return (cos(t.x)*(1+cos(2*t.x)),sin(t.x)*(1+cos(2*t.x)),-.5*(cos(t.x)*(1+cos(2*t.x))-1)^2-.5*(sin(t.x)*(1+cos(2*t.x)))^2+2);
}
surface s=surface(f,(-pi/2,0),(pi/2,2*pi),8,8,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),blue+linewidth(2));

//Draw the top of the column on the surface
//draw((1.6,0.3,1.865)--(1.8,.3,1.725),blue+linewidth(2));
//draw((1.8,0.3,1.7)--(1.8,.4,1.7),blue+linewidth(2));
//draw((1.8,0.4,1.7)--(1.6,.4,1.7),blue+linewidth(2));
//draw((1.6,0.4,1.7)--(1.6,.3,1.7),blue+linewidth(2));
draw((1.6,.3,1.775) -- (1.6,.4,1.74) -- (1.8,.4,1.6) -- (1.8,.3,1.635) --cycle,blue+linewidth(2));

//Draw the rectangular column
//base
draw((1.6,0.3,0)--(1.8,.3,0)--(1.8,.4,0)--(1.6,.4,0)--cycle,red);
//verticals plotted to average of 4 function heights
draw((1.6,0.3,0)--(1.6,.3,1.7),red);//base
draw((1.8,0.3,0)--(1.8,.3,1.7),red);//base
draw((1.8,0.4,0)--(1.8,.4,1.7),red);//base
draw((1.6,0.4,0)--(1.6,.4,1.7),red);//base
//top
draw((1.6,0.3,1.7)--(1.8,.3,1.7)--(1.8,.4,1.7)--(1.6,.4,1.7)--cycle,red);

//Shade the column now
import three;
path3 p =  (1.6,0.3,0)--(1.8,.3,0) -- (1.8,0.3,1.7)--(1.6,.3,1.7); //Left
draw(surface(p -- cycle), emissive(red+opacity(0.7)));
path3 p =  (1.6,0.3,1.7)--(1.8,.3,1.7)--(1.8,.4,1.7)--(1.6,.4,1.7); //top
draw(surface(p -- cycle), emissive(red+opacity(0.7)));
path3 p =  (1.6,0.4,0)--(1.8,.4,0) -- (1.8,0.4,1.7)--(1.6,.4,1.7); //right
draw(surface(p -- cycle), emissive(red+opacity(0.7)));
path3 p =  (1.6,0.3,0)--(1.6,.4,0) -- (1.6,0.4,1.7)--(1.6,.3,1.7); //back
draw(surface(p -- cycle), emissive(red+opacity(0.7)));
path3 p =  (1.8,0.3,0)--(1.8,.4,0) -- (1.8,0.4,1.7)--(1.8,.3,1.7); //front
draw(surface(p -- cycle), emissive(red+opacity(0.7)));
path3 p =  (1.6,0.3,0)--(1.8,.3,0)--(1.8,.4,0)--(1.6,.4,0); //bottom
draw(surface(p -- cycle), emissive(red+opacity(0.7)));



// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));
