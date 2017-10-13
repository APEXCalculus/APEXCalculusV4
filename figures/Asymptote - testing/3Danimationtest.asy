//import graph3;
import animate;
// import patterns;

settings.tex="pdflatex";
//defaultrender.merge=true;


animation a;

// add("brick",brick(black));

// triple g(real t) {return (1.299*cos(t),.866*sin(t),.5);}
//path3 mypath=graph(g,0,2pi,operator ..);

int n=10;
for(int i=0; i <= n; ++i) {
  picture pic;
  size(pic,100);
  // //path g=circle((0,sin(pi/n*i)),1);
	// triple g(real t) {return (t,cos(2pi/10*i)*t*(2-t),sin(2pi/10*i)*t*(2-t));}
  // path3 mypath=graph(g,0,2,operator ..);
	
	// draw(pic,mypath,rgb(0,0,1));
	draw(pic,(0,0)--(100,100-10*i));
	
  a.add(pic);
}

label(a.pdf("controls",multipage=false));


