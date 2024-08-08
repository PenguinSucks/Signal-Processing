function plotContinuousSignal(time, signal, titleStr)
    plot(time, signal, 'LineWidth', 1.5);
    title(titleStr);
    xlabel('Time');
    ylabel('Amplitude');
    grid on; % Optional: Add grid for better visualization
end
