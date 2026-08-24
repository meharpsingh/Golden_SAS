proc iml;
start Array(PC1,PC0,RRCD,ARR);
   U = (PC1*(RRCD-1)+1)/(PC0*(RRCD-1)+1);
   RR = ARR/U;
   return(RR) ;
finish;
PC1=0.25;
PC0=0.15;
RRCD={1,1.2,1.4,1.6,1.8,2.0,2.2,2.4,2.6,2.8,3.0,3.2,3.4,3.6,3.8,4.0,4.2,4.4,4.6,
      4.8,5.0,5.2,5.4,5.6,5.8,6.0};
ARR=0.99;
adjRR=Array(PC1,PC0,RRCD,ARR);
print RRCD adjRR;
