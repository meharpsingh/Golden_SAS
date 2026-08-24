/* Merged listing: this program was assembled from 5 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0073-proc-import.sas --- */
proc import
    out = define_header
    datafile = "&path\&metadata"
    dbms=excelcs
    replace;
    sheet="DEFINE_HEADER_METADATA";
run;
**** DETERMINE IF THIS IS A SDTM DEFINE FILE OR AN ADAM DEFINE FILE
**** AND SET THE STANDARD MACRO VARIABLE FOR THE REST OF THE PROGRAM;
data _null_;
    set define_header;
    if upcase(standard) = 'ADAM' then
        call symput('standard','ADAM');
    else if upcase(standard) = 'SDTM' then
        call symput('standard','SDTM');
    else
        put "ERR" "OR: CDISC standard undefined in
define_header_metadata";
run;
**** GET "TABLE OF CONTENTS" LEVEL DATASET METADATA;
proc import
    out = toc_metadata
    datafile = "&path\&metadata"
    dbms=excelcs
    replace;
    sheet = "TOC_METADATA" ;
run;
**** GET THE VARIABLE METADATA;
proc import
    out = VARIABLE_METADATA
    datafile = "&path\&metadata"
    dbms=excelcs
    replace;
    sheet = "VARIABLE_METADATA";
run;
**** GET THE CODELIST METADATA;
proc import
    out = codelists
    datafile = "&path\&metadata"
    dbms=excelcs
    replace;
    sheet = "CODELISTS" ;
run;
**** GET THE COMPUTATIONAL METHOD METADATA;
Shostak, Jack, and Holland, Chris. Implementing CDISC Using SAS®: An End-to-End Guide. Copyright © 2012, SAS Institute Inc., Cary,
Appendix D:  %make_define SAS Macro   237
proc import
    out = compmethod
    datafile = "&path\&metadata"
    dbms=excelcs
    replace;
    sheet = "COMPUTATION_METHOD" ;
run;
**** GET THE VALUE LEVEL METADATA;
proc import
    out = valuelevel
    datafile = "&path\&metadata"
    dbms=excelcs
    replace;
    sheet = "VALUELEVEL_METADATA" ;
run;
%if "&standard" = "ADAM" %then
  %do;
    **** GET THE ANALYSIS RESULTS METADATA;
    proc import
        out = analysisresults
        datafile = "&path\&metadata"
        dbms=excelcs
        replace;
        sheet = "ANALYSIS_RESULTS" ;
    run;
    **** GET THE ANALYSIS RESULTS METADATA;
    proc import
        out = externallinks
        datafile = "&path\&metadata"
        dbms=excelcs
        replace;
        sheet = "EXTERNAL_LINKS" ;
    run;
  %end;
**** USE HTMLENCODE ON SOURCE TEXT THAT NEEDS ENCODING FOR PROPER BROWSER
**** REPRESENTATIION;
%if &standard=ADAM %then
  %do;
    data toc_metadata;
       length documentation $ 800;
            set toc_metadata;
          documentation = htmlencode(documentation);
          ** convert single quotes to double quotes;
          documentation = tranwrd(documentation, "'", '"');
          ** convert double quotes to html quote;

/* --- 0074-data-variable_metadata.sas --- */
data variable_metadata;
       length comment $ 2000;
       set variable_metadata;
          format comment;
          informat comment;
          origin = htmlencode(origin);
          label = htmlencode(label);
          comment = htmlencode(comment);
          **** FOR ADAM, JOIN ORIGIN/"SOURCE" AND COMMENT
          **** TO FORM "SOURCE/DERIVATION" METADATA;
          if "&standard" = "ADAM" and origin ne '' and comment ne '' then
            comment = "SOURCE: " || left(trim(origin)) ||
                      " DERIVATION: " || left(trim(comment));
          else if "&standard" = "ADAM" and origin ne '' and
            comment = '' then
          comment = "SOURCE: " || left(trim(origin));
          if "&standard" = "ADAM" and origin = '' and
            comment ne '' then
          comment = "DERIVATION: " || left(trim(comment));
run;
data codelists;
       set codelists;
       codedvalue = htmlencode(codedvalue);
       translated = htmlencode(translated);
run;
data compmethod;
       set compmethod;
       computationmethod = htmlencode(computationmethod);
run;
data valuelevel;
       length comment $ 2000;
       set valuelevel;
       format comment;
       informat comment;
              origin = htmlencode(origin);
       label = htmlencode(label);
       comment = htmlencode(comment);
Shostak, Jack, and Holland, Chris. Implementing CDISC Using SAS®: An End-to-End Guide. Copyright © 2012, SAS Institute Inc., Cary,
Appendix D:  %make_define SAS Macro   239
       **** FOR ADAM, JOIN ORIGIN/"SOURCE" AND COMMENT
       **** TO FORM "SOURCE/DERIVATION" METADATA;
       if "&standard" = "ADAM" and origin ne '' and
         comment ne '' then
       comment = "SOURCE: " || left(trim(origin)) ||
                  " DERIVATION: " || left(trim(comment));
       else if "&standard" = "ADAM" and origin ne '' and
         comment = '' then
       comment = "SOURCE: " || left(trim(origin));
       if "&standard" = "ADAM" and origin = '' and
         comment ne '' then
       comment = "DERIVATION: " || left(trim(comment));
