   OPTIONS  LS=80  PS=60;
   DATA D1;
      INPUT  SUB_NUM
             CONSEQ    $
             MOD_AGGR  $
             SUB_AGGR;
   DATALINES;
   01 MR L 11
   02 MR L  7
   03 MR L 15
   04 MR L 12
   05 MR L  8
   06 MR M 24
   07 MR M 19
   08 MR M 20
   09 MR M 23
   10 MR M 29
   11 MR H 23
   12 MR H 29
   13 MR H 25
   14 MR H 20
   15 MR H 27
   16 MP L  4
   17 MP L  0
   18 MP L  9
   19 MP L  2
   20 MP L  8
   21 MP M 17
   22 MP M 20
   23 MP M 12
   24 MP M 17
   25 MP M 21
   26 MP H 12
   27 MP H 20
   28 MP H 21
   29 MP H 20
   30 MP H 18
   ;
