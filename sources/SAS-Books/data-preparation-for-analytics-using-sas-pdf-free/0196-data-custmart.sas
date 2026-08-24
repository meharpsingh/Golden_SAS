DATA CustMart;
ATTRIB /* Customer Demographics */
CustID
FORMAT=8.
Birthdate
FORMAT=DATE9. LABEL ="Date of Birth"
Age
FORMAT=8.
LABEL ="Age (years)"
;
ATTRIB /* Card Details */
Card_Start
FORMAT=DATE9. LABEL ="Date of Card Issue"
AgeCardMonths FORMAT=8.1
LABEL ="Age of Card (months)"
AgeCardIssue FORMAT=8.
LABEL ="Age at Card Issue (years)"
;
ATTRIB /* Visit Frequency and Recency */
FirstVisit           FORMAT=DATE9. LABEL = "First Visit"
LastVisit            FORMAT=DATE9. LABEL = "Last Visit"
Visit_Days           FORMAT=8.     LABEL = "Nr of Visit Days"
ActivePeriod         FORMAT=8.     LABEL = "Interval of Card Usage
(months)"
MonthsSinceLastVisit FORMAT = 8.1  LABEL = "Months since last visit
(months)"
VisitDaysPerMonth    FORMAT = 8.2  LABEL = "Average Visit Days per
Month"
;
ATTRIB /* Sale and Profit */
Total_Sale      FORMAT = 8.2 LABEL = "Total Sale Amount"
Total_Profit    FORMAT = 8.2 LABEL = "Total Profit Amount"
ProfitMargin    FORMAT = 8.1 LABEL = "Profit Marin (%)"
SalePerYear     FORMAT = 8.2 LABEL = "Average Sale per Year"
ProfitPerYear   FORMAT = 8.2 LABEL = "Average Profit per Year"
SalePerVisitDay FORMAT = 8.2 LABEL = "Average Sale per VisitDay";
