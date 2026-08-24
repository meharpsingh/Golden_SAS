ods layout end;
ods printer close;
title; footnote;
/* insert the composite image file in the ODS HTML5 web page
*/
ods html5 style=Styles.Pearl path="C:\temp"
  options(bitmap_mode='inline') /* embed the image in HTML
file */
  body="Fig14-7_GraphsAboveTablePreBuiltAsImage.xhtml";
data _null_;
declare odsout obj();
obj.image(file:
  'C:\temp\Fig14-7_GraphsAboveTablePreBuiltAsImage.png');
run;
