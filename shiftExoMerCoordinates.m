function ExoMerX = shiftExoMerCoordinates(ExoMerX, shift)

total = numel(ExoMerX);

for i = 1:total
    ExoMerX(i) = wrapTo360(ExoMerX(i) - shift);
end