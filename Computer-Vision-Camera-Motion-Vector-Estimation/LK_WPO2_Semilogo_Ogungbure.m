clc;
clear;
close all;

% (a) Lucas-Kanade optical flow method.
fp = 'Basketball';
fm1 = double(imread(fullfile(fp, 'frame1.png')));
fm2 = double(imread(fullfile(fp, 'frame2.png')));

%% Img Gradient
r_x = [-1 1; -1 1];
r_y = [1 1; -1 -1];

Ix = conv2(fm1, r_x, 'valid') + conv2(fm2, r_x, 'valid');
Iy = conv2(fm1, r_y, 'valid') + conv2(fm2, r_y, 'valid');
Itg = fm2(2:end, 2:end) - fm1(2:end, 2:end);

u = zeros(size(Ix));
v = zeros(size(Iy));

%% (1) LK LLS
[p, q] = size(Ix);
n = 1; 
X_rst = zeros(p, q, 2);  
for i = n+1:p-n-1
    for p = n+1:q-n-1
        wx = Ix(i-n:i+n, p-n:p+n);
        wy = Iy(i-n:i+n, p-n:p+n);
        wt = -Itg(i-n:i+n, p-n:p+n);
        a = [wx(:), wy(:)];
        b = wt(:);
        if det(a' * a) ~= 0
            X = (a' * a) \ (a' * b);
            u(i, p) = X(1);
            v(i, p) = X(2);
            X_rst(i, p, :) = X;
        end
    end
end

save('optical_flow_results.mat', 'X_rst');

sf = 50;
u_scd = u * sf;
v_scd = v * sf;

%% (b) Visualization
tlayout = tiledlayout(1, 3);

% human image/motion vector
dHM = true;  
% dHM = false; 
nexttile;
imshow(fm1 / 256);
title('Frame 1');
xlabel('X-axis');
ylabel('Y-axis');

nexttile;
imshow(fm2 / 256);
title('Frame 2');
xlabel('X-axis');
ylabel('Y-axis');

nexttile;
if dHM
    imshow(fm1 / 256);
    hold on;
else
    imshow(ones(size(fm1)));  
end

quiver(flipud(u_scd), flipud(v_scd), 'b');
title('Optical Flow Result');
xlabel('X-axis');
ylabel('Y-axis');

if dHM
    hold off;
end

title(tlayout, 'Frames and Optical Flow');
