clc
clear all
%Body A
syms ttx tty ttxd ttyd ttxdd ttydd mb Ix Iy Iz L af g real

%Ball S
syms xk yk xkd ykd xkdd ykdd mw ms rs Is real

%WheeL W
syms rw Iw bx by brx bry uxz uyz real

%% Xz
q1 = [xk; tty];
q1d = [xkd; ttyd];
q1dd = [xkdd; ttydd];

mi = ms + mb + mw;
ni = mb*L + mw*(rs + rw);
m11 = Is/rs/rs + mi + 3*Iw*(cos(af))^2/2/rw/rw;
m12 = -3*(rs+rw)*Iw*(cos(af))^2/2/rw/rw + ni*cos(tty);
m21 = m12;
m22 = Ix + mw*(rs+rw)^2 + mb*L*L + 3*Iw*(cos(af))^2*(rs+rw)^2/2/rw/rw;

Mxz = [m11,m12;m21,m22];
Cxz = [by -ni*ttyd*sin(tty);0 brx];
Gxz = [0;-ni*g*sin(tty)];
Qxz = [-uxz/rw;rs*uxz/rw];
Jxz = diff(Qxz,uxz);

% Dynamics Equation: Mxz*q1dd + Cxz*q1d+Gxz = Qxz

%% Yz
q1 = [yk; ttx];
q1d = [ykd; ttxd];
q1dd = [ykdd; ttxdd];

m11 = Is/rs/rs + mi + 3*Iw*(cos(af))^2/2/rw/rw;
m12 = 3*(rs+rw)*Iw*(cos(af))^2/2/rw/rw - ni*cos(ttx);
m21 = m12;
m22 = Ix + mw*(rs+rw)^2 + mb*L*L + 3*Iw*(cos(af))^2*(rs+rw)^2/2/rw/rw;

Myz = [m11,m12;m21,m22];
Cyz = [by ni*ttxd*sin(ttx);0 brx];
Gyz = [0;-ni*g*sin(ttx)];
Qyz = [uyz/rw;rs*uyz/rw];
Jyz = diff(Qyz,uyz);

% Dynamics Equation: Myz*q1dd + Cyz*q1d + Gyz + Qyz

%% Physical Params (need to recalculate depends on your system)
g = 10;
mb = 22;
L =0.5;
Ix = 2.2;
Iy = 2.21;
Iz = 1.07; 
rw = 0.05;
Iw = 0.00175;
mw = 0.56;
ms = 0.552;
rs = 0.1175;
Is = 0.0051;
af = 45*pi/180;
brx =3;
by = 4;
