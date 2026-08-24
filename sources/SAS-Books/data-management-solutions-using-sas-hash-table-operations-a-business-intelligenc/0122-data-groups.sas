%let N_groups = 3 ;
data Groups ;
do Inning = 1 to 9 ;
Group
= 1 + mod (Inning, &N_groups) ;
Group_Seq = 1 + mod (Inning + &N_groups - 1
,&N_groups) ;
output ;
end ;
run ;
