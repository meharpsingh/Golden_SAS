data _null_;
dcl odsout obj();
obj.image(file: "C:\temp\Table.png");
run;
/* inlay the common footnote for the content */
ods region x=0in y=4.53in  /* bottom of region 3 is at 4.53in
*/
  width=5in height=0.25in; /* bottom of page     is at 4.78in
*/
