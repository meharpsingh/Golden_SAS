proc sql ;
create table Triples as
select * from bizarro.Player_candidates
where Player_ID in
(select Batter_ID from Dw.AtBats where Result = "Triple")
and
Team_SK in (193) ;
quit ;
