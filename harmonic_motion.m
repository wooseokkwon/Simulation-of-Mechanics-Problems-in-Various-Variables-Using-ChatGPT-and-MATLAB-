% Prompt the user to input each variable
m = input('Enter the mass of the object (kg): ');
k = input('Enter the spring constant of the spring (N/m): ');
x0 = input('Enter the initial displacement (m): ');
v0 = input('Enter the initial velocity (m/s): ');
t_max = input('Enter the simulation time (s): ');
dt = input('Enter the time interval (s): ');

% Time array creation
t = 0:dt:t_max;

% Solving the motion equation
x = zeros(size(t));
v = zeros(size(t));
x(1) = x0;
v(1) = v0;
for i = 2:length(t)
    a = -k / m * x(i-1); % Calculate acceleration
    v(i) = v(i-1) + a * dt; % Update velocity
    x(i) = x(i-1) + v(i) * dt; % Update position
end

% Plotting the graph
plot(t, x, 'b', 'LineWidth', 2);
title('Simple Harmonic Motion Simulation');
xlabel('Time (s)');
ylabel('Displacement (m)');
grid on;
