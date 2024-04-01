close all; clear; clc;

% Prompt the user to input the function
func_str = input('Enter the function f(x): ', 's');

% Define the symbolic variable
syms x;

% Convert the function string to a symbolic expression
f = str2sym(func_str);

% Find the first derivative
f_prime = diff(f, x);

% Find the second derivative
f_double_prime = diff(f_prime, x);

% Create a vector of x values for plotting
x_values = linspace(-10, 10, 1000);

% Evaluate the original function, its first derivative, and its second derivative
f_values = subs(f, x, x_values);
f_prime_values = subs(f_prime, x, x_values);
f_double_prime_values = subs(f_double_prime, x, x_values);

% Plot all functions in one figure
figure;
plot(x_values, f_values, 'b', 'LineWidth', 2); hold on;
plot(x_values, f_prime_values, 'r', 'LineWidth', 2);
plot(x_values, f_double_prime_values, 'g', 'LineWidth', 2);
legend('Original function', 'First derivative', 'Second derivative');
title('Function and Its Derivatives');
xlabel('x');
ylabel('y');
grid on;
