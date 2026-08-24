proc iml;
* invoke iml;
/* --- Illustrating matrix operations --- */
start matrices;
* begin module;
print /  "---matrices module---",,;     * print message;
/* adding matrices */
a = {2 3,-1 7};
* define matrix a;
b = {8 1,9 6};
* define matrix b;
c = a + b;
* sum matrices;
print , "c = a + b" c;                 * print matrices;
/* scalar multiplication */
d = 2#a;
* scalar multiplication;
print , "scalar product d = 2#a" d;     * print d;
/* matrix transpose */
a = {2 3 -1,-1 7 0};
* define matrix a;
at = a`;
* define a transpose;
print , "a transpose " at;              * print a, a`;
/* column transpose */
v = {1,2,3};
* define column v;
vt = v`;
* v transpose;
print , "column transpose" vt;          * print v, v`;
/* matrix multiplication */
b = {6 1,-2 9,3 -4};
* define matrix b;
c = a*b;
* multiply matrices;
print , "c = a*b" c;                    * print a, b, c;
/* matrix inner and outer products */
a1 = a`*a;
* a transpose times a;
a2 = a*a`;
* a times a transpose;
v1 = v`*v;
* v transpose times v;
v2 = v*v`;
* v times v transpose;
print , "a`*a " a1,,
        "a*a` " a2,,
        "v`*v " v1,,
        "v*v` " v2;
* print products;
/* identity matrices */
imat = i(3);
* identity matrix;
