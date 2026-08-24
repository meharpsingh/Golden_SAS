data _null_ ;
dcl hash H() ;
do until (lr) ;
❶
set sashelp.vcolumn (keep=memname libname Name) end=lr ;
where libname="BIZARRO" and memname="PLAYER_CANDIDATES" ; ❷
isKey = scan (upcase (Name), -1, "_") in ("ID","SK") ;
❸
if isKey then H.defineKey(Name) ;
 ❹
else
H.defineData(Name) ;
end ;
H.defineDone () ;
❺
stop ;
set bizarro.Player_candidates ;
 ❻
run ;
