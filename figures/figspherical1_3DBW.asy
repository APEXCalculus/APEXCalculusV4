import graph3;
import apexstyle;


//ASY file for figspherical1_3D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(27,13,9);
defaultrender.merge=true;

usepackage("mathspec");texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={1};
defaultpen(0.5mm);

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-1.5,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


//Draw the plane  z=7-2x-2y
triple f(pair t) {
	return (t.y*cos(t.x),t.y*sin(t.x),sqrt(3)*t.y);//
}
surface s=surface(f,(0,0),(2*pi,1.5/sqrt(3)),16,4,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,0.5)+.1mm;
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//draw((-1.5,-1.5,2) -- (-1.5,1.5,2) -- (1.5,1.5,2) -- (1.5,-1.5,2) -- (-1.5,-1.5,2),rgb(0,0,.7)+.25mm);

triple g(real t) {return (1.5/sqrt(3)*cos(t),1.5/sqrt(3)*sin(t),1.5);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,rgb(0,0,0));

//Draw the plane  z=7-2x-2y
triple f(pair t) {
	return (t.x,t.x*sqrt(3),t.y);//
}
surface s=surface(f,(0,-1.25),(1.25,1.5),4,4,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen q=rgb(0.5,0,0)+.1mm;
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

draw((0,0,-1.25) -- (1.25,1.25*sqrt(3),-1.25) -- (1.25,1.25*sqrt(3),1.5) -- (0,0,1.5) -- (0,0,-1.5),rgb(0,0,0)+.25mm);


//Draw the plane  z=7-2x-2y
triple f(pair t) {
	return (sin(t.y)*cos(t.x),sin(t.y)*sin(t.x),cos(t.y));//
}
surface s=surface(f,(0,0),(2*pi,pi),16,16,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen q=rgb(0,.5,0)+.1mm;
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//dot((.5,sqrt(3)*.5,2),rgb(.1,.1,.1));

//draw((.5,sqrt(3)*.5,-.5)--(.5,sqrt(3)*.5,2.25));

triple g(real t) {return (1/2*cos(t),1/2*sin(t),1/2*sqrt(3));}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,rgb(0,0,0));

//(1.5/sqrt(3)*cos(t),1.5/sqrt(3)*sin(t),1.5)
draw((0,0,0) -- (1.5/sqrt(3)*cos(pi/3),1.5/sqrt(3)*sin(pi/3),1.5));

triple g(real t) {return (sin(t)*cos(pi/3),sin(t)*sin(pi/3),cos(t));}
path3 mypath=graph(g,0,pi,operator ..);
draw(mypath,rgb(0,0,0));

triple g(real t) {return (cos(t),sin(t),-.5);}
path3 mypath=graph(g,0,2*pi,operator ..);
//draw(mypath,rgb(0,.7,0)+.25mm);

triple g(real t) {return (t,sqrt(3)*t,2);}
path3 mypath=graph(g,-.866,.866,operator ..);
//draw(mypath,rgb(0,0,0));

//draw(s,emissive(gray+opacity(.3)),meshpen=invisible);


//draw(s,emissive(surfacepen),meshpen=apexmeshpen);



label("$\varphi=\frac{\pi}{6}$",(1.5/sqrt(3)*cos(2pi/3),1.5/sqrt(3)*sin(2pi/3),1.5),E);
label("$\rho=1$",(1.1*cos(pi/200),1.1*sin(pi/200),-.9));
label("$\theta=\frac{\pi}{3}$",(1.25,1.25*sqrt(3),1));

//draw((0,1,0)--(0,3,0)--(3,1,0)--cycle,curvepen);

// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);
//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//draw(s,palergb(.3,.3,.3));
//draw(s,lightrgb(.3,.3,.3),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.3,.3,.3));

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);
//draw(mypath,rgb(.3,.3,.3)+dashed+linewidth(2));

//pen p=rgb(0,0,1);
//draw(s,palergb(.3,.3,.3)+opacity(.5),meshpen=p,render(merge=true));