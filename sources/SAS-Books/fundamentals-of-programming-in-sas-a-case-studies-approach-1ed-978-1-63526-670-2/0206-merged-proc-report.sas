/* Merged listing: this program was assembled from 9 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0206-data-work-ipums2005cost.sas --- */
data work.ipums2005cost;   set work.ipums2005cost;
  if electric ge 9000 then electric=.;   if gas ge 9000 then gas=.;   if water ge 9000 then water=.;   if fuel ge 9000 then fuel=.; run;
proc corr data= work.ipums2005cost;
  var electric gas water fuel;
  with mortgagePayment hhincome homevalue;
  where homevalue ne 9999999 and mortgageStatus contains 'Yes';   ods select PearsonCorr;
run;

/* --- 0263-proc-report.sas --- */
proc report data= work.ipums2005cost;
  column mortgageStatus electric,(n median mean std);
  rbreak after  / summarize ;
  define mortgageStatus / group 'Mortgage Status';
  define electric / ' ';
  define n / 'Number of Observations' format=comma8. ;
  define median / 'Median Electricity Cost' format=dollar10.;
  define mean / 'Mean Electricity Cost' format=dollar10.;
  define std / 'Standard Deviation' format=dollar10.;
run;

/* --- 0265-proc-report.sas --- */
proc report data= work.ipums2005cost;
  where state in ('North Carolina','South Carolina');
  column state mortgageStatus electric,(n median mean std);
  define state / group 'State';
  define mortgageStatus / group 'Mortgage Status' format=$Mort_Status.;
  define electric / '';
  define n / 'Number of Observations' format=comma8.;
  define median / 'Median Electricity Cost' format=dollar10.;
  define mean / 'Mean Electricity Cost' format=dollar10.;
  define std / 'Standard Deviation' format=dollar10.;
  break after  state  / summarize  suppress ;
  rbreak after / summarize;
run;

/* --- 0266-proc-report.sas --- */
proc report data= work.ipums2005cost;
  where state in ('North Carolina','South Carolina');
  column mortgageStatus state ,(electric=num electric=mid electric=mean
    electric=sd) ;
  define state / across  'State Electricity Costs';
  define mortgageStatus / group 'Mortgage Status' format=$Mort_Status.;
  define num / n 'N' format=comma8.;
  define mid / median 'Median' format=dollar10.;
  define mean / mean 'Mean' format=dollar10.;
  define sd / std 'Std. Dev.' format=dollar10.;
  rbreak after / summarize;
run;
proc report data= work.ipums2005cost;
  where state in ('North Carolina','South Carolina');
  column mortgageStatus state,electric,(n median mean std) ;
  define state / across 'State Electricity Costs';

/* --- 0267-proc-format.sas --- */
proc format;
  value MetroStatus
    0 = "Unknown"
    1 = "Non-Metro"
    2-4 = "Metro"
  ;
run;
proc report data= work.ipums2005cost;
  where state in ('North Carolina','South Carolina');
  column mortgageStatus state ,metro ,electric ;
  define state / across 'State';   define metro / across 'Metro Status' format=MetroStatus.;   define mortgageStatus / group 'Mortgage Status' format=$Mort_Status.;
  define electric / mean 'Avg. Elec. Cost' format=dollar10.; run;

/* --- 0268-proc-report.sas --- */
proc report data= work.ipums2005cost;
  where state in ('North Carolina','South Carolina');
  column mortgageStatus electric,state,metro;
  define state / across 'Mean Electricity Costs';

/* --- 0270-proc-report.sas --- */
proc report data= work.ipums2005cost out= work.reportData;
  where state in ('North Carolina','South Carolina');
  column state mortgageStatus electric,(n median mean std);
  define state / group 'State';
  define mortgageStatus / group 'Mortgage Status' format=$Mort_Status.;
  define electric / '';
  define n / 'Number of Observations' format=comma8.;
  define median / 'Median Electricity Cost' format=dollar10.;
  define mean / 'Mean Electricity Cost' format=dollar10.;
  define std / 'Standard Deviation' format=dollar10.;
  break after state / summarize;
  rbreak after / summarize;
run;

/* --- 0306-proc-format.sas --- */
proc format;
  value costR 1500-high=cxFF0000;   value Rbold 1500-high=bold; Chapter 7: Advanced DATA Step Concepts
run;
proc report data= work.ipums2005cost
            style(header)=[fontfamily='Arial Black' backgroundcolor=gray55
                           color=white]
            style(column)=[fontfamily='Georgia' backgroundcolor=grayDD fontsize=10pt]
            style(summary)=[backgroundcolor=grayAA fontweight=bold fontstyle=italic];
  where state in ('North Carolina','South Carolina');
  column state mortgageStatus electric,(n median mean std);
  define state / group 'State';
  define mortgageStatus / group 'Mortgage Status' format=$Mort_Status.;
  define electric / '';
  define n / 'Number of Observations' format=comma8.;
  define median / 'Median Electricity Cost' format=dollar10.
                style(column)=[color=costR. fontweight=Rbold.] ;
  define mean / 'Mean Electricity Cost' format=dollar10.
                style(column)=[color=costR. fontweight=Rbold.] ;
  define std / 'Standard Deviation' format=dollar10.;
  break after state / summarize;
  rbreak after / summarize;
run;

/* --- 0307-proc-report.sas --- */
proc report data= work.ipums2005cost;
  where state in ('North Carolina','South Carolina');
  column state mortgageStatus electric=num electric=mid electric=avg
       ratio  electric=std;
  define state / group 'State';
  define mortgageStatus / group 'Mortgage Status' format=$Mort_Status.;
  define electric / '';
  define num / n 'Number of Observations' format=comma8.;
  define mid / median 'Median Electricity Cost' format=dollar10.;
  define avg / mean 'Mean Electricity Cost' format=dollar10.;
