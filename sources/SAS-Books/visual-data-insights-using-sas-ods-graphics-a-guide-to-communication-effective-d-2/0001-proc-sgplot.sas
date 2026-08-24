ods results off;
/* optional */
ods _all_ close;
/* recommended */
ods listing style=listing
/* custom styles can instead be used */
  gpath='C:\temp' dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=4.275in
  imagename='YourImageName';
/* your graph creation code here */
/* As an example, you could try
   title 'Test Image from Short Form Code';
   proc sgplot data=sashelp.class;
   scatter x=height y=weight;
   run;
