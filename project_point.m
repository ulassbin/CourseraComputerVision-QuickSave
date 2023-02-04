function matrixz = project_point(p, f)
 u = 0;
 v = 0;
 project_matrix = [1 0 0   0; ...
                   0 1 0   0; ...
                   0 0 1/f 0 ];
 vect_world = [transpose(p);1];
 vect_image = project_matrix*vect_world;
 u = vect_image(1)/vect_image(3);
 v = vect_image(2)/vect_image(3);
 matrixz = [u, v];
end