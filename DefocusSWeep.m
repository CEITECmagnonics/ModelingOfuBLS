z = linspace(-2e-6, 2e-6, 51);
i = 1;
ExiX = zeros(201,length(z));
EyiX = zeros(201,length(z));
EziX = zeros(201,length(z));
for zi = z
    [xi, yi, Exi, Eyi, Ezi] = focalFields(532e-9, 0.75, zi, 2, 1.65e-3, 3e-6);
%     ExiX(:,i) = Exi(round(end/2), :);
%     EyiX(:,i) = Eyi(round(end/2), :);
%     EziX(:,i) = Ezi(round(end/2), :);
    ExiX(:,i) = squeeze(trapz(Exi.*conj(Exi),1));
    EyiX(:,i) = squeeze(trapz(Eyi.*conj(Eyi),1));
    EziX(:,i) = squeeze(trapz(Ezi.*conj(Ezi),1));
    i = i + 1
end
    
[X, Z] = ndgrid(xi, z);
figure()
subplot(1,3,1)
surf(X*1e6, Z, real(ExiX), 'EdgeColor', 'None');
view(2)
xlabel('x (\mum)')
ylabel('Defocus (um)')
subplot(1,3,2)
surf(X*1e6, Z, real(EyiX), 'EdgeColor', 'None');
view(2)
xlabel('x (\mum)')
ylabel('Defocus (um)')
subplot(1,3,3)
surf(X*1e6, Z, real(EziX), 'EdgeColor', 'None');
view(2)
xlabel('x (\mum)')
ylabel('Defocus (um)')
