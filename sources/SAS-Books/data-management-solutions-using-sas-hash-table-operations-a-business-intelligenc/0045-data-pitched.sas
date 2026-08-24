data Pitched ;
if _n_ = 1 then do ;
if 0 then set dw.Players_positions_played (keep=Player_ID Pitcher) ;
dcl hash pitch (dataset: "dw.Players_positions_played (where=(Pitcher))") ; ❶
 pitch.defineKey ("Player_ID") ;
pitch.defineData ("Pitcher") ;
pitch.defineDone () ;
end ;
set bizarro.Player_candidates ;
where Team_SK in (193) ;
call missing (Pitcher) ;
