clc;
clear all;
figure;
view(3);

% 参数初始化
MAX_X=10;% 代表我们要画一个地图的长
MAX_Y=10;% 代表我们要画一个地图的宽
MAX_Z=5;% 代表我们要画一个地图的高
p_obstacle = 0.05;% 障碍率

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
xStart=1;%Starting Position
yStart=4;%Starting Position
zStart=1;%Starting Position
MAP(xStart,yStart,zStart) = 0;
plot3(xStart+.5,yStart+.5,zStart+.5,'bo');
text(xStart+.8,yStart+.8,zStart+.8,'源点');
%%地图上选择目标点
pause(0.3);
xTargetA=3;%Target Position
yTargetA=2;%Target Position
zTargetA=2;%Target Position
MAP(xTargetA,yTargetA,zTargetA) = 9998;
plot3(xTargetA+.5,yTargetA+.5,zTargetA+.5,'go');
text(xTargetA+.8,yTargetA+.8,zTargetA+.8,'汇点A');
pause(0.3);
xTargetB=6;%Target Position
yTargetB=8;%Target Position
zTargetB=3;%Target Position
MAP(xTargetB,yTargetB,zTargetB) = 9998;
plot3(xTargetB+.5,yTargetB+.5,zTargetB+.5,'go');
text(xTargetB+.8,yTargetB+.8,zTargetB+.8,'汇点B');
pause(0.3);
xTargetC=6;%Target Position
yTargetC=6;%Target Position
zTargetC=4;%Target Position
MAP(xTargetC,yTargetC,zTargetC) = 9998;
plot3(xTargetC+.5,yTargetC+.5,zTargetC+.5,'go');
text(xTargetC+.8,yTargetC+.8,zTargetC+.8,'汇点C');
node = [xStart,yStart,zStart,xTargetA,yTargetA,zTargetA,xTargetB,yTargetB,zTargetB,xTargetC,yTargetC,zTargetC];

