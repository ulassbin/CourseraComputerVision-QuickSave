% Find template 1D
% NOTE: Function definition must be the very first piece of code here!
function [index, val_set] = template_1d(t, s)
 index = 1;
  width = floor(length(t)/2);
  max = -999;
  val_set = zeros(size(s));
  t_mag = sqrt(t*transpose(t));
  for i=(1+width):(length(s)-width)
    patch = s(i-width:i+width);
    patch_mag = sqrt(patch*transpose(patch));
    val = t*transpose(patch)/(patch_mag*t_mag);
    val_set(i) = val;
    if(val > max)
      max = val;
      index = i;
    end
  end
end




%pkg load image; % AFTER function definition

% Test code: