function disparity = match_strips(strip_left, strip_right, b)
    % For each non-overlapping patch/block of width b in the left strip,
    %   find the best matching position (along X-axis) in the right strip.
    % Return a vector of disparities (left X-position - right X-position).
    % Note: Only consider whole blocks that fit within image bounds.
    [strip_h, strip_w] = size(strip_right);
    disparity = []; % initialize
    count = 0;
    for iter = 1:b:strip_w-b
      count = count + 1;
      block = strip_left(:,iter:iter+b-1); % Gets the block to check on right.
      correspondence = find_best_match(block,strip_right);
      disparity(count) = (iter - correspondence);
    end
end