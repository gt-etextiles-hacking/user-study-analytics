r_filename = 'data_R';
a_filename = 'data_';
r_filenames = [];
a_filenames = [];

% Initialize Struct Array
aggreg_data_struct = struct('TestID', '', 'TestNo', '', 'Filename', '', 'Tries_Per_Gest_Attempt', '', 'Success_Per_Gest_Attempt', '', 'Precision_Per_Gest', '', 'Recall_Per_Gest', '', 'Confuz_Mat', '');

% generate filenames
for i = 1:16
    testID = [r_filename, num2str(i)];
    files = [{[r_filename, num2str(i), '_', 'A.csv']}; {[r_filename, num2str(i), '_', 'B.csv']}];
    aggreg_data_struct(i).TestID = testID;

    r_filenames = [r_filenames; files];
end
% for i = 15:16
%     files = [{[a_filename, num2str(i), '_', 'A.csv']}; {[a_filename, num2str(i), '_', 'B.csv']}];
%     a_filenames = [a_filenames; files];
% end

all_files = [r_filenames; a_filenames];
%% Extract Metrics from Raw Data
for i = 1:length(all_files)
    fname = all_files{i,1};
    testNo = fname(end-4);
    testID = fname(1:end-6);

    aggreg_data_struct(i).TestID = testID;
    aggreg_data_struct(i).TestNo = testNo;
    aggreg_data_struct(i).Filename = fname;
    [attempts, successes, gross_preciz, gross_recall, confuz_mat] = data_analysis(fname);

    aggreg_data_struct(i).Tries_Per_Gest_Attempt = attempts;
    aggreg_data_struct(i).Success_Per_Gest_Attempt = successes;
    aggreg_data_struct(i).Precision_Per_Gest = gross_preciz;
    aggreg_data_struct(i).Recall_Per_Gest = gross_recall;
    aggreg_data_struct(i).Confuz_Mat = confuz_mat;
end
%% Learning Curves Per Gesture
attempts = [aggreg_data_struct.Tries_Per_Gest_Attempt];
[LC_means, LC_stds] =learningCurve(attempts);
%% Aggregate Confusion Matrix
conf_mats = [aggreg_data_struct.Confuz_Mat];
mass_mat = aggreg(conf_mats);
hold off
 heatmap({'Cover' 'Double Tap' 'Brush In' 'Brush Out' 'Scratch' 'Force Touch'}, {'Cover' 'Double Tap' 'Brush In' 'Brush Out' 'Scratch' 'Force Touch'}, mass_mat)
    title('Gesture Confusion Matrix')
    xlabel('Gesture Recognized')
    ylabel('Gesture Intended')
% Confusion matrix heatmap

% >> mass_mat
%
%     86     0     3     3     0    87
%      0    96     1     2     0     1
%      0     0    96     3     0     7
%      0     0     2    96     0     7
%      1     1     7    19    92    25
%     44     0     4     2     0    94
%% Recall & Precision Per Gesture
preciz = [aggreg_data_struct.Precision_Per_Gest];
recall = [aggreg_data_struct.Recall_Per_Gest];

precision_recall(recall, preciz);
ag_preciz = aggreg(preciz)/length(all_files);
ag_recall = aggreg(recall)/length(all_files);

% preciz =
%
%     0.6399    0.9719    0.9297    0.9328    0.7502    0.7501
% gross_recall =
%
%     0.6000    1.0000    1.0000    1.0000    1.0000    0.3750
%% Post-Test Analysis
[stat_sig, mean_intuit, std_intuit, mean_tech_intuit, std_tech_intuit] = post_test_parser('Post_Test_Data.csv');
%% Pre-Test Analysis
[males, fem, lefties, righties, mean_age, std_age] = pre_test_parser('Pre_Test_Data.csv');