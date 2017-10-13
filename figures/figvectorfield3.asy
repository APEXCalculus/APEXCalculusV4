import graph;
size(150,150);

// vector field F = < cos y, sin x > 

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

defaultpen(fontsize(8));

real f(real x) {return exp(x);}
pair F(real x) {return (x,f(x));}

pair xbounds=(-1.1,1.1);
pair ybounds=(-1.1,1.1);
real[] myxchoice={-1,1};
real[] myychoice={-1,1};

xaxis("",xbounds.x,xbounds.y,Ticks(myxchoice),arrow=Arrow(DefaultHead,size=4));
yaxis("",ybounds.x,ybounds.y,Ticks(myychoice),arrow=Arrow(DefaultHead,size=4));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0));
label("\phantom{$x$}",(xbounds.x-0.05*(xbounds.y-xbounds.x),0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x)));
label("\phantom{$y$}",(0,ybounds.x-0.05*(ybounds.y-ybounds.x)));

pair a=(.3,.3);
pair b=(1,1);

pair vectfunction(pair z) {if ((z.x==0) && (z.y==0)) {return (0,0);}
 return (-z.x/(z.x^2+z.y^2)^(3/2),-z.y/(z.x^2+z.y^2)^(3/2));}
path vector(pair t) {return -vectfunction(t)/2 -- vectfunction(t)/2;}

add(vectorfield(vector,a,b,2,2,blue));

pair aa=(-1,.3);
pair bb=(-.3,1);

pair vectfunction(pair z) {if ((z.x==0) && (z.y==0)) {return (0,0);}
 return (-z.x/(z.x^2+z.y^2)^(3/2),-z.y/(z.x^2+z.y^2)^(3/2));}
path vectorb(pair t) {return -vectfunction(t)/2 -- vectfunction(t)/2;}

add(vectorfield(vectorb,aa,bb,2,2,blue));

pair aa=(-1,-1);
pair bb=(-.3,-.3);

pair vectfunction(pair z) {if ((z.x==0) && (z.y==0)) {return (0,0);}
 return (-z.x/(z.x^2+z.y^2)^(3/2),-z.y/(z.x^2+z.y^2)^(3/2));}
path vectorb(pair t) {return -vectfunction(t)/2 -- vectfunction(t)/2;}

add(vectorfield(vectorb,aa,bb,2,2,blue));

pair aa=(.3,-1);
pair bb=(1,-.3);

pair vectfunction(pair z) {if ((z.x==0) && (z.y==0)) {return (0,0);}
 return (-z.x/(z.x^2+z.y^2)^(3/2),-z.y/(z.x^2+z.y^2)^(3/2));}
path vectorb(pair t) {return -vectfunction(t)/2 -- vectfunction(t)/2;}

add(vectorfield(vectorb,aa,bb,2,2,blue));