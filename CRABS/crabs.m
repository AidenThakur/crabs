function crabs(level)
%This comment is for the github commit changes test
  numCrabs = level;
  numJelly = level;

% Crabs is a kids computer game where a fisherman,  called the captain,
% hunts for a very clever and powerful crab. Test Test tes

 % Draw the game map and initialize map dimensions.
   [mapHeight , mapWidth] = drawMap( "BGImage.png" );
   [mapHeight , mapWidth] = drawMap( "BGImage.png" );

  % Initialize captain location,  heading and size
   xCapt = 1000;
   yCapt = 500;
   thetaCapt = -pi/2;
   sizeCapt = 50;
   healthCapt = 100;
   crabsCaught = 0;

    %initialize crab location, heading and size
    xCrab = rand(1,numCrabs)*mapWidth;
    yCrab = 3*mapHeight/4 + rand(1,numCrabs)*mapHeight/4;
    thetaCrab = ones(1,numCrabs)*(-pi/2);
    crabsCaught = 0;
    sizeCrab = 50;
    isCrabCaught = zeros(1,numCrabs);

    %initialize jellyfish
    xJelly=rand(1, numJelly)*mapWidth;
    yJelly=rand(1, numJelly)*mapHeight;
    thetaJelly = -pi/2;
    sizeJelly = 25;
    jellySting = 2;

  % Draw the captain and initialize graphics handles
%*********************************************************
  % Put your call to  drawCapt() here ….. You must give drawCapt its
  % input and output arguments.

  [captGraphics, xNet, yNet] = drawCapt(xCapt , yCapt , thetaCapt , sizeCapt);

  for k = 1:numCrabs
    crabGraphics(: , k) = drawCrab(xCrab(k), yCrab(k), thetaCrab(k), sizeCrab);
  endfor

  for j = 1:numJelly
   jellyGraphics(: , j) = drawJelly(xJelly(j),yJelly(j),thetaJelly,sizeJelly);
  endfor

  % print health status
     healthLoc = [100,100];
     crabsCaughtLoc = [100,175];
     healthStatus  = text(healthLoc(1), healthLoc(2), strcat('Health = ', num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
     crabsCaughtStatus  = text(crabsCaughtLoc(1), crabsCaughtLoc(2), strcat('Crabs Caught = ',num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red');


%*******************************************************

while(1)

    for j=1:numJelly

      % erase old jellyfish
      for i = 1:length(jellyGraphics(:, j))
      delete(jellyGraphics(i, j));
      endfor

      % move jellyfish
      [xJelly(j),yJelly(j),thetaJelly] = moveJelly(level, xJelly(j), yJelly(j), thetaJelly, sizeJelly, mapWidth,mapHeight);

      % draw jellyfish
      jellyGraphics(: , j) = drawJelly(xJelly(j),yJelly(j),thetaJelly,sizeJelly);

    endfor

    %remove old and plot new health and points status to screen
     delete(healthStatus);
     delete(crabsCaughtStatus);

     healthStatus  = text(healthLoc(1), healthLoc(2), strcat('Health = ', num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
     crabsCaughtStatus  = text(crabsCaughtLoc(1), crabsCaughtLoc(2), strcat('Crabs Caught = ', num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red');


cmd = kbhit(1); % Read the keyboard

  if ( cmd == "Q") % While not quit, read keyboard and respond

   break;

  endif

  if( cmd == "w" || cmd == "a" || cmd == "d" ) %Captain has moved. Respond.
     % erase old captain

     for i=1:length( captGraphics )
      set(captGraphics(i), 'Visible', 'off' );
     endfor

      % move capt
     [xCapt, yCapt, thetaCapt] = moveCapt(cmd, xCapt, yCapt, thetaCapt, mapWidth, mapHeight);

     %draw new capt
     [captGraphics,xNet,yNet]  = drawCapt( xCapt, yCapt, thetaCapt, sizeCapt);

  endif

  for j =1:numJelly
     if( getDistance(xJelly(j),yJelly(j),xCapt,yCapt) < 3*sizeCapt )
        healthCapt = healthCapt - jellySting;
     endif
  endfor


 for k=1:numCrabs

   if( !isCrabCaught(k) && getDistance(xNet,yNet,xCrab(k),yCrab(k)) < 2*sizeCapt )  %crab is caught

           crabsCaught = crabsCaught + 1;
           isCrabCaught(k) = 1;

           %erase old crab
            for i=1:length(crabGraphics(:,k))
              delete(crabGraphics(i,k));
            endfor

   endif

 endfor



 endwhile


close all
clear

endfunction
