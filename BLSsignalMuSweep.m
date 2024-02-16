mus = linspace(6.4e9, -40e9, 10);

i=0
for mu =mus
    i=i+1
    [BLSsignal(:,i), ff] = GetBLSsignal(100e-9, 50e-3, 0, mu);
end
figure()
plot(ff, BLSsignal./max(BLSsignal))