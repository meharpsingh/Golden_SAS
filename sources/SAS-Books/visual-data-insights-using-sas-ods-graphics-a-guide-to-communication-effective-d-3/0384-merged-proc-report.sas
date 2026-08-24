/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0384-proc-registry.sas --- */
proc registry
export="C:\temp\colornames.txt"
  usesashelp
  startat="COLORNAMES";
run;
data work.SASpredefinecColorList(keep=ColorName RGBcode);
retain FirstColorFound 'N' MaxLength 0;
length RGBsource $ 8 RGBcode $ 8;
infile " C:\temp\colornames.txt " pad end=LastOne;
input @1 Line $60.;
if Line =: '"AliceBlue'
then FirstColorFound = 'Y' ;
if FirstColorFound EQ 'N' then delete;
AfterColor = index(substr(Line,2,59),'"' );
ColorName = substr(Line,2,AfterColor-1);
if length(ColorName) GT 2;
if ColorName EQ 'Cornsilk'  then  ColorName = 'CornSilk';
if ColorName EQ 'lightGray' then  ColorName = 'LightGray';
if ColorName EQ 'Oldlace'   then  ColorName = 'OldLace';
if ColorName EQ 'Peachpuff' then  ColorName = 'PeachPuff';
if ColorName EQ 'Seashell'  then  ColorName = 'SeaShell';
MaxLength = max(MaxLength,length(ColorName));
RGBsource = substr(Line,index(Line,':') + 2,8);
RGBcode = 'CX' || compress(RGBsource,',');
if LastOne
then call symput('MaxLengthOfColorNames' ,MaxLength);
run;
data work.HLScolorCodes(keep=HLScode);
retain hhh 0;
length HLScode $ 8;
do hhh = 0 to 360 by 1;
  HLScode = 'H' || put(hhh,hex3.) || '80FF';
  output;
end;
run;

/* --- 0385-proc-report.sas --- */
ods results off;
ods _all_ close;
ods excel file=
  "C:\temp\Fig2-
5_SAS_PredefinedColors_AND_No_Figure_HLScolors.xlsx"
    options( embedded_titles='yes'
             title_footnote_nobreak='yes'
             sheet_interval='proc'
             zoom='200' /* adjust as preferred, or omit, or keep */
           );
ods excel options(sheet_name='Predefined Colors');
title1 justify=left font='Arial/Bold' height=10pt
  "SAS PreDefined Color Names";
title2 justify=left font='Arial/Bold' height=10pt
  "Consider clearing any cell with hard-to-read text" ;
title3 justify=left font='Arial/Bold' height=10pt
  "and saving this Excel spreadsheet with a new filename" ;
proc report data=work.SASpredefinecColorList nowd;
column ColorName colorname=clr colorname=clrBlackText
colorname=clrWhiteText RGBcode=clrRGBcolorCode;
define ColorName / 'Color Name' ;
define clr / 'Color' ;
compute clr /char length=35;
  call define(_col_,'style',
    'style=
{background='||ColorName||'     foreground='||ColorName||' } ');
endcomp;
define clrBlackText / 'With Black Text';
compute clrBlackText /char length=35;
  call define(_col_,'style',
    'style={background='||ColorName||' foreground=Black}');
endcomp;
define clrWhiteText / 'With White Text';
compute clrWhiteText /char length=35;
  call define(_col_,'style',
    'style={background='||ColorName||' foreground=White}');
endcomp;
run;
ods excel options(sheet_name='HLS Colors');
title1 justify=left font='Arial/Bold' height=10pt
  "HLS Colors and SAS HLS Color Codes";
proc report data=work.HLScolorCodes nowd;
column HLScode HLScode=clr HLScode=clrBlackText
HLScode=clrWhiteText;
define HLScode / 'HLS Code' ;
define clr / 'Color' ;
compute clr /char length=8;
  call define(_col_,'style',
    'style={background='||HLScode||' foreground='||HLScode||' } ');
endcomp;
define clrBlackText / 'With Black Text';
compute clrBlackText /char length=8;
  call define(_col_,'style',
    'style={background='||HLScode||' foreground=Black}');
endcomp;
define clrWhiteText / 'With White Text';
compute clrWhiteText /char length=8;
  call define(_col_,'style',
    'style={background='||HLScode||' foreground=White}');
endcomp;
run;
ods excel close;
title;
