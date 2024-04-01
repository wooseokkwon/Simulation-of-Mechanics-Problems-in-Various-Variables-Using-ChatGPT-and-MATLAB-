close all; clear; clc;

% List of code files
codeFiles = {'projectile.m', 'inclined_plane.m', 'harmonic_motion.m', 'derivative.m'}; % Add the names of the code files you want to execute here.

% Display options to the user
fprintf('Choose a code to execute:\n');
for i = 1:numel(codeFiles)
    fprintf('%d. %s\n', i, codeFiles{i});
end

% Prompt user for input
choice = input('Enter the number of the code to execute: ');

% Execute the chosen code
if choice >= 1 && choice <= numel(codeFiles)
    run(codeFiles{choice});
else
    fprintf('Invalid choice.\n');
end
