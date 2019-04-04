%--------------------------------------------------------------------------
% 
%  Ast_Const
%  
%  Purpose:
%     Definition of astronomical and mathematical constants
% 
%--------------------------------------------------------------------------

pi        = 3.14159265358979324;
pi2       = 2*pi;
Rad       = pi/180;
Deg       = 180/pi;
Arcs      = 3600*180/pi;

R_Earth   =   6378.137;     % [km]
f_Earth   = 1/298.257223563; % Flattening; WGS-84
R_Sun     = 696000.0;       % [km]
R_Moon    =   1738.0;       % [km]

MJD_J2000 = 51544.5;        % MJD of Epoch J2000.0
T_J2000   =  0.0;           % Epoch J2000.0
T_B1950   = -0.500002108;   % Epoch B1950

kGauss    = 0.01720209895;  % gravitational constant
GM_Sun    = kGauss*kGauss;  % [AU^3/d^2]

AU        = 149597870.0;    % Astronomical unit [km]

c_light   = 173.14;         % speed of light [AU/d]

