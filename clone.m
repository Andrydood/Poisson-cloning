function [ cloned_image ] = clone( destination_point_x, destination_point_y, mask, foreground ,background )

[ output_mask, output_image,laplacianImage  ] = makeMask( destination_point_x, destination_point_y, mask, foreground,background  );

cloned_image = seamlessClone(output_image, output_mask, laplacianImage);

end

