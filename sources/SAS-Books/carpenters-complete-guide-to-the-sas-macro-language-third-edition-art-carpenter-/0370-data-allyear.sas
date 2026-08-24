data allyear;
set yr11(in=in11)
    yr12(in=in12)
    yr13(in=in13);
year = 2000 +
       (in11*11) +
       (in12*12) +
       (in13*13);
run;
