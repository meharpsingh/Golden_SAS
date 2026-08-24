data mh;
       set &in_mh(keep=
                    %if &stdy_mh %then MHSTDY;
                    %if &endy_mh %then MHENDY;
                    %if &dur_mh %then MHDUR;
                    %if &cat_mh %then MHCAT;
