clc;
clear all;
figure;
view(3);

% 参数初始化
MAX_X=10;% 代表我们要画一个地图的长
MAX_Y=10;% 代表我们要画一个地图的宽
MAX_Z=5;% 代表我们要画一个地图的高
p_obstacle = 0;% 障碍率

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
xlabel('X轴');
ylabel('Y轴');
zlabel('Z轴');
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

%%%%%%%%%%%%%%%%第一条电路%%%%%%%%%%%%%%%%
%%地图上选择起始位置
pause(0.3);
xStart=4;%Starting Position
yStart=5;%Starting Position
zStart=1;%Starting Position
MAP(xStart,yStart,zStart) = 0;
plot3(xStart+.5,yStart+.5,zStart+.5,'bo');
text(xStart+.8,yStart+.8,zStart+.8,'源点A');
%%地图上选择目标点
pause(0.3);
xTargetA=7;%Target Position
yTargetA=5;%Target Position
zTargetA=1;%Target Position
MAP(xTargetA,yTargetA,zTargetA) = 9998;
plot3(xTargetA+.5,yTargetA+.5,zTargetA+.5,'go');
text(xTargetA+.8,yTargetA+.8,zTargetA+.8,'汇点A');
pause(0.3);

node = [xStart,yStart,zStart,xTargetA,yTargetA,zTargetA];

%%%%%%%%%%%%%第二条电路%%%%%%%%%
%%地图上选择起始位置
pause(0.3);
xStart2=5;%Starting Position
yStart2=4;%Starting Position
zStart2=1;%Starting Position
MAP(xStart2,yStart2,zStart2) = 0;
plot3(xStart2+.5,yStart2+.5,zStart2+.5,'bo');
text(xStart2+.8,yStart2+.8,zStart2+.8,'源点B');
%%地图上选择目标点
pause(0.3);
xTargetA2=5;%Target Position
yTargetA2=6;%Target Position
zTargetA2=1;%Target Position
MAP(xTargetA2,yTargetA2,zTargetA2) = 9998;
plot3(xTargetA2+.5,yTargetA2+.5,zTargetA2+.5,'go');
text(xTargetA2+.8,yTargetA2+.8,zTargetA2+.8,'汇点B');
pause(0.3);
node2 = [xStart2,yStart2,zStart2,xTargetA2,yTargetA2,zTargetA2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%第三条电路%%%%%%%%%
%%地图上选择起始位置
pause(0.3);
xStart3=6;%Starting Position
yStart3=4;%Starting Position
zStart3=1;%Starting Position
MAP(xStart3,yStart3,zStart3) = 0;
plot3(xStart3+.5,yStart3+.5,zStart3+.5,'bo');
text(xStart3+.8,yStart3+.8,zStart3+.8,'源点C');
%%地图上选择目标点
pause(0.3);
xTargetA3=6;%Target Position
yTargetA3=6;%Target Position
zTargetA3=1;%Target Position
MAP(xTargetA3,yTargetA3,zTargetA3) = 9998;
plot3(xTargetA3+.5,yTargetA3+.5,zTargetA3+.5,'go');
text(xTargetA3+.8,yTargetA3+.8,zTargetA3+.8,'汇点C');
pause(0.3);
node3 = [xStart3,yStart3,zStart3,xTargetA3,yTargetA3,zTargetA3];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NODE(1,:)=node;
NODE(2,:)=node2;
NODE(3,:)=node3;


save map MAP;
save point NODE;
h=msgbox('电路3D网格模型已生成');
uiwait(h,20);
if ishandle(h) == 1
    delete(h);
end
