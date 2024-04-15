% 该文件为以map.mat为地图文件，point.mat为起止位置文件，
% 进行A*算法路径规划的主程序
clc
clear all
close all;
disp('A Star Integrated Circuit routing Begins!!')
h = msgbox('A Star 集成电路布线开始!!');
uiwait(h,5);% 5s后关闭消息框
if ishandle(h) == 1
    delete(h);
end
load map.mat                    % 加载地图
load point.mat                  % 加载起止位置点
Glist = [];
for o =1:2 %遍历不同的约束，这里是优选方向
    [map.XMAX,map.YMAX,map.ZMAX] = size(MAP); %%代表我们要画一个地图的长和宽
    obstacle = GetObstacle(map,MAP);% 获取边界数据和障碍物坐标
    %加载线路
    for i = 1:length(NODE(:,1))
        map.start = NODE(i,1:3);  %起始点 注意必须在地图范围内
        map.goalA = NODE(i,4:6);  %目标点 注意必须在地图范围内

        goals1(1,:) = map.start;
        goals1(2,:) = map.goalA;

        GOALS(:,:,i) = goals1;%所有线路的坐标
        if i>1
            obstacle = GetObstacle_path(obstacle,goals1);%获取其他电路的障碍
        end
    end


    SuccessTime = 0;%局部线路成功次数
    G_ALL = 0;%总代价
    %obstacle = [obstacle;4,1; 4,2; 4,3; 4,4; 3,4 ;2,4;];%全封死的情况，是没有路的

    % 画出地图和起止点
    figure(o)
    title(['figure',num2str(o)]);
    view(3);
    axis([1 map.XMAX+1 1 map.YMAX+1 1 map.ZMAX+1])
    set(gca,'YTick',0:1:map.YMAX);
    set(gca,'XTick',0:1:map.XMAX);
    set(gca,'ZTick',0:1:map.ZMAX);
    grid on;hold on;

    for k = 1:length(GOALS(1,1,:))
        map.start = GOALS(1,:,k);
        map.goalA = GOALS(2,:,k);

        % 绘制边界和障碍点
        plot3(obstacle(:,1)+.5,obstacle(:,2)+.5,obstacle(:,3)+.5,'rx');hold on;
        % 绘制起始点
        plot3(map.start(1)+.5,map.start(2)+.5,map.start(3)+.5,'bo');hold on;
        text(map.start(1),map.start(2),map.start(3)+.8,strcat('S',num2str(k)),'FontSize',13,'FontWeight','bold');
        % 绘制终止点
        plot3(map.goalA(1)+.5,map.goalA(2)+.5,map.goalA(3)+.5,'gd');hold on;
        text(map.goalA(1),map.goalA(2),map.goalA(3)+.8,strcat('T',num2str(k)),'FontSize',13,'FontWeight','bold');


    end

    % 采用A*算法进行路径规划
    for j = 1:length(GOALS(1,1,:))
        goals = GOALS(:,:,j);
        for i = 1:(length(goals(:,1))-1)
            map.start = goals(i,:);  %起始点 注意必须在地图范围内
            map.goal = goals(i+1,:);

            [SuccessTime,path,G_ALL] = AStar(obstacle,map,SuccessTime,j,G_ALL,o);% A*算法
            obstacle(length(obstacle(:,1)),:)=[];
            obstacle(length(obstacle(:,1)),:)=[];
            if length(path)>=1
                obstacle = GetObstacle_path(obstacle,path);
            end
        end
        if j<length(GOALS(1,1,:))
            obstacle=DeteleObstacle_path(obstacle, GOALS(:,:,j+1));
        end
    end
    Glist = [Glist,G_ALL];
    disp(['The total cost is ',num2str(G_ALL)]);
    s=0;
    for j = 1:length(GOALS(1,1,:))   %计算所有二段网络个数
        goals = GOALS(:,:,j);
        s = s+length(goals(:,1))-1;
    end

    %画出路径
    %
    if SuccessTime == s
        h=msgbox('A Star All circuits routed successfully!!');
        disp('A Star Integrated Circuit routing Begins!!');
        uiwait(h,5);% 5s后关闭消息框
        if ishandle(h) == 1
            delete(h);
        end
    else
        h=msgbox('布线失败!!');
        uiwait(h,5);% 5s后关闭消息框
        if ishandle(h) == 1
            delete(h);
        end
    end
end
disp(strcat(['The optimal solution is the ',num2str(find(Glist==min(Glist)))],'nd figure'))

grid on;