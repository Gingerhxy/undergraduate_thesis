% 该文件为以map.mat为地图文件，point.mat为起止位置文件，
% 进行A*算法路径规划的主程序
clc
clear all
close all;
disp('A Star 集成电路布线开始!!')
h = msgbox('A Star 集成电路布线开始!!');
uiwait(h,5);% 5s后关闭消息框
if ishandle(h) == 1
    delete(h);
end
load map.mat                    % 加载地图
load point.mat                  % 加载起止位置点
[map.XMAX,map.YMAX,map.ZMAX] = size(MAP); %%代表我们要画一个地图的长和宽
obstacle = GetObstacle(map,MAP);% 获取边界数据和障碍物坐标
%加载线路
for i = 1:length(NODE(:,1))
    map.start = NODE(i,1:3);  %起始点 注意必须在地图范围内
    map.goalA = NODE(i,4:6);  %目标点 注意必须在地图范围内
    map.goalB = NODE(i,7:9);  %目标点 注意必须在地图范围内
    map.goalC = NODE(i,10:12);  %目标点 注意必须在地图范围内
    goals1(1,:) = map.start;
    goals1(2,:) = map.goalA;
    goals1(3,:) = map.goalB;
    goals1(4,:) = map.goalC;
    GOALS(:,:,i) = goals1;%所有线路的坐标
    if i>1
        obstacle = GetObstacle_path(obstacle,goals1);%获取其他电路的障碍
    end
end


SuccessTime = 0;%局部线路成功次数
%obstacle = [obstacle;4,1; 4,2; 4,3; 4,4; 3,4 ;2,4;];%全封死的情况，是没有路的
 
% 画出地图和起止点
figure(1)
if length(obstacle)>=1
    plot3(obstacle(:,1)+.5,obstacle(:,2)+.5,obstacle(:,3)+.5,'rx');hold on;
    % plot(obstacle(:,1),obstacle(:,2),'om');hold on;
end
pause(1);
h=msgbox('电路障碍已生成');
uiwait(h,5);% 5s后关闭消息框
if ishandle(h) == 1
    delete(h);
end
close 1
figure(1)
view(3);
axis([1 map.XMAX+1 1 map.YMAX+1 1 map.ZMAX+1])
set(gca,'YTick',0:1:map.YMAX);
set(gca,'XTick',0:1:map.XMAX);
set(gca,'ZTick',0:1:map.ZMAX);
grid on;hold on;

for k = 1:length(GOALS(1,1,:))
    map.start = GOALS(1,:,k);
    map.goalA = GOALS(2,:,k);
    map.goalB = GOALS(3,:,k);
    map.goalC = GOALS(4,:,k);
    % 绘制边界和障碍点
    plot3(obstacle(:,1)+.5,obstacle(:,2)+.5,obstacle(:,3)+.5,'rx');hold on;
    % 绘制起始点
    plot3(map.start(1)+.5,map.start(2)+.5,map.start(3)+.5,'bo');hold on;
    text(map.start(1)+.8,map.start(2)+.8,map.start(3)+.8,strcat('源点',num2str(k)));
    % 绘制终止点
    plot3(map.goalA(1)+.5,map.goalA(2)+.5,map.goalA(3)+.5,'gd');hold on;
    text(map.goalA(1)+.8,map.goalA(2)+.8,map.goalA(3)+.8,strcat('汇点A',num2str(k)));
    plot3(map.goalB(1)+.5,map.goalB(2)+.5,map.goalB(3)+.5,'gd');hold on;
    text(map.goalB(1)+.8,map.goalB(2)+.8,map.goalB(3)+.8,strcat('汇点B',num2str(k)));
    plot3(map.goalC(1)+.5,map.goalC(2)+.5,map.goalC(3)+.5,'gd');hold on;
    text(map.goalC(1)+.8,map.goalC(2)+.8,map.goalC(3)+.8,strcat('汇点C',num2str(k)));
end
 
% 采用A*算法进行路径规划
for j = 1:length(GOALS(1,1,:))
    goals = GOALS(:,:,j);
    for i = 1:(length(goals(:,1))-1)
        map.start = goals(i,:);  %起始点 注意必须在地图范围内
        map.goal = goals(i+1,:);
        if i == 1
            obstacle=[obstacle;[goals(3,:)]];
            obstacle=[obstacle;[goals(4,:)]];
        end
        if i == 2
            obstacle=[obstacle;[goals(4,:)]];
            obstacle=[obstacle;[goals(1,:)]];
        end
        if i == 3
            obstacle=[obstacle;[goals(1,:)]];
            obstacle=[obstacle;[goals(2,:)]];
        end
        [SuccessTime,path] = AStar(obstacle,map,SuccessTime,j);% A*算法
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

%画出路径
%
if SuccessTime == 12
    h=msgbox('A Star 所有电路布线成功!!');
    disp('A Star 所有电路布线成功!!');
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

grid on;