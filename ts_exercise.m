% Read the data in.
data_raw = readmatrix('Baana2021.xlsx');

% Check for missing and non-integer values. This loop prints the
for iii = 1:length(data_raw)
    % Prepare a string matrix
    text = ['value: ', num2str(data_raw(iii)), ...
            ', index: ', num2str(iii)];

    % First check if the value is NaN and in case print it and the index.
    % Then check if the value is not an integer and then print accordingly.
    if isnan(data_raw(iii))
        disp(text)
    elseif round(data_raw(iii)) ~= data_raw(iii)
        disp(text)
    end

end

% Change missing values to 0 and round off the decimals
data_clean = round(fillmissing(data_raw, 'constant', 0));

Fs = 24;
T = 1/Fs;
L = length(data_clean);
t = (0:L-1)*T;
figure(1)
plot(t, data_clean)
xlim tight
ylim tight

% Filtering the data (?)
% windowSize = 50; 
% b = (1/windowSize)*ones(1,windowSize);
% a = 1;
%
% data_filtered = filter(b, a, data_clean)
% figure(2)
% plot(t, data_filtered)
% xlim tight
% ylim tight

n = 2^nextpow2(L);
ffts = fft(data_clean, n);

% Plot the fourie coefficients on the complex plane
% figure(3)
% plot(ffts, '.')
% grid('on')
% xlabel('Re')
% ylabel('Im')

% Construct the one sided spectrum
P2 = abs(ffts);
P1 = P2(1:n/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% The maximum frequency is assumed to be half of the sampling rate
maxfreq = Fs/2;
% Equally spaced frequency vector
n1 = n/2;
f1 = (0:n1)/n1*maxfreq;

length(f1)
length(P1)

figure(2)
plot(f1, P1)

period1 = 1./f1;
figure(4)
plot(period1, P1)
xlim([0, 20])