f = 10^10
a = 20/3*10^(-2)
b = 20/4*10^(-2)
er = 4
eff = 0;
rat = b/a;
if(rat < 1)
const = 1/sqrt(1+12/rat) + 0.04*(1-rat^2);
eff = (er+1)/2 + (er-1)*const/2;
else
eff = (er+1)/2 + (er - 1)/(2*sqrt(1+12/rat));
end
Wg = 300/(f*sqrt(er))
Wc = 2*a
const2 = 1/Wg^2 + 1/Wc^2;
disp("the wavelength of microwave signal is:")
W0 = 1/sqrt(const2)