%%%%%%%%%%%%%第二条电路%%%%%%%%%
%%地图上选择起始位置
pause(0.3);
xStart2=4;%Starting Position
yStart2=6;%Starting Position
zStart2=1;%Starting Position
MAP(xStart2,yStart2,zStart2) = 0;
plot3(xStart2+.5,yStart2+.5,zStart2+.5,'bo');
text(xStart2+.8,yStart2+.8,zStart2+.8,'源点2');
%%地图上选择目标点
pause(0.3);
xTargetA2=7;%Target Position
yTargetA2=3;%Target Position
zTargetA2=2;%Target Position
MAP(xTargetA2,yTargetA2,zTargetA2) = 9998;
plot3(xTargetA2+.5,yTargetA2+.5,zTargetA2+.5,'go');
text(xTargetA2+.8,yTargetA2+.8,zTargetA2+.8,'汇点A2');
pause(0.3);
xTargetB2=9;%Target Position
yTargetB2=4;%Target Position
zTargetB2=3;%Target Position
MAP(xTargetB2,yTargetB2,zTargetB2) = 9998;
plot3(xTargetB2+.5,yTargetB2+.5,zTargetB2+.5,'go');
text(xTargetB2+.8,yTargetB2+.8,zTargetB2+.8,'汇点B2');
pause(0.3);
xTargetC2=2;%Target Position
yTargetC2=6;%Target Position
zTargetC2=4;%Target Position
MAP(xTargetC2,yTargetC2,zTargetC2) = 9998;
plot3(xTargetC2+.5,yTargetC2+.5,zTargetC2+.5,'go');
text(xTargetC2+.8,yTargetC2+.8,zTargetC2+.8,'汇点C2');
node2 = [xStart2,yStart2,zStart2,xTargetA2,yTargetA2,zTargetA2,xTargetB2,yTargetB2,zTargetB2,xTargetC2,yTargetC2,zTargetC2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%第三条电路%%%%%%%%%
%%地图上选择起始位置
pause(0.3);
xStart3=3;%Starting Position
yStart3=4;%Starting Position
zStart3=1;%Starting Position
MAP(xStart3,yStart3,zStart3) = 0;
plot3(xStart3+.5,yStart3+.5,zStart3+.5,'bo');
text(xStart3+.8,yStart3+.8,zStart3+.8,'源点3');
%%地图上选择目标点
pause(0.3);
xTargetA3=3;%Target Position
yTargetA3=6;%Target Position
zTargetA3=2;%Target Position
MAP(xTargetA3,yTargetA3,zTargetA3) = 9998;
plot3(xTargetA3+.5,yTargetA3+.5,zTargetA3+.5,'go');
text(xTargetA3+.8,yTargetA3+.8,zTargetA3+.8,'汇点A3');
pause(0.3);
xTargetB3=9;%Target Position
yTargetB3=8;%Target Position
zTargetB3=3;%Target Position
MAP(xTargetB3,yTargetB3,zTargetB3) = 9998;
plot3(xTargetB3+.5,yTargetB3+.5,zTargetB3+.5,'go');
text(xTargetB3+.8,yTargetB3+.8,zTargetB3+.8,'汇点B3');
pause(0.3);
xTargetC3=4;%Target Position
yTargetC3=9;%Target Position
zTargetC3=4;%Target Position
MAP(xTargetC3,yTargetC3,zTargetC3) = 9998;
plot3(xTargetC3+.5,yTargetC3+.5,zTargetC3+.5,'go');
text(xTargetC3+.8,yTargetC3+.8,zTargetC3+.8,'汇点C3');
node3 = [xStart3,yStart3,zStart3,xTargetA3,yTargetA3,zTargetA3,xTargetB3,yTargetB3,zTargetB3,xTargetC3,yTargetC3,zTargetC3];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%第四条电路%%%%%%%%%
%%地图上选择起始位置
pause(0.3);
xStart4=2;%Starting Position
yStart4=3;%Starting Position
zStart4=1;%Starting Position
MAP(xStart4,yStart4,zStart4) = 0;
plot3(xStart4+.5,yStart4+.5,zStart4+.5,'bo');
text(xStart4+.8,yStart4+.8,zStart4+.8,'源点4');
%%地图上选择目标点
pause(0.3);
xTargetA4=3;%Target Position
yTargetA4=7;%Target Position
zTargetA4=2;%Target Position
MAP(xTargetA4,yTargetA4,zTargetA4) = 9998;
plot3(xTargetA4+.5,yTargetA4+.5,zTargetA4+.5,'go');
text(xTargetA4+.8,yTargetA4+.8,zTargetA4+.8,'汇点A4');
pause(0.3);
xTargetB4=5;%Target Position
yTargetB4=5;%Target Position
zTargetB4=3;%Target Position
MAP(xTargetB4,yTargetB4,zTargetB4) = 9998;
plot3(xTargetB4+.5,yTargetB4+.5,zTargetB4+.5,'go');
text(xTargetB4+.8,yTargetB4+.8,zTargetB4+.8,'汇点B4');
pause(0.3);
xTargetC4=6;%Target Position
yTargetC4=3;%Target Position
zTargetC4=4;%Target Position
MAP(xTargetC4,yTargetC4,zTargetC4) = 9998;
plot3(xTargetC4+.5,yTargetC4+.5,zTargetC4+.5,'go');
text(xTargetC4+.8,yTargetC4+.8,zTargetC4+.8,'汇点C4');
node4 = [xStart4,yStart4,zStart4,xTargetA4,yTargetA4,zTargetA4,xTargetB4,yTargetB4,zTargetB4,xTargetC4,yTargetC4,zTargetC4];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NODE(1,:)=node;
NODE(2,:)=node2;
NODE(3,:)=node3;
NODE(4,:)=node4;

save map MAP;
save point NODE;
h=msgbox('电路3D网格模型已生成');
uiwait(h,20);
if ishandle(h) == 1
    delete(h);
end
close(figure(1));