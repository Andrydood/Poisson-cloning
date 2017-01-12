function [ output ] = pad( foreground )
foreground = padarray(foreground,10,'symmetric','both');
foreground = padarray(foreground',10,'symmetric','both');
output = foreground';

end

