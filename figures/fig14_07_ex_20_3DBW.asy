import graph3;
import apexstyle;


//ASY file for fig14_07_ex_20_3D.asy in Chapter 14


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(11,11,80);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={5,10,15};
defaultpen(0.5mm);

pair xbounds=(-1.25,1.25);
pair ybounds=(-1.25,1.25);
pair zbounds=(-.25,18);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));



//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,t.y,10-5t.x-2t.y);//
}
surface s=surface(f,(-1,-1),(1,1),3,3,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);



//triple g(real t) {return (t,-2,1-t^2);}
//path3 mypath=graph(g,-1,1,operator ..);draw(mypath,rgb(.3,.3,.3)+linewidth(2));

//triple g(real t) {return (cos(t),3sin(t),-2cos(t)-3sin(t)+5);}
//path3 mypath=graph(g,0,2pi,operator ..);draw(mypath,rgb(.3,.3,.3)+linewidth(2));


//triple g(real t) {return (t,1-t,t*(1-t));}
//path3 mypath=graph(g,0,1,operator ..);draw(mypath,rgb(.3,.3,.3)+linewidth(2));

//triple g(real t) {return (t,t+1,t*(t+1));}
//path3 mypath=graph(g,-1,0,operator ..);draw(mypath,rgb(.3,.3,.3)+linewidth(2));


draw((1,1,3)--(-1,1,13)--(-1,-1,17)--(1,-1,7)--cycle,rgb(.3,.3,.3)+linewidth(2));



//label and arrow
//label("$z=1-x^2$",(0,1,1.55));
//draw((0,.9,1.45)--(0,.5,1.05),Arrow3(size=2mm));

//triple g(real t) {return (0,t,6-t^2);}
//path3 mypath=graph(g,-2,2,operator ..);draw(mypath,rgb(.3,.3,.3)+linewidth(2));


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
