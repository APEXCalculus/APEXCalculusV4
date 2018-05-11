import graph3;
import apexstyle;


//ASY file for figcylindrical2_3D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(22,22,11);
defaultrender.merge=true;

usepackage("mathspec");texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={1,3,5};
defaultpen(0.5mm);

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-.5,6);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


//Draw the plane  z=7-2x-2y
triple f(pair t) {
	return (2*t.y*cos(t.x),2*t.y*sin(t.x),sqrt(4-4*t.y^2)+3);//
}
surface s=surface(f,(0,0),(2pi,1),16,16,Spline);
pen p=rgb(0,0,0.5)+.1mm;
draw(s,emissive(rgb(.6,.6,1)+opacity(.7)),meshpen=p);

//draw((-1.5,-1.5,2) -- (-1.5,1.5,2) -- (1.5,1.5,2) -- (1.5,-1.5,2) -- (-1.5,-1.5,2),rgb(0,0,.7)+.25mm);


//Draw the plane  z=7-2x-2y
triple f(pair t) {
	return (2*cos(t.x),2*sin(t.x),t.y);//
}
surface s=surface(f,(0,0),(2*pi,3),16,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,0.5)+.1mm;
draw(s,emissive(rgb(.6,.6,1)+opacity(.7)),meshpen=p);



//draw(s,emissive(gray+opacity(.3)),meshpen=invisible);


//draw(s,emissive(surfacepen),meshpen=apexmeshpen);




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