ods csv file="&path\data\E1_4_4demog.csv)" n
        options(doc='Help' o
                delimiter=";");p
proc print data=advrpt.demog
           noobs;q
   var fname lname dob; r
   run;
ods csv close; s
"fname";"lname";"dob"
"Mary";"Adams";"12AUG51"
"Joan";"Adamson";"."
"Mark";"Alexander";"15JAN30"
"Peter";"Antler";"15JAN34"
"Teddy";"Atwood";"14FEB50"
. . . . data not shown . . . .
data _null_;
   set advrpt.demog(keep=fname lname dob);
   file csv_a;
   if _n_=1 then put 'FName,LName,DOB';
   put (_all_)(','); n
   run;
