function [ output ] = padMask( foreground )
foreground = padarray(foreground,10,0,'both');
foreground = padarray(foreground',10,0,'both');
output = foreground';

end