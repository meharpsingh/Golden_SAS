DATA preteen;
SET sashelp.class;
WHERE age<13;
LABEL  name = 'First Name';
RENAME name = FName;
FORMAT height weight 5.1;
RUN;
