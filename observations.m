function observations(ExoZ, plot_title)

alpha = 0:10:180;
percentages = 1:numel(alpha);

for i = 1:numel(alpha)
    percentages(i) = ScopeAnglePercentage(ExoZ, alpha(i));
end

subplot(2, 2, 4);
p = plot(alpha, percentages);
p.LineWidth = 2;
p.Color = [0.4940, 0.1840, 0.5560];
title(plot_title);
xlabel('angle of observation (°)');
ylabel('exoplanets in view (%)');
grid on

line([50 50], [0 100], 'Color', [0.65, 0.65, 0.65], 'LineStyle', ':', 'LineWidth', 2);

