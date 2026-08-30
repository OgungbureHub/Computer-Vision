function [r1,r2,r3,cx,cy,fx,fy,tx,ty,tz] = spec(m)
m1=m(1,1:3);
m2=m(2,1:3);
m3=m(3,1:3);
r3=m3;
cx=dot(m1,m3);
cy=dot(m2,m3);
fx=norm(cross(m1,m3));
fy=norm(cross(m2,m3));
r1=1/(fx)*(m1-cx*m3);
r2=1/(fy)*(m2-cy*m3);
tx=1/(fx)*(m(1,4)-cx*m(3,4));
ty=1/(fy)*(m(2,4)-cy*m(3,4));
tz=m(3,4);
end

