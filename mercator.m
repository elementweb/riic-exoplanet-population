function mercator(ExoMerX, ExoMerY, ExoCartZ, obs_angle, obs_width_deg, time, plot_title)

planets = numel(ExoMerX);

margin = 10;
half_margin = margin / 2;
half_angle = obs_angle / 2;

subplot(2, 2, 2);
scatter(ExoMerX, ExoMerY, 2, 'MarkerEdgeColor', [0, 0.4470, 0.7410], 'MarkerFaceColor', [0, 0.4470, 0.7410]);
hold on

% add field of view box
line([0 360], [-90 -90], 'Color', [0.65, 0.65, 0.65], 'LineStyle', ':', 'LineWidth', 2);
line([0 360], [90 90], 'Color', [0.65, 0.65, 0.65], 'LineStyle', ':', 'LineWidth', 2);
line([0 0], [-90 90], 'Color', [0.65, 0.65, 0.65], 'LineStyle', ':', 'LineWidth', 2);
line([360 360], [-90 90], 'Color', [0.65, 0.65, 0.65], 'LineStyle', ':', 'LineWidth', 2);

% add lines of observable region
line([0-half_margin 360+half_margin], [-half_angle -half_angle], 'Color', [1, 0, 0], 'LineStyle', '--', 'LineWidth', 1);
line([0-half_margin 360+half_margin], [half_angle half_angle], 'Color', [1, 0, 0], 'LineStyle', '--', 'LineWidth', 1);
line([0-half_margin 360+half_margin], [0 0], 'Color', [0, 0, 0], 'LineStyle', '--', 'LineWidth', 1);

% how many exoplanets within obs_angle?
percentage = ScopeAnglePercentage(ExoCartZ, obs_angle);
% text(200, 75, {['~', num2str(round(percentage, 1)), '% of transiting exoplanets'], ['are within ', num2str(obs_angle), '° angle of observation']});

% distribution of exoplanets in declination obs. angle
step = 2;
emphasis = 30;
alpha = -90:step:90;
vertical = 1:numel(alpha);
for i = 1:numel(alpha)
    vertical(i) = ScopeAngleCount(ExoMerY, alpha(i), alpha(i)+step) * (100/planets) * emphasis + 370;
end
line([370 370], [-90 90], 'LineWidth', 1.5, 'Color', [0.65, 0.65, 0.65]);
plot(vertical, alpha, 'LineWidth', 1.5, 'Color', [0.4940, 0.1840, 0.5560]);

hold on

% distribution of exoplanets in right ascension obs. angle
step = 2;
emphasis = 60;
beta = 0:step:360;
horizontal = 1:numel(beta);
for i = 1:numel(beta)
    horizontal(i) = ScopeAngleCount(ExoMerX, beta(i), beta(i)+step) * (100/planets) * emphasis + 100;
end
line([0 360], [100 100], 'LineWidth', 1.5, 'Color', [0.65, 0.65, 0.65]);
plot(beta, horizontal, 'LineWidth', 1.5, 'Color', [0.9290, 0.6940, 0.1250]);
hold on

% distribution of exoplanets in right ascension obs. angle of observable region
step = 2;
emphasis = 60;
beta = 0:step:360;
horizontal = 1:numel(beta);
for i = 1:numel(beta)
    horizontal(i) = ScopeAngleCountXY(ExoMerX, ExoMerY, beta(i), beta(i)+step, -half_angle, half_angle) * (100/planets) * emphasis + 100;
end
plot(beta, horizontal, 'LineWidth', 1.5, 'Color', [0.6350, 0.0780, 0.1840]);

% Draw first point of Aries pointing & line (first point of Aries = Earth?Sun?Aries in one line)
[aries_ra, aries_dec] = Equ2Ecl(deg2rad(0), deg2rad(0));
[aries_x, aries_y, aries_z] = Ecl2Car([aries_ra, aries_dec]);
aries = Cel2Mer([aries_x, aries_y, aries_z]);
plot(aries(1), aries(2), '-o', 'MarkerSize', 10, 'MarkerEdgeColor', [0.6, 0, 1]);
line([aries(1) aries(1)], [-90 90], 'Color', [0.65, 0.65, 0.65], 'LineStyle', ':', 'LineWidth', 1);

