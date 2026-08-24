proc summary data=macro3.clinics;
   class region;
   var ht wt;
   output out=sumry n= mean= stderr=/autoname;
   run;