run;
%if "&standard" = "ADAM" %then
  %do;
    data analysisresults;
         length programmingcode $800. docleafid $40.;
         set analysisresults;
      where displayid ne '';
      arrow + 1;
      selectioncriteria = htmlencode(selectioncriteria);
      paramlist = htmlencode(paramlist);
      reason = htmlencode(reason);
      documentation = htmlencode(documentation);
      if index(documentation, '[r]')>0 then
        docleafid = substr(documentation, index(documentation,'[r]')+3,
                    index(documentation,'[\r]')-index(documentation,'[r]')-3);
      else
        docleafid = '.';
      programmingcode = htmlencode(programmingcode);
      ** convert single quotes to double quotes;
      programmingcode = tranwrd(programmingcode, "'", '"');
      ** convert double quotes to html quote;
      programmingcode = tranwrd(programmingcode, '"', '&quot;');
      format programmingcode $800.;
    run;
    ** ENSURE UNIQUENESS ON DISPLAYID AND RESULTID AND CREATE A COMBO ID;
    data analysisresults;
      set analysisresults;
      by displayid notsorted;
      drop resultnum;
      retain resultnum;
      if first.displayid then
          resultnum = 0;
      resultnum + 1;

/* --- 0076-data-_null_.sas --- */
    filename leaves "&path\leaves.txt";
    data _null_;
      set externallinks;
      file leaves notitles;
      put @5 '<def:leaf ID="' leafid +(-1) '"'     /
          @7 'xlink:href="' leafrelpath +(-1) '">' /
          @7 '<def:title>' title '</def:title>'    /
          @5 '</def:leaf>'
          ;
    run;
  %end;
**** ADD ITEMOID TO VARIABLE METADATA;
data VARIABLE_METADATA;
    set VARIABLE_METADATA(rename=(domain = oid));
    length itemoid $ 40;
    if variable in ("STUDYID","DOMAIN","USUBJID","SUBJID") then
      itemoid = variable;
    else
      itemoid = compress(oid || "." || variable);
run;
**** CREATE COMPUTATION METHOD SECTION;
filename comp "&path\compmethod.txt";
data compmethods;
    set compmethod;
    file comp notitles;
    if _n_ = 1 then
    put @5 "<!-- ******************************************* -->" /
        @5 "<!-- COMPUTATIONAL METHOD INFORMATION        *** -->" /
        @5 "<!-- ******************************************* -->";
    put @5 '<def:ComputationMethod OID="' computationmethodoid +(-1)
'">'
            computationmethod +(-1) '</def:ComputationMethod>';
run;
**** CREATE VALUE LEVEL LIST DEFINITION SECTION;
proc sort
    data=valuelevel;
    where valuelistoid ne '';
    by valuelistoid;
run;
Shostak, Jack, and Holland, Chris. Implementing CDISC Using SAS®: An End-to-End Guide. Copyright © 2012, SAS Institute Inc., Cary,
Appendix D:  %make_define SAS Macro   243
filename vallist "&path\valuelist.txt";
data valuelevel;
  set valuelevel;
    by valuelistoid;
    file vallist notitles;
    if _n_ = 1 then
      put @5 "<!-- ******************************************* -->" /
          @5 "<!-- VALUE LEVEL LIST DEFINITION INFORMATION  ** -->" /
          @5 "<!-- ******************************************* -->";
    if first.valuelistoid then
      put @5 '<def:ValueListDef OID="' valuelistoid +(-1) '">';
    put @7 '<ItemRef ItemOID="' valuename +(-1) '"' /
        @9 'Mandatory="' mandatory +(-1) '"/>';
    if last.valuelistoid then
      put @5 '</def:ValueListDef>';
run;
**** CREATE "ITEMGROUPDEF" SECTION;
proc sort
    data=VARIABLE_METADATA;
    where oid ne '';
    by oid varnum;
run;
proc sort
    data=toc_metadata;
    where oid ne '';
    by oid;
run;
filename igdef "&path\itemgroupdef.txt";
data itemgroupdef;
    length label $ 40;
    merge toc_metadata VARIABLE_METADATA(drop=label);
    by oid;
    file igdef notitles;
    if first.oid then
      do;

/* --- 0077-data-itemdef.sas --- */
filename idef "&path\itemdef.txt";
data itemdef;
    set VARIABLE_METADATA end=eof;
    by oid;
    file idef notitles;

/* --- 0078-data-itemdefvalue.sas --- */
filename idefvl "&path\itemdef_value.txt";
data itemdefvalue;
    set valuelevel end=eof;
    by valuelistoid;
    file idefvl notitles;
