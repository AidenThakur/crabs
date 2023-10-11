function [xCrab,yCrab,thetaCrab] = moveCrab(cmd,x,y,theta,size,height,width)

sTheta = pi/6;
tStep = 50;

  if(cmd == "j")%move left

  xCrab = x + tStep*sin(theta);
  yCrab = y - tStep*cos(theta);
  thetaCrab = theta;

  elseif(cmd == "l")%move right

  xCrab = x - tStep*sin(theta);
  yCrab = y + tStep*cos(theta);
  thetaCrab = theta;

  elseif(cmd == "k")%move back

  xCrab = x - tStep*sin(theta);
  yCrab = y - tStep*cos(theta);
  thetaCrab = theta;

 elseif(cmd == "i")%turn right

  xCrab = x;
  yCrab = y;
  thetaCrab = theta + sTheta;

  elseif(cmd == "i")%turn right

  xCrab = x;
  yCrab = y;
  thetaCrab = theta - sTheta;


else
 xCrab = x;
 yCrab = y;
 thetaCrab = theta



endfunction
