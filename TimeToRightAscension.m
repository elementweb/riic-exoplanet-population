function ra = TimeToRightAscension(reference, time)

vernal_equinox = posixtime(datetime('20-Mar-2019 21:58:00'));

year = 365.24225 * 24 * 3600;
current = posixtime(time);

% how many seconds will pass since the new year before first vernal equinox
% occurs?
vernal_sec_past_new_year = mod(vernal_equinox, year);

current = current - vernal_sec_past_new_year;

% how many seconds have passed since new year?
sec_past_new_year = mod(current, year);

% fraction of a year have passed
fraction = sec_past_new_year / year;

% angle in degrees (right ascension)
ra = wrapTo360(fraction*360 + 180 + reference);
