proc format;
   value trt
      1 = "Active"
      0 = "Placebo";
   value gender
      1 = "Male"
      2 = "Female";
   value race
      1 = "White"
      2 = "Black"
      3 = "Other";
run;
**** INPUT SAMPLE DEMOGRAPHICS DATA;
data source.demographic;
label subject  = "Subject Number"
      trt      = "Treatment"
      gender   = "Gender"
      race     = "Race"
      orace    = "Oher Race Specify"
      dob      = "Date of Birth"
      uniqueid = "Company Wide Subject ID"
      randdt   = "Randomization Date";
input subject 1-3 trt 5 gender 7 race 9 orace $ 11-20 +1 dob mmddyy10. +1
                        randdt mmddyy10.;
uniqueid = 'UNI' || put(subject,3.);
format dob randdt mmddyy10.;
datalines;
101 0 1 3 BRAZILIAN  02/05/1974 04/02/2010
102 1 2 1            11/02/1946 02/13/2010
103 1 1 2            05/01/1979 05/16/2010
104 0 2 1            05/01/1972 01/02/2010
105 1 1 3 ABORIGINE  03/02/1979 04/20/2010
106 0 2 1            05/01/1977 04/01/2010
201 1 1 3 LIBYAN     04/28/1949 06/11/2010
202 0 2 1            01/13/1967 02/23/2010
203 1 1 2            01/01/1971 06/10/2010
204 0 2 1            04/17/1950 02/03/2010
205 1 1 3 HMONG      05/13/1978 04/13/2010
206 1 2 1            02/09/1948 07/01/2010
301 0 1 1            04/12/1941 02/20/2010
302 0 1 2            07/02/1978 05/12/2010
303 1 1 1            03/02/1967 02/19/2010
304 0 1 1            03/03/1958 05/19/2010
305 1 1 1            02/28/1966 06/10/2010
306 0 1 2            01/02/1960 05/23/2010
401 1 2 1            10/31/1970 06/13/2010
402 0 2 2            10/12/1980 01/02/2010
403 1 1 1            01/23/1974 03/03/2010
;
