function [xCrab,yCrab,thetaCrab] = moveCrab(cmd,x,y,theta,size,height,width)

sTheta = pi/6;
tStep = 50;
buffer= 50;

  if(cmd == "j")%move left

  xTemp = x + tStep*sin(theta);
  yTemp = y - tStep*cos(theta);
  thetaCrab = theta;

      if (isOnMap(xTemp,yTemp,width,height,buffer))
       xCrab = xTemp;
       yCrab = yTemp;

     else
       xCrab = x;
       yCrab = y;

    endif

  elseif(cmd == "l")%move right

  xTemp = x - tStep*sin(theta);
  yTemp = y + tStep*cos(theta);
  thetaCrab = theta;

      if (isOnMap(xTemp,yTemp,width,height,buffer))
       xCrab = xTemp;
       yCrab = yTemp;

     else
       xCapt = x;
       yCapt = y;

    endif

  elseif(cmd == "k")%move back

  xCrab = x - tStep*sin(theta);
  yCrab = y - tStep*cos(theta);
  thetaCrab = theta;

 elseif(cmd == "u")%turn right

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

endif

endfunction
