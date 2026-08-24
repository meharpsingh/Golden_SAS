data .....;
  set.....;
  %exist(sasuser.bigdat)/* causes an error */
  if "&exist"="YES" then do;
