/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 160) */

﻿%macro benford (data=,
                var =,
				out =,
			    tmplib =work,
				AllowZero = NO,
				);


/****************************************************************
 ***  Teil I - Initialisierung
 ****************************************************************/
title; title2; title3; footnote; footnote2;


/****************************************************************
 ***  Teil II - Berechnungen
 ****************************************************************/

/** Calc Expected Frequencies nach Benford ***/ 
data &tmplib..EXPECTED;
 FORMAT FirstDigit 8. ExpFreq 8.3;
 DO FirstDigit = 1 TO 9;
   ExpFreq=(LOG10(1+(1/FirstDigit))*100);
   OUTPUT;
 END;
RUN;

/** Analyse Input Data ***/
DATA &tmplib..OBSERVED_tmp (KEEP=FirstDigit COUNT);
 SET &data;
 FirstDigit= INPUT(SUBSTR(SCAN(PUT(&VAR,BEST8.),1),1,1),BEST8.);
 %IF %upcase(&AllowZero) EQ NO %then %Do; 
     if FirstDigit=0 then delete;
 %end; 
 COUNT=1;
RUN;

/*** Chi2-Test ***/
PROC FREQ DATA=&tmplib..OBSERVED_tmp noprint;
 TABLES FirstDigit/OUT=&tmplib..Observed_XT (RENAME=(PERCENT=OBSERVED))
                   nocum ;
RUN;

proc timeseries data=&tmplib..Observed_XT;
                out =&tmplib..Observed_XT;
 id FirstDigit interval=day setmiss=0.0001 start='02JAN1960'd end='10JAN1960'd;
 var count;
run;

data &tmplib..Observed_XT;
 set &tmplib..Observed_XT;
 format FirstDigit 8.;
run;

ods select none;
ods trace off;

PROC FREQ DATA=&tmplib..OBSERVED_XT ;
 ods output OneWayChiSq=&tmplib..Chi2(drop=table label cvalue);
 TABLES FirstDigit/OUT=&tmplib..Observed (RENAME=(PERCENT=OBSERVED))
                   nocum 
                   chisq testp=(30.103 17.609 12.494 9.691 7.918
                                 6.695 5.799 5.115 4.576) ;
 weight count;
RUN;
ods select all;


DATA &out;
 MERGE &tmplib..EXPECTED(IN=A);
       &tmplib..Observed(IN=B);
 BY FirstDigit;
 IF B;
 DELTA=SUM(OBSERVED,-ExpFreq);
 label observed = "Verteilung in den Daten"
       expfreq  = "Erwartete Verteilung";
RUN;

proc sql noprint;
 select sum(abs(delta)) as sum_delta format = 8.1,
        sum(count) as sum_count format = 8.;
 into :sum_delta, :sum_count
 from &out;
 select nvalue1 format = 8.3  into :chi2_value from chi2 where name1 ='_PCHI_';
 select nvalue1 format = 8.3  into :pvalue     from chi2 where name1 ='P_PCHI';
quit;



/****************************************************************
 ***  Teil III - Ausgabe der Daten 
 ****************************************************************/

title  h=14pt "Analyse der Verteilung der Beträge nach dem Benford'schen Gesetz";
title2 h=10pt "Analyse-Variable: &var";
title3 h=10pt "Datensatz: &data";


proc sql;
 select firstdigit label="First Digit" format = 8.,
        count label="Häufigkeit" format = 8.,
        observed label = "Verteilung in den Daten (%)" format = 8.2,
		expfreq label = "Erwartete Verteilung (%)" format = 8.2,
		delta label = "Differenz" format = 8.2;
 from &out;
quit;

ods escapechar='^';
*font_style=italic;
ods text="^S={just=center font_weight=bold;
              font_size=10pt}^1n Der Datensatz enthält &sum_count. Beobachtungen. ";
ods text="^S={just=center font_weight=bold;
              font_size=10pt}Die Summe der absoluten Abweichungen von der erwarteten Verteilung beträgt: &sum_delta. ";			  
ods text="^S={just=center font_weight=bold;
              font_size=10pt}Der Chi2-Test hat einen p-Wert von &pvalue. (Chi2=&chi2_value.)";

title; title2; title3;
Footnote1 "Erstellt am %TRIM(%QSYSFUNC(DATE(), ddmmyyp10.)) um %TRIM(%SYSFUNC(TIME(), time8.)) vom User %upcase(&sysuserid.) am SAS-Analyseserver &SYSSCPL";


