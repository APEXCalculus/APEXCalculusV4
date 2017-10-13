import graph;
size(150,150);

// vector field F = < cos y, sin x > 

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
pen mainvect;
pen bgvect;

if(incolor) { 
	colorone = blue+1.5pt+linejoin(0);
	colortwo = red+1.5pt+linejoin(0);
	mainvect = blue + linejoin(0);
	bgvect = rgb(.6,.6,.6)+linejoin(0);
	} else
	{
	colorone = black+1.5pt+linejoin(0);
	colortwo = gray+1.5pt+linejoin(0);
	mainvect = black + linejoin(0);
	bgvect = rgb(.6,.6,.6)+linejoin(0);
	};
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

pair a=(-.9,-.9);
pair b=(.9,.9);

pair vectfunction(pair z) {return (-2*z.x,-4*z.y);}
path vector(pair t) {return -vectfunction(t)/2 -- vectfunction(t)/2;}

add(vectorfield(vector,a,b,12,12,mainvect));
