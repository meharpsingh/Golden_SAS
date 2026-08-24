filename codes "&path\codelist.txt";
proc sort
    data=codelists
    nodupkey;
    by codelistname codedvalue translated;
run;
**** MAKE SURE CODELIST IS UNIQUE;
data _null_;
    set codelists;
    by codelistname codedvalue;
    if not (first.codedvalue and last.codedvalue) then
      put "ERR" "OR: multiple versions of the same coded value "
           codelistname= codedvalue=;
run;
proc sort
    data=codelists;
    by codelistname rank;
run;
data codelists;
    set codelists end=eof;
    by codelistname rank;
    file codes notitles;
    if _n_ = 1 then
      put @5 "<!-- ******************************************** -->" /
          @5 "<!-- Codelists are presented below             -->" /
          @5 "<!-- ******************************************** -->" ;
    if first.codelistname then
      put @5 '<CodeList OID="CodeList.' codelistname +(-1) '"' /
          @7 'Name="' codelistname +(-1) '"' /
          @7 'DataType="' type +(-1) '">';
    **** output codelists that are not external dictionaries;
    if codelistdictionary = '' then
        do;
        put @7  '<CodeListItem CodedValue="' codedvalue +(-1) '"' @;
        if rank ne . then
             put ' def:Rank="' rank +(-1) '">';
           else
             put '>';
        put @9  '<Decode>' /
            @11 '<TranslatedText>' translated +(-1) '</TranslatedText>' /
Shostak, Jack, and Holland, Chris. Implementing CDISC Using SAS®: An End-to-End Guide. Copyright © 2012, SAS Institute Inc., Cary,
Appendix D:  %make_define SAS Macro   249
            @9  '</Decode>' /
            @7  '</CodeListItem>';
      end;
    **** output codelists that are pointers to external codelists;
    if codelistdictionary ne '' then
      put @7 '<ExternalCodeList Dictionary="' codelistdictionary +(-1)
             '" Version="' codelistversion +(-1) '"/>';
    if last.codelistname then
      put @5 '</CodeList>';
    if eof then
      put @3 '</MetaDataVersion>' /
          @1 '</Study>' /
          @1 '</ODM>';
run;
** create the .BAT file that will put all of the files together to
create the define;
filename dotbat "make_define.bat";
data _null_;
    file dotbat notitles;
    drive = substr("&path",1,2);
    put @1 drive;
    put @1 "cd &path";
    if "&standard" = "ADAM" then
      put @1 "type define_header.txt leaves.txt compmethod.txt
valuelist.txt itemgroupdef.txt itemdef.txt itemdef_value.txt
analysisresults.txt codelist.txt > define.xml";
    else if "&standard" = "SDTM" then
      put @1 "type define_header.txt leaves.txt compmethod.txt
valuelist.txt itemgroupdef.txt itemdef.txt itemdef_value.txt
codelist.txt > define.xml";
    put @1 "exit";
run;
x "make_define";
%mend make_define;
