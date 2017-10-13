import graph;
size(200,200);

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

real f(real x) {return exp(x);}
pair F(real x) {return (x,f(x));}

//xaxis("$x$");
//yaxis("$y$");
pair xbounds=(-2.25,2.25);
pair ybounds=(-2.25,2.25);
real[] myxchoice={-2,2};
real[] myychoice={-1,1};

//defaultpen(0.5mm);

xaxis("",xbounds.x,xbounds.y,Ticks(new real[]{-1,2}),arrow=Arrow(DefaultHead,size=4));
yaxis("",ybounds.x,ybounds.y,Ticks(myychoice),arrow=Arrow(DefaultHead,size=4));

//yaxis("",ybounds.x,ybounds.y,Ticks(N=0,Step=1,begin=true,end=true,beginlabel=false,endlabel=false,OmitTick(0)),arrow=Arrow(DefaultHead,size=4));
label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0));
label("\phantom{$x$}",(xbounds.x-0.05*(xbounds.y-xbounds.x),0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x)));
label("\phantom{$y$}",(0,ybounds.x-0.05*(ybounds.y-ybounds.x)));


//draw(graph(f,-4,2,operator ..),red);
//draw((0,0) -- (100,100));

pair a=(-2,-2);
pair b=(2,2);

//path vector(pair z) {return -(-z.y,z.x)--(-z.y,z.x);}

pair vectfunction(pair z) {return (z.y+z.x,z.x-z.y);}
path vector(pair t) {return -vectfunction(t)/2 -- vectfunction(t)/2;}

add(vectorfield(vector,a,b,8,8,blue));