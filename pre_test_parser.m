function [males, fem, lefties, righties, mean_age, std_age] = pre_test_parser(fname)
[num, txt, raw] = xlsread(fname);
num = num(5:end-2,end);
txt = [txt(1,:); txt(6:end-2,:)];
%raw = [raw(1,:); raw(6:end-2,:)];
mean_age = mean(num);
std_age = std(num);

fem = sum(strcmp(txt, 'Female'));
males = sum(strcmp(txt, 'Male'));

lefties = sum(strcmp(txt, 'Left'));
righties = sum(strcmp(txt, 'Right'));


end