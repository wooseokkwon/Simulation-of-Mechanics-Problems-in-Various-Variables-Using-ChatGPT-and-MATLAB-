close all; clear; clc;

% Prompt the user to input initial velocity, gravity, incline angle, and friction coefficient
v0 = input('Enter the initial velocity (m/s): ');
g = input('Enter the gravity (m/s^2): ');
alpha = input('Enter the incline angle (degrees): ');
friction_coefficient = input('Enter the friction coefficient: ');

% Split the initial velocity into x and y components
vx0 = v0 * cosd(alpha); % Initial velocity in the x-direction
vy0 = v0 * sind(alpha); % Initial velocity in the y-direction

% Convert the incline angle to radians
alpha_rad = deg2rad(alpha);

% Calculate effective gravity and friction force on the incline
g_effective = g * sind(alpha); % Effective gravity considering the incline
friction_force = friction_coefficient * g * cosd(alpha); % Friction force

% Time interval and time array creation
dt = 0.01; % Time interval
t_max = (2 * vy0) / g_effective; % Maximum value for time array
t = 0:dt:t_max; % Time range

% Calculate object's position
x = (vx0 / g_effective) * (v0 * sind(alpha) + sqrt((v0 * sind(alpha))^2 + 2 * g_effective * friction_force));
y = (vy0 / g_effective) * (v0 * sind(alpha) + sqrt((v0 * sind(alpha))^2 + 2 * g_effective * friction_force)); % Position in the y-direction

% Plot the trajectory
figure;
plot(x, y);
title('Inclined Plane Motion');
xlabel('Distance (m)');
ylabel('Height (m)');
grid on;

% Display the results
fprintf('Object''s landing position: x = %.2f m, y = %.2f m\n', x, y);
