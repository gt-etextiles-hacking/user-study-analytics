function [attempts, success] = attempt_counter(gest_mask, user_gest_mask)
% indices of each attempt
gest_idx_attempt = find(gest_mask);
gest_diff = diff(gest_idx_attempt);
%last_try = cover_idx_acover_diff < 0
idx = 1;
idx = [idx; find(gest_diff > 1)+1];
%cover_diff = [cover_idx_attempt(1); cover_idx_attempt([false; cover_diff > 1])]
try1 = gest_idx_attempt(idx(1):idx(2)-1);
try2 = gest_idx_attempt(idx(2):idx(3)-1);
try3 = gest_idx_attempt(idx(3):end);

attempts =[length(try1); length(try2); length(try3)];
last_try = [try1(end); try2(end); try3(end)];

% max_tries = attempts == 5;

success = user_gest_mask(last_try);

end