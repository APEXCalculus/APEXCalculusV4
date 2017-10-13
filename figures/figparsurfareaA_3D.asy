import graph3;

//ASY file for figparsurfareaA_3D.asy in Chapter 14, developing surface area


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(15.5,18.6,18.1,true,true);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-.1,1.5);
pair ybounds=(-.1,1.5);
pair zbounds=(-.1,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


//Draw the top half of the surface z = x^2+2y^2
triple ff(pair t) {
	return (t.y*(cos(t.x)+.1*sin(3t.x)),t.y*sin(t.x),2-(t.y*(cos(t.x)+.1*sin(3t.x)))^2-(t.y*sin(t.x))^2);//
}

triple f(pair t) {
	return -ff(t)+(1,1,3);
}

surface s=surface(f,(0,0),(2pi/4,1),4,16,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);



surface s=surface(f,(2pi/16,9/16),(4pi/16,11/16),8,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,rgb(1,.5,.5)+opacity(.7),meshpen=invisible);

real u0=2pi/16;
real v0=9/16;
real du=2pi/16;
real dv=2/16;
triple ru=f((u0+du,v0))-f((u0,v0));
triple rv=f((u0+du,v0))-f((u0,v0+dv));
pen curvepen2=.3mm+red;

draw(f((u0+du,v0))--f((u0,v0)),curvepen2,Arrow3(5));
draw(f((u0+du,v0))--f((u0+du,v0+dv)),curvepen2,Arrow3(5));

label("\scriptsize$P$",f((u0+du,v0))+(.05,-.05,.1));
label("\scriptsize$M$",f((u0,v0))+(0,+.1,.1));
label("\scriptsize$\scriptsize Q$",f((u0+du,v0+dv))+(.05,-.05,.1));

dot(f((u0+du,v0)),.7mm+black);
dot(f((u0,v0)),.7mm+black);
dot(f((u0+du,v0+dv)),.7mm+black);


//triple g(real t) {
	//return (cos(t)+.1sin(3t),sin(t),0);
	//}
//pen curvepen=.3mm+blue;
////triple g(real t) {return(cos(t),sin(t),t/(2*pi));}
//path3 mypath=graph(g,0,2pi/4,operator ..);
//draw(surface(mypath--(0,0,0)--cycle),curvepen+opacity(.5));
//draw(mypath,curvepen);


//pen curvepen2=.3mm+red;
//
//// t.y = 9/16, t.x varies from 2pi/16 to 4pi/16
//triple g1(real t) {return (9/16*(cos(t)+.1*sin(3t)),9/16*sin(t),0);}
//path3 mypath1=graph(g1,2pi/16,4pi/16,operator ..);
//// t.y varies from 9/16 to 11/16, t.x = 4pi/16
//triple g2(real t) {return (t*(cos(4pi/16)+.1*sin(3*4pi/16)),t*sin(4pi/16),0);}
//path3 mypath2=graph(g2,9/16,11/16,operator ..);
//// t.y = 11/16, t.x varies from 4pi/16 to 2pi/16
//triple g3(real t) {return (11/16*(cos(t)+.1*sin(3t)),11/16*sin(t),0);}
//path3 mypath3=graph(g3,4pi/16,2pi/16,operator ..);
//// t.y varies from 10/16 to 9/16, t.x = 2pi/16
//triple g4(real t) {return (t*(cos(2pi/16)+.1*sin(3*2pi/16)),t*sin(2pi/16),0);}
//path3 mypath4=graph(g4,11/16,9/16,operator ..);
//
//draw(surface(mypath1--mypath2--mypath3--mypath4--cycle),curvepen2+opacity(.5));
//draw(mypath1--mypath2--mypath3--mypath4--cycle,curvepen2);



//(t.y*(cos(t.x)+.1*sin(3t.x)),t.y*sin(t.x),2-(t.y*(cos(t.x)+.1*sin(3t.x)))^2-(t.y*sin(t.x))^2)


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
//draw(mypath,blue+dashed+linewidth(2));

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));
