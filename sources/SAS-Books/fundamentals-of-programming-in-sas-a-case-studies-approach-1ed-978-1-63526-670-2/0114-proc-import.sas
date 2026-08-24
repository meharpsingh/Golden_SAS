proc import file = rawTab dbms = dlm   out = work.Import02 replace;
  getnames = no;
  guessingrows = 250000;
