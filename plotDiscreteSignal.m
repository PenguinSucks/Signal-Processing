function plotDiscreteSignal(time, signal, titleStr, axisLimits)
    stem(time, signal, 'filled', 'LineWidth', 1.2);
    title(titleStr);
    xlabel('Time Sample');
    ylabel('Amplitude');
    if nargin == 4
        axis(axisLimits);
    end
    grid on; % Optional
end
