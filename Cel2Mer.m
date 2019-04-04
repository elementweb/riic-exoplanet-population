%--------------------------------------------------------------------------
%
% Cel2Ecl: Transformation of celestial to mercator coordinates
%
% Input:
%   C         Celestial coordinates (RA, DEC)
%
% Output:   
%   mat       2-point coordinate matrix
%
% Last modified:   2019/02/11   K. Gliozeris
%
%--------------------------------------------------------------------------
function mat = Cel2Mer(C)

x = C(1); y = C(2); z = C(3);

xy = norm([x y]);
xz = norm([x z]);
yz = norm([y z]);

long = atan2d(x, y) + 360*(x < 0);
lat = acosd(xy / norm([xy z]));
if z < 0
  lat = lat * -1;
end

% 0deg < long < 360deg
% 0deg < lat < 90deg
mat = [long, lat];
