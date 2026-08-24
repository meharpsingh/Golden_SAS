data source.labs;
label subject      = "Subject Number"
      month        = "Month: 0=baseline, 1=3 months, 2 =6 months"
      labcat       = "Category for Lab Test"
      labtest      = "Laboratory Test"
      colunits     = "Collected Units"
      nresult      = "Numeric Result"
      lownorm      = "Normal Range Lower Limit"
      highnorm     = "Normal Range Upper Limit"
      labdate      = "Date of Lab Test"
      uniqueid = "Company Wide Subject ID";
format labdate mmddyy10.;
input subject 1-3 month 6 labcat $ 9-18 labtest $ 20-30
      colunits $ 32-36 nresult 38-41 lownorm 45-48 highnorm 52-55 +1
               labdate mmddyy10.;
uniqueid = 'UNI' || put(subject,3.);
datalines;
101  0  HEMATOLOGY HEMATOCRIT  %     31     35     49   04/02/2010
101  1  HEMATOLOGY HEMATOCRIT  %     39     35     49   07/03/2010
101  2  HEMATOLOGY HEMATOCRIT  %     44     35     49   10/10/2010
101  0  HEMATOLOGY HEMOGLOBIN  g/dL  11.5   11.7   15.9 04/02/2010
101  1  HEMATOLOGY HEMOGLOBIN  g/dL  13.2   11.7   15.9 07/03/2010
101  2  HEMATOLOGY HEMOGLOBIN  g/dL  14.3   11.7   15.9 10/10/2010
101  0  CHEMISTRY  AST (SGOT)  IU/L  12     10     34   04/02/2010
101  1  CHEMISTRY  AST (SGOT)  IU/L  40     10     34   07/03/2010
101  2  CHEMISTRY  AST (SGOT)  IU/L  44     10     34   10/10/2010
101  0  CHEMISTRY  ALT (SGPT)  IU/L  10     5      35   04/02/2010
101  1  CHEMISTRY  ALT (SGPT)  IU/L  22     5      35   07/03/2010
101  2  CHEMISTRY  ALT (SGPT)  IU/L  33     5      35   10/10/2010
101  0  CHEMISTRY  ALK. PHOS.  IU/L  33     20     140  04/02/2010
101  1  CHEMISTRY  ALK. PHOS.  IU/L  49     20     140  07/03/2010
101  2  CHEMISTRY  ALK. PHOS.  IU/L  200    20     140  10/10/2010
101  0  CHEMISTRY  GGTP        IU/L  5      0      51   04/02/2010
101  1  CHEMISTRY  GGTP        IU/L  15     0      51   07/03/2010
101  2  CHEMISTRY  GGTP        IU/L  15     0      51   10/10/2010
101  0  CHEMISTRY  DIRECT BILI mg/dL 0.1    0      0.3  04/02/2010
101  1  CHEMISTRY  DIRECT BILI mg/dL 0.2    0      0.3  07/03/2010
101  2  CHEMISTRY  DIRECT BILI mg/dL 0.1    0      0.3  10/10/2010
101  0  CHEMISTRY  TOTAL BILI  mg/dL 1.0    0.3    1.9  04/02/2010
101  1  CHEMISTRY  TOTAL BILI  mg/dL 0.5    0.3    1.9  07/03/2010
101  2  CHEMISTRY  TOTAL BILI  mg/dL 2.5    0.3    1.9  10/10/2010
101  0  CHEMISTRY  ALBUMIN     g/dL  3.3    3.4    5.4  04/02/2010
101  1  CHEMISTRY  ALBUMIN     g/dL  4.1    3.4    5.4  07/03/2010
101  2  CHEMISTRY  ALBUMIN     g/dL  5.5    3.4    5.4  10/10/2010
101  0  CHEMISTRY  TOTAL PROT  g/dL  6.4    6.0    8.3  04/02/2010
101  1  CHEMISTRY  TOTAL PROT  g/dL  7.0    6.0    8.3  07/03/2010
101  2  CHEMISTRY  TOTAL PROT  g/dL  8.2    6.0    8.3  10/10/2010
102  0  HEMATOLOGY HEMATOCRIT  %     39     35     49   02/13/2010
;
