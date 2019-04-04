%--------------------------------------------------------------------------
%
% Cel2Ecl: Transformation of ecliptic to cartesian coordinates
%
% Input:
%   C         Celestial coordinates (RA, DEC) in radians
%   scale     Scale (Default = 1)
%
% Output:   
%   mat       3-point coordinate matrix
%
% Last modified:   2018/11/24   K. Gliozeris
%
%--------------------------------------------------------------------------
function [x, y, z] = Ecl2Car(C, scale)

if ~exist('scale', 'var')
  scale = ones(1,1);
end

[x, y, z] = sph2cart(C(1), C(2), scale);
