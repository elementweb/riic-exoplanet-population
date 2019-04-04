function count = ScopeAngleCountXY(ExoMerX, ExoMerY, from_angle_x, to_angle_x, from_angle_y, to_angle_y)

count = 0;

for i = 1:numel(ExoMerX)
    if (from_angle_x < ExoMerX(i) && ExoMerX(i) < to_angle_x) && (from_angle_y < ExoMerY(i) && ExoMerY(i) < to_angle_y)
        count = count + 1;
    end
end
