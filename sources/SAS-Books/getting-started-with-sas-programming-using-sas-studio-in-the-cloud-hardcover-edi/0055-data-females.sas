data Females;
   input @4  Gender $1. @;
   if Gender = 'F' then
      input @5   Age    3.
            @8  Height  2.
            @10 Weight  3.;
   else delete;
datalines;
001M 5465220
002F10161 98
003M 1770201
004M 2569166
005F   64187
006F 3567135
;
