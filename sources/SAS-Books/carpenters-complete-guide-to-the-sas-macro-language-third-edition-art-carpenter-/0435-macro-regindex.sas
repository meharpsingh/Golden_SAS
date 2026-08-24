%macro regindex;
   %local i;
   * Create the Region Index;
   data masterlist; ➊
      length region $2 RegName $100; ➋
      %do i = 1 %to &regcnt; ➌
         region="&&reg&i"; ➍
         RegName=catt("~{style [url='", ➎
                      "&loc\&dir\RegRpt_&&reg&i...pdf']}",
                      put("&&reg&i",$regname.));
         output masterlist;
      %end;
      *put regname=;
      run;
   ods pdf file=%tslit(%chkdir2(dirloc=&loc,dirname=&dir)\Master.pdf); ➏
   title1 'Master Index to the Regional Reports';
   proc print data=masterlist noobs; ➐
      var region regname;
      run;
   ods pdf close;
%mend regindex;
