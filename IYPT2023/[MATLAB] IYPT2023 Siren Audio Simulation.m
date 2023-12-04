clear;clc;              % Clear calculation
r = 2;                  % Radius of siren holes
ro = 2;                 % Radius of air jet orifice
h = 50;                 % Radius of concentric circle
nh = 16;                % Number of holes along concentric circle (equally distanced)
l = 2*pi*h/nh;          % Distance between 2 consecutive siren holes
s_rpm = 1200;           % Rotating speed of siren disc (rpm)
s_rps = 1200/60;        % Rotating speed of siren disc (rps)

Fs = 44100;             % Total time interval
dt = 1/Fs;              % Time step interval
step = 2*pi*h*s_rps*dt; % Spatial step interval
dmax = 2*pi*h*100;      % Maximum Distance
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
