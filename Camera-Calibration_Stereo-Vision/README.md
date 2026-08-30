# Camera-Calibration_Stereo-Vision


Stereo Vision 3D Reconstruction
Introduction:
This project involves 3D reconstruction using stereo vision with MATLAB. It relies on image processing and computer vision toolboxes to achieve accurate results.

Toolbox Requirements:
Ensure you have the following MATLAB toolboxes installed:
- Image Processing Toolbox
- Computer Vision Toolbox

Provided MATLAB Scripts:
 Quick_interaction:
   -You can run this  directly, it allows for a quick look at the results by pressing the ENTER key after each step.
   - Utilizes the Patch function to visualize individual shapes.
   - the Condenses Patch function at the end  of the code is used to view all shapes together.

 cv_wpo_1:
   - Requires full interaction for accurate results.
   - Requires the user to click a total of 30 points (12 for each right and left 2D image, and 18 points in a specific order on each shape).
   - After clicking the points, follow on-screen prompts until the end of the code. The script will display the mean square error and reconstructed results.
  - The mean square error depends on the accuracy of the points selected, therefore  you have to be carefully to click the small dot perfectly, otherwise the error  between  the actual calibration  point  and  the reconstructed  point will be high.

#Output Interpretation:
The output results are considered good and well-reconstructed. However, ensure proper interpretation of the mean square error and understand the significance of the reconstructed shapes.Feel free to press ENTER to proceed through each step in the 'Quick_interaction' script and follow the prompts in 'cv_wpo_1' for a more interactive experience.
