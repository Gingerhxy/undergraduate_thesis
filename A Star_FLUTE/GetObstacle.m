function obstacle=GetObstacle(map,MAP)
%获得地图的边界和障碍点的坐标
    % 生成边界的坐标,此处XMAX表示MAP的行数，YMAX表示MAP的列数
    boundary=[];
    for i2=0:(map.YMAX+1)
        for i1=0:(map.XMAX+1)
            boundary=[boundary;[i1 i2 0]];
            boundary=[boundary;[i1 i2 map.ZMAX+1]];
        end
    end
    for i3=0:(map.YMAX+1)
        for i4=0:(map.ZMAX+1)
            boundary=[boundary;[0 i3 i4]];
            boundary=[boundary;[map.XMAX+1 i3 i4]];
        end
    end
    for i5=0:(map.ZMAX+1)
        for i6=0:(map.XMAX+1)
            boundary=[boundary;[i6 0 i5]];
            boundary=[boundary;[i6 map.YMAX+1 i5]];
        end
    end
    obstacle = boundary;
    % 生成障碍点的坐标
    for i=1:map.XMAX
        for j=1:map.YMAX
            for z=1:map.ZMAX
                if MAP(i,j,z) == -1
                    obstacle=[obstacle;[i j z]];
                end
            end
        end
    end
end