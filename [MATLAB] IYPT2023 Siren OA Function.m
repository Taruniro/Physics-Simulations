% This function returns the sum of
% the overlapped area  of circle C1 and circle C2
% and the overlapped area  of circle C1 and circle C3.
% The distance between the centers of C1 and C2 is d.
% The distance between the centers of C2 and C2 is l.
% The radius of C1, C2, C3 is r.
function a = area1(r,l,d)
n = ceil(d/l)+1;
% n = 10;
a = 0;
for i=1:n
    c = (i-1)*l;
    x = abs(d-c);
    if x < 2*r
        theta = 2*acos(0.5*x/r);
        a = a + r^2*(theta-sin(theta));
    end
end
