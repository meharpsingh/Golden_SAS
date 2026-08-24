options nosource nonotes;
proc printto new log=
  "C:\temp\Listing3-16_SASlogForPROCTEMPLATEsourceCodeDisplay.txt";
run;
%put Display in the SAS LOG of SASUSER.TEMPLAT PROC TEMPLATE;
%put Source Code used to create the GraphFontArial7ptBold Style;
%put SASUSER.TEMPLAT is the default template store;
%put %str( ); /* blank line */
