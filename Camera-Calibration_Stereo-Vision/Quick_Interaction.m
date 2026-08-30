clear all
addpath('functions');
load('vars_quick.mat');
img_right='Inputs/right.jpg';
ing_left='Inputs/left.jpg';

input('Press Enter for left  and  right for MKRT ...');
%% 1b MRKT for  both  right and left  camera
disp('Left Camera Parameters:');
disp('Camera Matrix (m):');
disp(m_left);
disp('Intrinsic Matrix (K):');
disp(K_left);
disp('Rotation Matrix (R):');
disp(R_left);
disp('Translation Vector (T):');
disp(T_left);

disp('Right Camera Parameters:');
disp('Camera Matrix (m):');
disp(m_right);
disp('Intrinsic Matrix (K):');
disp(K_right);
disp('Rotation Matrix (R):');
disp(R_right);
disp('Translation Vector (T):');
disp(T_right);

input('Press Enter for visualization of  world Coordinate ...');
%%  Display world axes in both left and right images.
figure;
hold on;
visualize_3D_points_and_axes(m_left, ing_left, W_left);
title('World Axes Visualization - Left Camera');


figure;
hold on;
visualize_3D_points_and_axes(m_right, img_right, W_right);
title('left_word_axes.png- Right Camera');
hold off;

%%
input('Press Enter for Mean Square Error ...');
mse_value = mse(Pf', W_left);
disp(['Mean Squared Error (MSE): ' num2str(mse_value)]);
rmse_value = sqrt(mse_value);
disp(['Root Mean Squared Error (RMSE): ' num2str(rmse_value)])

%%
input('Press Enter for scatter3 plot...');
figure;
scatter3(con_mat(1, :), con_mat(2, :), con_mat(3, :), 'ob'); 
labels = cellstr(num2str((1:size(con_mat, 2))'));
title('3D Scatter Plot with Point Numbers');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
grid on;
axis equal;

%% PATCH FUNTION PLOT
input('Press Enter for each component patch...');
figure
% Opened notebook
patch(con_mat(1, [17,2,6,14]), con_mat(2, [17,2,6,14]), con_mat(3, [17,2,6,14]), [0.3010 0.7450 0.9330]);
patch(con_mat(1, [14,11,7,17]), con_mat(2, [14,11,7,17]), con_mat(3, [14,11,7,17]),[0.3010 0.7450 0.9330]);
view(3)
grid on;
axis equal;
hold on;

figure
% first box: white
patch(con_mat(1, [19, 20, 21, 22]), con_mat(2, [19, 20, 21, 22]), con_mat(3, [19, 20, 21, 22]), [0.5, 0.5, 0.5]);
patch(con_mat(1, [19, 22, 24, 23]), con_mat(2, [19, 22, 24, 23]), con_mat(3, [19, 22, 24, 23]), [0.5, 0.5, 0.5]);
patch(con_mat(1, [22, 21, 25, 24]), con_mat(2, [22, 21, 25, 24]), con_mat(3, [22, 21, 25, 24]), [0.5, 0.5, 0.5]);
view(3)
grid on;
axis equal;

% red pyramid
figure
patch(con_mat(1, [26, 27, 29, 26]), con_mat(2, [26, 27, 29, 26]), con_mat(3, [26, 27, 29, 26]), [0.8, 0, 0]);
patch(con_mat(1, [27, 29, 28, 27]), con_mat(2, [27, 29, 28, 27]), con_mat(3, [27, 29, 28, 27]), [0.8, 0, 0]);
view(3)
grid on;
axis equal;

% smallest box
figure
patch(con_mat(1, [30,31,32,33])/s, con_mat(2, [30,31,32,33])/s, con_mat(3, [30,31,32,33])/s,[0.9290 0.6940 0.1250]);
patch(con_mat(1, [30,33,35,34])/s, con_mat(2, [30,33,35,34])/s, con_mat(3, [30,33,35,34])/s, [0.9290 0.6940 0.1250]);
patch(con_mat(1, [33,32,36,35])/s, con_mat(2, [33,32,36,35])/s, con_mat(3, [33,32,36,35])/s, [0.9290 0.6940 0.1250]);
view(3)
grid on;
axis equal;
hold off

%%
input('Press Enter for  combined patches...');
figure
patch(con_mat(1, [17,2,6,14]), con_mat(2, [17,2,6,14]), con_mat(3, [17,2,6,14]), [0.3010 0.7450 0.9330]);
patch(con_mat(1, [14,11,7,17]), con_mat(2, [14,11,7,17]), con_mat(3, [14,11,7,17]),[0.3010 0.7450 0.9330]);
patch(con_mat(1, [19, 20, 21, 22]), con_mat(2, [19, 20, 21, 22]), con_mat(3, [19, 20, 21, 22]), [0.5, 0.5, 0.5]);
patch(con_mat(1, [19, 22, 24, 23]), con_mat(2, [19, 22, 24, 23]), con_mat(3, [19, 22, 24, 23]), [0.5, 0.5, 0.5]);
patch(con_mat(1, [22, 21, 25, 24]), con_mat(2, [22, 21, 25, 24]), con_mat(3, [22, 21, 25, 24]), [0.5, 0.5, 0.5]);
patch(con_mat(1, [26, 27, 29, 26]), con_mat(2, [26, 27, 29, 26]), con_mat(3, [26, 27, 29, 26]), [0.8, 0, 0]);
patch(con_mat(1, [27, 29, 28, 27]), con_mat(2, [27, 29, 28, 27]), con_mat(3, [27, 29, 28, 27]), [0.8, 0, 0]);
s = 2;
patch(con_mat(1, [30,31,32,33])/s, con_mat(2, [30,31,32,33])/s, con_mat(3, [30,31,32,33])/s,[0.9290 0.6940 0.1250]);
patch(con_mat(1, [30,33,35,34])/s, con_mat(2, [30,33,35,34])/s, con_mat(3, [30,33,35,34])/s, [0.9290 0.6940 0.1250]);
patch(con_mat(1, [33,32,36,35])/s, con_mat(2, [33,32,36,35])/s, con_mat(3, [33,32,36,35])/s, [0.9290 0.6940 0.1250]);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
view(3);
grid on;
axis equal;
view(3)

