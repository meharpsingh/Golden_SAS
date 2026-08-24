Data strings;
Input first $ second $;
Datalines;
Hello World
;
Run;
Data concatenate;
Set strings;
combined=first||second;
          Run;
