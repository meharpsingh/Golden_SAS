DATA MYDATA;
INPUT @1 LAST $20. @21 FIRST $20. @45 PHONE $12.;
Label LAST = 'Last Name'
      FIRST = 'First Name'
      PHONE = 'Phone Number';
DATALINES;
Reingold            Lucius                  201-876-0987
Jones               Pam                     987-998-2948
Abby                Adams                   214-876-0987
Smith               Bev                     213-765-0987
Zoll                Tim Bob                 303-987-2309
Baker               Crusty                  222-324-3212
Smith               John                    234-943-0987
Smith               Arnold                  234-321-2345
Jones               Jackie                  456-987-8077
;
*-------- Modify to sort by first name within last (by last first);
PROC SORT; BY LAST;
PROC PRINT LABEL;
TITLE 'ABC Company';
TITLE2 'Telephone Directory';
RUN;
