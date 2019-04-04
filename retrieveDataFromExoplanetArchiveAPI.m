function data = retrieveDataFromExoplanetArchiveAPI(params)

options = weboptions('ContentType', 'json');
response = webread(strcat('https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?format=json&', params), options, 'data', 'table');

length = numel(response);

for i = 1:length
    parse = struct2array(response(i));
    data(i, 1) = parse(1);
    data(i, 2) = parse(2);
    data(i, 3) = parse(3);
end
