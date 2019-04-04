function uL1B = SolarSystemBody(body, time)

timemjd2000 = date2mjd2000([time.Year, time.Month, time.Day, time.Hour, time.Minute, time.Second]);

SE = EphSS_car(3, timemjd2000);
SB = EphSS_car(body, timemjd2000);

mass_sun = 1.989e+30;
mass_earth = 5.974e+24;

mSE = norm(SE);

mEL1 = mSE * nthroot(mass_earth / (3 * mass_sun), 3);

SL1 = SE * ((mSE - mEL1) / mSE);
L1B = SB - SL1;

uL1B = L1B / norm(L1B);

if(body == 5)
    uL1B
end
