close all; clear; clc

% Input parameters
% For mass
m_rocket_stage1 = 22200;
m_fuel_stage1 = 410900;
F_thrust_stage1 = 7607000;
m_rocket_stage2 = 5700;
m_fuel_stage2 = 104800;
F_thrust_stage2 = 934000;
r = 6371000;
M = 5.972e24;
G = 6.673e-11;
% For drag
A = 10.521;
rho_air = 1.225;
C_d = 0.75;
% For thrust
Isp_stage1 = 348;
Isp_stage2 = 348;
stage1_time_limit = 150;
dot_m_stage1 = F_thrust_stage1 / (9.8 * Isp_stage1);
dot_m_stage2 = F_thrust_stage2 / (9.8 * Isp_stage2);
% Time interval
dt = 0.11;

% Initial velocity and altitude
v = 0;
t = 0;
h = 0;

% Arrays to store simulation results
time_array = [];
velocity_array = [];
altitude_array = [];
thrust_array = [];
gravity_array = [];
drag_array = [];

% Simulation loop
for i = 0:dt:500
    % Calculate effective gravity
    g_effective = G * M / (h + r)^2;

    % Calculate thrust
    if i <= stage1_time_limit
        m_fuel_stage1 = m_fuel_stage1 - dot_m_stage1 * dt;
        F_thrust = F_thrust_stage1;
    else
        m_fuel_stage1 = 0;
        m_rocket_stage1 = 0;
        m_fuel_stage2 = m_fuel_stage2 - dot_m_stage2 * dt;
        F_thrust = F_thrust_stage2;
    end
    
    % Calculate forces
    F_gravity = (m_rocket_stage1 + m_fuel_stage1 + m_rocket_stage2 + m_fuel_stage2) * g_effective;
    if h <= 16000
        F_drag = 0.5 * rho_air * v^2 * A * C_d;
    else
        F_drag = 0;
    end
    
    % Calculate acceleration
    a = (F_thrust - F_gravity - F_drag) / (m_rocket_stage1 + m_fuel_stage1 + m_rocket_stage2 + m_fuel_stage2);
    
    % Update velocity
    v = v + a * dt;
    
    % Update position
    h = h + v * dt;
    
    % Store results
    time_array(end+1) = i;
    velocity_array(end+1) = v;
    altitude_array(end+1) = h;
    thrust_array(end+1) = F_thrust;
    gravity_array(end+1) = F_gravity;
    drag_array(end+1) = F_drag;
    
    % Update time
    t = t + dt;
    
end

% Plot results in separate windows
figure('Name', 'Velocity vs Time');
plot(time_array, velocity_array);
title('Velocity vs Time');
xlabel('Time (s)');
ylabel('Velocity (m/s)');

figure('Name', 'Altitude vs Time');
plot(time_array, altitude_array);
title('Altitude vs Time');
xlabel('Time (s)');
ylabel('Altitude (m)');

figure('Name', 'Forces vs Time');
hold on;
plot(time_array, thrust_array, 'b', 'LineWidth', 1.5);
plot(time_array, gravity_array, 'r', 'LineWidth', 1.5);
plot(time_array, drag_array, 'g', 'LineWidth', 1.5);
legend('Thrust', 'Gravity', 'Drag');
title('Forces vs Time');
xlabel('Time (s)');
ylabel('Force (N)');
hold off;
