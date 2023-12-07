clc
clear
file_path = '~~\';  %%Input the file path of cross-section images
img_path_list = dir(strcat(file_path,'*.tif'));
image_num = length(img_path_list);
n = 1800;                     
if image_num > 0
    for r = 1:n                
        e = r*0.1;               
        for i = 1:image_num
            image_name = img_path_list(i).name; 
            I = imread(strcat(file_path,image_name));
            IM = imrotate(I,e,'nearest','crop');  
            model(:,:,i) = IM;  
        end
        A = model(:,x,:);  
        A1 = squeeze(A);  
        A2 = uint8(A1);
        imwrite(A2,['~~\',num2str(r,'%04d'), '.tif']); %%Input the file path of polar-section images
    end
end
