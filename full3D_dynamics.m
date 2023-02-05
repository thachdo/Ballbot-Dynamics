syms m11 m12 m13 m14 m15 m22 m23 m24 m25 m33 m34 m35 m44 m45 m55 real
syms xs ys psix psiy psiz xsd ysd psixd psiyd psizd
syms q1 q2 q3 q4 q5 q1d q2d q3d q4d q5d
syms c1 c2 c3 c4 c5
syms g1 g2 g3 g4 g5
syms b11 b12 b13 b21 b22 b23 b31 b32 b33 b41 b42 b43 b51 b52 b53
syms T1 T2 T3
syms L g rs Is ms Iw rw Ibx Iby Ibz mb

M = [m11,m12,m13,m14,m15;
    m12,m22,m23,m24,m25;
    m13,m23,m33,0,m35;
    m14,m24,0,m44,m45;
    m15,m25,m35,m45,m55];
C = [c1, c2, c3, c4, c5].';
G = [g1, g2, g3, g4, g5].';
B = [b11, b12, b13; b21, b22, b23; b31, b32, b33; b41, b42, b43; b51, b52, b53];
u = [T1,T2,T3].';
% Dynamics equation form: M*qdd + C + G = B*u;

%% Computed elmenents

m11 = (0.25*(4.0*Is*rw^2 + 3.0*Iw*rs^2 + 4.0*mb*rs^2*rw^2 + 4.0*ms*rs^2*rw^2 + 3.0*Iw*rs^2*cos(q3)^2 + 3.0*Iw*rs^2*cos(q5)^2 - 3.0*Iw*rs^2*cos(q3)^2*cos(q4)^2 - 6.0*Iw*rs^2*cos(q3)^2*cos(q5)^2 + 3.0*Iw*rs^2*cos(q3)^2*cos(q4)^2*cos(q5)^2 - 6.0*Iw*rs^2*cos(q3)*cos(q5)*sin(q3)*sin(q4)*sin(q5)))/(rs^2*rw^2);
m12 = (0.75*Iw*(cos(q5)*sin(q5) - 2.0*cos(q3)^2*cos(q5)*sin(q5) - 1.0*cos(q3)*sin(q3)*sin(q4) + 2.0*cos(q3)*cos(q5)^2*sin(q3)*sin(q4) + cos(q3)^2*cos(q4)^2*cos(q5)*sin(q5)))/rw^2;
m13 = -(0.25*(3.0*Iw*rs*cos(q4)*sin(q5) - 4.0*L*mb*rw^2*cos(q3)*sin(q5) + 4.0*L*mb*rw^2*cos(q5)*sin(q3)*sin(q4)))/rw^2;
m14 = (0.25*(3.0*Iw*rs*cos(q3)^2*cos(q5) - 6.0*Iw*rs*cos(q5) + 4.0*L*mb*rw^2*cos(q3)*cos(q4)*cos(q5) + 3.0*Iw*rs*cos(q3)*sin(q3)*sin(q4)*sin(q5)))/rw^2;
m15 = (0.25*(4.0*L*mb*rw^2 + 3.0*Iw*rs*cos(q3)*cos(q4))*(cos(q5)*sin(q3) - 1.0*cos(q3)*sin(q4)*sin(q5)))/rw^2;
m22 = (0.25*(4.0*Is*rw^2 + 6.0*Iw*rs^2 + 4.0*mb*rs^2*rw^2 + 4.0*ms*rs^2*rw^2 - 3.0*Iw*rs^2*cos(q3)^2 - 3.0*Iw*rs^2*cos(q5)^2 + 6.0*Iw*rs^2*cos(q3)^2*cos(q5)^2 - 3.0*Iw*rs^2*cos(q3)^2*cos(q4)^2*cos(q5)^2 + 6.0*Iw*rs^2*cos(q3)*cos(q5)*sin(q3)*sin(q4)*sin(q5)))/(rs^2*rw^2);
m23 = -(0.25*(4.0*L*mb*rw^2*cos(q3)*cos(q5) - 3.0*Iw*rs*cos(q4)*cos(q5) + 4.0*L*mb*rw^2*sin(q3)*sin(q4)*sin(q5)))/rw^2;
m24 = -(0.25*(6.0*Iw*rs*sin(q5) - 3.0*Iw*rs*cos(q3)^2*sin(q5) - 4.0*L*mb*rw^2*cos(q3)*cos(q4)*sin(q5) + 3.0*Iw*rs*cos(q3)*cos(q5)*sin(q3)*sin(q4)))/rw^2;
m25 = (0.25*(sin(q3)*sin(q5) + cos(q3)*cos(q5)*sin(q4))*(4.0*L*mb*rw^2 + 3.0*Iw*rs*cos(q3)*cos(q4)))/rw^2;
m33 = (0.25*(4.0*Ibx*rw^2 + 3.0*Iw*rs^2 + 4.0*L^2*mb*rw^2))/rw^2;
m34 = 0;
m35 = -(0.25*sin(q4)*(4.0*Ibx*rw^2 + 3.0*Iw*rs^2 + 4.0*L^2*mb*rw^2))/rw^2;
m44 = (0.25*(4.0*Iby*rw^2 + 3.0*Iw*rs^2 + 4.0*L^2*mb*rw^2 - 4.0*Iby*rw^2*sin(q3)^2 + 4.0*Ibz*rw^2*sin(q3)^2 + 3.0*Iw*rs^2*sin(q3)^2 - 4.0*L^2*mb*rw^2*sin(q3)^2))/rw^2;
m45 = (0.25*cos(q3)*cos(q4)*sin(q3)*(4.0*Iby*rw^2 - 4.0*Ibz*rw^2 - 3.0*Iw*rs^2 + 4.0*L^2*mb*rw^2))/rw^2;
m55 = (0.25*(2.0*Ibx*rw^2 + Iby*rw^2 + Ibz*rw^2 + 3.75*Iw*rs^2 + 3.0*L^2*mb*rw^2 - 2.0*Ibx*rw^2*cos(2.0*q4) - 1.0*Iby*rw^2*cos(2.0*q3) + Iby*rw^2*cos(2.0*q4) + Ibz*rw^2*cos(2.0*q3) + Ibz*rw^2*cos(2.0*q4) + 0.75*Iw*rs^2*cos(2.0*q3) + 0.75*Iw*rs^2*cos(2.0*q4) - 1.0*Iby*rw^2*cos(2.0*q3)*cos(2.0*q4) + Ibz*rw^2*cos(2.0*q3)*cos(2.0*q4) + 0.75*Iw*rs^2*cos(2.0*q3)*cos(2.0*q4) - 1.0*L^2*mb*rw^2*cos(2.0*q3) - 1.0*L^2*mb*rw^2*cos(2.0*q4) - 1.0*L^2*mb*rw^2*cos(2.0*q3)*cos(2.0*q4)))/rw^2;


