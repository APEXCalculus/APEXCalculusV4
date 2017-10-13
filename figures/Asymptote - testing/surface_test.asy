import graph3;

size(200,200,IgnoreAspect);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");
defaultpen(fontsize(10pt));
defaultpen(0.75mm);

// surface of form z=f(x,y)
real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);



// surface defined parametrically
//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(-pi/2,-pi),(pi/2,pi),8,8,Spline);


// curve in space
//triple g(real t) {return (1.299*cos(t),.866*sin(t),.5);}
//path3 mypath=graph(g,0,2pi,operator ..);


// defining axes
real[] myxchoice={-1,1};
real[] myzchoice={-1,1};

defaultpen(1bp);
xaxis3("$x$",-1.7,1.7,black,InOutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("$y$",-1.7,1.7,black,OutTicks(myxchoice),Arrow3(size=3mm));
zaxis3("$z$",-0,1.7,black,OutTicks(myzchoice),Arrow3(size=3mm));

picture pic;
triple g(real t) {return (t,cos(2*pi/10*1)*t*(2-t),sin(2*pi/10*1)*t*(2-t));}
//triple g(real t) {return (t,cos(t),sin(t));}
path3 mypath=graph(g,0,2,operator ..);
draw(pic,mypath,rgb(0,0,1));
add(pic);

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);

defaultpen(0.5mm);
pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//draw(mypath,rgb(0,0,1)+1.5);


