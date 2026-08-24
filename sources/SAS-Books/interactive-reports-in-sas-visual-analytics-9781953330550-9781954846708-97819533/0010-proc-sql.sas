proc sql;
     select max(__seq__) into :max_county from public.counties;
quit;
%put &=max_county;
/****************************************************************
********/
/*  STEP 3                                                              */
/*  Modify MAPSGFK.US_STATES to match COUNTIES data set:                */
/*  Create goeid, __seq__, format state names, rename variables         */
/****************************************************************
********/
data us_states(rename=(long=x lat=y));
     set mapsgfk.us_states;
     if _n_=1 then __seq__=&max_county.;
     length geoid $5.;
     geoid=cats(put(state,z2.),'000');
     __seq__+1;
     name=stnamel(statecode);
     drop x y resolution density id state statecode;
run;
/****************************************************************
********/
/*  STEP 4                                                              */
/*  Load SAS data set from a Base engine library (work.us_states) into  */
/*  the specified caslib ("Public") and save as "States".                */
/****************************************************************
********/
