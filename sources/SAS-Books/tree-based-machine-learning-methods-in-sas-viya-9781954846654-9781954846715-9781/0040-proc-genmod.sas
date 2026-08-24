ods noproctitle;
ods graphics / imagemap=on;
proc genmod data=MYCAS.BIGPVA;
        class &nominal / param=glm;
        model Target_D_with0= &interval &nominal /
                dist=tweedie(p=1.5) link=log;
        ods output FitStatistics=Work._GenMod_FitStats_;
        output out=work.Genmod_Tweedie pred=pred_ resraw=r_;
run;
