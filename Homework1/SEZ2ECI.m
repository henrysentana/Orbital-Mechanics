function  [r0,v0] = SEZ2ECI(r1,v1,rho,lambda,t) 
% Compute the position and velocity vectors (r0,v0) in ECI basis provided 
% the position and velocity vectors in SEZ basis, the radius (rho), the 
% latitude (lambda) of the observer from the center of the Earth, and the 
% the time since the observer crossed the Oxz plane.
%     Inputs: 
%         r1: position vector in SEZ basis [km] 
%         v1: velocity vector in SEZ basis [km]
%         rho: radius (in this case, radius f the Earth) [km]
%         lambda: latitude of the observer [rad]
%         t: time since the observer crossed the Oxz plane [s]
%     Outputs: 
%         r0: position vector in ECI basis [km]
%         v0: velocity vector in ECI basis [km]

% Compute the longitude of the observer considering the rotation of the
% Earth and the time passed from the Oxz plane 
global theta_dot 
theta = theta_dot*t;   % Longitude [rad]

% Rotation matrix from S0 to S1
A_0_1 = [sin(lambda)*cos(theta), sin(lambda)*sin(theta), -cos(lambda); 
             -sin(theta),       cos(theta),         0; 
         cos(lambda)*cos(theta), cos(lambda)*cos(theta), sin(lambda)];

% Rotation matrix from S1 to S0 
A_1_0 = transpose(A_0_1); 

% Compute r0 in SEZ basis and transform it into the ECI basis
r0 = [0,0,rho] + r1;
r0 = A_1_0*r0; 
error('Not completed yet')

