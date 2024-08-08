% main.m
% Clear workspace, close all figures, and clear command window
clc;
clear;
close all;

% Initialize the figure
figure('Name', 'Signal Operations', 'NumberTitle', 'off');

% ===========================
% Part 1: Discrete Signal Operations (Scaling)
% ===========================

% Discrete Signal Settings
n = 0:5;                % Time index for the discrete signal
x = [0 1 2 2 1 0];      % Discrete signal values

% Plot Original Discrete Signal
subplot(5,3,1);
plotDiscreteSignal(n, x, 'Original Discrete Signal', [0 10 0 3]);

% Plot Compressed Discrete Signal (Time scaling by 0.5)
subplot(5,3,4);
plotDiscreteSignal(n * 0.5, x, 'Compressed Discrete Signal', [0 10 0 3]);

% Plot Expanded Discrete Signal (Time scaling by 2)
subplot(5,3,7);
plotDiscreteSignal(n * 2, x, 'Expanded Discrete Signal', [0 10 0 3]);

% ===========================
% Part 2: Continuous Signal Operations (Scaling)
% ===========================

% Continuous Signal Settings
t = linspace(0, 8*pi, 100);  % Continuous time vector

% Plot Original Continuous Signal
subplot(5,3,2);
plotContinuousSignal(t, sin(t), 'Original Continuous Signal');

% Plot Expanded Continuous Signal (Time scaling by 0.5)
subplot(5,3,5);
plotContinuousSignal(t * 0.5, sin(t * 0.5), 'Expanded Continuous Signal');

% Plot Compressed Continuous Signal (Time scaling by 2)
subplot(5,3,8);
plotContinuousSignal(t * 2, sin(t * 2), 'Compressed Continuous Signal');

% ===========================
% Part 3: Discrete Signal Operations (Reversing)
% ===========================

% Discrete Signal with negative values
n = 0:5;
x = [0 1 2 -2 -1 0];

% Plot Original Discrete Signal
subplot(5,3,10);
plotDiscreteSignal(n, x, 'Original Discrete Signal (Reversal)', [0 10 -3 3]);

% Plot Reversed Discrete Signal
subplot(5,3,13);
plotDiscreteSignal(fliplr(-n), x, 'Reversed Discrete Signal', [-10 0 -3 3]);

% ===========================
% Part 4: Continuous Signal Operations (Reversing)
% ===========================

% Continuous Signal Settings
t = linspace(0, 8*pi, 100);  % Continuous time vector

% Plot Original Continuous Signal
subplot(5,3,3);
plotContinuousSignal(t, sin(t), 'Original Continuous Signal (Reversal)');

% Plot Reversed Continuous Signal
subplot(5,3,6);
plotContinuousSignal(fliplr(t), sin(t), 'Reversed Continuous Signal');

% ===========================
% Part 5: Discrete Signal Addition (Zero Padding)
% ===========================

% Define two signals with different time indices
n1 = -3:5;
x1 = [0 1 2 -2 -1 0 3 -3 0];
n2 = -5:3;
x2 = [0 1 0 2 0 1 2 3 -1];

% Zero-pad and add signals
n_combined = min(min(n1), min(n2)) : max(max(n1), max(n2));
y1 = zeros(1, length(n_combined));
y2 = zeros(1, length(n_combined));

y1((n_combined >= min(n1)) & (n_combined <= max(n1))) = x1;
y2((n_combined >= min(n2)) & (n_combined <= max(n2))) = x2;

% Plot the sum of the signals
subplot(5,3,9);
plotDiscreteSignal(n_combined, y1 + y2, 'Sum of Discrete Signals', [-10 10 -3 3]);

% ===========================
% Part 6: Continuous Signal Addition (Padding)
% ===========================

% Define two continuous signals with different time intervals
t1 = linspace(0, 4*pi, 100);
t2 = linspace(pi, 5*pi, 100);
y1 = sin(t1);
y2 = sin(t2);

% Define a common time vector with padding
t_combined = linspace(min(min(t1), min(t2)), max(max(t1), max(t2)), 200);
y1_padded = interp1(t1, y1, t_combined, 'linear', 0); % Interpolate with padding
y2_padded = interp1(t2, y2, t_combined, 'linear', 0); % Interpolate with padding

% Plot the sum of the continuous signals
subplot(5,3,12);
plotContinuousSignal(t_combined, y1_padded + y2_padded, 'Sum of Continuous Signals');

% ===========================
% Function Definitions
% ===========================

% Function to Plot Discrete Signals
function plotDiscreteSignal(time, signal, titleStr, axisLimits)
    stem(time, signal, 'filled', 'LineWidth', 1.2);
    title(titleStr);
    xlabel('Time Sample');
    ylabel('Amplitude');
    if nargin == 4
        axis(axisLimits);
    end
    grid on; % Optional: Add grid for better visualization
end

% Function to Plot Continuous Signals
function plotContinuousSignal(time, signal, titleStr)
    plot(time, signal, 'LineWidth', 1.5);
    title(titleStr);
    xlabel('Time');
    ylabel('Amplitude');
    grid on; % Optional: Add grid for better visualization
end
