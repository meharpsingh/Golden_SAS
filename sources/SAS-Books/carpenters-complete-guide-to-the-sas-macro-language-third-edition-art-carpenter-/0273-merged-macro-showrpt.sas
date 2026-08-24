/* Merged listing: this program was assembled from 9 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0273-macro-modfem.sas --- */
%macro modfem(dsn);
   %* Execute only for Females;
   %if &dsn ne FEMALE %then %return;
   data &dsn;
      set &dsn;
      wt = wt*2.2;;
      run;
%mend modfem;

/* --- 0295-macro-showrpt.sas --- */
%macro showRPT(dsn=sashelp.class);
proc report data=&dsn list;
run;
%mend showrpt;

/* --- 0301-macro-m_all_data.sas --- */
%macro M_all_data(dsn=);
%local nobs;
data _null_;
   set &dsn;
   * Variable Arrays;
   array _nums {*} _numeric_; ➌
   array _char {*} $ _character_;
   if dim(_nums) do i = 1 to dim(_nums);
      call symputx(catt(vname(_nums{i}➍),_n_➎),_nums{i}➏,'l');
   end;
   if dim(_char) do i = 1 to dim(_char);
      call symputx(catt(vname(_char{i}),_n_),_char{i},'l');
   end;
run;
%let NObs = &sysnobs; ➐
* Your process which utilizes these macro variables goes here;

/* --- 0312-macro-rbuild.sas --- */
%macro RBuild(dsn=,reg=);
%syslput _local_;
rsubmit;
   data buildbig;
      set &dsn(where=(region="&reg"));

/* --- 0339-macro-sumry.sas --- */
%macro sumry(dsn=,classlst=,varlst=);
title1 "Summary of &varlst";
proc summary data=&dsn;
   class &classlst;
   var &varlst;
   output out=sumry n= mean= stderr=/autoname;
   run;
%mend sumry;

/* --- 0350-macro-breakup.sas --- */
%macro breakup(dsn=,classvar=);
%local classcnt i;
proc sql noprint;
   select distinct &classvar ➊
      into :cval1- ➋
         from &dsn;
   %let classcnt=&sqlobs; ➌
   quit;

/* --- 0351-macro-breakup.sas --- */
%macro breakup(dsn=,classvar=);
%local classcnt i;
proc sql noprint;
   select distinct &classvar
      into :cval1-
         from &dsn;
   %let classcnt=&sqlobs;
   quit;

/* --- 0354-macro-numobs.sas --- */
%macro numobs(dsn=);
data _null_;
   call symputx('numobs', dsnobs, ➊'g');  ➋
   stop;  ➌
   set &dsn nobs=dsnobs; ➍
   run;
%mend numobs;

/* --- 0394-macro-split.sas --- */
%macro split(dsn=, dsnroot=fred, splitcnt=3);
%local dsid vcnt i cnteach j;
%let dsid = %sysfunc(open(&dsn)); ➊
%if &dsid ne 0 %then %do;
   %let vcnt = %sysfunc(attrn(&dsid,nvar)); ➋
   %do i = 1 %to &vcnt;
      %local vars&i;
      %let vars&i = %sysfunc(varname(&dsid,&i)); ➌
      %*put &&vars&i; %* Debbugging;
   %end;
   %let dsid = %sysfunc(close(&dsid)); ➍
   %* Nominal number of variables in each new dataset;
   %let cnteach = %sysevalf(&vcnt/&splitcnt,ceil); ➎
   data
      %do i = 1 %to &splitcnt; ➏
         &dsnroot&i(keep= ➐
            %do j= %eval((&i-1)*&cnteach+1) ➑
                    %to %sysfunc(min(&vcnt,%eval(&i*&cnteach))); ➒
              &&vars&j ➓
              %*put &=i &=j &&vars&j; %* Debugging;
            %end;
                   )
      %end;
      ;
      set &dsn;
      run;
%end;
%mend split;
