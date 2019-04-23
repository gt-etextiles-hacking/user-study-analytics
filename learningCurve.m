function [mean_attempts, std_devs] = learningCurve(attempts_mat)
[~, cols] = size(attempts_mat);
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

cover = [attempts_mat(:,idx); attempts_mat(:,idx_alt)];
dbl_tap = [attempts_mat(:,idx2); attempts_mat(:,idx_alt2)];
brushin = [attempts_mat(:,idx3); attempts_mat(:,idx_alt3)];
brushout = [attempts_mat(:,idx4); attempts_mat(:,idx_alt4)];
scratch = [attempts_mat(:,idx5); attempts_mat(:,idx_alt5)];
ftouch = [attempts_mat(:,idx6); attempts_mat(:,idx_alt6)];

mean_attempts = [mean(cover,2) mean(dbl_tap,2) mean(brushin,2) mean(brushout,2) mean(scratch,2) mean(ftouch,2)];
std_devs = [std(cover,0, 2) std(dbl_tap,0,2) std(brushin,0,2) std(brushout,0,2) std(scratch,0,2) std(ftouch,0,2)];

num_trials = 1:6;

hold on
ylim([0 5])
xlim([1 6])
xlabel('Trial Number')
ylabel('Number of Attempts')
title('Learning Curve for Cover Over Tests A & B')
errorbar(num_trials, mean_attempts(:,1), std_devs(:,1), 'kx-', 'LineWidth', 1);
%legend('Cover', 'Double Tap', 'Brush In', 'Brush Out', 'Scratch', 'ForceTouch')
hold off

errorbar(num_trials, mean_attempts(:,2), std_devs(:,2), 'kx-', 'LineWidth', 1);
title('Learning Curve for Double Tap Over Tests A & B')
ylim([0 5])
xlim([1 6])
xlabel('Trial Number')
ylabel('Number of Attempts')
hold off

errorbar(num_trials, mean_attempts(:,3), std_devs(:,3), 'kx-', 'LineWidth', 1);
title('Learning Curve for Brush In Over Tests A & B')
ylim([0 5])
xlim([1 6])
xlabel('Trial Number')
ylabel('Number of Attempts')
hold off

errorbar(num_trials, mean_attempts(:,4), std_devs(:,4), 'kx-', 'LineWidth', 1);
title('Learning Curve for Brush Out Over Tests A & B')
ylim([0 5])
xlim([1 6])
xlabel('Trial Number')
ylabel('Number of Attempts')
hold off

errorbar(num_trials, mean_attempts(:,5), std_devs(:,5), 'kx-', 'LineWidth', 1);
title('Learning Curve for Scratch Over Tests A & B')
ylim([0 5])
xlim([1 6])
xlabel('Trial Number')
ylabel('Number of Attempts')
hold off

errorbar(num_trials, mean_attempts(:,6), std_devs(:,6), 'kx-', 'LineWidth', 1);
title('Learning Curve for ForceTouch Over Tests A & B')
ylim([0 5])
xlim([1 6])
xlabel('Trial Number')
ylabel('Number of Attempts')
hold off
%legend('Cover', 'Double Tap', 'Brush In', 'Brush Out', 'Scratch', 'ForceTouch')

end