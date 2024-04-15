clc;
clear all;
figure;
view(3);

% 参数初始化
MAX_X=10;% 代表我们要画一个地图的长
MAX_Y=10;% 代表我们要画一个地图的宽
MAX_Z=5;% 代表我们要画一个地图的高
p_obstacle = 0.2;% 障碍率

% 设置障碍点
obstacle = ones(MAX_X,MAX_Y)*p_obstacle;%生成矩阵
% 将MAP矩阵中障碍点置为-1，非障碍点置为9998
MAP=[];
for i=1:MAX_Z
   MAP1 = 9999*((rand(MAX_X,MAX_Y))>obstacle)-1;    % -1值代表障碍物，rand随机数矩阵
   MAP(:,:,i)=MAP1;
end
j=0;
axis([1 MAX_X+1 1 MAX_Y+1 1 MAX_Z+1])
set(gca,'ZTick',0:1:MAX_Z);
set(gca,'YTick',0:1:MAX_Y);
set(gca,'XTick',0:1:MAX_X);
grid on;
hold on;
% 绘制出地图上的障碍物
for z=1:MAX_Z
    for i=1:MAX_X
        for j=1:MAX_Y
            if MAP(i,j,z) == -1
                plot3(i+.5,j+.5,z+.5,'rx');
            end
        end
    end
end
%%地图上选择起始位置
pause(1);
xStart=2;%Starting Position
yStart=4;%Starting Position
zStart=2;%Starting Position
MAP(xStart,yStart,zStart) = 0;
plot3(xStart+.5,yStart+.5,zStart+.5,'bo');
text(xStart+.8,yStart+.8,zStart+.8,'S','FontSize',14,'FontWeight','bold');
%%地图上选择目标点
pause(1);
xTargetA=7;%Target Position
yTargetA=8;%Target Position
zTargetA=4;%Target Position
MAP(xTargetA,yTargetA,zTargetA) = 9998;
plot3(xTargetA+.5,yTargetA+.5,zTargetA+.5,'go');
text(xTargetA+.8,yTargetA+.8,zTargetA+.8,'T','FontSize',14,'FontWeight','bold');
pause(1);
node = [xStart,yStart,zStart,xTargetA,yTargetA,zTargetA];
save map MAP;
save point node;
h=msgbox('电路3D网格模型已生成');
uiwait(h,5);
if ishandle(h) == 1
    delete(h);
end