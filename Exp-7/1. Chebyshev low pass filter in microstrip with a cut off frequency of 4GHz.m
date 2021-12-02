clc;
close all;
fc =4e9;
epsilon = 2.2;
h = 1.6;
g0=1;
g1=1.0316;
g2=1.1474;
g3=1.0316;
z0=50;
ohmc=1.0;
w = input('Enter width of 50 Ohm microstrip line: ');
z1 = input ( 'Enter impedance of inductor line: ');
wL = input ( 'Enter width of inductor line: ');
zc = z0^2/z1;
wC = input ( 'Enter width of capacitor line: ');
epsre_L = ((epsilon+1)/2) +(((epsilon-1)/2)*(1+(12*h/wL))^-0.5);
epsre_C = ((epsilon+1)/2) +(((epsilon-1)/2)*(1+(12*h/wC))^-0.5);
L1 = (z0/g0)*((ohmc/(2*3.14*fc))*g1)
c2 = (z0/g0)*((ohmc/(2*3.14*fc))*g2)
L3 = (z0/g0)*((ohmc/(2*3.14*fc))*g3)
lamdag_L = 300/(fc*1e-9*sqrt(epsre_L));
lamdag_C = 300/(fc*1e-9*sqrt(epsre_C));
ll = (lamdag_L/(2*63.14))*asin((fc*2*3.14*L3)/z1);
lc = (lamdag_L/(2*3.14))*asin(fc*2*3.14*c2*z1);
disp('Length of inductor line (Unit: mm)');
disp(ll)
disp('Length of capacitor line (Unit: mm)');
disp(lc)