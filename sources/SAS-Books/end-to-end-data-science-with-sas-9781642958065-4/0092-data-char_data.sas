DATA char_data;
  SET MYDATA.LOAN_LIMIT_TEST (keep=row_num BAD _CHARACTER_);
  IF purpose = 'debt_consolidation' then purpose_dc = 1; else purpose_dc = 0;
  IF purpose = 'credit_card' then purpose_cc = 1; else purpose_cc = 0;
  IF purpose = 'home_improvement' then purpose_hi = 1; else purpose_hi = 0;
  IF purpose NOT IN ('debt_consolidation', 'credit_card', 'home_improvement') then
purpose_other = 1; else purpose_other = 0;
RUN;
