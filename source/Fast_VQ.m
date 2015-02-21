function [ OPImage, F_Result ] = Fast_VQ( Sensed,Template,Template_Name )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% clear all;

    Process=strcat('Testing for match with : ',Template_Name);
    progressbar(Process) % Init single bar
    
F_Result=false;
SensedImg = Sensed;
clear OpImg;
clear OpImg1;
OpImg=SensedImg;
[ImgRow,ImgCol,ImgDep]= size(SensedImg);

TEMPLATE = Template;
[TempRow,TempCol,TempDep]= size(TEMPLATE);

TempBlocks=getBlocks(TEMPLATE);
[BlockRow,BlockCol]=size(TempBlocks);
CodeBook=getCodeBook(TempBlocks);
%imshow(TEMPLATE);

%save('C:\D-DRIVE\Rohan\BE-PROJECT\Codes\codes\fast VQ\Files\TestData.mat','CodeBook');
%check=load('C:\D-DRIVE\Rohan\BE-PROJECT\Codes\codes\fast VQ\Files\TestData.mat');

ImgBlocks=getBlocks(SensedImg);
[ImgBlockRow,ImgBlockCol]=size(ImgBlocks);

RowPtrLimit=(floor(ImgRow/2)-floor(TempRow/2)+1);
ColPtrLimit=(floor(ImgCol/2)-floor(TempCol/2)+1);
NoOfImgPor=RowPtrLimit*ColPtrLimit; 
mark = 1;
CurrPor=1; % =====here
StartPos=1; 
MatchAtBlk=1; % ========here
%EndPos=StartPos+BlockRow;
for i=1:RowPtrLimit
    IniPos=StartPos;
    
        for j=1:ColPtrLimit
            IniPos1=StartPos;
            
            clear ImgPorBlock;
            ImgPorBlocks=[];
            clear ImgPorCodeBook;
            
            for k=1:floor(TempRow/2)
                EndPos=StartPos+floor(TempCol/2)-1;
                ImgPorBlocks=[ImgPorBlocks;ImgBlocks(StartPos:EndPos,:)];

                StartPos=StartPos+floor(ImgCol/2);
                
                %OpImg=OpImg1;  -------------------
            end
            
            % **************
            ImgPorCodeBook=getCodeBook(ImgPorBlocks);
            pos=int2str(CurrPor);
                
            %OpImg1=CheckMatch(OpImg,TEMPLATE,CodeBook,ImgPorCodeBook,CurrPor); ------------------ 
              
            Result=false; %-------------------
            Result=CheckMatch1(CodeBook,ImgPorCodeBook);%--------------------
               
            if Result==true  % ----------------Entire If 
               MatchAt=MatchAtBlk;
               Rpos=(ceil(MatchAtBlk/floor(ImgCol/2))*2)-1;
               if rem(MatchAtBlk,floor(ImgCol/2))==0
                  Cpos=(floor(ImgCol/2)*2)-1;
               else
                  Cpos=(rem(MatchAtBlk,floor(ImgCol/2))*2-1);
               end;
               OpImg=showMatchAt(Rpos,Cpos,TempRow,TempCol,OpImg);
%                imshow(OpImg);
%                OPImage=OPImg;
               F_Result=true;
               break;               
            end;
                
%             filepos=strcat('C:\D-DRIVE\Rohan\BE-PROJECT\Codes\codes\fast VQ\Files\ImgCodeBooks\ImgTestData',pos,'.mat');
%             save('filepos','ImgPorCodeBook');
            % *******************            
            
            StartPos=IniPos1+1;
            CurrPor=CurrPor+1;
            MatchAtBlk=MatchAtBlk+1;
            
           % pause(0.01); % Do something important
            progressbar(mark/NoOfImgPor); % Update progress bar
            mark=mark+1;
        end
    if Result==true      
        break;
    end
    StartPos=IniPos+floor(ImgCol/2);
    MatchAtBlk=MatchAtBlk+(floor(ImgCol/2)-ColPtrLimit);
end

% save('C:\D-DRIVE\Rohan\BE-PROJECT\Codes\codes\fast VQ\Files\TestData.mat','CodeBook');
% check=load('C:\D-DRIVE\Rohan\BE-PROJECT\Codes\codes\fast VQ\Files\TestData.mat');

% imshow(OpImg);
pause(0.01);
progressbar(1); 
OPImage=OpImg;

end




