function codeBook = getCodeBook( Blocks )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    codeBook=[];
    splitLevel=3;
    maxCluster=power(2,splitLevel);
    maxLimit=(2*maxCluster)+1;
    currClusNo=1;
    [r,c]=size(Blocks);
    allocCluster = ones(1,r);
    currLevel=1;

    while currLevel<=splitLevel
        while (currClusNo<power(2,currLevel+1))
            flag=false;
            clear currBlks;
            currBlks=[];
            for i=1:r
                if allocCluster(1,i)==currClusNo
                    currBlks=[currBlks;Blocks(i,:)];
                    flag=true;
                end;
            end
            
            clear clusMean;
            if flag==false
                for i=1:c
                    clusMean(1,c)=-1;
                end
            else
                if  numel(mean(currBlks))==1
                clusMean=currBlks;
                else
                clusMean=mean(currBlks);    
                end;
            end;
            
            if flag==true
                if numel(mean(currBlks))~=1 
                    for i=1:r
                        if allocCluster(1,i)==currClusNo
                            if Blocks(i,currLevel)<=clusMean(1,currLevel)
                                allocCluster(1,i)=allocCluster(1,i)*2;
                            else
                                allocCluster(1,i)=(allocCluster(1,i)*2)+1;
                            end;
                        end;
                    end                    
                end;
            end;
            
            if currLevel==splitLevel
                codeBook=[codeBook;clusMean];                
            end;
            currClusNo=currClusNo+1;
        end
        
        currLevel=currLevel+1;

    end

end

