i=0;
sumTime=0;


B2s = linspace(0, 1, 4);
NA = 0.75;
kS = linspace(0, 15e6, 51);
fil = 2;

ExS = zeros(length(kS),length(B2s));
EyS = zeros(length(kS),length(B2s));

for B2 =B2s
   i=i+1;
   timer = tic;   
   [ExS(:,i), EyS(:,i)] = GetBLSsignalCoherent(kS, NA, fil, B2);
   elTime = toc(timer);
   sumTime = sumTime + elTime;
   elAvgTime = sumTime/i;
   if mod(i,4)==0
    RemainTime = (length(B2s)-i)*elAvgTime/60;
    sprintf("Remaining time: %d minutes", round(RemainTime))
   end
end

figure();
Exp = ExS.*conj(ExS);
plot(kS./1e6, Exp)


i=1;
for B2 = B2s
    row(i,1) = find(Exp(:,i)<max(Exp(:,i)./100), 1);
    i=i+1;
end
figure()
rowExp = (kS(row)/1e6)';
plot(B2s, kS(row)/1e6)

t = linspace(0,1,51);
% jj=1:length(kS);
jj=1;
kk=1:length(B2s);
figure()
for k=kk
for j=jj
plot(real(ExS(j,k).*exp(1j*t*2*pi)), real(EyS(j,k).*exp(1j*t*2*pi)))
hold on
end
end
axis equal

legendStrings = "kf = " + string(kS(jj)/1e6);
legend(legendStrings)

ExpEx = real(ExS.*exp(1j*t*2*pi)');
ExpEy = real(EyS.*exp(1j*t*2*pi)');

 
 