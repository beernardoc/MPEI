function shingles = strsplit(str, shingle_length)
    % Split a string into overlapping shingles
    shingles = cell(1, length(str) - shingle_length + 1);
    for i = 1:length(shingles)
        shingles{i} = str(i:i+shingle_length-1);
    end
end