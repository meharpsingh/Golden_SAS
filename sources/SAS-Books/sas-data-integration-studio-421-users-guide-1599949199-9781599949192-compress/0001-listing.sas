%let _output=temp.temp;
data &_output;
   infile '\\machine number\sources_external\birthday_event_data.txt'
          lrecl = 256
          pad
          firstobs = 2;
   attrib Birthday length = 8   format = ddmmyy10.  informat = YYMMDD8. ;
   attrib Event    length = $19 format = $19.       informat = $19.     ;
   attrib Amount   length = 8   format = dollar10.2 informat = comma8.2 ;
   attrib GrossAmt length = 8   format = Dollar12.2 informat = Comma12.2;
   input  @ 1  Birthday YYMMDD8.
          @ 9  Event    $19.
          @ 28 Amount   Comma8.2
          @ 36 GrossAmt Comma12.2;
Birthdayrun;
