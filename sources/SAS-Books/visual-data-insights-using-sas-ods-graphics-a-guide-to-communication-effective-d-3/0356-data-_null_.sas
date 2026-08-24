ods html5 style=Styles.Pearl path="C:\temp"
     /* default style has light blue web page background */
  options(bitmap_mode='inline') /* embed the image in HTML
file */
  body="Fig14-6_GraphsAboveTableBuiltInLayout.xhtml";
data _null_;
declare odsout obj();
obj.image(file:
  'C:\temp\Fig14-6_GraphsAboveTableBuiltInLayout.png');
run;
