$onText
The following code aims to evaluate the transmission loss at the presence of wind farms
and tends to present a robust setting for decision variables to suppress the undesirable effects of
intermittent nature of wind farms. To attain this goal,a wind farm with capacity of 40 MW is added to
bus 22.It is worth to mention that the forecasted value of wind power production is 30 MW in the wind farm.
The problem is solved in two stages and primary knowledge of IGDT method is required to be master of the subject.
$offText








sets i Number of Buses/1,2,5,8,11,13,3,4,6,7,9,10,12,14*30/
     slackbus(i) Slack Bus/1/
     PV(i) P_V Buses/2,5,8,11,13/
     gg(i) Generation Units/1,2,5,8,11,13/
     PQ(i) P_Q Buses/3,4,6,7,9,10,12,14*30/;

set counter/ c1*c13/;


scalar Sbase/100/;


set c/1/;
alias(i,j);


*************Data of Generation Units**************
Table GenD(i,*) 'Generation Units'
       Pg         Qg       Pmax    Pmin    Qmax    Qmin
1      99.211   5.335      200     50      200     -20
2      80       27.657     80      20      100     -20
5      50       21.544     50      15      80      -15
8      20       22.933     35      10      60      -15
11     20       38.583     30      10      50      -10
13     20       40.345     40      12      60      -15


*************Data of VAr Compensator Devices********

Table ComD(i,*) 'VAr Compensator Devices in MVAr'

         Qmax           Qmin

24       35              0
25       35              0
26       35              0
29       35              0
30       35              0


*************Data of Loads****************************

Table BD(i,*) 'Demands of each Bus in MW and MVAr'
          Pd        Qd

1         0         0
2         21.7      12.7
3         2.4       1.2
4         7.6       1.6
5         94.2      19
6         0         0
7         22.8      10.9
8         30        30
9         0         0
10        5.8       2
11        0         0
12        11.2      7.5
13        0         0
14        6.2       1.6
15        8.2       2.5
16        3.5       1.8
17        9         5.8
18        3.2       .9
19        9.5       3.4
20        2.2       .7
21        17.5      11.2
22        0         0
23        3.2       1.6
24        8.7       6.7
25        0         0
26        3.5       2.3
27        0         0
28        0         0
29        2.4       .9
30        10.6      1.9



************Data of Branches***********************

Table   branch(i,j,c,*)'Line Parameters'

                        r            x              b         rateA     rateB    rateC     tap     an        st        min         max


