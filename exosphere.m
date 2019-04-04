function exosphere(ExoX, ExoY, ExoZ, obs_angle, obs_width_deg, time, plot_title)

% Get Sphere Coordinates
[X,Y,Z] = sphere;

figure(1)
subplot(2, 2, 1);
hm = mesh(X,Y,Z);
hold on

plot3(ExoX, ExoY, ExoZ, '*', 'MarkerSize', 2, 'MarkerFaceColor', [1, 0, 0], 'Color', [1, 0, 0])
% title([plot_title, ' (', num2str(obs_angle), '°)']);
axis([-4 4 -4 4 -4 4])
axis vis3d

% Sagittarius marker
sagittarius = Equ2Car(deg2rad(266.4167), deg2rad(-29.0078)); % valid
plot3(sagittarius(1), sagittarius(2), sagittarius(3), 'bp', 'MarkerSize', 10, 'MarkerFaceColor', [0, 0, 1], 'Color', [0, 0, 1]); % blue

% Deneb star marker
deneb = Equ2Car(deg2rad(310.3583), deg2rad(45.2803)); % valid
plot3(deneb(1), deneb(2), deneb(3), 'bp', 'MarkerSize', 10, 'MarkerFaceColor', [1, 0.8, 0], 'Color', [1, 0.8, 0]); % yellow

% Sun equator North pole pointing
sunpole = Equ2Car(deg2rad(286.13), deg2rad(63.87)); % valid
plot3(sunpole(1), sunpole(2), sunpole(3), 'bp', 'MarkerSize', 10, 'MarkerFaceColor', [0.8, 0.6, 0], 'Color', [0.8, 0.6, 0]); % gold

% North Ecliptic Pole marger
pole = Equ2Car(deg2rad(270), deg2rad(66.5607)); % valid
plot3(pole(1), pole(2), pole(3), 'bp', 'MarkerSize', 15, 'MarkerFaceColor', [1, 0.7, 1], 'Color', [1, 0.7, 1]); % purple

% First point of Aries (Earth-Sun-Aries are all in line)
aries = Equ2Car(deg2rad(0), deg2rad(0)); % valid
plot3(aries(1), aries(2), aries(3), 'bp', 'MarkerSize', 10, 'MarkerFaceColor', [0.6, 0, 1], 'Color', [0.6, 0, 1]); % pink

% Omega Piscium (Nearby First Point of Aries)
omega = Equ2Car(deg2rad(359.8279), deg2rad(6.8633)); % valid
plot3(omega(1), omega(2), omega(3), 'bp', 'MarkerSize', 10, 'MarkerFaceColor', [0, 0, 0], 'Color', [0, 0, 0]); % black

% Alpha Piscium (Moving from Aries towards Alpha Piscium in around April 20)
alpha = Equ2Car(deg2rad(30.5117), deg2rad(2.7638)); % valid
plot3(alpha(1), alpha(2), alpha(3), 'bp', 'MarkerSize', 10, 'MarkerFaceColor', [0, 1, 0], 'Color', [0, 1, 0]); % green

% Draw angle of observation cone
ObsConeAnglePlot(obs_angle / 2);

% Draw observable width angle taking time of observation into account
ObsWidthAnglePlot(obs_angle / 2, obs_width_deg, time);

% Draw Jupiter position from L1 perspective
DrawSolarSystemBody(5, time, [0.8510, 0.3294, 0.1020]);
% Draw Saturn position from L1 perspective
DrawSolarSystemBody(6, time, [0.0745, 0.6235, 1.0000]);
% Draw Mars position from L1 perspective
DrawSolarSystemBody(4, time, [0.9294, 0.6902, 0.1294]);

hold off
set(hm, 'EdgeColor', 'k', 'FaceAlpha', 0.5)
view(157, 17)
daspect([0.8 0.8 0.8])
zoom(1, 8)
grid off
axis off

ax = gca;
ax.Clipping = 'off';