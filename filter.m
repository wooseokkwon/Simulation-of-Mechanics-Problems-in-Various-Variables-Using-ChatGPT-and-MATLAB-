% Create a sample signal with both low and high frequency components
t = 0:0.001:pi/5; % Time vector
x = sin(2*pi*5*t) + sin(2*pi*50*t); % Signal with 5 Hz and 50 Hz components

% Design a low-pass filter with a cutoff frequency of 10 Hz
Fs = 1/0.001; % Sampling frequency
Fc = 10; % Cutoff frequency
[b,a] = butter(6, Fc/(Fs/2)); % 6th order Butterworth filter

% Apply the filter to the signal
y = filter(b, a, x);

% Plot the original and filtered signals
figure;
hold on
plot(t, x);
title('Original Signal and Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');
plot(t, y);
xlabel('Time (s)');
ylabel('Amplitude');
