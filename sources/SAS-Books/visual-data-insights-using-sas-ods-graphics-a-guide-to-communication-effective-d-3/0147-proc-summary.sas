proc summary data=sashelp.cars nway;
class type origin;
var MPG_City MSRP;
output out=work.SUMMARYout mean=;
run;
data work.ToPlot; /* used for all Figures except
7-4 and 7-9 */
set SUMMARYout;
MPG_City = round(MPG_City,1);
MSRPinThousands = round(MSRP / 1000,1); /* MSRP
alternative
                                 used in some
other figures */
run;
data work.DattrMap_TenColors;
retain id "DiscreteID";
length value $ 2 fillcolor $ 18;
input value $ fillcolor $;
datalines;
15 black
16 gray
17 blue
18 lightblue
19 green
20 turquoise
21 magenta
22 darkorange
23 lightorange
55 yellow
;
run;
ods listing gpath="C:\temp" dpi=300
style=GraphFontArial10ptBold;
