%% Secant_Method.m
%% James Yates - 14/07/2020
%% This is an example script showing the implementation of the secant method
clc; clear all; close all;

%% Inputs ----------------------------------------------------------------------
f = @(x) sin(x);
x_upper = 2*pi;
x_lower = 0;

%% Identifying Potential Roots -------------------------------------------------
% Test Inputs
x_test = linspace(1.1*x_lower,1.1*x_upper,100);
f_test = f(x_test);
% Potential Roots
x_0 = x_test(diff(sign(f_test))~=0);

%% First Order Approximation ---------------------------------------------------
dx = 1e-3;
df = @(x) (sin(x + dx) - sin(x - dx))/(2*dx);

%% Root Finding ----------------------------------------------------------------
ea = ones(size(x_0));                                                            % Initialising Error
while sum(ea > 1e-5) ~= 0
      x_i = x_0;                                                                 % Previous Guess
      x_0 = x_0 - f(x_0)./df(x_0);                                               % Next Guess
      ea = abs((x_i - x_0));                                                     % Approximate Error
endwhile
    
%% Plotting Results ------------------------------------------------------------
plot(x_test,f_test,x_0,f(x_0),'ro')
xlabel('\theta'), xlim([x_lower,x_upper])
ylabel('y')
xticks([0,pi/2,pi,3*pi/2,2*pi]), xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})
grid on
