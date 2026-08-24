%macro clinicrpt;
%local i;
* Create a preport for each clinic;
%do i = 1 %to &clncnt;
   * Step through the individual regions;
   ods pdf file="&loc\&dir\ClinicRpt_&&cnum&i...pdf"; ➊
   title1 "Clinic Visit Details for the &&cnam&i Clinic";
   title2 link="&loc\&dir\RegRpt_&&creg&i...pdf" ➋
          "Return to the Region Report for this Clinic";
   proc report data=macro3.clinics(where=(clinnum="&&cnum&i")); ➌
      column lname fname dob exam symp;
      define lname / display 'Last Name';
      define fname / display 'First Name';
      define dob   / display 'Date of Birth' f=date9.;
      define exam  / display 'Exam Date' f=date9.;
      define symp  / display 'Symptom Code';
      run;
   ods pdf close;
%end;
%mend clinicrpt;
