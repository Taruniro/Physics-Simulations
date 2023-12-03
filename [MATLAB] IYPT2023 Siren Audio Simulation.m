clear;clc;
r = 2;           % radius of siren holes = 2 mm
ro = 2;          % radius of orifice
h = 50;          % radius of concentric circle = 50 mm
n = 16;          % number of holes along concentric circle
l = 2*pi*h/n;    % distance between 2 consecutive siren holes
s_rpm = 1200;     % rotating speed of siren disc (rpm)
s_rps = 1200/60;  % rotating speed of siren disc (rps)
Fs = 44100;
dt = 1/Fs;
step = 2*pi*h*s_rps*dt;
dmax = 2*pi*h*100;
d = 0:step:dmax;
n = length(d);
a = zeros(n,1);
for i=1:n
    a(i) = area1(r,l,d(i));
end
plot(d,a)
axis([0 500 0 max(a)])

audiowrite('overlapped_area_800rpm_16_4mm_5cm.mp3',a/max(a),Fs);

t = 0:dt:(n-1)*dt;
plot(t,a/max(a));
axis([0 .1 0 1.5])
set(gca,'FontSize',20)
xlabel('Time (s)')
ylabel('Normalized Area')
