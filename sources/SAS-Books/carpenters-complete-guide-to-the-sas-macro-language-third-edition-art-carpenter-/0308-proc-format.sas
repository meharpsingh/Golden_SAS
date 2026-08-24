proc format;
   value $sitecode
    "KETCHIKAN"  = 'A_KTN_'
    "POW"        = 'B_POW_'
    "PETERSBURG" = 'C_PTG_'
    "WRANGELL"   = 'C_WRG_'
    "SITKA"      = 'D_SIT_'
    "JUNEAU"     = 'E_JNU_'
    "GUSTAVUS"   = 'F_GUS_'
    "ELFIN COVE" = 'G_ELF_'
    "YAKUTAT"    = 'H_YAK_'
    other        = 'UNK_  ';
   run;
%macro findsite(site=Ketchikan);
%LET SITE=%UPCASE(&SITE);
%let scode = %sysfunc(putc(&site,$sitecode.));
%put &=site &=scode;
%mend findsite;
