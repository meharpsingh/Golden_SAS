data birthdays (drop=year);
 set friendDetails
     (keep=LastName FirstName
      Gender BirthdayYear BirthdayDay BirthdayMonth);
 length Birthday 8 Age 8;
 format Birthday date5.;
 format Age 6.2;
