function visuals(MagVisual, plot_title)

subplot(2, 2, 3);
h = histogram(MagVisual);
h.FaceColor = [0.4940, 0.1840, 0.5560]	;
title(plot_title);
xlabel('Visual magnitude');
ylabel('Candidate count');
grid on

