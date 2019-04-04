function count = ScopeAngleCount(ExoMerY, from_angle, to_angle)

count = 0;

for i = 1:numel(ExoMerY)
    if from_angle < ExoMerY(i) && ExoMerY(i) < to_angle
        count = count + 1;
    end
end
