%macro copysasmacr/store;
proc catalog catalog=advrpt.sasmacr;
  copy out=work.sasmacr;
  quit;
%mend copysasmacr;
%macro purgework(macname=);
proc catalog cat=work.sasmacr
       entrytype=macro;
  delete &macname;
  quit;
%mend purgework;
%purgework(macname=abc def ghi myghi)
%macro vercopy(verlist=)/store;
proc catalog c=complib.sasmacr
       force
       et=macro;
  copy out=work.sasmacr ;
  select &verlist;
  quit;
%mend vercopy;
