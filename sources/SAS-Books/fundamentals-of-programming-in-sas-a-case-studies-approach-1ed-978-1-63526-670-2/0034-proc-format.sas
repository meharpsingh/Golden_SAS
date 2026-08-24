proc format;
  value Mort
    0='None'
    1-350="$350 and Below"
    351-1000="$351 to $1000"
    1001-1600="$1001 to $1600"
    1601-high ="Over $1600"
  ;
