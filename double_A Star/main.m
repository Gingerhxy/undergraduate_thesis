% 该文件为以map.mat为地图文件，point.mat为起止位置文件，
% 进行A*算法路径规划的主程序
clc
clear all
close all;
disp('A Star 集成电路布线开始!!')
h=msgbox('A Star 集成电路布线开始!!');
uiwait(h,5);% 5s后关闭消息框
if ishandle(h) == 1
    delete(h);
end
load map.mat                    % 加载地图
load point.mat                  % 加载起止位置点
[map.XMAX,map.YMAX,map.ZMAX] = size(MAP); %%代表我们要画一个地图的长和宽
map.start = node(1:3);  %起始点 注意必须在地图范围内
map.goal = node(4:6);  %目标点 注意必须在地图范围内
obstacle = GetObstacle(map,MAP);% 获取边界数据和障碍物坐标
clear MAP node                  % 后续程序不再使用这两个变量
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
% 绘制边界和障碍点
plot3(obstacle(:,1)+.5,obstacle(:,2)+.5,obstacle(:,3)+.5,'rx');hold on;
% 绘制起始点
plot3(map.start(1)+.5,map.start(2)+.5,map.start(3)+.5,'bo');hold on;
text(map.start(1)+.8,map.start(2)+.8,map.start(3)+.8,'S');
% 绘制终止点
plot3(map.goal(1)+.5,map.goal(2)+.5,map.goal(3)+.5,'gd');hold on;
text(map.goal(1)+.8,map.goal(2)+.8,map.goal(3)+.8,'T');
% plot(map.start(1),map.start(2),'*r');hold on;
% plot(map.goal(1),map.goal(2),'*b');hold on;
 
% 采用A*算法进行路径规划
t1 = cputime;
path = AStar(obstacle,map);% A*算法
t2 = cputime;
t = t2-t1;
disp(t);
%画出路径
%
if length(path)>=1
    plot3(path(:,1)+0.5,path(:,2)+0.5,path(:,3)+0.5,'-m','LineWidth',5);hold on;
%     h=msgbox('A Star 布线成功!!');
%     uiwait(h,5);% 5s后关闭消息框
%     if ishandle(h) == 1
%         delete(h);
%     end
else
    h=msgbox('布线失败!!');
    uiwait(h,5);% 5s后关闭消息框
    if ishandle(h) == 1
        delete(h);
    end
end

grid on;