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
xStart=2;%Starting Position
yStart=8;%Starting Position
zStart=1;%Starting Position
MAP(xStart,yStart,zStart) = 0;
plot3(xStart+.5,yStart+.5,zStart+.5,'bo');
text(xStart+.8,yStart+.8,zStart+.8,'S');
%%地图上选择目标点
pause(0.3);
xTargetA=5;%Target Position
yTargetA=8;%Target Position
zTargetA=2;%Target Position
MAP(xTargetA,yTargetA,zTargetA) = 9998;
plot3(xTargetA+.5,yTargetA+.5,zTargetA+.5,'go');
text(xTargetA+.8,yTargetA+.8,zTargetA+.8,'A');
pause(0.3);
xTargetB=5;%Target Position
yTargetB=2;%Target Position
zTargetB=3;%Target Position
MAP(xTargetB,yTargetB,zTargetB) = 9998;
plot3(xTargetB+.5,yTargetB+.5,zTargetB+.5,'go');
text(xTargetB+.8,yTargetB+.8,zTargetB+.8,'B');
pause(0.3);
xTargetC=8;%Target Position
yTargetC=5;%Target Position
zTargetC=4;%Target Position
MAP(xTargetC,yTargetC,zTargetC) = 9998;
plot3(xTargetC+.5,yTargetC+.5,zTargetC+.5,'go');
text(xTargetC+.8,yTargetC+.8,zTargetC+.8,'C');
pause(0.3);
xTargetF=5;%Target Position
yTargetF=5;%Target Position
zTargetF=2;%Target Position
MAP(xTargetF,yTargetF,zTargetF) = 9998;
plot3(xTargetF+.5,yTargetF+.5,zTargetF+.5,'go');
text(xTargetF+.8,yTargetF+.8,zTargetF+.8,'F');
node = [xStart,yStart,zStart,xTargetA,yTargetA,zTargetA,xTargetF,yTargetF,zTargetF,xTargetB,yTargetB,zTargetB,xTargetF,yTargetF,zTargetF,xTargetC,yTargetC,zTargetC];

