import graph3;

//ASY file for figsurfint1_3D.asy in Chapter 14


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(16,12.5,14);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={2};
real[] myzchoice={3};
defaultpen(0.5mm);

pair xbounds=(-.1,2.5);
pair ybounds=(-.1,2.5);
pair zbounds=(-.1,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));



//Draw the plane 2x+y+z=3 over the triangle bounded
// by coordinate planes and y=2-2x
triple f(pair t) {
	return (t.x,t.y*(2-2*t.x),3-2*t.x-t.y*(2-2t.x));//
}
surface s=surface(f,(0,0),(1,1),8,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic},vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=invisible);


//pen curvepen=.3mm+blue;
//draw(surface((1,0,0)--(0,0,0)--(0,2,0)--cycle),curvepen+opacity(.5));
//draw((1,0,0)--(0,0,0)--(0,2,0)--cycle,curvepen);
//draw(f((0,0))--f((1,0))--f((0,1))--cycle,curvepen);

path3 gradient1(triple z){
  return O--(1,z.x,-z.y);
}

triple A=(0,0,1);
triple B=(1,2,3);

picture VectorPlot3D(path3 vector(triple t), triple a, triple b,
                     int nx=nmesh, int ny=nx, int nz=nx,bool truesize=false,
                     real maxlength=truesize ? 0 : min(abs(b.x-a.x)/nx,abs(b.y-a.y)/ny,abs(b.z-a.z)/nz),
                     //  bool cond(pair z)=null,
                     pen p=currentpen,
                     arrowbar3 arrow=Arrow3(6), margin3 margin=PenMargin3,
                     string name="", render render=defaultrender)
{
  picture pic;
  real dx=1/nx;
  real dy=1/ny;
  real dz=1/nz;
  real scale;
  if(maxlength > 0) {
    real size(triple t) {
      path3 g=vector(t);
      return abs(point(g,size(g)-1)-point(g,0));
    }
    real max=size((0,0,0));

    for(int i=0; i <= nx; ++i) {
      real x=interp(a.x,b.x,i*dx);
      for(int j=0; j <= ny; ++j)
        {
          real y=interp(a.y,b.y,j*dy);
          for(int k=0; k <= nz; ++k)
            max=max(max,size((x,y,interp(a.z,b.z,k*dz))));
        }}
    scale=max > 0 ? maxlength/max : 1;
  } else scale=1;
  bool group=name != "" || render.defaultnames;
  if(group)
    begingroup3(pic,name == "" ? "vectorfield" : name,render);
  for(int i=0; i <= nx; ++i) {
    real x=interp(a.x,b.x,i*dx);
    for(int j=0; j <= ny; ++j) {
      real y=interp(a.y,b.y,j*dy);
      for(int k=0; k <= nz; ++k)
        {      triple z=(x,y,interp(a.z,b.z,k*dz));
          {
            path3 g=scale3(scale)*vector(z);
            string name="vector";
            if(truesize) {
              picture opic;
              draw(opic,g,p,arrow,margin,name,render);
              add(pic,opic,z);
            } else
              draw(pic,shift(z)*g,p,arrow,margin,name,render);
          }
        }
    }}
  if(group)
    endgroup3(pic);
  return pic;

}
add(VectorPlot3D(gradient1,A,B,3,3,3,blue));