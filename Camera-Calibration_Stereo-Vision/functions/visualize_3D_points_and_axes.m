function visualize_3D_points_and_axes(m, filePath, wo_coord)
file=imread(filePath);
img_pts=(m*[wo_coord(:,1)'; wo_coord(:,2)'; wo_coord(:,3)'; ones(1,12)]);
img_pts=img_pts./(img_pts(3,:));
img_pts = img_pts(1:2, :)';
image = insertMarker(file, img_pts);

label_x = [
    0:199;       
    zeros(1, 200);  
    zeros(1, 200);  
    ones(1, 200)  
    ];

label_y = [
    zeros(1, 200);  
    0:199;           
    zeros(1, 200);  
    ones(1, 200)  
];

label_z = [
    zeros(1, 325);  
    zeros(1, 325);  
    0:324;           
    ones(1, 325)    
];

colors = {'red', 'green', 'blue'};
labels = {label_x, label_y, label_z};

for i = 1:numel(colors)
    c_lab = (m * labels{i});
    c_lab = c_lab(1:2, :) ./ c_lab(3, :);
    c_lab = c_lab';
    c_lab = c_lab(:, 1:2);
    image = insertShape(image, 'Line', [c_lab(1, 1), c_lab(1, 2), c_lab(end, 1), c_lab(end, 2)], 'LineWidth', 2, 'Color', colors{i});
end

imshow(image);

end
