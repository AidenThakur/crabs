function retval = crabs (level)
%This comment is for the github commit changes test


% Crabs is a kids computer game where a fisherman,  called the captain,
% hunts for a very clever and powerful crab. Test Test tes

 % Draw the game map and initialize map dimensions.
   [mapHeight , mapWidth] = drawMap( "BGImage.png" );

  % Initialize captain location,  heading and size
   xCapt = 1000;
   yCapt = 500;
   thetaCapt = -pi/2;
   sizeCapt = 50;
   healthCapt = 100;
   crabsCaught = 0;

    %initialize crab location, heading and size
    xCrab = 1000;
    yCrab = 1200;
    thetaCrab = -pi/2;
    sizeCrab = 50;



    %initialize jellyfish
     %initialize jelly fish
     xJelly=rand*mapWidth;
     yJelly=0;
     thetaJelly = -pi/2;
     sizeJelly = 25;
     jellySting = 2;

  % Draw the captain and initialize graphics handles
%*********************************************************
  % Put your call to  drawCapt() here ….. You must give drawCapt its
   % input and output arguments.

  [captGraphics, xNet, yNet] = drawCapt(xCapt , yCapt , thetaCapt , sizeCapt);
  crabGraphics = drawCrab(xCrab, yCrab, thetaCrab, sizeCrab);
  jellyGraphics = drawJelly(xJelly,yJelly,thetaJelly,sizeJelly);

  % print health status
     healthLoc = [100,100];
     crabsCaughtLoc = [100,175];
     healthStatus  = text(healthLoc(1), healthLoc(2), strcat('Health = ', ...
                                    num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
     crabsCaughtStatus  = text(crabsCaughtLoc(1), crabsCaughtLoc(2), ...
          strcat('Crabs Caught = ',num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red')


%*******************************************************
  cmd = "null"; % initial command

  while(1)
   % erase old jellyfish
    for i=1:length(jellyGraphics)
      delete(jellyGraphics(i));
    endfor
    % move jellyfish
    [xJelly,yJelly,thetaJelly] = moveJelly(level, xJelly, yJelly, thetaJelly, sizeJelly, mapWidth,mapHeight);
    % draw jellyfish
    jellyGraphics = drawJelly(xJelly,yJelly,thetaJelly,sizeJelly);

    %remove old and plot new health and points status to screen
     delete(healthStatus);
     delete(crabsCaughtStatus);

     healthStatus  = text(healthLoc(1), healthLoc(2), strcat('Health = ', ...
                                  num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
     crabsCaughtStatus  = text(crabsCaughtLoc(1), crabsCaughtLoc(2), ...
                                  strcat('Crabs Caught = ' num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red');


cmd = kbhit(1); % Read the keyboard

  if ( cmd == "Q") % While not quit, read keyboard and respond

   break;

  endif

  if( cmd == "w" || cmd == "a" || cmd == "d" ) %Captain has moved. Respond.
     % erase old captain

     for i=1:length( captGraphics )
      set(captGraphics(i), 'Visible', 'off' );
     endfor

     if( getDistance(xJelly,yJelly,xCapt,yCapt) < 3*sizeCapt )
       healthCapt = healthCapt - jellySting;
     endif

% move capt
   [xCapt, yCapt, thetaCapt] = moveCapt(cmd, xCapt, yCapt, thetaCapt, mapWidth, mapHeight);
  %[ xCapt, yCapt, thetaCapt ] = moveCapt( cmd, x, y, theta );

% draw new capt
   [captGraphics,xNet,yNet]  = drawCapt( xCapt, yCapt, thetaCapt, sizeCapt);

     if( getDist(xJelly,yJelly,xCapt,yCapt) < 3*sizeCapt )
       healthCapt = healthCapt - jellySting;
     endif


 if( getDistance(xNet,yNet,xCrab,yCrab) < 2*sizeCapt )  %crab is caught

        %keep track of how many crabs are caught
          crabsCaught = crabsCaught +1;

           %erase old crab
            for i=1:length(crabGraphics)
              delete(crabGraphics(i));
            endfor

           %create a new crab. initialize new crab location, heading and size
             xCrab = rand*mapWidth;
             yCrab = rand*mapHeight;
             thetaCrab = -pi/2;
             sizeCrab = 50;

          %draw new crab
           crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);

  endif


  %move crab
  [xCrab, yCrab, thetaCrab] = moveCrab(cmd, xCrab, yCrab, thetaCrab, sizeCrab, mapHeight, mapWidth);
  %draw new captain and crab
  crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);
  %[xCrab,yCrab,thetaCrab] = moveCrab(cmd,x,y,theta,size,height,width)




 endif


endwhile


close all
clear

endfunction
