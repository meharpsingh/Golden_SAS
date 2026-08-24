/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0321-data-control.sas --- */
data control(keep=fmtname start end label hlo);
      retain fmtname 'avg' n
             hlo 'M'; o
      do start=1 to 14;
         end=start+2; p
        label=cats('VisitGrp', put(start,z2.)); q
        output Control;
      end;
      hlo='O'; r
      label='Unknown';
      output;
run;
proc format cntlin=control; s
   run;
proc summary data=advrpt.lab_chemistry;
   by subject;
   class visit / mlf; t
   format visit avg.; u
   var potassium;
   output out=rollingAVG
          mean= Avg3Potassium;
   run;

/* --- 0335-proc-format.sas --- */
proc format cntlout=control(where=(fmtname='CL_NAME'));
   run;
proc print data=control;
   run;
