import graph3;
import apexstyle;


//ASY file for fig3d_proj3D.asy in Chapter 13


size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(6.7,-2,1.9);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
//real[] myxchoice={2};
//real[] myychoice={1,2};
//real[] myzchoice={2,4};
//defaultpen(0.5mm);

//pair xbounds=(-0.5,2.5);
//pair ybounds=(-0.5,2.25);
//pair zbounds=(-0.5,4.5);

//xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
//yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

//label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
//label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//plane z=2y
triple f(pair t) {
  return ((1+t.y/2*cos(t.x/2))*cos(t.x),(1+t.y/2*cos(t.x/2))*sin(t.x),t.y/2*sin(t.x/2));
}
surface s=surface(f,(0,-.3),(2*pi,.3),50,5);
pen p=rgb(0,0,1)+.1mm;
draw(s,emissive(rgb(.6,.6,1)+opacity(.7)),meshpen=p);

triple g(real t) {
  return f((t,.3));
}

path3 mypath=graph(g,-2pi,2pi,operator ..);
draw(mypath,rgb(.3,.3,.3)+linewidth(1));

//
//  Attempted various ways of getting a normal vector. Turns out all
//  were probably ok, it was just that the aspect ratio was off.
//  Used ``Aspect'' in the orthographic line above to fix it.
//

triple n(real t) {
	return (.5*cos(t)*sin(t/2),(1/2)*(sin(t/2)*sin(t)),-.5*cos(t/2));
	}
//(.5*cos(t)*sin(t/2),(1/4)*(cos(t/2)-cos(3*t/2)),-.5*cos(t/2))

//for(real i=0; i<=2*pi;i=i+2pi/10) {
//draw(f((i,0.)) -- (f((i,0.))+n(i)),rgb(1-i/(2pi),0,i/(2pi))+.2mm,Arrow3);
//}

//draw((f((0,0)).x,0,0) -- (1,0,-.5),rgb(1,0,0)+.2mm,Arrow3);
//draw((0.309017, 0.951057, 0.) -- (0.399835, 1.23057, -0.404508),rgb(.9,0,.1)+.2mm,Arrow3);
//draw((-0.809017, 0.587785, 0.) -- (-1.19373, 0.867294, -0.154508),rgb(.5,0,.5)+.2mm,Arrow3);
//draw((0.309017, -0.951057, 0.) -- (0.399835, -1.23057, 0.404508),rgb(.1,0,.9)+.2mm,Arrow3);

//
//  Final method of drawing normal vectors. 
//

for(real i=0; i<=2pi; i=i+2pi/20) {
triple a = f((i+.1,0))-f((i-.1,0));
triple b = f((i,.1))-f((i,-.1));
triple c = .3*(a.y*b.z-a.z*b.y,a.z*b.x-a.x*b.z,a.x*b.y-a.y*b.x)/sqrt(((a.y*b.z-a.z*b.y)^2+(a.z*b.x-a.x*b.z)^2+(a.x*b.y-a.y*b.x)^2));
draw(f((i,0)) -- (f((i,0))+c),rgb(1-i/(2pi),0,i/(2pi))+.2mm,Arrow3);
}

triple a = f((0+.1,0))-f((0-.1,0));
triple b = f((0,.1))-f((0,-.1));
triple c = .3*(a.y*b.z-a.z*b.y,a.z*b.x-a.x*b.z,a.x*b.y-a.y*b.x)/sqrt(((a.y*b.z-a.z*b.y)^2+(a.z*b.x-a.x*b.z)^2+(a.x*b.y-a.y*b.x)^2));
label("end",(f((0,0))+c-(0,0,.1)));

triple a = f((2pi+.1,0))-f((2pi-.1,0));
triple b = f((2pi,.1))-f((2pi,-.1));
triple c = .3*(a.y*b.z-a.z*b.y,a.z*b.x-a.x*b.z,a.x*b.y-a.y*b.x)/sqrt(((a.y*b.z-a.z*b.y)^2+(a.z*b.x-a.x*b.z)^2+(a.x*b.y-a.y*b.x)^2));
label("start",(f((2pi,0))+c+(0,0,.1)));

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