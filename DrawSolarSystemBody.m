function DrawSolarSystemBody(body, time, color)

uL1B = SolarSystemBody(body, time);

plot3(uL1B(1), uL1B(2), uL1B(3), 'o', 'MarkerSize', 10, 'MarkerFaceColor', color, 'Color', color);
