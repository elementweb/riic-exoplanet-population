function cartesian = Equ2Car(ra, dec)

[ra, dec] = Equ2Ecl(ra, dec);

[cx, cy, cz] = sph2cart(ra, dec, ones(1,1));

cartesian = [cx, cy, cz];


    
    