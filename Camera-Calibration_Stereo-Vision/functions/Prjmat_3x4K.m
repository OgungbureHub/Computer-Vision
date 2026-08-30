function [m1,m2,m3,m, u, v, Wc] = Prjmat_3x4K (filePath)

fileID = fopen('Inputs/calibration_points3.txt','r');
formatSpec = '%f';
Wc = fscanf(fileID,formatSpec, [3 12]);
Wc=Wc';
[X, Y, Z] = deal(Wc(:, 1), Wc(:, 2), Wc(:, 3));
imshow(filePath)
numPoints=12;
[u,v]=ginput(numPoints);

M=[];
for(n=1:12)
    M=[M;X(n) Y(n) Z(n) 1 0 0 0 0 -u(n)*X(n) -u(n)*Y(n) -u(n)*Z(n) -u(n); 0 0 0 0 X(n) Y(n) Z(n) 1 -v(n)*X(n) -v(n)*Y(n) -v(n)*Z(n) -v(n)];
end
% [U, D, V] = svd(M);
% m = reshape(V(:, 12), [4, 3])';
% t = (m * [X'; Y'; Z'; ones(1, numPoints)]); 
% t = t ./ t(3, :);
% [m1, m2, m3] = deal(m(1:3, 1:3));
[U, D, V]=svd(M);
m=V(:,12)*D(12,12);
m=reshape(m,[4 3]);
m=m';
% testing out if the matrix m is correct
t=(m*[X'; Y'; Z'; ones(1,12)]);
t=t./(t(3,:))
% it's correct :)
[m1, m2, m3] = deal(m(1:3, 1:3));
end

