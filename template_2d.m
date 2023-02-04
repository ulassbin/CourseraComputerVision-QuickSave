% Find template 2D
% NOTE: Function definition must be the very first piece of code here!
function [yIndex, xIndex, match_scores] = template_2d(template, img)
    % TODO: Find template in img and return [y x] location
    % NOTE: Turn off all output from inside the function before submitting!
    % Assuming width = height
    xIndex = 1;
    yIndex = 1;
    [t_h, t_w] = (size(template));
    %temp_pow = template .*template;
    temp_mag = norm(template);%sqrt(sum(temp_pow(:)));
    [im_h, im_w] = size(img);
    match_scores = zeros(length(1:(im_h-t_h)),length(1:(im_w-t_w)));
    max_val = -1; % Or inf...
    % Notation is
    % Im(x,y)
    % Im(im_w, im_h)
    total_size = im_w*im_h;
    count = 0;
    template = template / temp_mag;
    for u=1:(im_h-t_h)
        for v=1:(im_w-t_w)
            count = count +1;
            done = 100 * count/total_size;
            msg = ['Total done:', num2str(done)];
            disp(msg);
            patch = img(u:u+t_h-1,v:v+t_w-1); % Hacking indexes here..
            %patch_pow = patch.*patch;
            patch_mag = norm(patch); %sqrt(sum(patch_pow(:)));
            %disp("size patch")
            %size(patch)
            %disp("size template");
            %size(template)
            val_matrix = template .* patch;
            val = sum(val_matrix(:))/patch_mag;
            if(val > max_val)
                xIndex = u;
                yIndex = v;
                max_val = val;
            end
            match_scores(u,v) = val;
        end
    end
end