function percentage = ScopeAnglePercentage(ExoZ, angle)

max_z = sin((angle/2)*pi/180);
max_z_count = 0;

for i = 1:numel(ExoZ)
    if abs(ExoZ(i)) < max_z
        max_z_count = max_z_count + 1;
    end
end

percentage = (max_z_count / numel(ExoZ)) * 100;
