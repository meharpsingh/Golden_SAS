data _null_;
  infile sasautos('ds2csv.sas'); ➊
  input; ➋
  put _infile_; ➌
run;
