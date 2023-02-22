function similarity = string_similarity(str1, str2, shingle_length)
    % Compute the similarity between two strings using shingles
    % Split the strings into shingles
    str1_shingles = strsplit(str1, shingle_length);
    str2_shingles = strsplit(str2, shingle_length);
    % Count the number of matching shingles
    num_matching_shingles = sum(ismember(str1_shingles, str2_shingles));
    % Compute the similarity as the number of matching shingles divided by the total number of shingles
    similarity = num_matching_shingles / (length(str1_shingles) + length(str2_shingles));
end