1    .     2.1       0.0192        0.0575        0.0528        130       0        0        1        0        1        -360        360
1    .     3.1       0.0452        0.1652        0.0408        130       0        0        1        0        1        -360        360
2    .     4.1       0.057         0.1737        0.0368        65        0        0        1        0        1        -360        360
3    .     4.1       0.0132        0.0379        0.0084        130       0        0        1        0        1        -360        360
2    .     5.1       0.0472        0.1983        0.0418        130       0        0        1        0        1        -360        360
2    .     6.1       0.0581        0.1763        0.0374        65        0        0        1        0        1        -360        360
4    .     6.1       0.0119        0.0414        0.0090        90        0        0        1        0        1        -360        360
5    .     7.1       0.046         0.116         0.0204        70        0        0        1        0        1        -360        360
6    .     7.1       0.0267        0.082         0.0170        130       0        0        1        0        1        -360        360
6    .     8.1       0.012         0.042         0.0090        32        0        0        1        0        1        -360        360
6    .     9.1       0             0.208              0        65        0        0        0.95     0        1        -360        360
6    .     10.1      0             0.556              0        32        0        0        1.1      0        1        -360        360
9    .     11.1      0             0.208              0        65        0        0        1        0        1        -360        360
9    .     10.1      0             0.11               0        65        0        0        1        0        1        -360        360
4    .     12.1      0             0.256              0        65        0        0        1.025    0        1        -360        360
12   .     13.1      0             0.14               0        65        0        0        1        0        1        -360        360
12   .     14.1      0.1231        0.2559             0        32        0        0        1        0        1        -360        360
12   .     15.1      0.0662        0.1304             0        32        0        0        1        0        1        -360        360
12   .     16.1      0.0945        0.1987             0        32        0        0        1        0        1        -360        360
14   .     15.1      0.221         0.1997             0        16        0        0        1        0        1        -360        360
16   .     17.1      0.0524        0.1923             0        16        0        0        1        0        1        -360        360
15   .     18.1      0.1073        0.2185             0        16        0        0        1        0        1        -360        360
18   .     19.1      0.0639        0.1292             0        16        0        0        1        0        1        -360        360
19   .     20.1      0.034         0.068              0        32        0        0        1        0        1        -360        360
10   .     20.1      0.0936        0.209              0        32        0        0        1        0        1        -360        360
10   .     17.1      0.0324        0.0845             0        32        0        0        1        0        1        -360        360
10   .     21.1      0.0348        0.0749             0        32        0        0        1        0        1        -360        360
10   .     22.1      0.0727        0.1499             0        32        0        0        1        0        1        -360        360
21   .     22.1      0.0116        0.0236             0        32        0        0        1        0        1        -360        360
15   .     23.1      0.1           0.202              0        16        0        0        1        0        1        -360        360
22   .     24.1      0.115         0.179              0        16        0        0        1        0        1        -360        360
23   .     24.1      0.132         0.27               0        16        0        0        1        0        1        -360        360
24   .     25.1      0.1885        0.3292             0        16        0        0        1        0        1        -360        360
25   .     26.1      0.2544        0.38               0        16        0        0        1        0        1        -360        360
25   .     27.1      0.1093        0.2087             0        16        0        0        1        0        1        -360        360
28   .     27.1      0             0.396              0        65        0        0        1.05     0        1        -360        360
27   .     29.1      0.2198        0.4153             0        16        0        0        1        0        1        -360        360
27   .     30.1      0.3202        0.6027             0        16        0        0        1        0        1        -360        360
29   .     30.1      0.2399        0.4533             0        16        0        0        1        0        1        -360        360
8    .     28.1      0.0636        0.2           0.0428        32        0        0        1        0        1        -360        360
6    .     28.1      0.0169        0.0599        0.0130        32        0        0        1        0        1        -360        360;






Set line(i,j,c) /
                1.2.1,  1.3.1,  2.4.1,  3.4.1
                2.5.1,  2.6.1,  4.6.1,  5.7.1
                6.7.1,  6.8.1,  6.9.1,  6.10.1
                9.11.1,  9.10.1,  4.12.1,  12.13.1
                12.14.1,  12.15.1,  12.16.1,  14.15.1
                16.17.1,  15.18.1,  18.19.1,  19.20.1
                10.20.1,  10.17.1,  10.21.1,  10.22.1
                21.22.1,  15.23.1,  22.24.1,  23.24.1
                24.25.1,  25.26.1,  25.27.1,  28.27.1
                27.29.1,  27.30.1,  29.30.1,  8.28.1
                6.28.1 /;


Set line1(i,j,c) /
                1.2.1,  1.3.1,  2.4.1,  3.4.1
                2.5.1,  2.6.1,  4.6.1,  5.7.1
                6.7.1,  6.8.1,
                9.11.1,  9.10.1,   12.13.1
                12.14.1,  12.15.1,  12.16.1,  14.15.1
                16.17.1,  15.18.1,  18.19.1,  19.20.1
                10.20.1,  10.17.1,  10.21.1,  10.22.1
                21.22.1,  15.23.1,  22.24.1,  23.24.1
                24.25.1,  25.26.1,  25.27.1,
                27.29.1,  27.30.1,  29.30.1,  8.28.1
                6.28.1 /;

Set  line2(i,j,c)/6.9.1,  6.10.1, 4.12.1,28.27.1/;

