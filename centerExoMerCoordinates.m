function ExoMerX = centerExoMerCoordinates(ExoMerX, shift)

total = numel(ExoMerX);

for i = 1:total
    ExoMerX(i) = wrapTo360(ExoMerX(i) + shift) - 180;
end