import graph3;
import apexstyle;


//ASY file for figspherical1_3D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(16.5,1,4.8);
defaultrender.merge=true;

usepackage("mathspec");texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-1.1,1.1);
pair ybounds=(-1.1,1.1);
pair zbounds=(-.1,1.1);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

real r1=.4;
real r2=.6;
real t1=pi/6;
real t2=4pi/3;
real z1=.4;
real z2=.8;

// (t.x*cos(t.y),t.x*sin(t.y),z)
//Draw the plane  z=7-2x-2y
triple f(pair t) {
	return (r1*cos(t.y),r1*sin(t.y),t.x);//
}
surface s=surface(f,(z1,t1),(z2,t2),4,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,0.7)+.1mm;
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

triple f(pair t) {
	return (r2*cos(t.y),r2*sin(t.y),t.x);//
}
surface s=surface(f,(z1,t1),(z2,t2),4,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

triple f(pair t) {
	return (t.x*cos(t1),t.x*sin(t1),t.y);//
}
surface s=surface(f,(r1,z1),(r2,z2),4,4,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

triple f(pair t) {
	return (t.x*cos(t2),t.x*sin(t2),t.y);//
}
surface s=surface(f,(r1,z1),(r2,z2),4,4,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

triple f(pair t) {
	return (t.x*cos(t.y),t.x*sin(t.y),z1);//
}
surface s=surface(f,(r1,t1),(r2,t2),4,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

triple f(pair t) {
	return (t.x*cos(t.y),t.x*sin(t.y),z2);//
}
surface s=surface(f,(r1,t1),(r2,t2),4,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


draw((0,0,0) -- .8*(cos(t1),sin(t1),0),dashed+.25mm);
draw((0,0,0) -- .8*(cos(t2),sin(t2),0),dashed+.25mm);

draw(arc((0,0,0),.3*(1,0,0),.3*(cos(t2),sin(t2),0),(0,0,1)),black+.25mm,Arrow3(size=2mm));
draw(arc((0,0,0),.5*(1,0,0),.3*(cos(t1),sin(t1),0),(0,0,1)),black+.25mm,Arrow3(size=2mm));

label("\scriptsize$\theta_1$",.6(cos(t1/2),sin(t1/2),-.05));
label("\scriptsize$\theta_2$",.5(cos(t2/1.5),sin(t2/1.5),0));

draw ((r2*cos(t2),r2*sin(t2),z1) -- (r2*cos(t2),r2*sin(t2),0),dashed+.25mm);
draw ((r2*cos(t1),r2*sin(t1),z1) -- (r2*cos(t1),r2*sin(t1),0),dashed+.25mm);

draw ((0,0,z2) -- (r2*cos(t2/1.5),r2*sin(t2/1.5),z2),dashed+.25mm);
draw ((0,0,z2) -- (r1*cos(t2/3),r1*sin(t2/3),z2),dashed+.25mm);


label("\scriptsize$r_2$",(r2*.95*cos(t2/1.5),r2*.95*sin(t2/1.5),z2+.05));
label("\scriptsize$r_1$",(r1*.8*cos(t2/3),r1*.8*sin(t2/3),z2+.05));


draw((0,0,z1) -- (r1*cos(t1),r1*sin(t1),z1),dashed+.25mm);
draw((0,0,z2) -- (r1*cos(t1),r1*sin(t1),z2),dashed+.25mm);

label("\scriptsize$z_1$",(0,0,z1),W);
label("\scriptsize$z_2$",(0,0,z2),W);




//dot((0,0,2.799),rgb(0,0,0)+1.2mm);








//draw((-1.5,-1.5,2) -- (-1.5,1.5,2) -- (1.5,1.5,2) -- (1.5,-1.5,2) -- (-1.5,-1.5,2),rgb(0,0,.7)+.25mm);

triple g(real t) {return (1.5/sqrt(3)*cos(t),1.5/sqrt(3)*sin(t),1.5);}
path3 mypath=graph(g,0,2*pi,operator ..);
//draw(mypath,rgb(0,0,.8));

//Draw the plane  z=7-2x-2y
triple f(pair t) {
	return (t.x,t.x*sqrt(3),t.y);//
}
surface s=surface(f,(-1.25,-1.5),(1.25,1.5),8,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen q=rgb(0.7,0,0);
//draw(s,emissive(rgb(1,.6,.6)+opacity(.7)),meshpen=q);

//draw((-1.25,-1.25*sqrt(3),-1.5) -- (1.25,1.25*sqrt(3),-1.5) -- (1.25,1.25*sqrt(3),1.5) -- (-1.25,-1.25*sqrt(3),1.5) -- (-1.25,-1.25*sqrt(3),-1.5),rgb(.8,0,0)+.25mm);


//Draw the plane  z=7-2x-2y
triple f(pair t) {
	return (sin(t.y)*cos(t.x),sin(t.y)*sin(t.x),cos(t.y));//
}
surface s=surface(f,(0,0),(2*pi,pi),16,16,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen q=rgb(0,.7,0);
//draw(s,emissive(rgb(.5,.9,.5)+opacity(.7)),meshpen=q);

//dot((.5,sqrt(3)*.5,2),rgb(.1,.1,.1));

//draw((.5,sqrt(3)*.5,-.5)--(.5,sqrt(3)*.5,2.25));

triple g(real t) {return (1/2*cos(t),1/2*sin(t),1/2*sqrt(3));}
path3 mypath=graph(g,0,2*pi,operator ..);
//draw(mypath,rgb(0,0,0));

//(1.5/sqrt(3)*cos(t),1.5/sqrt(3)*sin(t),1.5)
//draw((1.5/sqrt(3)*cos(4*pi/3),1.5/sqrt(3)*sin(4*pi/3),1.5) -- (0,0,0) -- (1.5/sqrt(3)*cos(pi/3),1.5/sqrt(3)*sin(pi/3),1.5));

triple g(real t) {return (sin(t)*cos(pi/3),sin(t)*sin(pi/3),cos(t));}
path3 mypath=graph(g,0,2*pi,operator ..);
//draw(mypath,rgb(0,0,0));





//draw(s,emissive(gray+opacity(.3)),meshpen=invisible);


//draw(s,emissive(surfacepen),meshpen=apexmeshpen);



//label("$\varphi=\frac{\pi}{6}$",(1.5/sqrt(3)*cos(2pi/3),1.5/sqrt(3)*sin(2pi/3),1.5),E);
//label("$\rho=1$",(1.1*cos(pi/6),1.1*sin(pi/6),-.5));
//label("$\theta=\frac{\pi}{3}$",(1.25,1.25*sqrt(3),1));

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