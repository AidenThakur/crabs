#Start of code -> File, make func
function lineHandle = drawLine ( pointA, pointB, color)
% This funtion takes two points A and B, draws a line of the color I choose

%extract the x cordinatesfrom the points
x = [ pointA(1) ; pointB(1)];
y = [ pointA(2) ; pointB(2)];

lineHandle= plot(x, y, color);
set(lineHandle, "LineWidth",3);

endfunction
