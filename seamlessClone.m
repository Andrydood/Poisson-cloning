function [ out_image ] = seamlessClone( image,mask,laplacianImage )

[x_size, y_size] =size(image);

image = image-image.*(mask == 1);

out_image =image;

n = sum(sum(mask));

%%Construct the B matrix
% % Since its value needs to be the sum of the border pixels,  for each 
% % pixel in the patch just add its sorrounding 4 pixels, because if it's not a
% % border pixel value, it's 0, and so it doesn't change

B = zeros(n,1);
revIndex = zeros(x_size, y_size);

counter=1;



for x = 1:x_size
    
    for y = 1:y_size
    
        if(mask(x,y)==1)
        
            B(counter)= image(x+1,y)+...
                        image(x-1,y)+...
                        image(x,y+1)+...
                        image(x,y-1)-...
                        laplacianImage(x,y);
            
            %%Index is constructed so that individual patch pixels in the B vector can be 
            %%addressed in the future as their locations in the patch
            revIndex(x,y) = counter;
            
            counter=counter+1;        
        end
    end
  
end


%%A matrix is constructed

%%Firstly, it is an identity matrix with -4 on its diagonal

A = spdiags(ones(n,1)*(-4),0,n,n);

%%Go through every pixel
for x = 1:x_size
    
    for y = 1:y_size
        
        %%If pixel in patch is encountered, check if it has any adjacent
        %%pixels also in the patch
        
        %%If it does, mark them in matrix A as 1
        if(mask(x,y)==1)
            
            currentPixel = revIndex(x,y);
            
            if(mask(x+1,y) == 1)
                adjacentPixel = revIndex(x+1,y);
                A(currentPixel,adjacentPixel) = 1;
            end    
            if(mask(x-1,y) == 1)
                adjacentPixel = revIndex(x-1,y);
                A(currentPixel,adjacentPixel) = 1;
            
            end
            if(mask(x,y+1) == 1)
                adjacentPixel = revIndex(x,y+1);
                A(currentPixel,adjacentPixel) = 1;
            
            end
            if(mask(x,y-1) == 1)
                adjacentPixel = revIndex(x,y-1);
                A(currentPixel,adjacentPixel) = 1;
                
            end
          
        end
    end
  
end

%%Calculate the set of linear equations
X=A\B;
counter=1;

%%Reconstruct image by placing the calculated values in the original
for x = 1:x_size
    
    for y = 1:y_size
    
        if(mask(x,y)==1)
        
            out_image(x,y)= -X(counter);
            
            counter=counter+1;        
        end
    end
  
end


end

