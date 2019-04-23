function [attempts, successes, gross_preciz, gross_recall, confuz_mat] = data_analysis(fname)
[~,txt,~] = xlsread(fname);

% where the user was prommpted to perform the gesture
% gesture is tested 3 times
% user is given 5 attempts each time
% need to find # attempts per test
cover_mask = strcmp(txt(:,1),{'Cover'});
scratch_mask = strcmp(txt(:,1),{'Scratch'});
dbl_tap_mask = strcmp(txt(:,1),{'Double Tap'});
brushin_mask = strcmp(txt(:,1),{'Brush In'});
brushout_mask = strcmp(txt(:,1),{'Brush Out'});
ftouch_mask = strcmp(txt(:,1),{'Force Touch'});

gest_masks = [cover_mask dbl_tap_mask brushin_mask brushout_mask scratch_mask ftouch_mask];

% where the user executed the gesture
user_cover_mask = [strcmp(txt(:,2),{'Cover'})];
user_scratch_mask = [strcmp(txt(:,2),{'Scratch'})];
user_dbl_tap_mask = [strcmp(txt(:,2),{'Double Tap'})];
user_brushin_mask = [strcmp(txt(:,2),{'Brush In'})];
user_brushout_mask = [strcmp(txt(:,2),{'Brush Out'})];
user_ftouch_mask = [strcmp(txt(:,2),{'Force Touch'})];

user_gest_masks = [user_cover_mask user_dbl_tap_mask user_brushin_mask user_brushout_mask user_scratch_mask user_ftouch_mask];
order = {'Cover' 'Double Tap' 'Brush In' 'Brush Out' 'Scratch' 'Force Touch'};


% where the user got it right
matches_cover = user_cover_mask & cover_mask;
matches_scratch = user_scratch_mask & scratch_mask;
matches_dbl_tap = user_dbl_tap_mask & dbl_tap_mask;
matches_brushin = user_brushin_mask & brushin_mask;
matches_brushout = user_brushout_mask & brushout_mask;
matches_ftouch = user_ftouch_mask & ftouch_mask;

matches = [matches_cover matches_dbl_tap matches_brushin matches_brushout matches_scratch matches_ftouch];

attempts = [];
successes = [];
for i = [1:6]
    [atpts, sxs] = attempt_counter(gest_masks(:, i), user_gest_masks(:, i));
    attempts = [attempts atpts];
    successes = [successes sxs];
end

% gross matches/attempts
% PRECISION

% cover_preciz = 100* sum(matches_cover) / sum(cover_mask);
% scratch_preciz = 100* sum(matches_scratch) / sum(scratch_mask);
% dbl_tap_preciz = 100 * sum(matches_dbl_tap) / sum(dbl_tap_mask);
% brushin_preciz = 100 * sum(matches_brushin) / sum(brushin_mask);
% brushout_preciz = 100 * sum(matches_brushout) / sum(brushout_mask);
% ftouch_preciz = 100 * sum(matches_ftouch) / sum(ftouch_mask);
% gross_preciz = [cover_preciz; dbl_tap_preciz; brushin_preciz; brushout_preciz; scratch_preciz; ftouch_preciz];

% PRECISION # matches/ total identified gestures
gross_preciz = sum(matches)./sum(gest_masks);

% RECALL # of matches / # total gestures executed
gross_recall = sum(matches) ./ sum(user_gest_masks);

confuz_mat = confusion_matrix(gest_masks, user_gest_masks);

end