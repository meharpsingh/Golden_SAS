data Oscar;
   length String $ 10 Name $ 20 Comment $ 25 Address $ 30
          Q1-Q5 $ 1;
   infile datalines dsd dlm=" ";
*Note: the DSD option is needed to strip the quotes from
 the variables that contain blanks;
   input String Name Comment Address Q1-Q5;
datalines;
AbC "jane E. MarPle" "Good Bad Bad Good" "25 River Road" y
n N Y Y
12345 "Ron Cody" "Good Bad Ugly" "123 First Street" N n n n
N
98x "Linda Y. d'amore" "No Comment" "1600 Penn Avenue" Y Y
y y y
. "First Middle Last" . "21B Baker St." . . . Y N
;
