i=0;
sumTime=0;


Fils = linspace(0.1, 2, 51);
NA = 0.75;
kS = linspace(0, 20e6, 51);

ExS = zeros(length(kS),length(Fils));
EyS = zeros(length(kS),length(Fils));

for fil =Fils
   i=i+1;
   timer = tic;   
   [ExS(:,i), EyS(:,i)] = GetBLSsignalCoherent(kS, NA, fil);
   elTime = toc(timer);
   sumTime = sumTime + elTime;
   elAvgTime = sumTime/i;
   if mod(i,4)==0
    RemainTime = (length(Fils)-i)*elAvgTime/60;
    sprintf("Remaining time: %d minutes", round(RemainTime))
   end
end

figure();
plot(kS./1e6, EyS.*conj(EyS))
Exp = EyS.*conj(EyS);

i=1;
for fil = Fils
    row(i,1) = find(Exp(:,i)<max(Exp(:,i)./100), 1);
    i=i+1;
end
figure()
rowExp = (kS(row)/1e6)';
plot(Fils, kS(row)/1e6)

 
 