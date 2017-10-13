import graph;
size(150,150);

// vector field F = < y, x > 


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
	
real f(real x) {return 2*x^2-1;}
pair F(real x) {return (x,f(x));}

//real g(real x) {return x^4;}
//pair G(real x) {return (x,g(x));}

pair G(real t) {return (cos(t),sin(t)+1);}

pair xbounds=(-1.1,1.1);
pair ybounds=(-1.1,1.1);
real[] myxchoice={-1,1};
real[] myychoice={-1,1};

xaxis("",xbounds.x,xbounds.y,Ticks(myxchoice),arrow=Arrow(DefaultHead,size=4));
yaxis("",ybounds.x,ybounds.y,Ticks(myychoice),arrow=Arrow(DefaultHead,size=4));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0));
//label("\phantom{$x$}",(xbounds.x-0.05*(xbounds.y-xbounds.x),0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x)));
//label("\phantom{$y$}",(0,ybounds.x-0.05*(ybounds.y-ybounds.x)));

pair a=(-1,-1);
pair b=(1,1);

pair vectfunction(pair z) {return (z.y,z.x);}
path vector(pair t) {return -vectfunction(t)/2 -- vectfunction(t)/2;}

add(vectorfield(vector,a,b,12,12,bgvect));

draw(graph(F,-1,1,operator ..),colorone);
draw(graph(G,pi,2*pi,operator ..),colortwo);

label("$y=2x^2-1$",(.7,-.9),filltype=Fill(white+opacity(.7)));
label("$x^2+(y-1)^2=1$",(0,.25),filltype=Fill(white+opacity(.7)));

