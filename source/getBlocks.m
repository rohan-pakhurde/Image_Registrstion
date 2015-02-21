function blk = getBlocks( TEMPLATE )

%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[r,c,d]= size(TEMPLATE);
blk =zeros((floor(r/2)*floor(c/2)),12);%------------'blk' is a 2D array of blocks where every row represents one blk with 12 values.

row=1;
col=1;
blkpos=1;
    while (blkpos<=(floor(r/2) * floor(c/2)))%-------initializing blks with pixel value
        if  row<=r-1
        blk(blkpos,1) =(TEMPLATE(row,col,1));
        blk(blkpos,2) =(TEMPLATE(row,col,2));
        blk(blkpos,3) =(TEMPLATE(row,col,3));
        blk(blkpos,4) =(TEMPLATE(row,col+1,1));
        blk(blkpos,5) =(TEMPLATE(row,col+1,2));
        blk(blkpos,6) =(TEMPLATE(row,col+1,3));
        blk(blkpos,7) =(TEMPLATE(row+1,col,1));
        blk(blkpos,8) =(TEMPLATE(row+1,col,2));
        blk(blkpos,9) =(TEMPLATE(row+1,col,3));
        blk(blkpos,10) =(TEMPLATE(row+1,col+1,1));
        blk(blkpos,11) =(TEMPLATE(row+1,col+1,2));
        blk(blkpos,12) =(TEMPLATE(row+1,col+1,3));
        col=col+2;
        if(col>c-1)
            row=row+2;
            col=1;
        end;
        
        end;
        blkpos=blkpos+1;
    end;

end

