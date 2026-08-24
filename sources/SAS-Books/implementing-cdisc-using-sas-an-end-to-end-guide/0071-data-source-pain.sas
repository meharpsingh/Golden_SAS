data source.pain;
label subject  = "Subject Number"
      randomizedt = "Baseline visit date"
      month3dt    = "Month 3 visit date"
      month6dt    = "Month 6 visit date"
      painbase    = "Pain score at baseline: 0=none, 1=mild, 2=moderate, 3=severe"
      pain3mo     = "Pain score at 3 months: 0=none, 1=mild, 2=moderate, 3=severe"
      pain6mo     = "Pain score at 6 months: 0=none, 1=mild, 2=moderate, 3=severe"
      uniqueid = "Company Wide Subject ID";
input subject randomizedt mmddyy10. +1 month3dt mmddyy10. +1 month6dt
mmddyy10. painbase pain3mo pain6mo;
uniqueid = 'UNI' || put(subject,3.);
format randomizedt month3dt month6dt mmddyy10.;
datalines;
101 04/02/2010 07/03/2010 10/10/2010 3 2 1
102 02/13/2010 05/10/2010 08/11/2010 3 3 1
103 05/15/2010 08/15/2010 11/15/2010 3 3 0
104 01/02/2010 04/03/2010 07/04/2010 2 0 0
105 04/20/2010 07/20/2010 10/19/2010 3 3 1
106 04/01/2010 07/05/2010 10/10/2010 3 0 0
201 06/10/2010 09/09/2010 12/12/2010 3 2 0
202 01/23/2010 04/20/2010 07/20/2010 3 1 1
203 06/10/2010 .          .          3 . .
204 02/03/2010 05/04/2010 08/05/2010 3 2 1
205 04/13/2010 07/12/2010 10/10/2010 3 2 3
206 07/01/2010 10/01/2010 12/28/2010 2 2 0
301 02/20/2010 05/19/2010 08/22/2010 3 1 1
302 05/12/2010 08/13/2010 11/15/2010 3 3 3
303 02/19/2010 05/17/2010 08/17/2010 3 2 1
304 05/19/2010 08/15/2010 11/20/2010 3 0 0
;
