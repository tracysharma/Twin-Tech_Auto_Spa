% Main script for TwinTech Auto Spa System
% Elisa Zarriello - 13895329 
% Tracy Sharma - 13888223
% Aleisha Tran - 14244103

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
    %IF NEEDED - TBC
    %Set number of steps taken for trajectory 
        steps = 100;

%% Environment 
    hold on; 
    view(3)
    set(0,'DefaultFigureWindowStyle','docked')
    Environment.main; %load environment from class
    
    hold on;

%% Call Robots to the environment 
    rABB = LinearABB(transl(1.0,1.75,0));
    rUR10 = LinearUR10(transl(-3,1.75,0)*trotz(pi));

    hold on;

%% Body -> Functions to be run below 

%set initial joint angle positions
qABB = zeros(1,7);
qUR10 = zeros(1,8);


%inverse kinematics with optimisation of joint angles 
        q1 = rUR10.model.ikcon(rUR10.model.fkine(qUR10));   
        q2 = rUR10.model.ikcon(transl(-2,1.5,2));
        q3 = rUR10.model.ikcon(transl(-2,1.6,1.5));
        q4 = rUR10.model.ikcon(transl(-2,1.7,2));
        q5 = rUR10.model.ikcon(transl(-3,1.8,1.5));
        q6 = rUR10.model.ikcon(transl(-3,1.9,2));
        q7 = rUR10.model.ikcon(transl(-3.1,2,1.5));
        q8 = rUR10.model.ikcon(transl(-3.2,2,1.5));
        q9 = rUR10.model.ikcon(transl(-3.3,2,1.5));
        q10 = rUR10.model.ikcon(transl(-3.3,2,1.5));


        qPath1 = jtraj(q1,q2,steps);
        qPath2 = jtraj(q2,q3,steps);
        qPath3 = jtraj(q3,q4,steps);
        qPath4 = jtraj(q4,q5,steps);
        qPath5 = jtraj(q5,q6,steps);
        qPath6 = jtraj(q6,q7,steps);
        qPath7 = jtraj(q7,q8,steps);
        qPath8 = jtraj(q8,q9,steps);
        qPath9 = jtraj(q9,q10,steps);

        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory 
            rUR10.model.animate(qPath1(i, :));
            drawnow();
        end
        for i = 1:steps
        %Animate LinearUR3 to run qMatrix trajectory 
        rUR10.model.animate(qPath2(i, :));
        drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
            rUR10.model.animate(qPath3(i, :));
            drawnow();
        end

        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
            rUR10.model.animate(qPath4(i, :));
            drawnow();
        end
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
%% Line Plane Intersection : Collision detection 
% Set up the figure
figure;

% Set the camera view
view(3); % 3D view

% Add lighting for better visibility
light('Position', [0 1 0]); % Adjust the light position as needed

% Define the car's surface as a plane
carPlaneNormal = [0, 1, 0]; % Normal vector of the car's surface (assumed to be vertical)
carPlanePoint = [0, 0, 0];  % A point on the car's surface (assumed at the origin)

% Define the robot arm's line segment (start and end points)
robotLineStart = [1.0, 1.75, 0];
%[2, 1.75, 0];  % Starting position of the robot arm
robotLineEnd = [1.7, 1.75, 0];
% [2.2, 1.75, 0];  % Endpoint of the robot arm

% Calculate the direction vector of the robot arm's line
robotLineDirection = robotLineEnd - robotLineStart;

% Calculate the parameter t for the intersection point between the line and the plane
t = dot(carPlaneNormal, carPlanePoint - robotLineStart) / dot(carPlaneNormal, robotLineDirection);

% Check if the intersection point is within the bounds of the line segment
if t >= 0 && t <= 1
    
    % Calculate the intersection point
    intersectionPoint = robotLineStart + t * robotLineDirection;

    % Check if the intersection point is on the car's surface (within a tolerance)
    tolerance = 0.01; % Adjust the tolerance as needed
    isCollision = norm(intersectionPoint - carPlanePoint) < tolerance;

    % Create a surface object (plane) and color it based on collision
    vertices = [0, 0, 0; 0, 0, 1; 0, 1, 1; 0, 1, 0]; % Define vertices for the plane
    faces = [1, 2, 3, 4]; % Define faces for the plane

    if isCollision
        planeColor = 'red'; % Color for collision
    else
        planeColor = 'green'; % Color for no collision
    end
        planeSurface = patch('Vertices', vertices, 'Faces', faces, 'FaceColor', planeColor);

    if isCollision
        disp('Collision detected! Stop the robot to prevent damage to the car.');
        % Implement actions to stop the robot or trigger safety measures.
    else
        disp('No collision. The robot can continue wiping the car.');
        % Continue the robot's motion along the rail.
    end
else
        disp('No collision within the line segment.');
end




