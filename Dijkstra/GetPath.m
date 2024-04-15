function path=GetPath(close,start)

    ind=1;
    path=[];
    while 1
        path=[path; close(ind,1:2)];
        if isequal(close(ind,1:2),start)   
            break;
        end
        for io=1:length(close(:,1))
            if isequal(close(io,1:2),close(ind,4:5))   %close(1,4:5)就是goal点的父节点，这里是去找哪一行close(io,1:2)会等于goal的父节点，找到以后在继续这样去找谁等于这个父节点的父节点，直到父节点为start.
                ind=io;
                break;
            end
        end
    end
end