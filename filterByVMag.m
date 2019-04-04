function matrix = filterByVMag(data, visual_mag)

total = size(data, 1);

matrix = [];

for i = 1:total
    if ~isnan(data(i,3)) && data(i,3) < visual_mag
        matrix = [matrix; data(i,1:3)];
    end
end
