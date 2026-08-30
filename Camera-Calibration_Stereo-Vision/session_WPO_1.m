%% 1(a)
clear all
img_right='Inputs/right.jpg';
ing_left='Inputs/left.jpg';
%% 1b MRKT for  both  right and left  camera
[~, ~, ~, m_left, u_left, v_left, W_left] = Prjmat_3x4K(ing_left);
[r1_left, r2_left, r3_left, cx_left, cy_left, fx_left, fy_left, tx_left, ty_left, tz_left] = spec(m_left);

R_left = [r1_left; r2_left; r3_left];
T_left = [tx_left, ty_left];
K_left = [fx_left, 1, cx_left; 0, fy_left, cy_left; 0, 0, 1];

% parameters for the left camera
disp('Left Camera Parameters:');
disp('Camera Matrix (m):');
disp(m_left);
disp('Intrinsic Matrix (K):');
disp(K_left);
disp('Rotation Matrix (R):');
disp(R_left);
disp('Translation Vector (T):');
disp(T_left);

%% Load data for the right camera
[~, ~, ~, m_right, u_right, v_right, W_right] = Prjmat_3x4K(img_right);
[r1_right, r2_right, r3_right, cx_right, cy_right, fx_right, fy_right, tx_right, ty_right, tz_right] = spec(m_right);


R_right = [r1_right; r2_right; r3_right];
T_right = [tx_right, ty_right];
K_right = [fx_right, 1, cx_right; 0, fy_right, cy_right; 0, 0, 1];

disp('Right Camera Parameters:');
disp('Camera Matrix (m):');
disp(m_right);
disp('Intrinsic Matrix (K):');
disp(K_right);
disp('Rotation Matrix (R):');
disp(R_right);
disp('Translation Vector (T):');
disp(T_right);


%%  Display world axes in both left and right images.
figure;
hold on;
visualize_3D_points_and_axes(m_left, ing_left, W_left);
title({'World Axes Visualization - Left Camera'});

figure;
hold on;
visualize_3D_points_and_axes(m_right, img_right, W_right);
title({'World Axes Visualization - Right Camera'});
hold off;
%% 2(a) reconstruct 3D world
disp('Press Enter to Continue!')  
pause;
figure
imshow('Inputs/correspondence_right.jpg')
pt_lft = ginput(18);
hold on;
plot(pt_lft(:, 1), pt_lft(:, 2), '*g'); % '*' in red color
hold off;

imshow('Inputs/correspondence_left.jpg')
pt_rght = ginput(18);
hold on;
plot(pt_rght(:, 1), pt_rght(:, 2), '*g'); % '*' in red color
hold off;

P_3drec = Tri_Dept(m_right, pt_lft, m_left, pt_rght);
disp('Original Matrix P:');
disp(P_3drec);