Parameter rep1,rep2,rep3,rep4,rep5,rep6,rep7,rep8;

Parameter Wcap(i)/22 30/;

Parameter Beta/-.025/;

parameters
b
g;

variable
alpha
Rc
ratio
Qc
V
Pw
theta
Pg
Qg
y
Pfrom
Pto
Qfrom
Qto
Ploss
Fcb;

equations
eq1
eq2
eq3
eq4
eq5
eq6
eq7
eq8
eq9
eq10
eq11
eq12
eq13
eq14
eq15
eq16
eq17
eq18;

b(i,j,c)$line(i,j,c) = -branch(i,j,c,'x')/(sqr(branch(i,j,c,'r'))+sqr(branch(i,j,c,'x')));
g(i,j,c)$line(i,j,c) = branch(i,j,c,'r')/(sqr(branch(i,j,c,'r'))+sqr(branch(i,j,c,'x')));




***************************Ybus Formulation*************************************
eq1(i,j)..y(i,j,'real')$(not sameas(i,j))=e= sum(c$branch(i,j,c,'st'), -1/ratio(i,j,c) * (g(i,j,c)*cos(branch(i,j,c,'an')) - b(i,j,c)*sin(branch(i,j,c,'an'))))
                                                         + sum(c$branch(j,i,c,'st'), -1/ratio(j,i,c)* (g(j,i,c)*cos(-branch(j,i,c,'an')) - b(j,i,c)*sin(-branch(j,i,c,'an'))));


eq2(i,j)..y(i,j,'imag')$(not sameas(i,j))=e= sum(c$branch(i,j,c,'st'), -1/ratio(i,j,c) * (b(i,j,c)*cos(branch(i,j,c,'an')) + g(i,j,c)*sin(branch(i,j,c,'an'))))
                                                          + sum(c$branch(j,i,c,'st'), -1/ratio(j,i,c)* (b(j,i,c)*cos(-branch(j,i,c,'an')) + g(j,i,c)*sin(-branch(j,i,c,'an'))));


eq3(i,i)..y(i,i,'real')=e= sum((j,c)$branch(i,j,c,'st'), g(i,j,c)/sqr(ratio(i,j,c))) + sum((j,c)$branch(j,i,c,'st'), g(j,i,c));



eq4(i,i)..y(i,i,'imag')=e= sum((j,c)$branch(i,j,c,'st'), 1/sqr(ratio(i,j,c)) * (b(i,j,c)+branch(i,j,c,'b')/2)) + sum((j,c)$branch(j,i,c,'st'),(b(j,i,c)+branch(j,i,c,'b')/2));
********************************************************************************



***************************Power Flow Equations*********************************

eq5(i)..         (Pw(i)$Wcap(i))/Sbase+Pg(i)$slackbus(i)+(GenD(i,'Pg')/Sbase)$(PV(i))-BD(i,'Pd')/Sbase=e=sum(j,(V(i)*V(j)*y(i,j,'real')*cos(theta(i)-theta(j))+V(i)*V(j)*y(i,j,'imag')*sin(theta(i)-theta(j))));

eq6(i)..         Qg(i)$GenD(i,'Qmax')+(Qc(i)$ComD(i,'Qmax')/Sbase)- BD(i,'Qd')/Sbase=e=sum(j,(V(i)*V(j)*y(i,j,'real')*sin(theta(i)-theta(j))-V(i)*V(j)*y(i,j,'imag')*cos(theta(i)-theta(j))));

********************************************************************************






**************************Constraints*******************************************
eq7(i,j,c)$(line(i,j,c))..                       Pfrom(i,j,c)=e=(power(V(i),2)*y(i,j,'real')-V(i)*V(j)*[y(i,j,'real')*cos(theta(i)-theta(j))+y(i,j,'imag')*sin(theta(i)-theta(j))]);

