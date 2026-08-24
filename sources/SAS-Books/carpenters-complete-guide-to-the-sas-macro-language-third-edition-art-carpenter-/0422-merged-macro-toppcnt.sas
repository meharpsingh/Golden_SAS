/* Merged listing: this program was assembled from 9 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0422-macro-applyfmt.sas --- */
%macro applyfmt(dsn=,var=,fmt=,chktype=);
   %* Make sure the format is present;
   %if &fmt = %then %do; ➎
      %put ERROR: Format is missing for a FIXRAW request;
      %put ERROR- &=DSN &=var;
      %return; ➏
   %end;
   %* Make sure that the format has a period;
   %if %index(&fmt,.)=0 %then %let fmt=&fmt..; ➐
   data &dsn; ➑
      set &dsn;
      &var = put(&var,&fmt); ➒
   run;
%mend applyfmt;

/* --- 0438-macro-toppcnt.sas --- */
%macro toppcnt(dsn,idvar,pcnt);
***********************************************************;
* create table pcnt for indicating &pcnt of ids           *;
***********************************************************;
proc sql noprint;
   select count(distinct &idvar) *&pcnt ➊
      into :idpcnt  ➋
         from &dsn;
***********************************************************;
*   sort on descending &idvar                             *;

/* --- 0439-proc-sort.sas --- */
proc sort data= &dsn out=items;
by descending &idvar;
run;
***********************************************************;
*   keep top &IDPCNT %                                    *;
***********************************************************;
data topitems;
set items(obs=%sysevalf(&idpcnt,ceil)); ➌
run;
%mend toppcnt;
%toppcnt(macro3.biomass,bmtotl,.25);

/* --- 0440-macro-selpcnt.sas --- */
%macro selpcnt(dsn=,idvar=,pcnt=);
* Sort the incoming data set in descending order;
proc sort data=&dsn  ➊
          out=items;
   by descending &idvar;
   run;
* Read the first IDPCNT observations from ITEMS;
data topNitems;
   idpcnt = ceil(nobs*&pcnt);  ➌
   do point = 1 to idpcnt;
      set items point=point nobs=nobs; ➋
      output topnitems;
   end;
   stop;
   run;
%mend selpcnt;

/* --- 0442-macro-rand_wo.sas --- */
%macro rand_wo(dsn=,pcnt=100);
   %local obscnt;
   %let obscnt = %obscnt(&dsn); ➌
   %put obs count is &obscnt;
   * Randomly select observations from &DSN;
   data rand_wo(drop=cnt totl);
      * Calculate the number of obs to read;
      totl = ceil(&pcnt*&obscnt); ➍
      array obsno {&obscnt} _temporary_;  ➎
      do until(cnt=totl);
         point = ceil(ranuni(0)*&obscnt);  ➏
         if obsno{point} ne 1 then do;  ➐
            * This obs has not been selected before;
            set &dsn point=point; ➑
            output rand_wo;
            obsno{point}=1;  ➒
            cnt+1;
         end;
      end;
      stop;
      run;
%mend rand_wo;

/* --- 0443-macro-rand_w.sas --- */
%macro rand_w(dsn,numobs=0,pcnt=0);  ➊
* Randomly select &NUMOBS observations from &DSN;
data rand_w;
retain numobs .;
drop numobs i;
* Create a variable (NUMOBS) to hold number of obs
* to write to RAND_W;
%if &pcnt ne 0 and &numobs=0 %then %do;
   * Use the percent to calculate a number of obs;
   numobs = round(nobs*&pcnt); ➋
%end;
%else %do;
   numobs = &numobs; ➌
%end;
* Loop through the SET statement NUMOBS times;
do i = 1 to numobs;
   * Determine the next observation to read;
   point = ceil(ranuni(0)*nobs);  ➍
   * Read and output the selected observation;
   set &dsn point=point nobs=nobs  ; ➎
   output rand_w;  ➏
end;
stop;
run;
%mend rand_w;

/* --- 0445-data-_null_.sas --- */
%let qlist = ➎
     %str(%')%sysfunc(tranwrd(&list,%str( ),%str(',')))%str(%');
%* Build the WHERE clause;
%if &miss=ok %then %let wclause = &chkvar ge ._; ➏
%else %let wclause = &chkvar gt .z;
%if &reg ne %then %let wclause = &wclause & region="&reg"; ➐
%if %bquote(&list) ne  %then
      %let wclause = &wclause & clinnum in(&qlist); ➑
data _null_;
   set &dsn(where=(%unquote(&wclause))); ➒
   file "c:\temp\makecsv.csv" dlm=',';
   if _n_=1 then put "clinicnumber,clinicname,region,&chkvar";
   put clinnum clinname region &chkvar;
   run;
%mend makecsv;

/* --- 0446-macro-findoutliers.sas --- */
%macro findoutliers(dsn=,prefix=,value=,op=ge, logicop=or);
%local i wclause;
proc contents data=&dsn noprint
              out=contdsn; ➊
   run;
data _null_;
   set contdsn;
   if name =: %upcase("&prefix");
   cnt+1;
   call symputx(catt('var',cnt),trim(name),'l'); ➋
   call symputx('varcnt',cnt,'l'); ➌
   run;
%if varcnt ge 1 %then %do;
   %let wclause= &var1 &op &value;  ➍
   %if varcnt gt 1 %then %do i = 2 %to &varcnt;
      %* Build the where clause; ➎
      %let wclause = &wclause &logicop &&var&i &op &value;
   %end;
data outliers;
   set &dsn(where=(&wclause)); ➏
   run;
%end;
%mend findoutliers;

/* --- 0448-macro-buildmatrix.sas --- */
%macro buildmatrix(dsn=);
data _null_;
   set &dsn end=eof;
   array vlist {*} _numeric_; ➊
   length name $18;
   i+1; ➋
   if eof then call symputx('rowcnt',i,'l'); ➌
   if i=1 then call symputx('colcnt',dim(vlist),'l');
   *** Store values for this row;
   * Build the base for the macro vars for this row;
   mbase = catt('r',i,'c'); ➍
   * Step through the values for this observation;
   do j = 1 to dim(vlist); ➎
      * Save the value for this row and column;
      call symputx(catt(mbase,j),vlist{j},'l'); ➏
      * Save the variable name;
      if i=1 then do;
         call vname(vlist(j),name); ➐
         call symputx(catt('vname',j),name,'l');
end;
   end;
   run;
