# Photometric-Stereo-Technique

The  code implement photometric Stereo technique for shape  recovery from images captured  under  different ligntining  conditions. The  code  estimates albedo(the amount of light reflected compared to the total  light received by the surface), normal vectors and recovers the depth map (3D model of a scene of  how far the  object is from the viewer) of any any animal  selected.
 There  are 4  functions  that are used, 3 taken from the  dataset folder that was provided with the  exercise  folder and 1 extra is used to apply threshold to certain pixels.


functions:
-PhotometricStereo.m: This  estimates  the  albedo and  normal vector according to slide 18 and 13 of the PhotometricStereo_Reminder_Lesson.pdf

-PSLoadProcessedImages.m: This  function helps us to easily load processed images for photometric stereo according to slide 15  and  slide 8 of  the same  PhotometricStereo_Reminder_Lesson.pdf.

-DepthFromGradient.m: This is another useful function that is used used to recover the depth map from gradient information,  according to slide 21  and  slide 7 of  the same  PhotometricStereo_Reminder_Lesson.pdf.

- processThreshold.m: This is  used to check the threshold values  on albedo.


To Interact:
Ensure the animal images are organized  within  folders  in trhe PSData directory.  Observe  the  reconstructed  animals  from  different angles for  a compresinsive views
