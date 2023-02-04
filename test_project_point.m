% Project a point from 3D to 2D using a matrix operation


%% Test: Given point and focal length (units: mm)
p = [200 100 120];
f = 50;

disp(project_point(p, f));
