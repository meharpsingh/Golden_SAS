proc cas noqueue;
autotune.tuneGradientBoostTree result=r /
        trainOptions={
                    table={name='HMEQ', vars={'CLAGE', 'DEBTINC',
'LOAN',
                            'MORTDUE', 'VALUE', 'REASON', 'JOB', 'bad'}},
                    inputs={'CLAGE', 'DEBTINC', 'LOAN', 'MORTDUE',
                            'VALUE', 'REASON', 'JOB'},
                    target='bad',
                    nominals={'REASON', 'JOB', 'bad'},
                    casOut={name='gbt_hmeq_model', replace=true}
                    nbins=55
        }
        tunerOptions={seed=3791538}
;
print r;
run;
quit;
