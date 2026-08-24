proc format;
    picture dollar_km (round)
                low-<1000='009' (prefix='$' mult=1)
               1000-<1000000='009.9K' (prefix='$' mult=.01)
            1000000-high='009.9M' (prefix='$' mult=.00001);
run;
