function next = MotionModel()
%当前节点  周围的八个相邻节点  与  当前节点的坐标差值（前两列）
%当前节点  周围的八个相邻节点  与  当前节点的距离值（最后一列）

next = [-1,1,14;...
    0,1,10;...
    1,1,14;...
    -1,0,10;...
    1,0,10;...
    -1,-1,14;...
    0,-1,10;...
    1,-1,14];

end