proc sgplot data=&out;
 vbar FirstDigit / response=OBSERVED fillattrs= ( color=palevioletred);
 vline FirstDigit / response=ExpFreq lineattrs=(thickness=5 color=blue) 
                    transparency=0.5 ;
 yaxis label="Häufigkeit in Prozent";
 xaxis label="First Digit";
run;

title; title2; title3; footnote; footnote2;


%mend; *Benford;


%macro benford_rank (data=,
                var =,
				out =,
				by =,
				nranks=10,
			    tmplib =work,
				AllowZero = NO,
				);

/****************************************************************
 ***  Teil I - Initialisierung
 ****************************************************************/
title; title2; title3; footnote; footnote2;


/****************************************************************
 ***  Teil II - Berechnungen
 ****************************************************************/



/** Extrahieren 1st Digit ***/
DATA &tmplib..OBSERVED_tmp (KEEP=FirstDigit COUNT &by);
 SET &data;
 FirstDigit= INPUT(SUBSTR(SCAN(PUT(&VAR,BEST8.),1),1,1),BEST8.);
 %IF %upcase(&AllowZero) EQ NO %then %Do; 
     if FirstDigit=0 then delete;
 %end; 
 COUNT=1;
RUN;


proc sort data=&tmplib..OBSERVED_tmp ;
 by &by;
RUN;


*** Chi2 Test; 
PROC FREQ DATA=&tmplib..OBSERVED_tmp noprint;
 TABLES FirstDigit/OUT=&tmplib..Observed_XT (RENAME=(PERCENT=OBSERVED))
                   nocum ;
 by &by;
RUN;

proc timeseries data=&tmplib..Observed_XT;
                out =&tmplib..Observed_XT;
 id FirstDigit interval=day setmiss=1 start='02JAN1960'd end='10JAN1960'd;
 var count;
 by &by;
run;

data &tmplib..Observed_XT;
 set &tmplib..Observed_XT;
 format FirstDigit 8.;
run;

ods select none;
ods trace off;

PROC FREQ DATA=&tmplib..OBSERVED_XT ;
 ods output OneWayChiSq=&tmplib..Chi2(drop=table label cvalue);
 TABLES FirstDigit/OUT=&tmplib..Observed (RENAME=(PERCENT=OBSERVED))
                   nocum 
                   chisq testp=(30.103 17.609 12.494 9.691 7.918
                                 6.695 5.799 5.115 4.576) ;
 weight count;
 by &by;
RUN;
ods select all;



*** Aufbereiten der Daten;
proc transpose data=Chi2 out=&out. (drop=_name_ df_pchi); 
by &by;
var nValue1;
id name1;
run;

proc sort data=&out.;
 by descending _pchi_;
run;

data &out.;
 format Rank 3.;
 set &out.;
 Rank = _N_;
rename _pchi_ = Abweichungsmass
       p_pchi = Wahrscheinlichkeit_Benford;
format p_pchi percent8.3;
       _pchi_ 8.1;
run;

/****************************************************************
 ***  Teil III - Ausgabe der Daten 
 ****************************************************************/

ods escapechar='^';

Title h=14pt  "Abweichungs-Ranking nach dem Benford'schen Gesetz";
title2 h=10pt "Listing der Top &nranks. Einheiten (identifiziert durch &by.)";
title3 h=10pt "Gesamtliste befindet sich im Datenbestand '%upcase(&out.)'";


proc sql;
 select Rank,
        &by.,
		Abweichungsmass label="Abweichungsmass (Chi2)",
        Wahrscheinlichkeit_Benford label="Wahrscheinlichkeit Benford (p-Wert)"
 from &out.;
 where Rank <= &nranks;
quit;

title; title2; title3;
Footnote1 "Erstellt am %TRIM(%QSYSFUNC(DATE(), ddmmyyp10.)) um %TRIM(%SYSFUNC(TIME(), time8.)) vom User %upcase(&sysuserid.) am SAS-Analyseserver &SYSSCPL";

proc sgplot data=&out.;
 series x=Rank y=Wahrscheinlichkeit_Benford;
 yaxis label="Wahrscheinlichkeit Benford (p-Wert)";
 xaxis label="Ranking";
 *refline 0.05;
 *scatter x=Abweichungsmass y=Wahrscheinlichkeit_Benford;
run;
title; title2; title3; Footnote1;
%mend;
