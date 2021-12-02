%parameters for circulator
P1 = [-10.457,-10.956,-30.455];%port 1 input
P2 = [-30.456,-10.456,-10.952];%port 2 input
P3 = [-10.953,-30.452,-10.457];%port 3 input
VSWR = 2 %VSWR
%S matrix for 3 port circulator
S = nan(3,3);
disp("for circutator:")
%insertion loss circulator
I = ((P1(1)-P1(2))+(P2(2)-P2(3))+(P3(3)-P3(1)))/3 %insertion loss
S(1,3) = 10^(I/(-20));
S(2,1) = S(3,2) = S(1,3);
%isolation loss circulator
Is = ((P1(1)-P1(3))+(P2(2)-P2(1))+(P3(3)-P3(2)))/3 %isolation
S(1,2) = 10^(Is/(-20));
S(2,3) = S(3,1) = S(1,2);
%VSWR circulator
S(1,1) = (VSWR-1)/(VSWR+1);
S(2,2) = S(3,3) = S(1,1);
disp("S matrix for circulator is:")
disp(S) %S matrix
%parameters for isolator
Ps1 = [-10.457,-10.956];%port 1 input
Ps2 = [-30.455,-10.956];%port 2 input
%S matrix for 2 port isolator
S = nan(2,2);
disp("for isolator")
%insertion loss isolator
I = Ps1(1)-Ps1(2)
S(2,1) = 10^(I/(-20));
%isolation loss isolator
Is = Ps2(2)-Ps2(1)
S(1,2) = 10^(Is/(-20));
%VSWR isolator
S(1,1) = (VSWR-1)/(VSWR+1);
S(2,2) = S(1,1);
disp("S matrix for isolator is:")
disp(S) %S matrix

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