ods results off;
ods _all_ close;
ods html5 path="C:\temp"
style=AllTextFontArial12ptBoldNoPageBrks
  body="Fig14-2_TwoGraphsStacked.xhtml"
  (title='Student Average Height By Age');
proc odstext; /* create a common title for both graphs */
p "Average Height By Age" /
  style=[just=c font_face="Arial" font_size=12pt
font_weight=Bold];
run;
/* setup for both graphs */
ods graphics on / reset=all scale=off width=500px height=200px
  /* Default size in pixels is 640 by 480. */
  outputfmt=SVG
  imagemap; /* Unnecessary with data labels available,
