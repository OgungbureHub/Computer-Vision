function processThreshold(I, L, thresholdRange, resultsDir)
    for st = thresholdRange
        
        % Create shadow mask
        sm = I > st;
        s = strel('square', 5);
        for i = 1:size(I, 3)
            sm(:,:,i) = imerode(sm(:,:,i), s);
        end

        %%  (a) Estimate Normal Vectors
        N = PhotometricStereo(I, sm, L);
        % save(fullfile(resultsDir, ['Normals_' num2str(st) '.mat']), 'N');

        figure; imshow(N); axis xy;
        title(['Threshold = ' num2str(st)]);
        % saveas(gcf, fullfile(resultsDir, ['NormalMap_' num2str(st) '.png']));

        %% (b) Estimate Depth Map from Normal Vectors
        fprintf('Estimating depth map from normal vectors...\n');
        p = -N(:,:,1) ./ N(:,:,3);
        q = -N(:,:,2) ./ N(:,:,3);
        p(isnan(p)) = 0;
        q(isnan(q)) = 0;
        Z = DepthFromGradient(p, q);
        % save(fullfile(resultsDir, ['DepthMap_' num2str(st) '.mat']), 'Z');

        %% (c) Visualize Depth Map by Plotting Object's Surface
        fprintf('Visualizing object surface with threshold=%f...\n', st);
        viewAngles = [30, 20, 0;   
                      150, 30, 45;  
                      270, 15, -30]; 
    
        figure('Toolbar', 'figure');
        for i = 1:size(viewAngles, 1)
            subplot(1, 3, i);
            surf(Z, 'EdgeColor', 'None', 'FaceColor', [0.5 0.5 0.5]);
            axis equal; view(viewAngles(i, :));
            title(['View Angle: Azimuth=' num2str(viewAngles(i, 1)) ', Elevation=' num2str(viewAngles(i, 2)) ', Roll=' num2str(viewAngles(i, 3))]);
            camlight('headlight');

        end
        set(gcf, 'MenuBar', 'none');
        % saveas(gcf, fullfile(resultsDir, 'SubplotSurfacePlots.png'));
        % close(gcf);

    end
end