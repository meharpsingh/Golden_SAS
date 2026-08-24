data _null_;
   set sashelp.vcolumn;
   where Libname='ORION' and Name='Product_ID';
   file 'print_products.sas';  *  Windows and UNIX;
/* file '.workshop.sascode(prinprod)';  *  z/OS;  */
   Prt=cats(Libname, '.', Memname);
   Pgm_Line=catt('proc print data=', Prt, '(obs=5);');
   Title=catx(' ', "title 'First Five Observations of", Prt,
               "';");
   put Pgm_Line;
   put Title;
   put 'run;';
run;
