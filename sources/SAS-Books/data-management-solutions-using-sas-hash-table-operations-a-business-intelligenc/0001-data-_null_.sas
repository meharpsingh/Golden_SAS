data _null_ ;
set bizarro.Player_candidates end = LR ;
TN = 1 + mod (rank (MD5 (cats (Team_SK, Player_ID))), 8) ;
array Freq [8] (8*0) ;
Freq[TN] + 1 ;
if LR then put Freq[*] ;
run ;
