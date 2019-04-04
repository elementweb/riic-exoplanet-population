clear
close all

AU = 1.496e+8;
mu = 1.3272e+11; % mu Sun
time = datetime;
timemjd2000 = date2mjd2000([time.Year, time.Month, time.Day, time.Hour, time.Minute, time.Second]);
timemjd2000 = 0;
% timemjd2000 = date2mjd2000([2009, 1, 1.5, 0, 0, 0]);

% Using EphSS_kep first
% jupiter_eph = EphSS_car(5, timemjd2000);

% Jupiter
jupiter_kep = uplanet(timemjd2000, 3); % Jupiter
jupiter_car = kep2car(jupiter_kep, mu);

a = jupiter_kep(1) / AU;
e = jupiter_kep(2);
i = jupiter_kep(3);
Om = jupiter_kep(4);
om = wrapTo360(rad2deg(jupiter_kep(4)) + rad2deg(jupiter_kep(5)));
theta = rad2deg(jupiter_kep(6));

eccentric = 2 * atan(tan(jupiter_kep(6) / 2) * sqrt((1-e)/(1+e)));
mean = eccentric - e*sin(eccentric);

% % Hermes
% hermes_kep = ephNEO(timemjd2000, 16); % Hermes
% hermes_car = kep2car(hermes_kep, mu);
% 
% % Mars
% mars_kep = uplanet(timemjd2000, 4); % Mars
% mars_car = kep2car(mars_kep, mu);
% 
% % Saturn
% saturn_kep = uplanet(timemjd2000, 6); % Saturn
% saturn_car = kep2car(saturn_kep, mu);
% 
% % Neptune
% neptune_kep = uplanet(timemjd2000, 8); % Neptune
% neptune_car = kep2car(neptune_kep, mu);
% 
% % Pluto
% pluto_kep = uplanet(timemjd2000, 9); % Pluto
% pluto_car = kep2car(pluto_kep, mu);
% 
% % Uranus
% uranus_kep = uplanet(timemjd2000, 7); % Uranus
% uranus_car = kep2car(uranus_kep, mu);
% 
% export = [
%     jupiter_kep;
%     mars_kep;
%     saturn_kep;
%     neptune_kep;
%     pluto_kep;
%     uranus_kep;
% ];
% 
% % Convert all semi-major axes to AUs
% for i = 1:numel(export(:,1))
%     export(i,1) = export(i,1) / AU;
% end

% Compare
% r == jupiter_eph(1:3)














