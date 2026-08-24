%macro regrpt;
%local i;
* Create a preport for each Region;
%do i = 1 %to &regcnt;
   * Step through the individual regions;
   ods pdf file="&loc\&dir\RegRpt_&&reg&i...pdf"; ➊
   title1 "Visit Counts for the "
          "%qtrim(%qsysfunc(putc(&&reg&i, $regname.))) Region";
   title2 link="&loc\&dir\Master.pdf"
          "Return to the Master Index"; ➋
   proc report data=macro3.clinics(where=(region="&&reg&i"));
      column clinnum clinname n;
      define clinnum / group 'Clinic Number';
      define clinname/ group 'Clinic Name';
      define n / 'Visit Count';
      compute clinname;
         link = catt("&loc\&dir\ClinicRpt_",
                     clinnum, ➌
                     '.pdf');
         call define(_col_, 'url', link); ➍
      endcomp;
      run;
   ods pdf close;
%end;
%mend regrpt;
