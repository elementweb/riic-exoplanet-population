function data = readExoplanetCSV(filename, RA, DEC, VMag)

CSV = readtable(filename);

data = [CSV(:, RA) CSV(:, DEC) CSV(:, VMag)];
data = data{:, :};