% Draw observation box
angle = TimeToRightAscension(aries(1), time);
observation = wrapTo360(180 - angle);
trailing = boundaryAngle(observation, -obs_width_deg/2);
leading = boundaryAngle(observation, obs_width_deg/2);
line([trailing trailing], [-half_angle half_angle], 'Color', [0.9290, 0.6940, 0.1250], 'LineStyle', ':', 'LineWidth', 2);
line([leading leading], [-half_angle half_angle], 'Color', [0.9290, 0.6940, 0.1250], 'LineStyle', ':', 'LineWidth', 2);
plot(observation, 0, '-x', 'MarkerSize', 10, 'MarkerEdgeColor', 'black');
if (trailing < observation && observation < leading)
    rectangle('Position', [trailing -half_angle obs_width_deg obs_angle]);
elseif (trailing > leading)
    rectangle('Position', [0 -half_angle leading obs_angle]);
    rectangle('Position', [trailing -half_angle 360-trailing obs_angle]);
end

% Omega Piscium (Nearby First Point of Aries)
[omega_ra, omega_dec] = Equ2Ecl(deg2rad(359.8279), deg2rad(6.8633));
[omega_x, omega_y, omega_z] = Ecl2Car([omega_ra, omega_dec]);
omega = Cel2Mer([omega_x, omega_y, omega_z]);
plot(omega(1), omega(2), '-o', 'MarkerSize', 10, 'MarkerEdgeColor', 'black');

% Alpha Piscium (Moving from Aries towards Alpha Piscium in around April 20)
[alpha_ra, alpha_dec] = Equ2Ecl(deg2rad(30.5117), deg2rad(2.7638));
[alpha_x, alpha_y, alpha_z] = Ecl2Car([alpha_ra, alpha_dec]);
alpha = Cel2Mer([alpha_x, alpha_y, alpha_z]);
plot(alpha(1), alpha(2), '-o', 'MarkerSize', 10, 'MarkerEdgeColor', 'green');

% Deneb star marker
[deneb_ra, deneb_dec] = Equ2Ecl(deg2rad(310.3583), deg2rad(45.2803));
[deneb_x, deneb_y, deneb_z] = Ecl2Car([deneb_ra, deneb_dec]);
deneb = Cel2Mer([deneb_x, deneb_y, deneb_z]);
plot(deneb(1), deneb(2), '-x', 'MarkerSize', 14, 'MarkerEdgeColor', 'blue');

% Jupiter's position
jupiter = SolarSystemBody(5, time);
jupiter = Cel2Mer([jupiter(1), jupiter(2), jupiter(3)]);
plot(jupiter(1), jupiter(2), 'd', 'MarkerSize', 14, 'MarkerEdgeColor', [0.6350, 0.0780, 0.1840]);

% plot properties
title(plot_title);
xlabel('Ecliptical longitude (°)');
ylabel('Ecliptical latitude (°)');
axis([0-margin 360+margin+80 -90-margin 90+margin+50]);

hold off

% Plot zoomed-in view
subplot(2, 2, 4);
ExoMerXCenter = centerExoMerCoordinates(ExoMerX, angle);
scatter(ExoMerXCenter, ExoMerY, 3, 'MarkerEdgeColor', [1, 0, 0], 'MarkerFaceColor', [1, 0, 0]);
title(join(['Transiting exoplanets in FOV on', string(time)]));
xlabel('Ecliptical longitude (°)');
ylabel('Ecliptical latitude (°)');
hold on

% Draw observation box
x1 = -25;
x2 = 25;
y1 = -obs_angle/2;
y2 = obs_angle/2;
axis([x1-10 x2+10 y1-10 y2+10]);
rectangle('Position', [x1 y1 x2-x1 y2-y1]);
line([0 0], [y1 y2], 'Color', [0.4, 0.4, 0.4], 'LineStyle', '--', 'LineWidth', 1);
line([x1 x2], [0 0], 'Color', [0.4, 0.4, 0.4], 'LineStyle', '--', 'LineWidth', 1);

% How much does the angle shift in one day / week?
delta_angle_day = 360 / 365.24225;
delta_angle_week = 7 * delta_angle_day;
plot([0 delta_angle_week], [y2+5 y2+5], 'LineWidth', 2);
text(8, y2+5, {['1 week (~', num2str(round(delta_angle_week, 2)), '°)']});

