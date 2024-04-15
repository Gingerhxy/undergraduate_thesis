clc;
clear all;
figure;

% 参数初始化
MAX_X=50;% 代表我们要画一个地图的长
MAX_Y=50;% 代表我们要画一个地图的宽
p_obstacle = 0.3;% 障碍率

% 设置障碍点
obstacle = ones(MAX_X,MAX_Y)*p_obstacle;
% 将MAP矩阵中障碍点置为-1，非障碍点置为9998
MAP = 9999*((rand(MAX_X,MAX_Y))>obstacle)-1;    % -1值代表障碍物
j=0;
x_val = 1;
y_val = 1;
axis([1 MAX_X+1 1 MAX_Y+1])   %x轴，y轴范围1-50的图像
set(gca,'YTick',0:1:MAX_Y);   %x轴，y轴间隔为1
set(gca,'XTick',0:1:MAX_X);
grid on;
hold on;
% 绘制出地图上的障碍物
for i=1:MAX_X
    for j=1:MAX_Y
        if MAP(i,j) == -1
            plot(i+.5,j+.5,'rx');
        end
    end
end
%%地图上选择起始位置
pause(1);
h=msgbox('Please Select the Vehicle initial position using the Left Mouse button');
uiwait(h,5);% 5s后关闭消息框
if ishandle(h) == 1
    delete(h);
end
xlabel('Please Select the Vehicle initial position ','Color','black');
but=0;
while (but ~= 1) %Repeat until the Left button is not clicked
    [xval,yval,but]=ginput(1);
    xval=floor(xval);
    yval=floor(yval);
end
xStart=xval;%Starting Position
yStart=yval;%Starting Position
MAP(xval,yval) = 0;
plot(xval+.5,yval+.5,'bo');
%%地图上选择目标点
pause(1);
h=msgbox('Please Select the Target using the Left Mouse button in the space');
uiwait(h,5);
if ishandle(h) == 1
    delete(h);
end
xlabel('Please Select the Target using the Left Mouse button','Color','black');
but = 0;
while (but ~= 1) %Repeat until the Left button is not clicked
    [xval,yval,but]=ginput(1);
end
xval = floor(xval);
yval = floor(yval);
xTarget = xval;
yTarget = yval;
MAP(xval,yval) = 9998;
plot(xval+.5,yval+.5,'gd');
text(xval+1,yval+.5,'Target');
node = [xStart,yStart,xTarget,yTarget];
save map MAP;
save point node;
close(figure(1));