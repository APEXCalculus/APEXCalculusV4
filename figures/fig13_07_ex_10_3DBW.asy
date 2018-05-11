import graph3;
import apexstyle;


//ASY file for figspherical1_3D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(16,.9,8.1);
defaultrender.merge=true;

usepackage("mathspec");texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-.6,.6);
pair ybounds=(-.6,.6);
pair zbounds=(-.1,1);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


real t1=pi/3;
real t2=7pi/6;
real p1=pi/6-.2;
real p2=pi/6+.2;
real r1=.75;
real r2=.9;



//Draw the plane  z=7-2x-2y
triple f(pair t) {
	return (r1*cos(t.x)*sin(t.y),r1*sin(t.x)*sin(t.y),r1*cos(t.y));//
}
surface s=surface(f,(t1,p1),(t2,p2),4,4,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,0.7)+.1mm;
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


triple f(pair t) {
	return (r2*cos(t.x)*sin(t.y),r2*sin(t.x)*sin(t.y),r2*cos(t.y));//
}
surface s=surface(f,(t1,p1),(t2,p2),4,4,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


triple f(pair t) {
	return (t.y*cos(t.x)*sin(p1),t.y*sin(t.x)*sin(p1),t.y*cos(p1));//
}
surface s=surface(f,(t1,r1),(t2,r2),4,4,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


triple f(pair t) {
	return (t.y*cos(t.x)*sin(p2),t.y*sin(t.x)*sin(p2),t.y*cos(p2));//
}
surface s=surface(f,(t1,r1),(t2,r2),4,4,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


triple f(pair t) {
	return (t.y*cos(t1)*sin(t.x),t.y*sin(t1)*sin(t.x),t.y*cos(t.x));//
}
surface s=surface(f,(p1,r1),(p2,r2),4,4,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


triple f(pair t) {
	return (t.y*cos(t2)*sin(t.x),t.y*sin(t2)*sin(t.x),t.y*cos(t.x));//
}
surface s=surface(f,(p1,r1),(p2,r2),4,4,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


//
// lines for phi
//
draw((r1*cos(t1)*sin(p1),r1*sin(t1)*sin(p1),r1*cos(p1)) -- (0,0,0) -- (r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),r1*cos(p2)),black+.25mm+dashed);

//draw(arc((0,0,0),(r1*cos(t1)*sin(p1)/2.5,r1*sin(t1)*sin(p1)/2.5,r1*cos(p1)/2.5),(r1*cos(t1)*sin(p2)/2.5,r1*sin(t1)*sin(p2)/2.5,r1*cos(p2)/2.5)),black+.25mm,Arrow3(size=1.5mm));

//label("\scriptsize$\Delta\varphi$",.95*(r1*cos(t1)*sin((p1+p2)/2)/2,r1*sin(t1)*sin((p1+p2)/2)/2,r1*cos((p1+p2)/2)/2));



//
//  lines for theta
//

draw((0,0,0) -- (r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),0),black+.25mm+dashed);

draw((0,0,0) -- (r1*cos(t2)*sin(p2),r1*sin(t2)*sin(p2),0),black+.25mm+dashed);

draw(arc((0,0,0),.25*(r1,0,0),.5*(r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),0)),black+.25mm,Arrow3(size=1.5mm));

draw(arc((0,0,0),.4*(r1,0,0),.4*(r1*cos(t2)*sin(p2),r1*sin(t2)*sin(p2),0),(0,0,1)),black+.25mm,Arrow3(size=1.5mm));

label("\scriptsize$\theta_1$",.25*(r1*cos(t1/2)*sin(p2),r1*sin(t1/2)*sin(p2),0));
label("\scriptsize$\theta_2$",.5*(r1*cos(t2/2)*sin(p2),r1*sin(t2/2)*sin(p2),0));

//
// lines for rho
//

draw(arc((0,0,0),(r1*cos(t1)*sin(0),r1*sin(t1)*sin(0),r1*cos(0)),(r1*cos(t1)*sin(p1),r1*sin(t1)*sin(p1),r1*cos(p1))),black+.25mm+dashed);

draw(arc((0,0,0),(r2*cos(t1)*sin(0),r2*sin(t1)*sin(0),r2*cos(0)),(r2*cos(t1)*sin(p1),r2*sin(t1)*sin(p1),r2*cos(p1))),black+.25mm+dashed);


label("\scriptsize$\rho_1$",(0,0,r1),W);
label("\scriptsize$\rho_2$",(0,0,r2),W);

real poff = -0.05;

//draw((r1*cos(t1)*sin(p1+poff),r1*sin(t1)*sin(p1+poff),r1*cos(p1+poff)) -- (r2*cos(t1)*sin(p1+poff),r2*sin(t1)*sin(p1+poff),r2*cos(p1+poff)),black+.25mm,Arrows3(size=1.5mm));

//label("\scriptsize$\rho$",(0,-.04,.5*r1));

//draw((0,-.02,.01) -- (0,-.02,.99*r1),black+.25mm,Arrows3(size=1.5mm));


//
//  lines for theta length
//

//draw((r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),r1*cos(p2)-.05) -- (r1*cos(t2)*sin(p2),r1*sin(t2)*sin(p2),r1*cos(p2)-.05),black+.25mm,Arrows3(size=1.5mm));

//label("\scriptsize$\rho\sin(\varphi)\Delta\theta$",1.5*((r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),r1*cos(p2)-.05) + (r1*cos(t2)*sin(p2),r1*sin(t2)*sin(p2),r1*cos(p2)-.05)+(0,0,-.05))/2+(0,0,-.25),S);

//draw(1.5*((r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),r1*cos(p2)-.05) + (r1*cos(t2)*sin(p2),r1*sin(t2)*sin(p2),r1*cos(p2)-.05)+(0,0,-.05))/2 + (0,0,-.25) -- 1.05((r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),r1*cos(p2)-.05) + (r1*cos(t2)*sin(p2),r1*sin(t2)*sin(p2),r1*cos(p2)-.05))/2+(0,0,-.01),black+.25mm+dashed,Arrow3(size=1.5mm));

//
// lines for phi length
//



draw(arc((0,0,0),.9*(0,0,r1),.95*(r1*cos(t1)*sin(p1),r1*sin(t1)*sin(p1),r1*cos(p1))),black+.25mm,Arrows3(size=1.5mm));
label("\scriptsize$\varphi_1$",.9*(r1*cos(t1)*sin(p1/2),r1*sin(t1)*sin(p1/2),r1*cos(p1/2)),S);


label("\scriptsize$\varphi_2$",.68*(r1*cos(t1)*sin(p1+(p2-p1)/2),r1*sin(t1)*sin(p1+(p2-p1)/2),r1*cos(p1+(p2-p1)/2)),S);
draw(arc((0,0,0),.7*(0,0,r1),.7*(r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),r1*cos(p2))),black+.25mm,Arrows3(size=1.5mm));






//(p1+p2)/2
//dot((0,0,2.799),rgb(0,0,0)+1.1.5mm);








//triple g(real t) {return (1.5/sqrt(3)*cos(t),1.5/sqrt(3)*sin(t),1.5);}
//path3 mypath=graph(g,0,2*pi,operator ..);
//draw(mypath,rgb(0,0,.8));







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