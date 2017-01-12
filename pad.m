function [ output ] = pad( foreground )
foreground = padarray(foreground,3,'symmetric','both');
foreground = padarray(foreground',3,'symmetric','both');
output = foreground';

end

