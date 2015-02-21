function [ OPImage,Result ] = NCC( Sensed, Template, Template_Name )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Sensed = imread('C:\D-DRIVE\Rohan\BE-PROJECT\Codes\pics\wrappers\limca.bmp');
% figure, imshow(Sensed);
% Template= imread('C:\D-DRIVE\Rohan\BE-PROJECT\Codes\pics\wrappers\templates\limca.bmp');

    m = 50;
    Process=strcat('Testing for match with : ',Template_Name);
    progressbar(Process) % Init single bar
OPImg=Sensed;
Result=false;
[ro co do]=size(Template);
% figure, imshow(Template);

Cor_Rel = normxcorr2(Template(:,:,1),Sensed(:,:,1));
% figure, surf(Cor_Rel), shading flat;

[max_c, imax] = max(abs(Cor_Rel(:)));
[row, col] = ind2sub(size(Cor_Rel),imax(1));

% extract region from peppers and compare to onion
if max_c>0.8
    extracted_IMG = Sensed(row-ro+1:row,col-co+1:col,:);
    if isequal(Template,extracted_IMG) 
       disp('Match Found.');
       Result=true;
       OPImg=showMatchAt(row-ro+1,col-co+1,ro,co,Sensed);
    else
        disp('Improper Match.');
    end
end
OPImage=OPImg;

    for i = 1:m
      pause(0.01) % Do something important
      progressbar(i/m) % Update progress bar
    end
end

