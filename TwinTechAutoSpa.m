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
    set(0,'DefaultFigureWindowStyle','docked')
    Environment.main; %load environment from class
    
    hold on;

%% Call Robots to the environment 
    rABB = LinearABB(transl(2,1.75,0));
    rUR10 = LinearUR10(transl(-3,1.75,0)*trotz(pi));

    hold on;

%% Body -> Functions to be run below 

%set initial joint angle positions
qABB = zeros(1,7);
qUR10 = zeros(1,8);


%inverse kinematics with optimisation of joint angles 
        q1 = rABB.model.ikcon(rABB.model.fkine(qABB));   
        q2 = rABB.model.ikcon(transl(-2,1.5,2)*rpy2tr(-180, 90, -90, 'deg'));
        q3 = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        % q4 = rABB.model.ikcon(transl(-2,1.7,2)*rpy2tr(-180, 90, -90, 'deg'));
        % q5 = rUR10.model.ikcon(transl(-3,1.8,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        % q6 = rUR10.model.ikcon(transl(-3,1.9,2)*rpy2tr(-180, 90, -90, 'deg'));
        % q7 = rUR10.model.ikcon(transl(-3.1,2,1.5));
        % q8 = rUR10.model.ikcon(transl(-3.2,2,1.5));
        % q9 = rUR10.model.ikcon(transl(-3.3,2,1.5));
        % q10 = rUR10.model.ikcon(transl(-3.3,2,1.5));


        qPath1 = jtraj(q1,q2,steps);
        qPath2 = jtraj(q2,q3,steps);
        % qPath3 = jtraj(q3,q4,steps);
        % qPath4 = jtraj(q4,q5,steps);
        % qPath5 = jtraj(q5,q6,steps);
        % qPath6 = jtraj(q6,q7,steps);
        % qPath7 = jtraj(q7,q8,steps);
        % qPath8 = jtraj(q8,q9,steps);
        % qPath9 = jtraj(q9,q10,steps);

        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory 
            rABB.model.animate(qPath1(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory 
            rABB.model.animate(qPath2(i, :));
            drawnow();
        end
        % for i = 1:steps
        %     %Animate LinearUR3 to run qMatrix trajectory
        %     rUR10.model.animate(qPath3(i, :));
        %     drawnow();
        % end

        % for i = 1:steps
        %     %Animate LinearUR3 to run qMatrix trajectory
        %     rUR10.model.animate(qPath4(i, :));
        %     drawnow();
        % end
        % for i = 1:steps
        %     %Animate LinearUR3 to run qMatrix trajectory
        %     rUR10.model.animate(qPath5(i, :));
        %     drawnow();
        % end
        % for i = 1:steps
        %     %Animate LinearUR3 to run qMatrix trajectory
        %     rUR10.model.animate(qPath6(i, :));
        %     drawnow();
        % end
        % for i = 1:steps
        %     %Animate LinearUR3 to run qMatrix trajectory
        %     rUR10.model.animate(qPath7(i, :));
        %     drawnow();
        % end
        % for i = 1:steps
        %     %Animate LinearUR3 to run qMatrix trajectory
        %     rUR10.model.animate(qPath8(i, :));
        %     drawnow();
        % end
        %         for i = 1:steps
        %     %Animate LinearUR3 to run qMatrix trajectory
        %     rUR10.model.animate(qPath9(i, :));
        %     drawnow();
        % end
%% 