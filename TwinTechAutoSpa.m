% Main script for TwinTech Auto Spa System
% Elisa Zarriello - 13895329 
% Tracy Sharma - 
% Aleisha Tran - 

% Description 
    % We are designing an automated car wash system designed for the 
    % convenience of your own garage. Our solution integrates cutting-edge 
    % technology, featuring an ABB-IRB-2600/12 robot mounted on a precision 
    % linear rail system to reach and meticulously wipe down your vehicle 
    % alongside an Universal UR10 Robot arm to rinse your car.

%% Clear all
    clear
    clf
    clc

%% Properties
    %IF NEEEDED - TBC
    %Set number of steps taken for trajectory 
        steps = 100;

%% Environment 
    hold on; 
    view(3)
    Environment.main; %load environment from class
    

    hold on;

% %% Call Robots to the environment 
%     rABB = LinearABB();
%     rUR10 = LinearUR10();
% 
%     hold on;

%% Body -> Functions to be run below 

%set initial joint angle positions
qABB = zeros(1,7);
qUR10 = zeros(1,7);
%Set end-effector positions 
endEffectorTrABB = rABB.model.ikcon(r.model.fkine(qABB));
endEffectorTrUR10 = rUR10.model.ikcon(r.model.fkine(qUR10));


%% 