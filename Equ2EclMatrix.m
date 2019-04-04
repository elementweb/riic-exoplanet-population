%--------------------------------------------------------------------------
%
% Equ2EclMatrix: Transformation of equatorial to ecliptical coordinates
%
% Input:
%   T         Time in Julian centuries since J2000
%
% Output:   
%   mat       Transformation matrix
%
% Last modified:   2015/08/12   M. Mahooti
%
%--------------------------------------------------------------------------
function mat = Equ2EclMatrix (T)

Ast_Const

eps = ( 23.43929111-(46.8150+(0.00059-0.001813*T)*T)*T/3600 )*Rad;
mat = R_x(eps);

