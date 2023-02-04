

s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [1 1 0];
disp('Signal:'), disp([1:size(s, 2); s]);
disp('Template:'), disp([1:size(t, 2); t]);

[index, val_set] = template_1d(t, s);
val_set
disp('Index:'), disp(index);

subplot(3,1,1)
plot(val_set);
subplot(3,1,2)
plot(s);
subplot(3,1,3)
plot(t)
shading flat;