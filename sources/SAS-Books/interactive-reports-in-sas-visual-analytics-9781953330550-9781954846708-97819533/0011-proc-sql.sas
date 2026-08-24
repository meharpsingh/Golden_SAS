proc sql;
     select max(__seq__) into :max_state from us_states;
quit;
%put &=max_state;
/****************************************************************
********/
/*  STEP 6                                                              */
/*  Modify MAPSGFK.WORLD to match COUNTIES data set:                    */
/*  Filter for US, create geoid, __seq__, rename variables              */
/****************************************************************
********/
data us(rename=(long=x lat=y idname=name));
     set mapsgfk.world;
     where id='US';
     if _n_=1 then __seq__=&max_state.;
     length geoid $5.;
     geoid='00000';
     __seq__+1;
     drop x y id iso isoalpha2 resolution density cont lake;
run;
/****************************************************************
********/
/*  STEP 7                                                              */
/*  Load SAS data set from a Base engine library (work.us) into         */
/*  the specified caslib ("Public") and save as "US".                    */
/****************************************************************
********/
