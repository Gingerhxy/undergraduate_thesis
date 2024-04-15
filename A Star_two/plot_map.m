function  plot_map( map,obstacle,open,close )

% %画出障碍点、起始点、终点
% if length(obstacle)>=1
%     plot(obstacle(:,1),obstacle(:,2),'sk','MarkerFaceColor','k');hold on;
% end
% plot(map.start(1),map.start(2),'*r');hold on;
% plot(map.goal(1),map.goal(2),'*g');hold on;

% axis equal;
% axis([-1.5,map.XMAX+2.5,-1.5,map.YMAX+2.5]);

%绘制网格
% for i = 1:map.XMAX+3
%    line([-0.5,map.XMAX+1.5],[i-1.5,i-1.5]);
% end
% 
% for j = 1:map.YMAX+3
%    line([j-1.5,j-1.5],[-0.5,map.YMAX+1.5]);
% end
pause(0.02);
%绘制节点

plot3(close(:,1)+0.5,close(:,2)+0.5,close(:,3)+0.5,'sr','MarkerFaceColor','r');
hold on;
%pause(0.1);
plot3(open(:,1)+0.5,open(:,2)+0.5,open(:,3)+0.5,'sg','MarkerFaceColor','g');
hold on;
%pause(0.1);

end
