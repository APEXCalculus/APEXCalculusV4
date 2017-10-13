import graph3;
import apexstyle;


//ASY file for figsurfint1_3D.asy in Chapter 14


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(16,12.5,14);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={2};
real[] myzchoice={3};
defaultpen(0.5mm);

pair xbounds=(-.1,2.5);
pair ybounds=(-.1,2.5);
pair zbounds=(-.1,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));



//Draw the plane 2x+y+z=3 over the triangle bounded
// by coordinate planes and y=2-2x
triple f(pair t) {
	return (t.x,t.y*(2-2*t.x),3-2*t.x-t.y*(2-2t.x));//
}
surface s=surface(f,(0,0),(1,1),8,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,emissive(gray+opacity(.6)),meshpen=invisible);


pen curvepen=.3mm+rgb(.3,.3,.3);

draw((1,0,0)--(0,0,0)--(0,2,0)--cycle,curvepen);
draw(f((0,0))--f((1,0))--f((0,1))--f((0,0)),.3mm+black);

//draw(surface((1,0,0)--(0,0,0)--(0,2,0)--cycle),curvepen+opacity(.5));
triple f(pair t) {
	return (t.x,t.y*(2-2*t.x),0);//
}
surface s=surface(f,(0,0),(1,1),4,4,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,emissive(gray),meshpen=invisible);



//draw((1,0,0)--(0,0,0)--(0,2,0)--cycle,curvepen);
//draw(f((0,0))--f((1,0))--f((0,1))--f((0,0)),.3mm+black);

//pen curvepen=.3mm+rgb(.3,.3,.3);
//triple g(real t) {return(cos(t),-1,2sin(t));}
//path3 mypath=graph(g,0,2pi,operator ..);
//draw(mypath,curvepen);
//
//triple g(real t) {return(cos(t),2,2sin(t));}
//path3 mypath=graph(g,0,2pi,operator ..);
//draw(mypath,curvepen);

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