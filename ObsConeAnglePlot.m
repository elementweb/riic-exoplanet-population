%--------------------------------------------------------------------------
%
% ObsConeAnglePlot: Draw obervation angle on spherical plot
%
% Input:
%   angle          Observation angle
%   size           Cone size
%   radius         Cone radius
%
% Last modified:   2018/11/24   K. Gliozeris
%
%--------------------------------------------------------------------------
function ObsConeAnglePlot(angle)

% Upper line
longitude = 0:1:360;
total = numel(longitude);

upper = zeros(total, 3);
lower = zeros(total, 3);

for i = 1:total
    % Upper
    [upper_x, upper_y, upper_z] = Ecl2Car([deg2rad(longitude(i)) deg2rad(angle)]);
    upper(i, 1) = upper_x;
    upper(i, 2) = upper_y;
    upper(i, 3) = upper_z;
    
    % Lower
    [lower_x, lower_y, lower_z] = Ecl2Car([deg2rad(longitude(i)) deg2rad(-angle)]);
    lower(i, 1) = lower_x;
    lower(i, 2) = lower_y;
    lower(i, 3) = lower_z;
end

plot3(upper(:, 1), upper(:, 2), upper(:, 3), 'Color', [0, 0, 1], 'LineStyle', '--', 'LineWidth', 1);
plot3(lower(:, 1), lower(:, 2), lower(:, 3), 'Color', [0, 0, 1], 'LineStyle', '--', 'LineWidth', 1);
