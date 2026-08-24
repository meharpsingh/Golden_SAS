PROC FREQ DATA = callcenter NOPRINT;
 TABLE CustID / OUT = CallCenterComplaints(DROP = Percent RENAME =
(Count = Complaints));
 WHERE Category = 'Complaint' and datepart(date) < &snapdate;
RUN;
