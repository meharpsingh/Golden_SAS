data dairy;
set dairy;
   expenditures = expenditures / p_butter;
   p_milk = p_milk / p_butter;
   p_cheddar = p_cheddar / p_butter;
   p_processed = p_processed / p_butter;
run;
