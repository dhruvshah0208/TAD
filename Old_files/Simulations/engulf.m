function output = engulf(xe,ye,xtop,ytop,xbottom,ybottom)
% Output will be 1 if all the points are inside DRS
    [~,size_xe] = size(xe);
    for i = 1:size_xe
        x = xe(i);
        y = ye(i);
        if(inside(x,y,xtop,ytop,xbottom,ybottom) == 0)
            output = 0;
            break
        end
        output = 1;
    end
end
