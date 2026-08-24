proc format;
  value $smk
    low - < 'N','O' - high='Smoker'
    other = 'Non-Smoker';
run;
