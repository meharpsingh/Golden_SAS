libname master
"C:\sas\toolkit_global_library\standards\XYZ_program_cdisc-sdtm-3.1.2-
    1.3\validation\control";
libname control
"C:\Documents and
Settings\XPMUser\Desktop\CDISC_book\CST_validate_sdtm\metadata\control";
Shostak, Jack, and Holland, Chris. Implementing CDISC Using SAS®: An End-to-End Guide. Copyright © 2012, SAS Institute Inc., Cary,
Chapter 8:  SDTM Validation   141
data control.validation_control;
  set master.validation_master;
  where standardversion in ("***","3.1.2") and checksource in
("OpenCDISC","WebSDM");
run;
