%MACRO CreateProps(data=,vars=,target=,library=sasuser,
                   out_ds=,mv_baseline=YES,type=c,other_tag="OTHER");
*** Load the number of items in &VARS into macro variable NVARS;
%LET c=1;
%DO %WHILE(%SCAN(&vars,&c) NE);
 %LET c=%EVAL(&c+1);
%END;
%LET nvars=%EVAL(&c-1);
*** Loop over the Variables in Vars;
%DO i = 1 %TO &nvars;
   *** Calculate the MEAN of the target variable for each group;
   PROC MEANS DATA = &data NOPRINT MISSING;
   FORMAT &target 16.3;
    VAR &target;
    CLASS %SCAN(&vars,&i);
    OUTPUT OUT = work.prop_%SCAN(&vars,&i) MEAN=;
   RUN;
   %IF &MV_BASELINE = YES %THEN %DO;
       PROC SORT DATA = work.prop_%SCAN(&vars,&i);
     BY _type_ %SCAN(&vars,&i);
    RUN;
   DATA work.prop_%SCAN(&vars,&i);
     SET work.prop_%SCAN(&vars,&i);
        &target._lag=lag(&target);
IF _type_ = 1 and %SCAN(&vars,&i) IN ("",".") Then
       &target=&target._lag;
    RUN;
   %END;
   *** Prepare a data set that is used to create a format;
   DATA work.prop_%SCAN(&vars,&i);
        %IF &type = n %THEN %DO;
      SET work.prop_%SCAN(&vars,&i)(rename = (%SCAN(&vars,&i) =
tmp_name));;
    %SCAN(&vars,&i) = PUT(tmp_name,16.);
        %END;
%ELSE %DO;
            SET work.prop_%SCAN(&vars,&i);;
IF UPCASE(%SCAN(&vars,&i)) = 'OTHER' THEN
%SCAN(&vars,&i) = '_OTHER';
        %END;
IF _type_ = 0 THEN DO;
                                %SCAN(&vars,&i)=&other_tag;
_type_ = 1;
 END;
    RUN;
