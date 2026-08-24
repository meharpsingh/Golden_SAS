  proc format;
value $Gender 'M' = 'Male'
'F' = 'Female'
' ' = 'Not entered'
other = 'Miscoded';
value Age low-29  = 'Less than 30'
30-50   = '30 to 50'
51-high = '51+';
value $Likert '1' = 'Str Disagree'
'2' = 'Disagree'
'3' = 'No Opinion'
'4' = 'Agree'
'5' = 'Str Agree';
  run;
