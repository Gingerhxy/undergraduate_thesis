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
for i = 1:length(NODE)
    goalss = NODE{i};
    goals1 = [];
    goals1(1,:) = [0,0,0];
    for j = 1:(length(NODE{i})/3)
        goals1(j,:) = goalss(3*(j-1)+1:3*j);
    end
    GOALS{i} = goals1;%所有线路的坐标
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

for k = 1:length(GOALS)
    goals = GOALS{k};
    for j = 1:length(goals(:,1))
        map.start = goals(j,:);
        % 绘制边界和障碍点
        plot3(obstacle(:,1)+.5,obstacle(:,2)+.5,obstacle(:,3)+.5,'rx');hold on;
        % 绘制起始点
        plot3(map.start(1)+.5,map.start(2)+.5,map.start(3)+.5,'bo');hold on;
        text(map.start(1)+.8,map.start(2)+.8,map.start(3)+.8,strcat(num2str(k),strcat('PIN',num2str(j))));
    end
end
SUCCESSTIME = 0;
% 采用A*算法进行路径规划
t1 = cputime;
for j = 1:length(GOALS)
    PATH(1,:) = [0,0,0];
    goals = GOALS{j};
    SUCCESSTIME = SUCCESSTIME + length(goals(:,1))-1;
    for i = 1:(length(goals(:,1))-1)
        map.start = goals(i,:);  %起始点 注意必须在地图范围内
        map.goal = goals(i+1,:);
        [SuccessTime,path] = AStar(obstacle,map,SuccessTime,j);% A*算法
        if length(path)>=1
            length_PATH = length(PATH(:,1));
            for k = 1:length(path(:,1))
                PATH(length_PATH+k,:) = path(k,:);
            end
        end
    end
    obstacle = GetObstacle_path(obstacle,PATH);
    if j<length(GOALS)
        obstacle=DeteleObstacle_path(obstacle, GOALS{j+1});
    end
end
t2 = cputime;
t = t2-t1;
disp(t);
%画出路径
%
if SuccessTime == SUCCESSTIME
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