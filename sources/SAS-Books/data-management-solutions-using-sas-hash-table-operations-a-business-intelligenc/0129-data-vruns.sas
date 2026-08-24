%let comp_keys = Game_SK Inning Top_Bot ;
%let keys_list = %sysfunc (tranwrd (&comp_keys, %str( ), %str(,))) ; ❶
%let UKS_base = input (_MD5, pib2.) ;
%let N_groups = 4 ;
%let UKS_group = mod (&UKS_base,&N_groups) + 1 ;
data vRuns / view = vRuns ;
❷
 set dw.Runs ;
length _concat $ 32 _MD5 $ 16 ;
_concat = catx (":", &keys_list) ;
_MD5 = md5 (_concat) ;
run ;
%macro UKS() ;
%do Group = 1 %to &N_groups ;
do LR = 0 by 0 until (LR) ;
set vRuns (where=(&UKS_group=&Group)) end = LR ;
❸
 link SCORE ;
end ;
link OUT ;
%end ;
%mEnd ;
