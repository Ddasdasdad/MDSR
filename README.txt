Name of the code: Multi-direction slicing and reconstruction of 3D CT scanning(MDSR).

These code slice the 3D CT images to obtain polar-section images and reconstruct the 3D model base on polar-section images.

[1] Multi_direction_slicing
    
    Input the file path of cross-section images at the "file_path";
    
    where the "n" is the number of the polar-section images you want;

    where the "e" is the angel of rotation of each polar-section images;

    input the file path of polar-section images, imagename and the type of image at the "imwrite".


[2] Multi_direction_reconstruction

    Where the "X", "Y", "Z", is the size of 3D model;

    input the file path of polar-section images at the "file_path";

    where the "n" is the number of the polar-section images;

    where the "e" is the angel of rotation of each polar-section images;

    input the file path of cross-section images , imagename and the type of image at the "imwrite".

-------------------------------------------------------------------------------------------------------------------------

NOTE: 	The scripts should essentially work on different platforms, due to the multiplatform nature of the used software.
	However, it has only been tested under Windows until now.


       

    

    