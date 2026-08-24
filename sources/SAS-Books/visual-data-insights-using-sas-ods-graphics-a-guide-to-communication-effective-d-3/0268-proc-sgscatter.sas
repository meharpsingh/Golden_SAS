ods listing style=GraphFontArial8ptBold gpath="C:\temp"
dpi=300;
ods graphics on / reset=all scale=off
  height=4.3in /* minimum height that avoids thinning
values */
  imagename="Fig10-
3_OneYvar_MulipleXvars_ScatterPlots_OneColumn";
title1 justify=center
  'European Vehicle Brand vs MSRP ($K) & MPG (City)';
proc sgscatter data=sasuser.EuropeanCarsDollarsInK;
                 /* input created in Listing 10-2 */
plot (Make) * (MSRPinThousands MPG_City) / columns=1
  axisextent=data grid minorgrid;
format MSRPinThousands dollar4.;
label MSRPinThousands='MSRP';
run;
