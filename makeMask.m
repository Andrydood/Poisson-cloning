function [ output_mask, output_image, laplacianImage ] = makeMask( destination_point_x, destination_point_y, mask, source,destination  )

[x_size, y_size] =size(destination);

%Find the smallest rectangle to contain the mask
top = size(mask,1);
bot = 0; 
left = size(mask,2);
right = 0; 

for x = 1:size(mask,1)
    
    for y = 1:size(mask,2)
        
        if(mask(x,y) == 1)
            %%2 padding in case the borders go to the edgem which would
            %%make it so that when the laplacian is being calculated, the
            %%border would be obvious
            if(x-2<top)
               top = x-2; 
            end
            if(x+2>bot)
               bot = x+2; 
            end
            
            if(y-2<left)
               left=y-2; 
            end
            if(y+2>right)
               right = y+2; 
            end
            
        end
        
    end
    
end

%cut the mask to the appropriate size
cut_mask = mask(top:bot,left:right);
cut_image=source(top:bot,left:right);
[source_mask_x, source_mask_y] = size(cut_mask);

%create a mask of the destination image with the source image pixels
output_mask = logical(zeros(x_size, y_size));

output_mask(destination_point_x:destination_point_x+source_mask_x-1 , ...
                 destination_point_y:destination_point_y+source_mask_y-1) = cut_mask;
             
             
%create an image of the destination with the source image pixels
output_image = destination;

for x = 1:source_mask_x
    
    for y = 1:source_mask_y
        
        if(cut_mask(x,y)==1)
            output_image(destination_point_x+x-1 ,destination_point_y+y-1) = cut_image(x,y);
        end
    
    end
    
end

laplacianImage = destination;

laplacianImage(destination_point_x:destination_point_x+source_mask_x-1 , ...
                 destination_point_y:destination_point_y+source_mask_y-1) = cut_image;

laplacianImage = laplacian(laplacianImage);  


end

