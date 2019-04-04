%--------------------------------------------------------------------------
%
% Cel2Ecl: Transformation of celestial to ecliptical coordinates
%
% Input:
%   T         Time in Julian centuries since J2000
%   C         Celestial coordinates (RA, DEC)
%
% Output:   
%   mat       3-point coordinate matrix
%
% Last modified:   2018/11/24   K. Gliozeris
%
%--------------------------------------------------------------------------
function mat = Cel2Ecl(T, C)

Ast_Const

[ex, ey, ez] = sph2cart(C(1)*pi/180, C(2)*pi/180, ones(1,1));

eps = (23.43929111-(46.8150+(0.00059-0.001813*T)*T)*T/3600 ) * Rad;
conv = R_x(eps);

mat = [ex, ey, ez] * conv;
