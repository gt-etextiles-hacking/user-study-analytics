function precision_recall(in1, in2)

cols = length(in1);
idx = 1:6:cols;
idx2 = 2:6:cols;
idx3 = 3:6:cols;
idx4 = 4:6:cols;
idx5 = 5:6:cols;
idx6 = 6:6:cols;

idx_alt = idx(2:2:end);
idx = idx(1:2:end);

idx_alt2 = idx2(2:2:end);
idx2 = idx2(1:2:end);

idx_alt3 = idx3(2:2:end);
idx3 = idx3(1:2:end);

idx_alt4 = idx4(2:2:end);
idx4 = idx4(1:2:end);

idx_alt5 = idx5(2:2:end);
idx5 = idx5(1:2:end);

idx_alt6 = idx6(2:2:end);
idx6 = idx6(1:2:end);

% testA = attempts_mat(idx, :);
% testB = attempts_mat(idx2, :);

cover_re = [in1(idx); in1(idx_alt)];
dbl_tap_re = [in1(idx2); in1(idx_alt2)];
brushin_re = [in1(idx3); in1(idx_alt3)];
brushout_re = [in1(idx4); in1(idx_alt4)];
scratch_re = [in1(idx5); in1(idx_alt5)];
ftouch_re = [in1(idx6); in1(idx_alt6)];

cover_prec = [in2(idx); in2(idx_alt)];
dbl_tap_prec = [in2(idx2); in2(idx_alt2)];
brushin_prec = [in2(idx3); in2(idx_alt3)];
brushout_prec = [in2(idx4); in2(idx_alt4)];
scratch_prec = [in2(idx5); in2(idx_alt5)];
ftouch_prec = [in2(idx6); in2(idx_alt6)];

plot(cover_re, cover_prec, 'ko')
title('Cover Precision vs Recall')
xlim([0 1])
ylim([0 1])
xlabel('Recall')
ylabel('Precision')
hold off

plot(dbl_tap_re, dbl_tap_prec, 'ko')
title('Double Tap Precision vs Recall')
xlabel('Recall')
ylabel('Precision')
xlim([0 1])
ylim([0 1])
hold off

plot(brushin_re, brushin_prec, 'ko')
title('Brush In Precision vs Recall')
xlabel('Recall')
ylabel('Precision')
xlim([0 1])
ylim([0 1])
hold off

plot(brushout_re, brushout_prec, 'ko')
title('Brush Out Precision vs Recall')
xlabel('Recall')
ylabel('Precision')
xlim([0 1])
ylim([0 1])
hold off

plot(scratch_re, scratch_prec, 'ko')
title('Scratch Precision vs Recall')
xlabel('Recall')
ylabel('Precision')
xlim([0 1])
ylim([0 1])
hold off

plot(ftouch_re, ftouch_prec, 'ko')
title('ForceTouch Precision vs Recall')
xlabel('Recall')
ylabel('Precision')
xlim([0 1])
ylim([0 1])
hold off


end