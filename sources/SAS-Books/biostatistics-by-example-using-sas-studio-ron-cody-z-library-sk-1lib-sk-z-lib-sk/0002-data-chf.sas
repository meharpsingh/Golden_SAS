data CHF;
   do Group = 'Placebo','Calcium','Lasix';
      do Weight = 'Overweight','Normal';
          do Subj = 1 to 5;
            input LVEF @@;
            output;
         end;
      end;
   end;
datalines;
55 57 57 40 52
58 80 55 48 62
57 78 84 72 78
65 80 81 57 55
60 65 48 64 40
70 62 60 57 67
;
