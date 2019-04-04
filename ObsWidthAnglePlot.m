function ObsWidthAnglePlot(vert_angle, width_deg, time)

t = -vert_angle:1:vert_angle;
total = numel(t);

aries_ra = 0;
angle = TimeToRightAscension(aries_ra, time);
trailing_angle = boundaryAngle(angle, -width_deg/2);
leading_angle = boundaryAngle(angle, width_deg/2);

trailing = zeros(total, 3);
leading = zeros(total, 3);

% Mark Earth's position
[earth_x, earth_y, earth_z] = Ecl2Car([deg2rad(angle) deg2rad(0)], 0.3); % valid
plot3(earth_x, earth_y, earth_z, '-o', 'MarkerSize', 10, 'MarkerFaceColor', [0, 0, 1], 'Color', [0, 0, 1]); % blue

% Mark Moon's position (assume)
[moon_x, moon_y, moon_z] = Ecl2Car([deg2rad(wrapTo360(angle+15)) deg2rad(0)], 0.4); % valid
plot3(moon_x, moon_y, moon_z, '-o', 'MarkerSize', 6, 'MarkerFaceColor', [0.4, 0.4, 0.4], 'Color', [0.4, 0.4, 0.4]); % grey

% Mark Sun's direction vector (orange arrow)
sun_angle = wrapTo360(angle + 180);
[sun_x, sun_y, sun_z] = Ecl2Car([deg2rad(sun_angle) deg2rad(0)], 0.5); % valid
vector = quiver3(0, 0, 0, sun_x, sun_y, sun_z);
vector.Color = [1, 0, 0];
vector.LineWidth = 2;
plot3(sun_x, sun_y, sun_z, '-o', 'MarkerSize', 18, 'MarkerFaceColor', [0.9290, 0.6940, 0.1250], 'Color', [0.9290, 0.6940, 0.1250]); % blue

% Mark Center position
plot3(0, 0, 0, '-o', 'MarkerSize', 6, 'MarkerFaceColor', [0, 0, 0], 'Color', [0, 0, 0]); % white

for i = 1:total
    % Trailing edge
    [trailing_x, trailing_y, trailing_z] = Ecl2Car([deg2rad(trailing_angle) deg2rad(t(i))]);
    trailing(i, 1) = trailing_x;
    trailing(i, 2) = trailing_y;
    trailing(i, 3) = trailing_z;
    
    % Leading edge
    [leading_x, leading_y, leading_z] = Ecl2Car([deg2rad(leading_angle) deg2rad(t(i))]);
    leading(i, 1) = leading_x;
    leading(i, 2) = leading_y;
    leading(i, 3) = leading_z;
    
    if i == 1
        v1 = trailing(i, :);
        v2 = leading(i, :);
    end
    
    if i == total
        v3 = trailing(i, :);
        v4 = leading(i, :);
    end
end

% vertical lines
plot3(trailing(:, 1), trailing(:, 2), trailing(:, 3), 'LineWidth', 2, 'Color', 'black');
plot3(leading(:, 1), leading(:, 2), leading(:, 3), 'LineWidth', 2, 'Color', 'black');

% Plot observation lines from observer to the screen
v1 = [[0, 0, 0]; v1];
plot3(v1(:, 1), v1(:, 2), v1(:, 3), 'LineWidth', 1, 'Color', 'black');
v2 = [[0, 0, 0]; v2];
plot3(v2(:, 1), v2(:, 2), v2(:, 3), 'LineWidth', 1, 'Color', 'black');
v3 = [[0, 0, 0]; v3];
plot3(v3(:, 1), v3(:, 2), v3(:, 3), 'LineWidth', 1, 'Color', 'black');
v4 = [[0, 0, 0]; v4];
plot3(v4(:, 1), v4(:, 2), v4(:, 3), 'LineWidth', 1, 'Color', 'black');





