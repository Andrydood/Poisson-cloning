function [ output ] = laplacian( image )

[x_size, y_size] = size(image);

padSize= 1;

paddedImage = padarray(image, padSize, 'symmetric', 'both');
paddedImage = padarray(paddedImage', padSize, 'symmetric', 'both');
paddedImage=paddedImage';

k = [0 1 0;
     1 -4 1; 
     0 1 0];
 
output = zeros(x_size,y_size);

for x = 1+padSize:x_size+padSize
    
    for y = 1+padSize:y_size+padSize
        
        output(x-padSize,y-padSize) = sum(sum( k .* paddedImage(x-1:x+1,y-1:y+1)));
        
    end
    
end

end

