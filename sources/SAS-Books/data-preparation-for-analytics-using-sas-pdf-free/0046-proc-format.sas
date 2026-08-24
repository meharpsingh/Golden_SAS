PROC FORMAT;
 VALUE air
   .  = '00: MISSING'
   LOW -< 220 = '01: < 220'
   220 -< 275 = '02: 220 - 274'
   275 - HIGH = '03: > 275';
RUN;
