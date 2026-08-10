t = 0:60;
y = 1.5*t + 1.5*sin(t) + 1.5*randn(1,61);

figure(1)
plot(t,y)
title('Synthetic time series')
xlabel('time (s)')

data = readtable('co2_mm_mlo.csv', VariableNamingRule='modify');
t = data.decimalDate;
co2 = data.average;

figure(2)
plot(t, co2)
title('Measured CO2 monthly averages in Mauna Loa, Hawaii')
xlabel('year')
ylabel('CO2 mole fraction (ppm)')
axis tight