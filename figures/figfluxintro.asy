import graph;
size(150,150);

// vector field F = < 1,cos(x) > 


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
	colorone = blue+1.5pt+linejoin(0);
	colortwo = red+1.5pt+linejoin(0);
	} else
	{
	colorone = black+1.5pt+linejoin(0);
	colortwo = gray+1.5pt+linejoin(0);
	};
	
pair xbounds=(-2,12);
pair ybounds=(-2,12);
real[] myxchoice={10};
real[] myychoice={10};

xaxis("",xbounds.x,xbounds.y,Ticks(myxchoice),arrow=Arrow(DefaultHead,size=4));
yaxis("",ybounds.x,ybounds.y,Ticks(myychoice),arrow=Arrow(DefaultHead,size=4));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0));
//label("\phantom{$x$}",(xbounds.x-0.05*(xbounds.y-xbounds.x),0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x)));
//label("\phantom{$y$}",(0,ybounds.x-0.05*(ybounds.y-ybounds.x)));

pair a=(-.1,-.1);
pair b=(1.1,1.1);

pair vectfunction(pair z) {return (1,cos(3*pi*z.x));}
path vector(pair t) {return -vectfunction(t)/2 -- vectfunction(t)/2;}

//add(vectorfield(vector,a,b,12,12,rgb(.7,.7,.7)));

real f(real x) {return ((x-1)*(x)*(x+1));}
pair F(real x) {return (x,10*f(.2*(x-5))+5);}

//real g(real x) {return x^4;}
//pair G(real x) {return (x,g(x));}

//pair G(real t) {return (.2,t);}


draw((1,7.88)--(1.88,7.4),colortwo,arrow=EndArrow(3));
draw((3,8.36)--(2.28,7.66),colortwo,arrow=EndArrow(3));
draw((5,5)--(4.1,4.55),colortwo,arrow=EndArrow(3));
draw((7,1.64)--(6.28,0.94),colortwo,arrow=EndArrow(3));
draw((9,2.12)--(9.88,1.6),colortwo,arrow=EndArrow(3));

draw(graph(F,0,10,operator ..),colorone,arrow=MidArrow(5));


//draw(graph(G,0.2,1,operator ..),colorone,arrow=MidArrow(5));
//draw(graph(f,0,.8,operator ..),colorone+linetype(new real[] {4,2}),arrow=MidArrow(5));

//label("$C_1$",(.8,.15),filltype=Fill(white+opacity(.7)));
//label("$C_2$",(.13,.8),filltype=Fill(white+opacity(.7)));
//label("$C_3$",(.6,.5),filltype=Fill(white+opacity(.7)));


