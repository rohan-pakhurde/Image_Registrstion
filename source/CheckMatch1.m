function flag = CheckMatch1(CodeBook,ImgPorCodeBook)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[row col]=size(CodeBook);
flag=true;

for i=1:row
    for j=1:col
        if abs(CodeBook(i,j)- ImgPorCodeBook(i,j))>15
            flag=false;
%            OpImg(Rpos,Cpos,1)=0;
%            OpImg(Rpos,Cpos,2)=0;
%            OpImg(Rpos,Cpos,3)=255;
            
        end;
    end
end

%if flag==true
%    
%    for i=0:TempRow-1
%        OpImg(Rpos+i,Cpos,1)=255;
%       OpImg(Rpos+i,Cpos,2)=255;
%       OpImg(Rpos+i,Cpos,3)=255;
%        OpImg(Rpos+i,Cpos+TempCol,1)=255;
%        OpImg(Rpos+i,Cpos+TempCol,2)=255;
%        OpImg(Rpos+i,Cpos+TempCol,3)=255;        
%    end
%    for j=0:TempCol-1
%        OpImg(Rpos,Cpos+j,1)=255;
%        OpImg(Rpos,Cpos+j,2)=255;
%        OpImg(Rpos,Cpos+j,3)=255;
%        OpImg(Rpos+TempRow,Cpos+j,1)=255;
%        OpImg(Rpos+TempRow,Cpos+j,2)=255;
%        OpImg(Rpos+TempRow,Cpos+j,3)=255;
%    end
    
%end;

end