%%
Pf = Tri_Dept(m_right, [u_right v_right], m_left, [u_left v_left]);
figure;
scatter3(Pf(1, :), Pf(2, :), Pf(3, :), 'ob');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Scatter Plot of Reconstructed 3D Points');
grid on;
axis equal;
%% 2b compute mean square error
mse_value = mse(Pf', W_left);
disp(['Mean Squared Error (MSE): ' num2str(mse_value)]);
rmse_value = sqrt(mse_value);
disp(['Root Mean Squared Error (RMSE): ' num2str(rmse_value)])
% 
%%
figure;
scatter3(con_mat(1, :), con_mat(2, :), con_mat(3, :), 'ob');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Scatter Plot of Reconstructed 3D Points');
grid on;
axis equal;


%% PATCH FUNTION PLOT
figure
% Opened notebook
patch(con_mat(1, [17,2,6,14]), con_mat(2, [17,2,6,14]), con_mat(3, [17,2,6,14]), [0.3010 0.7450 0.9330]);
patch(con_mat(1, [14,11,7,17]), con_mat(2, [14,11,7,17]), con_mat(3, [14,11,7,17]),[0.3010 0.7450 0.9330]);
view(3)
grid on;
axis equal;
hold on;
%%
% figure
% % first box: white
patch(con_mat(1, [19, 20, 21, 22]), con_mat(2, [19, 20, 21, 22]), con_mat(3, [19, 20, 21, 22]), [0.5, 0.5, 0.5]);
patch(con_mat(1, [19, 22, 24, 23]), con_mat(2, [19, 22, 24, 23]), con_mat(3, [19, 22, 24, 23]), [0.5, 0.5, 0.5]);
patch(con_mat(1, [22, 21, 25, 24]), con_mat(2, [22, 21, 25, 24]), con_mat(3, [22, 21, 25, 24]), [0.5, 0.5, 0.5]);
% view(3)
% grid on;
% axis equal;
 
%% red pyramid
figure
patch(con_mat(1, [26, 27, 29, 26]), con_mat(2, [26, 27, 29, 26]), con_mat(3, [26, 27, 29, 26]), [0.8, 0, 0]);
patch(con_mat(1, [27, 29, 28, 27]), con_mat(2, [27, 29, 28, 27]), con_mat(3, [27, 29, 28, 27]), [0.8, 0, 0]);
view(3)
grid on;
axis equal;

%% smallest box
figure
scalingFactor = 2;
patch(con_mat(1, [30,31,32,33])/scalingFactor, con_mat(2, [30,31,32,33])/scalingFactor, con_mat(3, [30,31,32,33])/scalingFactor,[0.9290 0.6940 0.1250]);
patch(con_mat(1, [30,33,35,34])/scalingFactor, con_mat(2, [30,33,35,34])/scalingFactor, con_mat(3, [30,33,35,34])/scalingFactor, [0.9290 0.6940 0.1250]);
patch(con_mat(1, [33,32,36,35])/scalingFactor, con_mat(2, [33,32,36,35])/scalingFactor, con_mat(3, [33,32,36,35])/scalingFactor, [0.9290 0.6940 0.1250]);
view(3)
grid on;
axis equal;
hold off

%% View all
figure
patch(con_mat(1, [17,2,6,14]), con_mat(2, [17,2,6,14]), con_mat(3, [17,2,6,14]), [0.3010 0.7450 0.9330]);
patch(con_mat(1, [14,11,7,17]), con_mat(2, [14,11,7,17]), con_mat(3, [14,11,7,17]),[0.3010 0.7450 0.9330]);
patch(con_mat(1, [19, 20, 21, 22]), con_mat(2, [19, 20, 21, 22]), con_mat(3, [19, 20, 21, 22]), [0.5, 0.5, 0.5]);
patch(con_mat(1, [19, 22, 24, 23]), con_mat(2, [19, 22, 24, 23]), con_mat(3, [19, 22, 24, 23]), [0.5, 0.5, 0.5]);
patch(con_mat(1, [22, 21, 25, 24]), con_mat(2, [22, 21, 25, 24]), con_mat(3, [22, 21, 25, 24]), [0.5, 0.5, 0.5]);
patch(con_mat(1, [26, 27, 29, 26]), con_mat(2, [26, 27, 29, 26]), con_mat(3, [26, 27, 29, 26]), [0.8, 0, 0]);
patch(con_mat(1, [27, 29, 28, 27]), con_mat(2, [27, 29, 28, 27]), con_mat(3, [27, 29, 28, 27]), [0.8, 0, 0]);
scalingFactor = 2;
patch(con_mat(1, [30,31,32,33])/scalingFactor, con_mat(2, [30,31,32,33])/scalingFactor, con_mat(3, [30,31,32,33])/scalingFactor,[0.9290 0.6940 0.1250]);
patch(con_mat(1, [30,33,35,34])/scalingFactor, con_mat(2, [30,33,35,34])/scalingFactor, con_mat(3, [30,33,35,34])/scalingFactor, [0.9290 0.6940 0.1250]);
patch(con_mat(1, [33,32,36,35])/scalingFactor, con_mat(2, [33,32,36,35])/scalingFactor, con_mat(3, [33,32,36,35])/scalingFactor, [0.9290 0.6940 0.1250]);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
view(3);
grid on;
axis equal;
view(3)
grid on;
axis equal;

