function obstacle=GetObstacle(map,MAP)
%获得地图的边界和障碍点的坐标
    % 生成边界的坐标,此处XMAX表示MAP的行数，YMAX表示MAP的列数
    boundary=[];
    for i1=0:(map.YMAX+1)
        boundary=[boundary;[0 i1]];
    end
    for i2=0:(map.XMAX+1)
        boundary=[boundary;[i2 0]];
    end
    for i3=0:(map.YMAX+1)
        boundary=[boundary;[map.XMAX+1 i3]];
    end
    for i4=0:(map.XMAX+1)
        boundary=[boundary;[i4 map.YMAX+1]];
    end
    obstacle = boundary;
    % 生成障碍点的坐标
    for i=1:map.XMAX
        for j=1:map.YMAX
            if MAP(i,j) == -1
                obstacle=[obstacle;[i j]];
            end
        end
    end
end