% % %%%%%%%%%%%%%第二条电路%%%%%%%%%
% %%地图上选择起始位置
% pause(0.3);
% xStart=2;%Starting Position
% yStart=8;%Starting Position
% zStart=1;%Starting Position
% MAP(xStart,yStart,zStart) = 0;
% plot3(xStart+.5,yStart+.5,zStart+.5,'bo');
% text(xStart+.8,yStart+.8,zStart+.8,'源点');
% %%地图上选择目标点
% pause(0.3);
% xTargetA=5;%Target Position
% yTargetA=8;%Target Position
% zTargetA=2;%Target Position
% MAP(xTargetA,yTargetA,zTargetA) = 9998;
% plot3(xTargetA+.5,yTargetA+.5,zTargetA+.5,'go');
% text(xTargetA+.8,yTargetA+.8,zTargetA+.8,'汇点A');
% pause(0.3);
% xTargetB=5;%Target Position
% yTargetB=2;%Target Position
% zTargetB=3;%Target Position
% MAP(xTargetB,yTargetB,zTargetB) = 9998;
% plot3(xTargetB+.5,yTargetB+.5,zTargetB+.5,'go');
% text(xTargetB+.8,yTargetB+.8,zTargetB+.8,'汇点B');
% pause(0.3);
% xTargetC=8;%Target Position
% yTargetC=5;%Target Position
% zTargetC=4;%Target Position
% MAP(xTargetC,yTargetC,zTargetC) = 9998;
% plot3(xTargetC+.5,yTargetC+.5,zTargetC+.5,'go');
% text(xTargetC+.8,yTargetC+.8,zTargetC+.8,'汇点C');
% node1 = [xStart,yStart,zStart,xTargetA,yTargetA,zTargetA,xTargetB,yTargetB,zTargetB,xTargetC,yTargetC,zTargetC];
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%第二条电路%%%%%%%%%
%%地图上选择起始位置
pause(0.3);
xStart=5;%Starting Position
yStart=5;%Starting Position
zStart=1;%Starting Position
MAP(xStart,yStart,zStart) = 0;
plot3(xStart+.5,yStart+.5,zStart+.5,'bo');
text(xStart+.8,yStart+.8,zStart+.8,'源点');
%%地图上选择目标点
pause(0.3);
xTargetA=5;%Target Position
yTargetA=5;%Target Position
zTargetA=5;%Target Position
MAP(xTargetA,yTargetA,zTargetA) = 9998;
plot3(xTargetA+.5,yTargetA+.5,zTargetA+.5,'go');
text(xTargetA+.8,yTargetA+.8,zTargetA+.8,'汇点A');
node1 = [xStart,yStart,zStart,xTargetA,yTargetA,zTargetA];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
%%%%%%%%%%%%%%%%第三条电路%%%%%%%%%%%%%%%%
%%地图上选择起始位置
pause(0.3);
xStart=1;%Starting Position
yStart=7;%Starting Position
zStart=1;%Starting Position
MAP(xStart,yStart,zStart) = 0;
plot3(xStart+.5,yStart+.5,zStart+.5,'bo');
text(xStart+.8,yStart+.8,zStart+.8,'源点S');
%%地图上选择目标点
pause(0.3);
xTargetA=3;%Target Position
yTargetA=9;%Target Position
zTargetA=2;%Target Position
MAP(xTargetA,yTargetA,zTargetA) = 9998;
plot3(xTargetA+.5,yTargetA+.5,zTargetA+.5,'go');
text(xTargetA+.8,yTargetA+.8,zTargetA+.8,'汇点A');
pause(0.3);
xTargetB=4;%Target Position
yTargetB=2;%Target Position
zTargetB=3;%Target Position
MAP(xTargetB,yTargetB,zTargetB) = 9998;
plot3(xTargetB+.5,yTargetB+.5,zTargetB+.5,'go');
text(xTargetB+.8,yTargetB+.8,zTargetB+.8,'汇点B');
pause(0.3);
xTargetC=7;%Target Position
yTargetC=4;%Target Position
zTargetC=4;%Target Position
MAP(xTargetC,yTargetC,zTargetC) = 9998;
plot3(xTargetC+.5,yTargetC+.5,zTargetC+.5,'go');
text(xTargetC+.8,yTargetC+.8,zTargetC+.8,'汇点C');
pause(0.3);
xTargetF1=3;%Target Position
yTargetF1=7;%Target Position
zTargetF1=2;%Target Position
MAP(xTargetF,yTargetF,zTargetF) = 9998;
plot3(xTargetF1+.5,yTargetF1+.5,zTargetF1+.5,'go');
text(xTargetF1+.8,yTargetF1+.8,zTargetF1+.8,'F1');
pause(0.3);
xTargetF2=4;%Target Position
yTargetF2=4;%Target Position
zTargetF2=2;%Target Position
MAP(xTargetF,yTargetF,zTargetF) = 9998;
plot3(xTargetF2+.5,yTargetF2+.5,zTargetF2+.5,'go');
text(xTargetF2+.8,yTargetF2+.8,zTargetF2+.8,'F2');
node2 = [xStart,yStart,zStart,xTargetF1,yTargetF1,zTargetF1,xTargetA,yTargetA,zTargetA,xTargetF1,yTargetF1,zTargetF1,xTargetF2,yTargetF2,zTargetF2,xTargetB,yTargetB,zTargetB,xTargetF2,yTargetF2,zTargetF2,xTargetC,yTargetC,zTargetC];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%第四条电路%%%%%%%%%%%%%%%%
%%地图上选择起始位置
pause(0.3);
xStart=2;%Starting Position
yStart=4;%Starting Position
zStart=5;%Starting Position
MAP(xStart,yStart,zStart) = 0;
plot3(xStart+.5,yStart+.5,zStart+.5,'bo');
text(xStart+.8,yStart+.8,zStart+.8,'源点S');
%%地图上选择目标点
pause(0.3);
xTargetA=3;%Target Position
yTargetA=8;%Target Position
zTargetA=2;%Target Position
MAP(xTargetA,yTargetA,zTargetA) = 9998;
plot3(xTargetA+.5,yTargetA+.5,zTargetA+.5,'go');
text(xTargetA+.8,yTargetA+.8,zTargetA+.8,'汇点A');
pause(0.3);
xTargetB=9;%Target Position
yTargetB=4;%Target Position
zTargetB=3;%Target Position
MAP(xTargetB,yTargetB,zTargetB) = 9998;
plot3(xTargetB+.5,yTargetB+.5,zTargetB+.5,'go');
text(xTargetB+.8,yTargetB+.8,zTargetB+.8,'汇点B');
pause(0.3);
xTargetC=6;%Target Position
yTargetC=1;%Target Position
zTargetC=1;%Target Position
MAP(xTargetC,yTargetC,zTargetC) = 9998;
plot3(xTargetC+.5,yTargetC+.5,zTargetC+.5,'go');
text(xTargetC+.8,yTargetC+.8,zTargetC+.8,'汇点C');
pause(0.3);
xTargetF1=6;%Target Position
yTargetF1=4;%Target Position
zTargetF1=3;%Target Position
MAP(xTargetF,yTargetF,zTargetF) = 9998;
plot3(xTargetF1+.5,yTargetF1+.5,zTargetF1+.5,'go');
text(xTargetF1+.8,yTargetF1+.8,zTargetF1+.8,'F1');
pause(0.3);
xTargetF2=6;%Target Position
yTargetF2=8;%Target Position
zTargetF2=2;%Target Position
MAP(xTargetF,yTargetF,zTargetF) = 9998;
plot3(xTargetF2+.5,yTargetF2+.5,zTargetF2+.5,'go');
text(xTargetF2+.8,yTargetF2+.8,zTargetF2+.8,'F2');
node3 = [xStart,yStart,zStart,xTargetF1,yTargetF1,zTargetF1,xTargetF2,yTargetF2,zTargetF2,xTargetA,yTargetA,zTargetA,xTargetF2,yTargetF2,zTargetF2,xTargetF1,yTargetF1,zTargetF1,xTargetB,yTargetB,zTargetB,xTargetF1,yTargetF1,zTargetF1,xTargetC,yTargetC,zTargetC];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



NODE={node,node1,node2,node3};




save map MAP;
save point NODE;
h=msgbox('电路3D网格模型已生成');
uiwait(h,20);
if ishandle(h) == 1
    delete(h);
end
