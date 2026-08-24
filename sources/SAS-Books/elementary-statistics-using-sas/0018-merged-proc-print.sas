/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0018-data-ticketsl.sas --- */
data ticketsl;
   input state $ amount @@;
   label state='State Where Ticket Received'
               amount='Cost of Ticket';
   datalines;

;

/* --- 0019-proc-print.sas --- */
proc print data=ticketsl label;
   title 'Speeding Ticket Data with Labels';
run;
