%let comp_keys = Game_SK Inning Top_Bot AB_Number ;
❶
%let data_vars = Batter_ID Is_A_Hit Result ;
%let data_list = %sysfunc (tranwrd (&data_vars, %str( ), %str(,))) ; ❷
data Join_Runs_AtBats (drop = _: Runs) ;
if _n_ = 1 then do ;
dcl hash h (multidata:"Y", ordered:"A") ;
do _k = 1 to countw ("&comp_keys") ;
❸
 h.defineKey (scan ("&comp_keys", _k)) ;
end ;
