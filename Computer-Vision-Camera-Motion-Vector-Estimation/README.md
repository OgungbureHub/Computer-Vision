# Computer-Vision-Motion Vector Estimation
Computer Vision Project: Camera Calibration  Motion  Estimation
The MATLAB  code  implements  the Lucas-Kanade optical flow method to estimate  the motion  vectors  between a pair of frams. You  just  have to load a pair of images to  the  code and  the code  will compute  the  image  gradients and  applied Lucas-Kanade least squares  criterion method to estimate the  motion vectors.

function:
ImageGradient:image gradients (I_x and I_y) are computed  using  convolution with partial derivative kernels. Temporal gradient Itg is  calculated.
Least Square method  is applied  to estimate the  motion  vectors  u and  v for the pixels.
You visualize the  optical flow result.  You can choose to  see  only the  motion vector by selecting  falsefor the variable  dHM and  you can select true to see the  motion vector around the players.


You can decide to play  with any consecutive pair of frames to see the Lucas-Kanade  optical flow estimation.

