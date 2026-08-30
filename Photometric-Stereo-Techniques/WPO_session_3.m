clear all;
close all;
addpath('functions');
addpath('PSData');
a = {'Cat', 'Frog', 'Hippo', 'Turtle'};

disp('animals list:');
for i = 1:length(a)
    disp([num2str(i) '. ' a{i}]);
end
opt = input('Enter number to the animal: ');
if opt < 1 || opt > length(a)
    error('choose a valid number to one animal.');
end
sel_ani = a{opt};
disp(['Selected animal: ' sel_ani]);
%%
d = strcat('PSData/', sel_ani, '/');
D = fullfile(fileparts(mfilename('fullpath')), d);

% Photometric stereo parameters
ic = 1;
thresholdRange = 0.2;

L = textread(fullfile(D, 'light_directions.txt'));
%%  Load images
fmt = {'tiff', 'png'};
ds = fmt{1};  
cs = fmt{2};  
o = struct('ImageChannel', ic, 'NormalizePercentile', 99);
I = PSLoadProcessedImages(fullfile(D, 'Objects'), cs, o);
nI = size(I, 3);

resultsDir = fullfile(D, 'Results');
if ~exist(resultsDir, 'dir')
    mkdir(resultsDir);
end

processThreshold(I, L, thresholdRange, resultsDir);


