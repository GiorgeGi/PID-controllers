%{
This is a program for testing out PID algorithms
It works for MATLAB and Octave
It can generate graphs for the four common control systems: P, PI, PD and PID for measurements and analysis
The program is flexible and does not require changes in the code structure for repeated testing
%}



clear                       % Clear the workspace variables
clc                         % Clear the command window
close all                   % Close all open figure windows

% S = 1 / (s^2 + 3s + 1)
num = 1;                    % Define the numerator of the system transfer function
den = [1 3 1];              % Define the denominator of the system transfer function
S = tf(num, den);           % Create a transfer function object S using the numerator and denominator coefficients

H = 1;                      % Define the transfer function of the feedback path, which is simply 1

M = feedback(S, H);         % Create a closed-loop transfer function M by connecting the system S and the feedback path H

step(M, 'p--b');            % Plot the step response of the closed-loop system M using a dashed blue line

hold on;                    % Allow multiple plots on the same figure



choice = input("Choose P (1), PI (2), PD (3), or PID (4): ");
switch choice
  
  case 1
    
    Kp = input("Enter the value of the proportional gain Kp: ");
    
    % Create a PID controller object with the specified gain
    % GC = Kp + Ki*(1/s) + Kd*s
    GC = pid(Kp);   
    % Create a new closed-loop transfer function connecting the system GC*S and the feedback path H    
    MC = feedback(GC*S, H); 
    % Plot the step response
    step(MC, '*-.g');
    
    % Initiallize graph grid
    grid on;
    % Create a label to hold information
    legend({strcat("Open Loop"), strcat("Kp=", num2str(Kp))}, "location", "southeast");
    % By design legends are enclosed in a box, remove it
    legend boxoff;
    % Graph title
    title("Proportional Controller");
    
  case 2
  
    Kp = input("Enter the value of the proportional gain Kp: ");
    Ki = input("Enter the value of the integral gain Ki: ");
    
    GC = pid(Kp, Ki);
    MC = feedback(GC*S, H);
    step(MC, '*-.g');
    
    grid on;
    legend({strcat("Open Loop"), strcat("Kp=", num2str(Kp), ", Ki=", num2str(Ki))}, "location", "southeast");
    legend boxoff;
    title("Proportional Integral Controller");
    
  case 3
  
    Kp = input("Enter the value of the proportional gain Kp: ");
    Kd = input("Enter the value of the derivative gain Kd: ");
    
    GC = pid(Kp, Kd);
    MC = feedback(GC*S, H);
    step(MC, '*-.g');
    
    grid on;
    legend({strcat("Open Loop"), strcat("Kp=", num2str(Kp), ", Kd=", num2str(Kd))}, "location", "southeast");
    legend boxoff;
    title("Proportional Derivative Controller");
    
  case 4
  
    Kp = input("Enter the value of the proportional gain Kp: ");
    Ki = input("Enter the value of the integral gain Ki: ");
    Kd = input("Enter the value of the derivative gain Kd: ");
    
    GC = pid(Kp, Ki, Kd);
    MC = feedback(GC*S, H);
    step(MC, '*-.g');
    
    grid on;
    legend({strcat("Open Loop"), strcat("Kp=", num2str(Kp), ", Ki=", num2str(Ki), ", Kd=", num2str(Kd))}, "location", "southeast");
    legend boxoff;
    title("Proportional Integral Derivative Controller");
  
  otherwise
    
    fprintf("Choose 1, 2, 3, or 4\n")

end
