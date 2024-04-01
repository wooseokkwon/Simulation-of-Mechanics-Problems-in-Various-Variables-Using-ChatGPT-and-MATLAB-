close all; clear; clc;

% Prompt the user to input initial velocity, launch angle, gravity, initial height, and air resistance
v0 = input('Enter the initial velocity (m/s): ');
theta = input('Enter the launch angle (degrees): ');
g = input('Enter the gravity (m/s^2): ');
initial_height = input('Enter the initial height (m): ');

% Split the initial velocity into x and y components
vx0 = v0 * cosd(theta); % Initial velocity in the x-direction
vy0 = v0 * sind(theta); % Initial velocity in the y-direction

% Time interval and time array creation
dt = 0.01; % Time interval
t_max = (2 * vy0) / g; % Time to reach maximum height
t = 0:dt:t_max; % Time range from 0 to maximum height

% Calculate projectile's position
x = vx0 * t; % Position in the x-direction
y = initial_height + vy0 * t - 0.5 * g * t.^2; % Position in the y-direction

% Calculate maximum height and time of flight
max_height = max(y) - initial_height; % Maximum height
time_of_flight = 2 * t_max; % Total time of flight

% Calculate horizontal range
range_x = vx0 * time_of_flight; % Horizontal range

% Calculate velocity components
vx = vx0 * ones(size(t)); % Velocity in the x-direction (constant)
vy = vy0 - g * t; % Velocity in the y-direction

% Calculate velocity magnitude
v_mag = sqrt(vx.^2 + vy.^2);

% Plotting the trajectory
plot(x, y);
title('Projectile Motion');
xlabel('Distance (m)');
ylabel('Height (m)');

% Displaying the results
fprintf('Maximum height: %.2f m\n', max_height);
fprintf('Time of flight: %.2f s\n', time_of_flight);
fprintf('Horizontal range: %.2f m\n', range_x);
