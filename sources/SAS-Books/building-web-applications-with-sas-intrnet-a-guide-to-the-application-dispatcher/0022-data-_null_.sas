data _null_;
 infile external;
 file _webout;
 input;
 _infile_ = resolve(_infile_); X
 put _infile_;
run;
