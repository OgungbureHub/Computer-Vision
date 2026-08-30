function P = Tri_Dept(m1,point1,m2,point2)
m1Tr=m1(1,:);
m2Tr=m1(2,:);
m3Tr=m1(3,:);
m1Tl=m2(1,:);
m2Tl=m2(2,:);
m3Tl=m2(3,:);

P=[];
for i=1:12
A=[point1(i,1)*m3Tr - m1Tr; point1(i,2)*m3Tr - m2Tr; point2(i,1)*m3Tl - m1Tl; point2(i,2)*m3Tl - m2Tl];
[U, D, V]=svd(A);
hom_vec=D(4,4)*V(:,4);
hom_vec=hom_vec./hom_vec(4);
P=[P hom_vec(1:3)];
end

end

