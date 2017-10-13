import graph;
size(150,150);

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

defaultpen(fontsize(8));

bool incolor;
incolor = false;

pen colorone;
pen colortwo;

if(incolor) { 
	colorone = blue+linejoin(0);
	colortwo = red+1.5pt+linejoin(0);
	} else
	{
	colorone = black+linejoin(0);
	colortwo = gray+1.5pt+linejoin(0);
	};

real f(real x) {return exp(x);}
pair F(real x) {return (x,f(x));}

pair xbounds=(-3.5,3.5);
pair ybounds=(-3.5,3.5);
real[] myxchoice={-3,-2,-1,1,2,3};
real[] myychoice={-3,-2,-1,1,2,3};

xaxis("",xbounds.x,xbounds.y,Ticks(myxchoice),arrow=Arrow(DefaultHead,size=4));
yaxis("",ybounds.x,ybounds.y,Ticks(myychoice),arrow=Arrow(DefaultHead,size=4));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0));
label("\phantom{$x$}",(xbounds.x-0.05*(xbounds.y-xbounds.x),0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x)));
label("\phantom{$y$}",(0,ybounds.x-0.05*(ybounds.y-ybounds.x)));

pair a=(-2,-2);
pair b=(2,2);

int[] array={-1,0,1};
for(int j : array){
 for(int k : array){
  draw((j,k) -- (j+j+k,k+j-k),arrow=Arrow(DefaultHead,size=4),colorone);
	}
	}

//pair vectfunction(pair z) {return (z.y+z.x,z.x-z.y);}
//path vector(pair t) {return -vectfunction(t)/2 -- vectfunction(t)/2;}

//add(vectorfield(vector,a,b,5,5,blue));