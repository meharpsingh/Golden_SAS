ods results=off;
ods _all_ close;
proc sort data=sashelp.us_data(keep=state statecode
statename population_2010) out=ToCntlinPrep;
where statecode NE 'PR';
by population_2010;
run;
data ToFormat;
retain fmtname 'popfmt' type 'N' Start 0;
length Start End 8 Label $ 64;
set ToCntlInPrep;
if _N_ EQ 1 then Start = population_2010;
if _N_ LT 10 then return;
if _N_ EQ 10 then do;
  End = population_2010;
  Label = trim(left(put(Start,comma10.))) || ' - ' ||
    trim(left(put(population_2010,comma10.))) || ' (ten
lowest)';
  output;
end;
if _N_ EQ 11 then Start = population_2010;
else
if _N_ LT 25 then return;
else
if _N_ EQ 25 then do;
  End = population_2010;
  Label = trim(left(put(Start,comma10.))) || ' - ' ||
    trim(left(put(population_2010,comma10.))) || ' (below
median)';
  output;
end;
else
if _N_ EQ 26
then do;
  Start = population_2010;
  End = population_2010;
  Label = trim(left(put(Start,comma10.))) || ' - ' ||
    trim(left(put(End,comma10.))) || ' (median)';
  output;
end;
else
if _N_ EQ 27 then Start = population_2010;
if _N_ LT 41 then return;
else
if _N_ EQ 41 then do;
  End = population_2010;
  Label = trim(left(put(Start,comma10.))) || ' - ' ||
    trim(left(put(population_2010,comma10.))) || ' (above
median)';
  output;
end;
else
if _N_ EQ 42 then Start = population_2010;
if _N_ LT 51 then return;
else
if _N_ EQ 51 then do;
  End = population_2010;
  Label = trim(left(put(Start,comma10.))) || ' - ' ||
trim(left(put(population_2010,comma10.))) || ' (ten
highest)';
  output;
end;
run;
proc format cntlin=ToFormat library=work;
run;
/* turn on the LISTING destination to see output from:
proc format fmtlib;
run; */
proc sort data=sashelp.us_data(keep=statecode statename
population_2010) out=ToRank;
where statecode NE 'PR';
by descending population_2010;
run;
data Ranked;
length Rank $ 2 /* NOT USED: PopDisplay $ 5 PopShort $ 4 */;
set ToRank;
Rank = left(put(_N_,2.));
run;
