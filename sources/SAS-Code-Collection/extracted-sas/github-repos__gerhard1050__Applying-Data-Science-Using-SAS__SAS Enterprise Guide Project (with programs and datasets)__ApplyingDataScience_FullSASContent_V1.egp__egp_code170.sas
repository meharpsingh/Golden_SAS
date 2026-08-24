/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 170) */

﻿/*

proc means data=demand_data_xt noprint chartype;
 class Product_ID LifeTime;
 var Quantity;
 output out=demand_data_aggr(where=(_type_ in ('10','11'));
                                      rename=(_freq_ = MonthsAvailable)) sum=;
run;

proc means data=demand_data_aggr noprint nway;
 where _type_ = '11' and Lifetime <= 12;
 class product_id;
 var quantity;
 output out= demand_first12_months(drop= _type_) sum=;
run;
*/



proc transpose data=demand_data_xt;
               out=demand_month_wide(drop= _name_ _label_);
               prefix=q;
 where  lifetime le 12;
 by product_id;
 var Quantity;
 id LifeTime;
run;
