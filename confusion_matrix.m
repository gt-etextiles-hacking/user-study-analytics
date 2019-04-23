function inten_vs_pred = confusion_matrix(gest_masks, user_gest_masks)
        
    [~, gestures] = size(gest_masks);
    inten_vs_pred = zeros(gestures, gestures);
%     actno_vs_inten = zeros(gestures, gestures);
    for i = 1 : gestures
        for j = 1 : gestures      
            inten_vs_pred(i,:) = sum(gest_masks(:, i) & user_gest_masks);
        end
    end

end