function path=GetPath(close,start,close_back,goal)

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
    
    ind_back=1;
    while 1
        path=[close_back(ind_back,1:3); path];
        if isequal(close_back(ind_back,1:3),goal)   
            break;
        end
        for io_back=1:length(close_back(:,1))
            if isequal(close_back(io_back,1:3),close_back(ind_back,6:8))
                ind_back=io_back;
                break;
            end
        end
    end
end