/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0027-macro-parsing.sas --- */
%macro parsing;
%do i=1 %to &filecount;
❶
data parsing_result_&i;
infile %scan(&filelist,&i,%STR( )) length=linelen lrecl=500 pad;
varlen=linelen-0;
❷
input source_text $varying500. varlen;
length sourcetable $50;
sourcetable=%scan(&filenames,&i,%STR( ));
❸
Corp_Pattern =
"/(\b[A-Z]\w+\s[A-Z]\w+(\s[A-Z]\w+)*\b)|(\b(\w+\s+)*\w+\s+\ucorp(oration)?\b|\uinc\.?\b|\uco\.?\b|LLC\b|Company\b)/o";
Website_Pattern =
"/\b\w+\.(com|co|org|edu|gov|net)\b/o";
SSN_Pattern = "/\b\d{3}\s*-\s*\d{2}\s*-\s*\d{4}\b/o";
Phone_Pattern =
"/(\+?\d\s*(-|\.|\())?\s*?\d{3}\s*(-|\.|\))\s*\d{3}\s*(-|\.)\s*\d{4}/o";
DOB_Pattern =
"/\d{1,2}\s*\/\s*\d{1,2}\s*\/\s*\d{4}/o";
Addr_Pattern =
"/\s+(\w+(\s\w+)*\s\w+),?\s+(\w+\s*\w+),?\s+(\w+),?\s+((\d{5}\s*-\s*\d{4})|\d{5})/o";
pattern_ID = PRXPARSE(Corp_Pattern);
start = 1;
stop = length(source_text);
CALL PRXNEXT(pattern_ID, start, stop, source_text, position, length);
   do while (position > 0);
      line=_N_;
      found = substr(source_text, position, length);
      put "Line:" _N_ found= position= length= ;
      output;
      CALL PRXNEXT(pattern_ID, start, stop, source_text, position, length);
     retain source_text start stop position length found;
   end;
keep sourcetable line position length found;
run;

/* --- 0028-proc-print.sas --- */
proc print data=parsing_result_&i;
❹
run;
