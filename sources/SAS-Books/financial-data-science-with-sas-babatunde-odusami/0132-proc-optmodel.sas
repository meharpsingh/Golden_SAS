proc optmodel;
      var x >= 0 , y >= 0;
      min f = 7*x +5*y;
      con 4*x + 3*y >= 19;
      con  x + y <= 5;
      solve;
