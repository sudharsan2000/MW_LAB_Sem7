%parameters for E plane TEE
P1 = [10,9.8,14.15];%port 1 out
P2 = [10.2,10,-14.16];%port 2 out
P3 = [14.32,-14.12,0];%port 3 out
P1in = P2in = P3in = 20;
VSWR = 2 %VSWR
%S matrix for 3 port E plane TEE
S = nan(3,3);
S(1,:) = P1./P1in;
S(2,:) = P2./P2in;
S(3,:) = P3./P3in;
disp("S matrix for a waveguide E plane tee:")
disp(S) %S matrix