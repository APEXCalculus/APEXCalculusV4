import graph;
size(150,150);

// vector field F = < 1,0 > 


usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


defaultpen(fontsize(8));

bool incolor;
incolor = true;

pen colorone;
pen colortwo;

if(incolor) { 
	colorone = blue+1.5pt;
	colortwo = red+1.5pt;
	} else
	{
	colorone = black+1.5pt;
	colortwo = gray+1.5pt;
	};
	
pair xbounds=(-.2,1.2);
pair ybounds=(-.2,1.2);
real[] myxchoice={1};
real[] myychoice={1};

xaxis("",xbounds.x,xbounds.y,Ticks(myxchoice),arrow=Arrow(DefaultHead,size=4));
yaxis("",ybounds.x,ybounds.y,Ticks(myychoice),arrow=Arrow(DefaultHead,size=4));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0));
//label("\phantom{$x$}",(xbounds.x-0.05*(xbounds.y-xbounds.x),0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x)));
//label("\phantom{$y$}",(0,ybounds.x-0.05*(ybounds.y-ybounds.x)));

pair a=(-.1,-.1);
pair b=(1.1,1.1);

pair vectfunction(pair z) {return (1,0);}
path vector(pair t) {return -vectfunction(t)/2 -- vectfunction(t)/2;}

add(vectorfield(vector,a,b,5,5,rgb(.6,.6,.6)));

real f(real x) {return sqrt(x);}
pair F(real x) {return (x,.2);}

//real g(real x) {return x^4;}
//pair G(real x) {return (x,g(x));}

pair G(real t) {return (.2,t);}

draw(graph(F,0,1,operator ..),colorone,arrow=MidArrow(5));
draw(graph(G,1,0,operator ..),colortwo,arrow=MidArrow(5));
draw(graph(f,.4,1,operator ..),colorone+linetype(new real[] {4,2}),arrow=MidArrow(5));

label("$C_1$",(1,.25),filltype=Fill(white+opacity(.7)));
label("$C_2$",(.27,1),filltype=Fill(white+opacity(.7)));
label("$C_3$",(1.05,1),filltype=Fill(white+opacity(.7)));

