function [stat_sig, mean_intuit, std_intuit, mean_tech_intuit, std_tech_intuit] = post_test_parser(fname)
    [num, ~, raw] = xlsread(fname);
    
    % delete first 4 records bc they are from aware home
    favs = raw(2+4:end, 10);
    %% Determine Favorite Gestures
    n = length(favs);
    favs = strrep(favs, 'Brush Up', 'Brush In');
    favs = strrep(favs, 'Brush Down', 'Brush Out');
    cat_favs = categorical(favs);
    pie(cat_favs)
    title(['Preferred Gestures (n = ' num2str(n) ')' ])
    hold off
%     cover_ct = sum(strcmp(favs, 'Cover'));
%     dbl_tap_ct = sum(strcmp(favs, 'Double Tap'));
%     brushin_ct = sum(strcmp(favs, 'Brush Up'));
%     brushout_ct = sum(strcmp(favs, 'Brush Down'));
%     scratch_ct = sum(strcmp(favs, 'Scratch'));
%     ftouch_ct = sum(strcmp(favs, 'Force Touch'));
    
    %raw = [raw(1,:); raw(6:end, :)];
    likert_data = [num(5:end, 1:7) num(5:end, end-2:end)];
    %all_data = [raw{2:end,3:end-1}];
 %% Determine Least Fave Gesture
 h8 = raw(2+4:end, 11);
 n = length(h8);
 h8 = strrep(h8, 'Brush Up', 'Brush In');
 favs = strrep(h8, 'Brush Down', 'Brush Out');
 cat_h8 = categorical(h8);
 
 pie(cat_h8)
 title(['Least Preferred Gestures (n = ' num2str(n) ')' ])
 hold off
%% Check for Significant Differences in Perceived Intuitiveness
    [a, b, stats] = friedman(likert_data(:,2:6))
    hold off
    stat_sig = multcompare(stats, 'estimate', 'friedman');
    hold off
    boxplot(likert_data(:,2:6), 'labels', {'ForceTouch', 'Cover', 'Double Tap', 'Scratch', 'Avg of All Gestures'});
    hold on
    title('Perceived Intuitiveness of Gesture')
    ylabel('Likert Rating (Out of 5)')
    hold off
%% Mean & Std of Perceived Intuitiveness    
    mean_likert = mean(likert_data);
    std_likert = std(likert_data);
    
   c = categorical({'ForceTouch', 'Cover', 'Double Tap', 'Scratch', 'Avg of All Gestures'});
   mean_intuit = mean_likert(2:6);
   std_intuit = std_likert(2:6);
   bar(c, mean_likert(2:6));
   title('Perceived Intuitiveness of Gestures')
   xlabel('Gestures')
   ylabel('Perceived Intuitiveness (Out of 5)')
   hold on
   er = errorbar(c, mean_likert(2:6),std_likert(2:6));
   er.Color= [0,0,0];
   er.LineStyle = 'none';
   hold off
%% Mean & Std of Other Metrics   
   c = categorical({'Intuitiveness of Tutorial', 'Intuitiveness of Jacket', 'Usefulness of Jacket Compared to Other Wearables', 'Likelihood of Buying Jacket', 'Likelihood of Recommending Jacket to Others'});
   
%    standard deviation =
% 
%     0.5623    0.7019    0.8314    1.2719    0.9275

% means =
% 
%     4.7647    4.3529    3.2353    2.6471    2.8824

   mean_tech_intuit = mean_likert([1, 7:10]);
   std_tech_intuit = std_likert([1, 7:10]);
   bar(c, mean_tech_intuit);
   title('Post-Test Perceptions')
   ylabel('Likert Rating (Out of 5)')
   hold on
   er = errorbar(c, mean_tech_intuit,std_tech_intuit);
   er.Color= [0,0,0];
   er.LineStyle = 'none';
   hold off
end