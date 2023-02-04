function best_x = find_best_match(patch, strip)
    % TODO: Find patch in strip and return column index (x value) of topleft corner
    best_x = 1; % placeholder
    xIndex = 1;
    [t_h, t_w] = (size(patch));
    temp_mag = norm(patch);
    [im_h, im_w] = size(strip);
    max_val = -1; % Or inf...
    total_size = im_w-t_w;
    count = 0;
    patch = patch / temp_mag;
    down_sample = 5;
    for u=1:down_sample:(im_w-t_w) % Slide from initial index to final position.
        count = count +1;
        done = 100 * count/total_size;
        %msg = ['Total done:', num2str(done)];
        %disp(msg);
        patch_strip = strip(:, u:u+t_w-1);
        patch_strip_mag = norm(patch_strip);
        val_matrix = patch .* patch_strip;
        val = sum(val_matrix(:))/patch_strip_mag;
        if(val > max_val)
            best_x = u;
            max_val = val;
        end
    end
end