% Prompt user to input the frequency of the first signal component
freq1 = input('Enter the frequency of the first signal component (in Hz): ');

% Prompt user to input the frequency of the second signal component
freq2 = input('Enter the frequency of the second signal component (in Hz): ');

% Create a sample signal with both low and high frequency components
t = 0:0.001:pi/5; % Time vector
x = sin(2*pi*freq1*t) + sin(2*pi*freq2*t); % Signal with both frequency components

% Design a low-pass filter with a cutoff frequency of 10 Hz
Fs = 1/0.001; % Sampling frequency
Fc = 10; % Cutoff frequency
[b,a] = butter(6, Fc/(Fs/2)); % 6th order Butterworth filter

% Apply the filter to the signal
y = filter(b, a, x);

% Plot the original and filtered signals
figure;
plot(t, x, 'b', 'LineWidth', 1.5);
hold on;
plot(t, y, 'r', 'LineWidth', 1.5);
title('Original Signal and Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal', 'Filtered Signal');
grid on;
hold off;
