function disp_map = getDisparityAll(image_left, image_right, b)
    % For each non-overlapping patch/block of width b in the left strip,
    %   find the best matching position (along X-axis) in the right strip.
    % Return a vector of disparities (left X-position - right X-position).
    % Note: Only consider whole blocks that fit within image bounds.
    disp_map = zeros(size(image_left));
    [image_h, strip_w] = size(image_left);
    disp_map = zeros(size(image_left));
    xcount = 0;
    ycount = 0;
    for y_iter = 1:b:image_h-b
      ycount = ycount+1;
      % Extract strip from left image
      strip_left = image_left(y_iter:(y_iter + b - 1), :);
      % Extract strip from right image
      strip_right = image_right(y_iter:(y_iter + b - 1), :);
      xcount = 0;
      percent_done = (100*y_iter/image_h);
      disp("Percent done: " + percent_done)
      for iter = 1:b:strip_w-b
        xcount = xcount+1;
        block = strip_left(:,iter:iter+b-1); % Gets the block to check on right.
        correspondence = find_best_match(block,strip_right);
        disp_map(y_iter:y_iter+b-1, iter:iter+b-1) = (iter - correspondence);
      end
    end
end