eq8(i,j,c)$(line(i,j,c))..                       Pto(i,j,c)=e=(power(V(j),2)*y(i,j,'real')-V(i)*V(j)*[y(i,j,'real')*cos(theta(i)-theta(j))-y(i,j,'imag')*sin(theta(i)-theta(j))]);

eq9(i,j,c)$(line(i,j,c))..                       Qfrom(i,j,c)=e=(-power(V(i),2)*(branch(i,j,c,'b')+y(i,j,'imag'))-V(i)*V(j)*[y(i,j,'real')*sin(theta(i)-theta(j))-y(i,j,'imag')*cos(theta(i)-theta(j))]);

eq10(i,j,c)$(line(i,j,c))..                      Qto(i,j,c)=e=(-power(V(j),2)*(branch(i,j,c,'b')+y(i,j,'imag'))+V(i)*V(j)*[y(i,j,'real')*sin(theta(i)-theta(j))+y(i,j,'imag')*cos(theta(i)-theta(j))]);

eq11(i,j,c)$(line(i,j,c))..                      100*sqrt(power(Pfrom(i,j,c),2)+power(Qfrom(i,j,c),2))=l=branch(i,j,c,'rateA');

eq12(i,j,c)$(line(i,j,c))..                      100*sqrt(power(Pto(i,j,c),2)+power(Qto(i,j,c),2))=l=branch(i,j,c,'rateA');


V.lo(PQ)=0.95;
V.up(PQ)=1.05;


V.lo(gg)=0.9;
V.up(gg)=1.1;



theta.lo(i)=-pi/6;
theta.up(i)=pi/6;


Pg.lo(slackbus) = GenD(slackbus,'Pmin')/Sbase;
Pg.up(slackbus) = GenD(slackbus,'Pmax')/Sbase;



Qg.lo(i) = GenD(i,'Qmin')/Sbase;
Qg.up(i) = GenD(i,'Qmax')/Sbase;


Qc.lo(i)= ComD(i,'Qmin');
Qc.up(i)= ComD(i,'Qmax');


ratio.fx(line1)=1;
ratio.lo(line2)=.9;
ratio.UP(line2)=1.1;

********************************************************************************




eq13..              Ploss=e=(-100/2*sum((i,j),y(i,j,'real')*[power(V(i),2)+power(V(j),2)-2*V(i)*V(j)*cos(theta(i)-theta(j))]));
eq14(i)..           (Pw(i)$Wcap(i))=e=Wcap(i);
eq15..              Fcb=e=Ploss;


eq16..              Ploss=l=Fcb.l*(1+Beta);
eq17(i)..          (Pw(i)$Wcap(i))=e=(Wcap(i))*(1-alpha);
eq18..              Rc=e=alpha;
alpha.lo=0;
alpha.up=1;
model RPP/eq1,eq2,eq3,eq4,eq5,eq6,eq7,eq8,eq9,eq10,eq11,eq12,eq13,eq14,eq15/;


option reslim=10800;

option optca=0,optcr=0,dnlp=conopt4;


solve RPP using dnlp minimizing Fcb;

display Ploss.l,Fcb.l,Pw.l;




model IGDT_RPP/eq1,eq2,eq3,eq4,eq5,eq6,eq7,eq8,eq9,eq10,eq11,eq12,eq13,eq16,eq17,eq18/;


option reslim=100800;

option optca=0,optcr=0,dnlp=conopt4;

loop(counter,
Beta=Beta+.025;
solve IGDT_RPP using dnlp maximizing Rc;
rep1(counter)=Fcb.l*(1+Beta);
rep2(counter)=alpha.l;
rep3(counter,i)=Pw.l(i);
rep4(counter)=Beta;
rep5(counter)=IGDT_RPP.modelstat;
rep6(counter,gg)=V.l(gg);
rep7(counter,line2)=ratio.l(line2);
rep8(counter,i)=Qc.l(i);
);


display rep1,rep2,rep3,rep4,rep5,rep6,rep7,rep8;
