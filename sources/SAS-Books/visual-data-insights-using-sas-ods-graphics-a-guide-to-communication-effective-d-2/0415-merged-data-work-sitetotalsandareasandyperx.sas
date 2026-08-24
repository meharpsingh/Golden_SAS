/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0415-data-totals.sas --- */
data totals;
input Site $
Quarter Sales Salespersons
;
format Sales dollar12.2;
datalines;
Lima 1  4043.97  4
NY   1  8225.26 12
Rome 1  3543.97  6
Lima 2  3723.44  5
NY   2  8595.07 18
Rome 2  5558.29 10
Lima 3  4437.96  8
NY   3  9847.91 24
Rome 3  6789.85 14
Lima 4  6065.57 10
NY   4 11388.51 26
Rome 4  8509.08 16
;
run;
proc summary data=totals;
class Site;
var Sales Salespersons;
output out=SiteTotals sum=SiteTotalSales SiteSalespersons;
run;

/* --- 0416-data-work-sitetotalsandareasandyperx.sas --- */
data work.SiteTotalsAndAreasAndYperX;
retain MaxSiteTotalSales 0;
length NumbersForSite $ 8 SiteWithNumbers $ 13;
set SiteTotals end=LastOne;
if _type_ EQ 0
then do;
  call symput('
GrandTotalSales
',
    trim(left(put(SiteTotalSales,dollar7.))));
  call symput('
GrandTotalSalespersons
',
    trim(left(put(SiteSalespersons,3.))));
  delete;
end;
/* macro variables disappear at end of SAS session */
NumbersForSite =
  trim(left(SiteSalesPersons)) || '-' ||
  trim(left(put((SiteTotalSales / 1000),dollar5.1)));
SiteWithNumbers =
  trim(left(Site)) || '-' || trim(left(NumbersForSite));
Area = SiteTotalSales * SiteSalespersons;
YperX = SiteTotalSales / SiteSalespersons;
MaxSiteTotalSales = max(MaxSiteTotalSales,SiteTotalSales);
if LastOne then do;
  call symput('
MaxSiteTotalSales
',MaxSiteTotalSales);
  call symput('
MaxSiteTotalSalesDisplay
',
    trim(left(put((MaxSiteTotalSales / 1000),dollar5.1))));
end;
/* macro variables disappear at end of SAS session */
run;
