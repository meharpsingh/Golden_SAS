ods results=off;
ods _all_ close;
proc sort data=sashelp.us_data(keep=state statecode statename population_2010) out=ToCntlinPrep;
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
    trim(left(put(population_2010,comma10.))) || ' (ten lowest)';
  output;
end;
if _N_ EQ 11 then Start = population_2010;
else
if _N_ LT 25 then return;
else
if _N_ EQ 25 then do;
  End = population_2010;
  Label = trim(left(put(Start,comma10.))) || ' - ' ||
    trim(left(put(population_2010,comma10.))) || ' (below median)';
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
    trim(left(put(population_2010,comma10.))) || ' (above median)';
  output;
end;
else
if _N_ EQ 42 then Start = population_2010;
if _N_ LT 51 then return;
else
if _N_ EQ 51 then do;
  End = population_2010;
  Label = trim(left(put(Start,comma10.))) || ' - ' || trim(left(put(population_2010,comma10.))) || ' (ten highest)';
  output;
end;
run;
proc format cntlin=ToFormat library=work;
run;
/* turn on the LISTING destination to see output from:
proc format fmtlib;
run; */
proc sort data=sashelp.us_data(keep=statecode statename population_2010) out=ToRank;
where statecode NE 'PR';
by descending population_2010;
run;
data Ranked;
length Rank $ 2 /* NOT USED: PopDisplay $ 5 PopShort $ 4 */;
set ToRank;
Rank = left(put(_N_,2.));
run;
proc sort data=Ranked out=RankedToMerge;
by statecode;
run;
proc sort data=mapsgfk.uscenter(keep=x y state statecode ocean) out=StateCentersToMerge;
by statecode;
run;
data population_plus_statecenter;
merge StateCentersToMerge(in=StateCenter) RankedToMerge(in=Ranked);
by statecode;
if StateCenter and Ranked;
if ocean EQ 'Y' AND statecode EQ 'VT'
then delete;
else
if ocean EQ 'N' AND statecode NE 'VT'
then delete;
run;
data statelabels;
set population_plus_statecenter;
length label $15;
label=statecode;
if label='FL'
then x = x + 0.005;
if label='HI'
then y = y + 0.025;
if label='ME'
then y = y + 0.01;
if ocean EQ 'Y'
then do;
  if statecode IN ('NH')
  then x = x + 0.03;
  else
  if statecode IN ('MA' 'CT' 'RI')
  then x = x + 0.04;
  else
  if statecode EQ 'MD'
  then x = x + 0.02;
  else
  if statecode EQ 'DC'
  then x = x + 0.01;
  else
  if statecode IN ('NJ' 'DE')
  then x = x + 0.03;
  label = trim(Rank) || ' - ' || statecode || ' - ' ||
          put(population_2010 / 1000000,5.2);
  output;
end;
else do;
  if statecode EQ 'VT'
  then do;
    y = y + 0.025;
  x = x - 0.005;
  end;
  y = y + 0.01;
  label = Rank;
  output;
  y = y - 0.01;
  label = statecode;
  output;
  y = y - 0.01;
  label = put(population_2010 / 1000000,5.2);
  output;
end;
 /* NOT USED:
PopDiaplay = put(population_2010 / 1000000,5.2);
PopShort = put(population_2010 / 1000000,4.1);
 */
run;
proc template;
define style styles.LeRB_FiveColorMap_POGCB;
 parent=styles.xhtmlblue;
/* NOT USED:
  style graphbackground / color=cxfafae6;
