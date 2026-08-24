data manager3;
   merge man3(in=M)
         emp_addresses(rename=(Manager_Level1=Manager_Level3
                               Manager1_Name=Manger3_Name)
                       keep=Manager_Level1 Manager1_Name);
   by Manager_Level3;
   if M;
run;
proc sort data=manager3 out=man4;
   by Manager_Level4;
run;
data manager4;
   merge man4(in=M)
         emp_addresses(rename=(Manager_Level1=Manager_Level4
                               Manager1_Name=Manger4_Name)
                       keep=Manager_Level1 Manager1_Name);
   by Manager_Level4;
   if M;
run;
proc sort data=manager4 out=man5;
   by Manager_Level5;
run;
data manager5;
   merge man5(in=M)
         emp_addresses(rename=(Manager_Level1=Manager_Level5
                               Manager1_Name=Manger5_Name)
                       keep=Manager_Level1 Manager1_Name);
   by Manager_Level5;
   if M;
run;
proc sort data=manager5 out=man6;
   by Manager_Level6;
run;
data manager_names;
   merge man6(in=M)
         emp_addresses(rename=(Manager_Level1=Manager_Level6
                               Manager1_Name=Manger6_Name)
                       keep=Manager_Level1 Manager1_Name);
   by Manager_Level6;
   if M;
run;