c1 = -(0.25*(3.0*Iw*q2d*q5d + 3.0*Iw*q1d*q3d*sin(2.0*q3) + 3.0*Iw*q1d*q5d*sin(2.0*q5) - 3.0*Iw*q2d*q3d*sin(q4) - 6.0*Iw*q2d*q5d*cos(q3)^2 - 6.0*Iw*q2d*q5d*cos(q5)^2 + 6.0*Iw*q2d*q3d*cos(q3)^2*sin(q4) + 6.0*Iw*q2d*q3d*cos(q5)^2*sin(q4) - 6.0*Iw*q4d*q5d*rs*sin(q5) + 3.0*Iw*q2d*q5d*cos(q3)^2*cos(q4)^2 + 12.0*Iw*q2d*q5d*cos(q3)^2*cos(q5)^2 + 3.0*Iw*q2d*q4d*cos(q3)*cos(q4)*sin(q3) - 6.0*Iw*q2d*q5d*cos(q3)^2*cos(q4)^2*cos(q5)^2 - 6.0*Iw*q1d*q5d*cos(q3)*sin(q3)*sin(q4) - 6.0*Iw*q1d*q3d*cos(q5)*sin(q4)*sin(q5) - 6.0*Iw*q1d*q3d*cos(q3)*cos(q4)^2*sin(q3) - 12.0*Iw*q1d*q3d*cos(q3)*cos(q5)^2*sin(q3) - 6.0*Iw*q1d*q4d*cos(q3)^2*cos(q4)*sin(q4) - 12.0*Iw*q1d*q5d*cos(q3)^2*cos(q5)*sin(q5) + 4.0*L*mb*q3d^2*rw^2*sin(q3)*sin(q5) + 4.0*L*mb*q5d^2*rw^2*sin(q3)*sin(q5) + 6.0*Iw*q3d*q5d*rs*cos(q4)*cos(q5) - 12.0*Iw*q2d*q3d*cos(q3)^2*cos(q5)^2*sin(q4) + 4.0*L*mb*q3d^2*rw^2*cos(q3)*cos(q5)*sin(q4) + 4.0*L*mb*q4d^2*rw^2*cos(q3)*cos(q5)*sin(q4) + 4.0*L*mb*q5d^2*rw^2*cos(q3)*cos(q5)*sin(q4) + 6.0*Iw*q4d*q5d*rs*cos(q3)^2*cos(q4)^2*sin(q5) - 6.0*Iw*q2d*q4d*cos(q3)*cos(q4)*cos(q5)^2*sin(q3) + 12.0*Iw*q1d*q3d*cos(q3)^2*cos(q5)*sin(q4)*sin(q5) + 12.0*Iw*q1d*q5d*cos(q3)*cos(q5)^2*sin(q3)*sin(q4) - 3.0*Iw*q4d^2*rs*cos(q3)*cos(q4)*sin(q3)*sin(q5) + 3.0*Iw*q5d^2*rs*cos(q3)*cos(q4)*sin(q3)*sin(q5) - 8.0*L*mb*q3d*q5d*rw^2*cos(q3)*cos(q5) + 6.0*Iw*q3d*q4d*rs*cos(q3)*cos(q5)*sin(q3) + 6.0*Iw*q1d*q3d*cos(q3)*cos(q4)^2*cos(q5)^2*sin(q3) + 6.0*Iw*q1d*q4d*cos(q3)^2*cos(q4)*cos(q5)^2*sin(q4) + 6.0*Iw*q1d*q5d*cos(q3)^2*cos(q4)^2*cos(q5)*sin(q5) + 3.0*Iw*q5d^2*rs*cos(q3)^2*cos(q4)*cos(q5)*sin(q4) - 6.0*Iw*q3d*q5d*rs*cos(q3)^2*cos(q4)*cos(q5) - 6.0*Iw*q3d*q4d*rs*cos(q3)^2*sin(q4)*sin(q5) - 12.0*Iw*q2d*q3d*cos(q3)*cos(q5)*sin(q3)*sin(q5) + 6.0*Iw*q2d*q3d*cos(q3)*cos(q4)^2*cos(q5)*sin(q3)*sin(q5) + 6.0*Iw*q2d*q4d*cos(q3)^2*cos(q4)*cos(q5)*sin(q4)*sin(q5) + 8.0*L*mb*q3d*q4d*rw^2*cos(q4)*cos(q5)*sin(q3) + 8.0*L*mb*q4d*q5d*rw^2*cos(q3)*cos(q4)*sin(q5) - 8.0*L*mb*q3d*q5d*rw^2*sin(q3)*sin(q4)*sin(q5) + 6.0*Iw*q1d*q4d*cos(q3)*cos(q4)*cos(q5)*sin(q3)*sin(q5) + 12.0*Iw*q2d*q5d*cos(q3)*cos(q5)*sin(q3)*sin(q4)*sin(q5) - 6.0*Iw*q3d*q5d*rs*cos(q3)*cos(q4)*sin(q3)*sin(q4)*sin(q5)))/rw^2;
c2 = -(0.25*(3.0*Iw*q1d*q5d - 3.0*Iw*q2d*q3d*sin(2.0*q3) - 3.0*Iw*q2d*q5d*sin(2.0*q5) - 3.0*Iw*q1d*q3d*sin(q4) - 6.0*Iw*q1d*q5d*cos(q3)^2 - 6.0*Iw*q1d*q5d*cos(q5)^2 + 6.0*Iw*q1d*q3d*cos(q3)^2*sin(q4) + 6.0*Iw*q1d*q3d*cos(q5)^2*sin(q4) + 6.0*Iw*q4d*q5d*rs*cos(q5) + 3.0*Iw*q1d*q5d*cos(q3)^2*cos(q4)^2 + 12.0*Iw*q1d*q5d*cos(q3)^2*cos(q5)^2 + 3.0*Iw*q1d*q4d*cos(q3)*cos(q4)*sin(q3) - 6.0*Iw*q1d*q5d*cos(q3)^2*cos(q4)^2*cos(q5)^2 + 6.0*Iw*q2d*q5d*cos(q3)*sin(q3)*sin(q4) + 6.0*Iw*q2d*q3d*cos(q5)*sin(q4)*sin(q5) - 4.0*L*mb*q3d^2*rw^2*cos(q5)*sin(q3) - 4.0*L*mb*q5d^2*rw^2*cos(q5)*sin(q3) + 12.0*Iw*q2d*q3d*cos(q3)*cos(q5)^2*sin(q3) + 12.0*Iw*q2d*q5d*cos(q3)^2*cos(q5)*sin(q5) + 6.0*Iw*q3d*q5d*rs*cos(q4)*sin(q5) - 12.0*Iw*q1d*q3d*cos(q3)^2*cos(q5)^2*sin(q4) - 6.0*Iw*q4d*q5d*rs*cos(q3)^2*cos(q4)^2*cos(q5) - 6.0*Iw*q1d*q4d*cos(q3)*cos(q4)*cos(q5)^2*sin(q3) + 3.0*Iw*q4d^2*rs*cos(q3)*cos(q4)*cos(q5)*sin(q3) - 3.0*Iw*q5d^2*rs*cos(q3)*cos(q4)*cos(q5)*sin(q3) + 4.0*L*mb*q3d^2*rw^2*cos(q3)*sin(q4)*sin(q5) + 4.0*L*mb*q4d^2*rw^2*cos(q3)*sin(q4)*sin(q5) + 4.0*L*mb*q5d^2*rw^2*cos(q3)*sin(q4)*sin(q5) - 12.0*Iw*q2d*q3d*cos(q3)^2*cos(q5)*sin(q4)*sin(q5) - 12.0*Iw*q2d*q5d*cos(q3)*cos(q5)^2*sin(q3)*sin(q4) - 8.0*L*mb*q3d*q5d*rw^2*cos(q3)*sin(q5) + 6.0*Iw*q3d*q4d*rs*cos(q3)*sin(q3)*sin(q5) - 6.0*Iw*q2d*q3d*cos(q3)*cos(q4)^2*cos(q5)^2*sin(q3) - 6.0*Iw*q2d*q4d*cos(q3)^2*cos(q4)*cos(q5)^2*sin(q4) - 6.0*Iw*q2d*q5d*cos(q3)^2*cos(q4)^2*cos(q5)*sin(q5) + 3.0*Iw*q5d^2*rs*cos(q3)^2*cos(q4)*sin(q4)*sin(q5) + 6.0*Iw*q3d*q4d*rs*cos(q3)^2*cos(q5)*sin(q4) - 6.0*Iw*q3d*q5d*rs*cos(q3)^2*cos(q4)*sin(q5) - 12.0*Iw*q1d*q3d*cos(q3)*cos(q5)*sin(q3)*sin(q5) + 6.0*Iw*q1d*q3d*cos(q3)*cos(q4)^2*cos(q5)*sin(q3)*sin(q5) + 6.0*Iw*q1d*q4d*cos(q3)^2*cos(q4)*cos(q5)*sin(q4)*sin(q5) - 8.0*L*mb*q4d*q5d*rw^2*cos(q3)*cos(q4)*cos(q5) + 8.0*L*mb*q3d*q4d*rw^2*cos(q4)*sin(q3)*sin(q5) + 8.0*L*mb*q3d*q5d*rw^2*cos(q5)*sin(q3)*sin(q4) - 6.0*Iw*q2d*q4d*cos(q3)*cos(q4)*cos(q5)*sin(q3)*sin(q5) + 12.0*Iw*q1d*q5d*cos(q3)*cos(q5)*sin(q3)*sin(q4)*sin(q5) + 6.0*Iw*q3d*q5d*rs*cos(q3)*cos(q4)*cos(q5)*sin(q3)*sin(q4)))/rw^2;
c3 = -(0.125*(3.0*Iw*q2d^2*sin(2.0*q3) - 3.0*Iw*q1d^2*sin(2.0*q3) + 3.0*Iw*q1d^2*sin(2.0*q3)*cos(q4)^2 + 6.0*Iw*q1d^2*sin(2.0*q3)*cos(q5)^2 - 6.0*Iw*q2d^2*sin(2.0*q3)*cos(q5)^2 - 4.0*Iby*q4d^2*rw^2*sin(2.0*q3) + 4.0*Ibz*q4d^2*rw^2*sin(2.0*q3) + 3.0*Iw*q4d^2*rs^2*sin(2.0*q3) + 4.0*Iby*q5d^2*rw^2*sin(2.0*q3)*cos(q4)^2 - 4.0*Ibz*q5d^2*rw^2*sin(2.0*q3)*cos(q4)^2 - 3.0*Iw*q5d^2*rs^2*sin(2.0*q3)*cos(q4)^2 + 8.0*Ibx*q4d*q5d*rw^2*cos(q4) + 6.0*Iw*q4d*q5d*rs^2*cos(q4) - 3.0*Iw*q1d^2*sin(2.0*q3)*cos(q4)^2*cos(q5)^2 + 3.0*Iw*q2d^2*sin(2.0*q3)*cos(q4)^2*cos(q5)^2 - 4.0*L^2*mb*q4d^2*rw^2*sin(2.0*q3) - 6.0*Iw*q1d*q2d*cos(2.0*q3)*sin(q4) + 8.0*L^2*mb*q4d*q5d*rw^2*cos(q4) + 12.0*Iw*q1d*q2d*cos(2.0*q3)*cos(q5)^2*sin(q4) - 6.0*Iw*q1d*q4d*rs*sin(2.0*q3)*cos(q5) - 6.0*Iw*q2d*q4d*rs*sin(2.0*q3)*sin(q5) - 6.0*Iw*q1d^2*cos(2.0*q3)*cos(q5)*sin(q4)*sin(q5) + 6.0*Iw*q2d^2*cos(2.0*q3)*cos(q5)*sin(q4)*sin(q5) + 8.0*Iby*q4d*q5d*rw^2*cos(2.0*q3)*cos(q4) - 8.0*Ibz*q4d*q5d*rw^2*cos(2.0*q3)*cos(q4) - 6.0*Iw*q4d*q5d*rs^2*cos(2.0*q3)*cos(q4) + 6.0*Iw*q1d*q5d*rs*cos(q4)*cos(q5) + 6.0*Iw*q2d*q4d*rs*cos(q5)*sin(q4) + 6.0*Iw*q2d*q5d*rs*cos(q4)*sin(q5) - 6.0*Iw*q1d*q4d*rs*sin(q4)*sin(q5) + 12.0*Iw*q1d*q2d*sin(2.0*q3)*cos(q5)*sin(q5) + 4.0*L^2*mb*q5d^2*rw^2*sin(2.0*q3)*cos(q4)^2 + 6.0*Iw*q1d*q5d*rs*cos(2.0*q3)*cos(q4)*cos(q5) - 6.0*Iw*q2d*q4d*rs*cos(2.0*q3)*cos(q5)*sin(q4) + 6.0*Iw*q2d*q5d*rs*cos(2.0*q3)*cos(q4)*sin(q5) + 6.0*Iw*q1d*q4d*rs*cos(2.0*q3)*sin(q4)*sin(q5) + 8.0*L^2*mb*q4d*q5d*rw^2*cos(2.0*q3)*cos(q4) - 6.0*Iw*q1d*q2d*sin(2.0*q3)*cos(q4)^2*cos(q5)*sin(q5) - 6.0*Iw*q2d*q5d*rs*sin(2.0*q3)*cos(q4)*cos(q5)*sin(q4) + 6.0*Iw*q1d*q5d*rs*sin(2.0*q3)*cos(q4)*sin(q4)*sin(q5)))/rw^2;
c4 = (0.03125*(3.0*Iw*q1d^2*cos(2.0*q5)*sin(2.0*q4) - 3.0*Iw*q2d^2*sin(2.0*q4) - 3.0*Iw*q1d^2*cos(2.0*q3)*sin(2.0*q4) - 3.0*Iw*q2d^2*cos(2.0*q3)*sin(2.0*q4) - 3.0*Iw*q1d^2*sin(2.0*q4) - 3.0*Iw*q2d^2*cos(2.0*q5)*sin(2.0*q4) - 16.0*Ibx*q5d^2*rw^2*sin(2.0*q4) + 8.0*Iby*q5d^2*rw^2*sin(2.0*q4) + 8.0*Ibz*q5d^2*rw^2*sin(2.0*q4) + 6.0*Iw*q5d^2*rs^2*sin(2.0*q4) + 32.0*Ibx*q3d*q5d*rw^2*cos(q4) + 24.0*Iw*q3d*q5d*rs^2*cos(q4) - 8.0*Iby*q5d^2*rw^2*cos(2.0*q3)*sin(2.0*q4) + 8.0*Ibz*q5d^2*rw^2*cos(2.0*q3)*sin(2.0*q4) + 6.0*Iw*q5d^2*rs^2*cos(2.0*q3)*sin(2.0*q4) + 6.0*Iw*q1d^2*sin(2.0*q3)*sin(2.0*q5)*cos(q4) - 6.0*Iw*q2d^2*sin(2.0*q3)*sin(2.0*q5)*cos(q4) + 6.0*Iw*q1d*q2d*sin(2.0*q4)*sin(2.0*q5) - 8.0*L^2*mb*q5d^2*rw^2*sin(2.0*q4) - 36.0*Iw*q2d*q5d*rs*cos(q5) - 32.0*Iby*q3d*q4d*rw^2*sin(2.0*q3) + 32.0*Ibz*q3d*q4d*rw^2*sin(2.0*q3) + 24.0*Iw*q3d*q4d*rs^2*sin(2.0*q3) + 36.0*Iw*q1d*q5d*rs*sin(q5) + 3.0*Iw*q1d^2*cos(2.0*q3)*cos(2.0*q5)*sin(2.0*q4) - 3.0*Iw*q2d^2*cos(2.0*q3)*cos(2.0*q5)*sin(2.0*q4) + 32.0*L^2*mb*q3d*q5d*rw^2*cos(q4) + 6.0*Iw*q1d*q2d*cos(2.0*q3)*sin(2.0*q4)*sin(2.0*q5) - 8.0*L^2*mb*q5d^2*rw^2*cos(2.0*q3)*sin(2.0*q4) + 12.0*Iw*q2d*q5d*rs*cos(2.0*q3)*cos(q5) - 12.0*Iw*q2d*q5d*rs*cos(2.0*q4)*cos(q5) - 24.0*Iw*q1d*q3d*rs*sin(2.0*q3)*cos(q5) - 12.0*Iw*q1d*q5d*rs*cos(2.0*q3)*sin(q5) + 12.0*Iw*q1d*q5d*rs*cos(2.0*q4)*sin(q5) - 12.0*Iw*q1d*q2d*cos(2.0*q5)*sin(2.0*q3)*cos(q4) - 24.0*Iw*q2d*q3d*rs*sin(2.0*q3)*sin(q5) + 32.0*Iby*q3d*q5d*rw^2*cos(2.0*q3)*cos(q4) - 32.0*Ibz*q3d*q5d*rw^2*cos(2.0*q3)*cos(q4) - 24.0*Iw*q3d*q5d*rs^2*cos(2.0*q3)*cos(q4) - 32.0*L^2*mb*q3d*q4d*rw^2*sin(2.0*q3) + 24.0*Iw*q2d*q3d*rs*cos(q5)*sin(q4) - 24.0*Iw*q1d*q3d*rs*sin(q4)*sin(q5) - 24.0*Iw*q2d*q3d*rs*cos(2.0*q3)*cos(q5)*sin(q4) + 24.0*Iw*q1d*q3d*rs*cos(2.0*q3)*sin(q4)*sin(q5) + 24.0*Iw*q1d*q5d*rs*sin(2.0*q3)*cos(q5)*sin(q4) + 24.0*Iw*q2d*q5d*rs*sin(2.0*q3)*sin(q4)*sin(q5) + 32.0*L^2*mb*q3d*q5d*rw^2*cos(2.0*q3)*cos(q4) - 12.0*Iw*q2d*q5d*rs*cos(2.0*q3)*cos(2.0*q4)*cos(q5) + 12.0*Iw*q1d*q5d*rs*cos(2.0*q3)*cos(2.0*q4)*sin(q5)))/rw^2;
c5 = -(0.25*(1.5*Iw*q2d^2*sin(2.0*q5) - 1.5*Iw*q1d^2*sin(2.0*q5) - 3.0*Iw*q1d*q2d + 6.0*Iw*q1d*q2d*cos(q3)^2 + 6.0*Iw*q1d*q2d*cos(q5)^2 + 3.0*Iw*q1d^2*cos(q3)*sin(q3)*sin(q4) - 3.0*Iw*q2d^2*cos(q3)*sin(q3)*sin(q4) + 4.0*Ibx*q3d*q4d*rw^2*cos(q4) + 4.0*Iby*q3d*q4d*rw^2*cos(q4) - 4.0*Ibz*q3d*q4d*rw^2*cos(q4) + 6.0*Iw*q1d^2*cos(q3)^2*cos(q5)*sin(q5) - 6.0*Iw*q2d^2*cos(q3)^2*cos(q5)*sin(q5) - 6.0*Iw*q2d*q4d*rs*cos(q5) - 4.0*Ibx*q4d*q5d*rw^2*sin(2.0*q4) + 4.0*Iby*q4d*q5d*rw^2*sin(2.0*q4) + 6.0*Iw*q1d*q4d*rs*sin(q5) - 3.0*Iw*q1d*q2d*cos(q3)^2*cos(q4)^2 - 12.0*Iw*q1d*q2d*cos(q3)^2*cos(q5)^2 + 8.0*L^2*mb*q3d*q4d*rw^2*cos(q4) + 6.0*Iw*q2d*q4d*rs*cos(q3)^2*cos(q5) - 6.0*Iw*q1d*q4d*rs*cos(q3)^2*sin(q5) + 6.0*Iw*q1d*q2d*cos(q3)^2*cos(q4)^2*cos(q5)^2 - 6.0*Iw*q1d^2*cos(q3)*cos(q5)^2*sin(q3)*sin(q4) + 6.0*Iw*q2d^2*cos(q3)*cos(q5)^2*sin(q3)*sin(q4) - 8.0*Iby*q3d*q4d*rw^2*cos(q3)^2*cos(q4) + 8.0*Ibz*q3d*q4d*rw^2*cos(q3)^2*cos(q4) + 6.0*Iw*q3d*q4d*rs^2*cos(q3)^2*cos(q4) - 3.0*Iw*q1d^2*cos(q3)^2*cos(q4)^2*cos(q5)*sin(q5) + 3.0*Iw*q2d^2*cos(q3)^2*cos(q4)^2*cos(q5)*sin(q5) + 4.0*Iby*q4d^2*rw^2*cos(q3)*sin(q3)*sin(q4) - 4.0*Ibz*q4d^2*rw^2*cos(q3)*sin(q3)*sin(q4) - 3.0*Iw*q4d^2*rs^2*cos(q3)*sin(q3)*sin(q4) - 8.0*L^2*mb*q3d*q4d*rw^2*cos(q3)^2*cos(q4) - 6.0*Iw*q2d*q4d*rs*cos(q3)^2*cos(q4)^2*cos(q5) - 8.0*Iby*q3d*q5d*rw^2*cos(q3)*cos(q4)^2*sin(q3) - 8.0*Iby*q4d*q5d*rw^2*cos(q3)^2*cos(q4)*sin(q4) + 8.0*Ibz*q3d*q5d*rw^2*cos(q3)*cos(q4)^2*sin(q3) + 8.0*Ibz*q4d*q5d*rw^2*cos(q3)^2*cos(q4)*sin(q4) + 6.0*Iw*q1d*q4d*rs*cos(q3)^2*cos(q4)^2*sin(q5) + 6.0*Iw*q3d*q5d*rs^2*cos(q3)*cos(q4)^2*sin(q3) + 6.0*Iw*q4d*q5d*rs^2*cos(q3)^2*cos(q4)*sin(q4) + 4.0*L^2*mb*q4d^2*rw^2*cos(q3)*sin(q3)*sin(q4) - 6.0*Iw*q1d*q3d*rs*cos(q3)^2*cos(q4)*cos(q5) - 6.0*Iw*q2d*q3d*rs*cos(q3)^2*cos(q4)*sin(q5) - 8.0*L^2*mb*q3d*q5d*rw^2*cos(q3)*cos(q4)^2*sin(q3) - 8.0*L^2*mb*q4d*q5d*rw^2*cos(q3)^2*cos(q4)*sin(q4) + 6.0*Iw*q1d*q4d*rs*cos(q3)*cos(q5)*sin(q3)*sin(q4) + 6.0*Iw*q2d*q4d*rs*cos(q3)*sin(q3)*sin(q4)*sin(q5) - 12.0*Iw*q1d*q2d*cos(q3)*cos(q5)*sin(q3)*sin(q4)*sin(q5) + 6.0*Iw*q2d*q3d*rs*cos(q3)*cos(q4)*cos(q5)*sin(q3)*sin(q4) - 6.0*Iw*q1d*q3d*rs*cos(q3)*cos(q4)*sin(q3)*sin(q4)*sin(q5)))/rw^2;
g1 = 0;
g2 = 0;
g3 = -1.0*L*g*mb*cos(q4)*sin(q3);
g4 = -1.0*L*g*mb*cos(q3)*sin(q4);
g5 = 0;
b11 = -(1.0*(0.7071068*cos(q5)*sin(q3) + 0.7071068*cos(q4)*sin(q5) - 0.7071068*cos(q3)*sin(q4)*sin(q5)))/rw;
b12 = -(1.414214*(0.4330127*cos(q3)*cos(q5) + 0.5*cos(q5)*sin(q3) - 0.25*cos(q4)*sin(q5) + 0.4330127*sin(q3)*sin(q4)*sin(q5) - 0.5*cos(q3)*sin(q4)*sin(q5)))/rw;
b13 = (1.414214*(0.4330127*cos(q3)*cos(q5) - 0.5*cos(q5)*sin(q3) + 0.25*cos(q4)*sin(q5) + 0.4330127*sin(q3)*sin(q4)*sin(q5) + 0.5*cos(q3)*sin(q4)*sin(q5)))/rw;
b21 = -(1.0*(0.7071068*sin(q3)*sin(q5) - 0.7071068*cos(q4)*cos(q5) + 0.7071068*cos(q3)*cos(q5)*sin(q4)))/rw;
b22 = -(1.414214*(0.25*cos(q4)*cos(q5) + 0.4330127*cos(q3)*sin(q5) + 0.5*sin(q3)*sin(q5) + 0.5*cos(q3)*cos(q5)*sin(q4) - 0.4330127*cos(q5)*sin(q3)*sin(q4)))/rw;
b23 = -(1.414214*(0.25*cos(q4)*cos(q5) - 0.4330127*cos(q3)*sin(q5) + 0.5*sin(q3)*sin(q5) + 0.5*cos(q3)*cos(q5)*sin(q4) + 0.4330127*cos(q5)*sin(q3)*sin(q4)))/rw;
b31 = (0.7071068*rs)/rw;
b32 = -(0.3535534*rs)/rw;
b33 = -(0.3535534*rs)/rw;
b41 = (0.7071068*rs*sin(q3))/rw;
b42 = (0.3535534*rs*(1.732051*cos(q3) + 2.0*sin(q3)))/rw;
b43 = -(0.3535534*rs*(1.732051*cos(q3) - 2.0*sin(q3)))/rw;
b51 = -(0.7071068*rs*(sin(q4) + cos(q3)*cos(q4)))/rw;
b52 = (0.3535534*rs*(sin(q4) - 2.0*cos(q3)*cos(q4) + 1.732051*cos(q4)*sin(q3)))/rw;
b53 = -(0.3535534*rs*(2.0*cos(q3)*cos(q4) - 1.0*sin(q4) + 1.732051*cos(q4)*sin(q3)))/rw;


%% Physical params
Ibx = 16.25;
Iby = 15.85;
Ibz = 1.08;
mb = 116;
rw = 0.1;
Iw = 0.0043;
ms = 11.4;
Is  = 0.165;
rs = 0.19;
g =9.81;
L = 0.23;
