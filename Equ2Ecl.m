function [lambda,beta] = Equ2Ecl(alpha,delta)
% EQUAT2ECLIP - Convert from equatorial to ecliptic celestial coordinates.
%   [lambda,beta] = Equ2Ecl(alpha,delta) returns the longitudinal and
%   latitudinal coordinates in the ecliptic coordinate system corresponding
%   to coordinates of right ascension and declination (alpha and delta) in
%   the equatorial coordinate system.
% 
%   All inputs and outputs are in units of raidans.  lambda will be in the
%   range of [-pi, pi] while beta will be in the range [-pi/2, pi/2]. Inputs
%   must be vectors of equal size;
% 
%   Example:
%       [lambda,beta] = Equ2Ecl([-0.2700;-0.6132],[0.0492;0.0512]);
 
%   Written by Dmitry Savransky, 3 March 2009
%error checking
if nargin ~= 2
    error('You must input both Declination and Right Ascension.');
end
delta = delta(:);
alpha = alpha(:);
if length(delta) ~= length(alpha)
    error('Inputs must be the same length.');
end
%define Earth's axial tilt
epsilon = (23 + 26/60 + 21.448/3600)*pi/180; %radians
%calculate trigonometric combinations of coordinates
sb = sin(delta)*cos(epsilon) - cos(delta)*sin(epsilon).*sin(alpha);
cbcl = cos(delta).*cos(alpha);
cbsl = sin(delta)*sin(epsilon) + cos(delta)*cos(epsilon).*sin(alpha);
%calculate coordinates
lambda = atan2(cbsl,cbcl);
r = sqrt(cbsl.^2 + cbcl.^2);
beta = atan2(sb,r);
r2 = sqrt(sb.^2+r.^2);
%sanity check: r2 should be 1
if sum(abs(r2 - 1)) > 1e-12
    warning('equat2eclip:radiusError',...
        'Latitude conversion radius is not uniformly 1. ');
end