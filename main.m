clear
close all

% Limits
obs_angle_deg = 50;
obs_width_deg = 50;
visual_mag_limit = 20;
time = datetime('27-Mar-2019 09:30:00');
% time = datetime('9-Jun-2019 18:45:00');
% time = datetime;

% data_known = readExoplanetCSV('data/exoplanets-Nov25.csv', 3, 4, 6);
% k2_candidates = readExoplanetCSV('data/exoplanets-Feb12-K2CandidatesAll.csv', 3, 4, 33);
% kepler_candidates = readExoplanetCSV('data/exoplanets-Feb12-KeplerObjectsOfInterest.csv', 45, 46, 47);
data_api = retrieveDataFromExoplanetArchiveAPI('table=exoplanets&select=ra,dec,st_optmag&where=st_optmag>0%20and%20pl_tranflag>0');

% What are we actually showing?
object = 'transiting exoplanets';

% Combine data (if there's any to combine)
data = vertcat(data_api);

% Filter out records by visual magnitude
data = filterByVMag(data, visual_mag_limit);

% Validate custom conversion functions (Equ2Ecl and Equ2Car) before continuing
validateCoordinateConversionFunctions();

% Get total number of planets
total = size(data, 1);

% Initiate arrays
ExoCartesian = zeros(total, 3);
ExoMercator = zeros(total, 2);

% Convert between coordinate systems
for i = 1:total
    ExoCartesian(i, 1:3) = Equ2Car(deg2rad(data(i, 1)), deg2rad(data(i, 2)));
    ExoMercator(i, 1:2) = Cel2Mer(ExoCartesian(i, 1:3));
end

%% Plot known exoplanets on ecliptic sphere
exosphere(ExoCartesian(:, 1), ExoCartesian(:, 2), ExoCartesian(:, 3), obs_angle_deg, obs_width_deg, time, ['Celestial coordinates of ', object]);

%% Plot known exoplanets on field-of-view (mercator projection)
mercator(ExoMercator(:, 1), ExoMercator(:, 2), ExoCartesian(:, 3), obs_angle_deg, obs_width_deg, time, ['L1 field of view of ', object]);

%% Plot distribution of visual magnitudes
visuals(data(:, 3), ['Visual magnitude distribution of ', object]);




