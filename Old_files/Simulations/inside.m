function output = inside(x,y,xtop,ytop,xbottom,ybottom)
% This function returns 1 if x,y is inside the region and 0 if not
[~,size_top] = size(xtop);
[~,size_bottom] = size(ybottom);

if ((x >= 0) && (y >= 0))     % Quadrant 1
    xline = linspace(0,max(xtop),size_top);
    if(x ~= 0)
        yline = y/x * xline;
    else
        yline = y/(x+0.00001) * xline;
    end
    abs_distance = (xtop - xline).^2 + (ytop - yline).^2;
    [~,loc] = min(abs_distance);
    X = xline(loc);
    Y = yline(loc);
    
    if ((x <= X) && (y <= Y))
        output = 1;
    else
        output = 0;
    end
    
elseif ((x <= 0) && (y >= 0)) % Quadrant 2
    xline = linspace(0,min(xtop),size_top);
    if(x ~= 0)
        yline = y/x * xline;
    else
        yline = y/(x+0.00001) * xline;
    end
    abs_distance = (xtop - xline).^2 + (ytop - yline).^2;
    [~,loc] = min(abs_distance);
    X = xline(loc);
    Y = yline(loc);
    
    if ((x >= X) && (y <= Y))
        output = 1;
    else
        output = 0;
    end
    

elseif ((x <= 0) && (y <= 0)) % Quadrant 3
    xline = linspace(0,min(xbottom),size_bottom);
    yline = y/x * xline;
    abs_distance = (xbottom - xline).^2 + (ybottom - yline).^2;
    [~,loc] = min(abs_distance);
    X = xline(loc);
    Y = yline(loc);
    
    if ((x >= X) && (y >= Y))
        output = 1;
    else
        output = 0;
    end

elseif ((x >= 0) && (y <= 0)) % Quadrant 4
    xline = linspace(0,max(xbottom),size_bottom);
    yline = y/x * xline;
    abs_distance = (xbottom - xline).^2 + (ybottom - yline).^2;
    [~,loc] = min(abs_distance);
    X = xline(loc);
    Y = yline(loc);
    
    if ((x <= X) && (y >= Y))
        output = 1;
    else
        output = 0;
    end
end

end