import graph3;
import apexstyle;


//ASY file for figstokes2_3D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(24,17,11.6);
defaultrender.merge=true;

usepackage("mathspec");texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-.1,1.1);
pair ybounds=(-.1,1.1);
pair zbounds=(-.1,1.1);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

draw((.5,sqrt(3)/2,1)--(.5,sqrt(3)/2,0)--(0,0,0),dashed);

draw(arc((0,0,0),(.5,0,0),(.25,sqrt(3)/4,0)),Arrow3(size=2mm));

dot((.5,sqrt(3)/2,1),rgb(0,0,0));

label("$\theta$",(.55*cos(pi/6),.55*sin(pi/6),.1));

label("$(r,\theta,z)$",(.5,sqrt(3)/2,1.1));

label("$z$",(.5,sqrt(3)/2+.1,.5));

label("$r$",(.20,sqrt(3)/4,0.05));

//draw(s,emissive(gray+opacity(.3)),meshpen=invisible);


//draw(s,emissive(surfacepen),meshpen=apexmeshpen);



//label("$\mathcal{S}$",(1,1,5));
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