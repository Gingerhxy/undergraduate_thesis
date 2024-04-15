function obstacle=GetObstacle_path(obstacle,path)
%获得已走路径的坐标，加入障碍
    for i = 1:length(path(:,1))
        obstacle=[obstacle;[path(i,:)]];
    end
end