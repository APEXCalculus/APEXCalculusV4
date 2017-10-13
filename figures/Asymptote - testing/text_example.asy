import graph3;

size(200,200,IgnoreAspect);
currentprojection=orthographic(4,2,3);
defaultpen(fontsize(10pt));

triple g(real t) {return (cos(t),sin(t),t);}
path3 mypath=graph(g,0,2pi,operator ..);

xaxis3("$x$",-1,1,black,OutTicks(2,1),Arrow3);
yaxis3("$y$",-1,1,black,OutTicks(2,1),Arrow3);
zaxis3("$z$",0,6,black,OutTicks(3,0),Arrow3);

draw(O--(-1,0,1),red+1bp,Arrow3);

draw(g(pi/2)--g(pi/2)+(-1,0,1),red+1bp,Arrow3);


draw(mypath,1bp+blue,Arrow3);

