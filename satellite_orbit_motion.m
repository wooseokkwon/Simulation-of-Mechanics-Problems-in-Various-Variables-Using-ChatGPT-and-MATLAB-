% Constants
G = 6.67430e-11; % gravitational constant (m^3/kg/s^2)
M = 5.972e24;    % mass of the Earth (kg)
R = 6371000;     % radius of the Earth (m)

% Get altitude from user input
altitude = input('Enter altitude above the Earth''s surface (m): ');

% Calculate satellite parameters
r = R + altitude; % distance from the center of the Earth to the satellite (m)
v = sqrt(G * M / r); % speed of the satellite in circular orbit (m/s)
T = 2 * pi * r / v; % period of the satellite's orbit (s)
Fc = M * v^2 / r; % centripetal force acting on the satellite (N)

% Animation setup
theta = linspace(0, 2*pi, 100);
earth_x = R * cos(theta);
earth_y = R * sin(theta);
plot(earth_x, earth_y, 'b');
hold on;

% Initialize satellite position
satellite_x = zeros(size(theta));
satellite_y = zeros(size(theta));

% Plot Earth and initial satellite position
plot(earth_x, earth_y, 'b');
satellite_plot = plot(satellite_x(1), satellite_y(1), 'r.', 'MarkerSize', 10);

% Animate satellite orbit
for i = 1:length(theta)
    satellite_x(i) = r * cos(theta(i));
    satellite_y(i) = r * sin(theta(i));
    set(satellite_plot, 'XData', satellite_x(i), 'YData', satellite_y(i));
    pause(0.01); % Adjust animation speed if necessary
end

hold off;
axis equal;
xlabel('X (m)');
ylabel('Y (m)');
title('Satellite Orbit Animation');

% Display results
fprintf('Speed of the satellite in circular orbit: %.2f m/s\n', v);
fprintf('Orbital velocity: %.2f m/s\n', v);
fprintf('Period of the satellite''s orbit: %.2f seconds\n', T);
fprintf('Centripetal force acting on the satellite: %.2f Newtons\n', Fc);
