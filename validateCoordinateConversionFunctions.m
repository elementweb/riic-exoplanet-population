function validateCoordinateConversionFunctions()

% Before we proceed with coordinate system conversions, we need to validate
% functions that we are going to use. We know that Sun's axial tilt is 7.25
% degrees and it's rotation axis is pointing towards NGC 6552 (on Earth's
% equatorial system this is at RA 286.13 and DEC 63.87)
ngc6552 = Equ2Car(deg2rad(286.13), deg2rad(63.87));
% Now we know that our celestial sphere's Z-axis is pointing towards [0 0
% 1] in cartesian system:
celestialTop = [0 0 1];
% Having cartesian coordinates for NGC 6552 we can
% compute angle between those two vectors. The resulting angle should be
% equal to Sun's axial tilt:
tilt = atan2d(norm(cross(ngc6552, celestialTop)), dot(ngc6552, celestialTop));

% If resulting tilt angle is equal to 7.25 then continue script execution,
% otherwise - stop and show error message
if round(tilt, 2) == 7.25
    disp('Coordinate system check: pass');
else
    error('Coordinate system check: fail');
end