function [final_out] = rgbClone( destination_point_x, destination_point_y, mask, foreground ,background)
%Compute clone for all color channels

disp('Calculating channel: red');
r = clone( destination_point_x, destination_point_y, mask, foreground(:,:,1) ,background(:,:,1) );

disp('Calculating channel: green');
g = clone( destination_point_x, destination_point_y, mask, foreground(:,:,2) ,background(:,:,2) );

disp('Calculating channel: blue');
b = clone( destination_point_x, destination_point_y, mask, foreground(:,:,3) ,background(:,:,3) );

final_out=cat(3,r,g,b);

end

