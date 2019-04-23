function out = aggreg(mat)

[~, cols] = size(mat);

idx1 = 1:6:cols;
idx2 = 2:6:cols;
idx3 = 3:6:cols;
idx4 = 4:6:cols;
idx5 = 5:6:cols;
idx6 = 6:6:cols;

sum1 = sum(mat(:,idx1), 2);
sum2 = sum(mat(:,idx2), 2);
sum3 = sum(mat(:,idx3), 2);
sum4 = sum(mat(:,idx4), 2);
sum5 = sum(mat(:,idx5), 2);
sum6 = sum(mat(:,idx6), 2);

out = [sum1 sum2 sum3 sum4 sum5 sum6];
end