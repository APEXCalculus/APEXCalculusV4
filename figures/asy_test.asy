import graph3;
size(200,200,IgnoreAspect);
currentprojection=orthographic(7.2,-5.1,8);
defaultrender.merge=true;


// draw #1
//draw((0,1,0)--(2,1,4)--(2,0,0)--cycle,rgb(.3,.3,.3)+linewidth(2));

path3 p1=(1,0,0)--(1,2,0)--(3,2,0)--(3,0,0);
// draw #2
//draw(surface(p1 -- cycle), emissive(gray+opacity(.6)));

path3 p2=(0,1,0)--(2,1,4)--(2,0,0);
draw(surface(p2 -- cycle), emissive(gray+opacity(.6)));

path3 p3=(2,0,0)--(2,1,4)--(2,1,0);
draw(surface(p3 -- cycle), emissive(gray+opacity(.6)));

