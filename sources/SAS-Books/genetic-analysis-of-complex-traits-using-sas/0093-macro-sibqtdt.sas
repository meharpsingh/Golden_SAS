%macro sibqtdt;
 /*********************************************************/
 /* Remove sibships of size 1 from data set and create    */
 /* columns of genotypes                                  */
 /*********************************************************/
   data sibdata;
    set offspring;
    array a{60};
    array geno{30};
    by pedigree household_id;
    if first.household_id and last.household_id then delete;
    do i=1 to 30;
     geno[i]=a[2*i-1]+a[2*i]-2;
    end;
