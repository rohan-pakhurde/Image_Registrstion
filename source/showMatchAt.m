function ResultImg = showMatchAt( RowNo,ColNo,Height,Width,Img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    ResultImg=Img;
    for i=0:Height-1
        ResultImg(RowNo+i,ColNo,1)=0;
        ResultImg(RowNo+i,ColNo,2)=0;
        ResultImg(RowNo+i,ColNo,3)=0;
        ResultImg(RowNo+i,ColNo+Width-1,1)=0;
        ResultImg(RowNo+i,ColNo+Width-1,2)=0;
        ResultImg(RowNo+i,ColNo+Width-1,3)=0;        
    end

    for i=0:Width-1
        ResultImg(RowNo,ColNo+i,1)=0;
        ResultImg(RowNo,ColNo+i,2)=0;
        ResultImg(RowNo,ColNo+i,3)=0;
        ResultImg(RowNo+Height-1,ColNo+i,1)=0;
        ResultImg(RowNo+Height-1,ColNo+i,2)=0;
        ResultImg(RowNo+Height-1,ColNo+i,3)=0;                
    end
end

