data League_1 League_2 ;
set Bizarro.Teams ;
select (League_SK) ;
when (1) output League_1 ;
