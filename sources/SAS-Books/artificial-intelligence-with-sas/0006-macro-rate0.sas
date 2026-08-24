%macro rate0(user);
    proc sql;
create table user as
select distinct(title), (1) format=1. as rating,
(&user.) as user
from d.bhist
where name = "&user.";
    quit;
