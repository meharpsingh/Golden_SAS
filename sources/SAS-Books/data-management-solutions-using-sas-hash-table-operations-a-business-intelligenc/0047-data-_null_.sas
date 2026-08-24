data _null_ ;
❶
 if _n_ = 1 then do ;
❷
 dcl hash h (multidata:"Y") ;
❸
 h.defineKey ("_n_") ;
❹
 h.defineData ("League_SK", "Team_SK", "Team_Name") ;
❺
 h.defineDone () ;
end ;
do until (last.League_SK) ;
❻
 set bizarro.Teams ;
by League_SK ;
h.add() ;
❼
 end ;
h.output (dataset: catx ("_", "work.League", League_SK)) ; ❽
 h.clear() ;
❾
run ;
