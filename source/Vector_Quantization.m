function [ OPImage,Result ] = Vector_Quantization( Sensed,Template,Template_Name )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    Process=strcat('Testing for match with : ',Template_Name);
    progressbar(Process) % Init single bar

IPIMG = Sensed;
[r,c,d]= size(IPIMG);
IPIMG1=IPIMG;
TEMPLATE = Template;
TEMPLATE1=TEMPLATE;
[r1,c1,d1]= size(TEMPLATE);
%IPIMG =  [zeros(r1-2,c+((c1-2)*2),3);zeros(r,c1-2,3) IPIMG zeros(r,c1-2,3);zeros(r1-2,c+((c1-2)*2),3)];
[r2,c2,d2]= size(IPIMG);
fresult=false;
TempCodeBook = getCB(TEMPLATE);
[r3,c3,d3]= size(TempCodeBook);

mark=1;
marklimit=(r2-r1)*(c2-c1);

for i=1:r2-r1%(r-2)+r1-2
    for j=1:c2-c1%c+c1
        clear X;
        X = zeros(r1,c1,d1);
        for x=1:r1
            for y=1:c1
                 X(x,y,1)= IPIMG(i+x-1,j+y-1,1);
                 X(x,y,2)= IPIMG(i+x-1,j+y-1,2);
                 X(x,y,3)= IPIMG(i+x-1,j+y-1,3);
            end
        end
        %IMGportionclus=getcluster(X);
        
        %----------- this part to check only
        result=false;
        
        clear ImgPorCodeBook;
        ImgPorCodeBook = getCB(X);
        for CBrow=1:r3
            for CBcol=1:c3
                if (abs(TempCodeBook(CBrow,CBcol)-ImgPorCodeBook(CBrow,CBcol))>5)
                    result=false;
                    break;
                else
                    result=true;
                    %fresult=false;
                    %break;
                end;

            end
            if (result==false)
            break;
            end;
        end
        
        if(result==true)
            fresult=true;
            OPIMG=showMatchAt(i,j,r1,c1,IPIMG);
            %imshow(OPIMG);
            OPImage=OPIMG;
            Result=true;
        end;
        %----------- this part to check only
        progressbar(mark/marklimit); % Update progress bar
        mark=mark+1;
        if fresult==true;
            disp('MATCH!!');
            break;
        end;
    end
    if fresult==true;
        disp('MATCH2!!');
        break;
    end;
end
        if(fresult==false)
            %imshow(IPIMG);
            OPImage=IPIMG;
            Result=false;
            disp('FAIL!!');
        end;
pause(0.01);
progressbar(1); 

end

