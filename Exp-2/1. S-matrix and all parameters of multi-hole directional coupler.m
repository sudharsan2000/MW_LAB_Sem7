%parameters
VSWR = 1.10 %VSWR
P1 = [-10.457,-10.811,-30.457,-36.477];%port 1 input
P2 = [-10.811,-10.457,-36.477,-30.457];%port 2 input
P3 = [-30.457,-36.477,-10.457,-10.811];%port 3 input
P4 = [-36.477,-30.457,-10.811,-10.457];%port 4 input
S = nan(4,4);

for k = 1:size(P1,2)
    S(1,k) = 10^((P1(1) - P1(k))/(-20));
    S(2,k) = 10^((P2(2) - P2(k))/(-20));
    S(3,k) = 10^((P3(3) - P3(k))/(-20));
    S(4,k) = 10^((P4(4) - P4(k))/(-20));
end
for k = 1:size(P1,2)
    S(k,k) = (VSWR-1)/(VSWR+1);
end

disp(S);
D = -20*log10(S(4,1)/S(3,1)) %directivity
C = -20*log10(S(3,1))%Coupling loss
I = -20*log10(S(2,1))%insertion loss
Is = -20*log10(S(4,1))%isolation loss