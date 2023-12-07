clc
clear
%% build model
X = 2000; Y = 2000; Z = 2000;        %% Size of the 3D model
R_model = zeros(X,Y);
R_model = uint8(R_model);
R = X/2;
%% image input
file_path = '~~';  %% Input the file path of polar-section images
img_path_list = dir(strcat(file_path,'*.tif')); 
image_num = length(img_path_list);
%% rot and reconstruction
for k = 1:Z
    Model1 = false(X,Y);
    Model1 = double(Model1);
    Model2 = zeros(X,Y);
    Model2 = double(Model2);
    for r = 1:X
        image_name = img_path_list(r).name;
        I = imread(strcat(file_path,image_name));
        a = find(I);
        I(a) = 1;
        IM = double(I);
        e = r*0.09;                    
        Angle = (e/180)*pi;
        for t = 1:X
            if t < R
                a0 = (cos(Angle)*(t-878));
                b0 = (sin(Angle)*(t-878));
                a1 = round(cos(Angle)*(t-878));
                b1 = round(sin(angle)*(t-878));
                ca1 = abs(a1 - a0);
                cb1 = abs(b1 - b0);
                mwa1 = sqrt((cb1*cb1 + ca1*ca1)/0.5*0.5);
                x1=1000+a1;y1=1000+b1;
                Model1(y1,x1) = IM(t,k) + Model1(y1,x1);
%                Model1(y1,x1) = 25 + Model1(y1,x1);
                Model2(y1,x1) = Model2(y1,x1) + mwa1;
            else
                x0 = (cos(angle)*(t-878));
                y0 = (sin(angle)*(t-878));
                x1 = round(cos(angle)*(t-878));
                y1 = round(sin(angle)*(t-878));
                ca1 = abs(x1 - x0);
                cb1 = abs(y1 - y0);
                mwx1 = sqrt((cb1*cb1 + ca1*ca1)/0.5*0.5);
                x2=1000+x1;y2=1000+y1;
                Model1(y2,x2) = IM(t,k) +  Model1(y2,x2);
%                Model1(y2,x2) = 25 +  Model1(y2,x2);
                Model2(y2,x2) = Model2(y2,x2) + mwx1;
            end
        end        
    end
    R_model = round(Model1./Model2);
    imwrite(R_model,['D:\纵向切片\JZ\2000\',num2str(k,'%04d'),'.tif']);
end