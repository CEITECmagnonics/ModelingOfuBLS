NA = linspace(0.05, 1, 51);
i = 1;
ExiX = zeros(201,length(NA));
for NAi = NA
    [xi, yi, Exi, Eyi, Ezi] = focalFields(532e-9, NAi, 0, 10, 5e-3, 3e-6);
    ExiX(:,i) = Exi(:, round(end/2));
    i = i + 1
end
    
[X, NAy] = ndgrid(xi, NA);
figure('name', 'NA vs Ex')
surf(X*1e6, NAy, abs(ExiX), 'EdgeColor', 'None');
view(2)
xlabel('x (\mum)')
ylabel('NA ()')