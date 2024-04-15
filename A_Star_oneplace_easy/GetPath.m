function path=GetPath(close,start)

    ind=1;
    path=[];
    while 1
        path=[path; close(ind,1:3)];
        if isequal(close(ind,1:3),start)   
            break;
        end
        for io=1:length(close(:,1))
            if isequal(close(io,1:3),close(ind,6:8))
                ind=io;
                break;
            end
        end
    end
end