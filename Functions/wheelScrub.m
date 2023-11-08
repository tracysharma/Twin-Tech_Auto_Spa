function wheelScrub(rABB, qABB, rUR10, qUR10, steps)

%inverse kinematics with optimisation of joint angles 
        q1a = rUR10.model.getpos;   
        q2a = rUR10.model.ikcon(transl(-2.2,1.05,0.5)*trotx(pi/2));
        q3a = rUR10.model.ikcon(transl(-2,1.05,0.6)*trotx(pi/2));
        q4a = rUR10.model.ikcon(transl(-2.2,1.05,0.5)*trotx(pi/2));
        q5a = rUR10.model.ikcon(transl(-2.5,1.05,0.3)*trotx(pi/2));
        q6a = rUR10.model.ikcon(transl(-2,1.05,0.5)*trotx(pi/2));
        q7a = rUR10.model.ikcon(transl(-2.2,1.05,0.6)*trotx(pi/2));
        q8a = rUR10.model.ikcon(transl(-2,1.05,0.5)*trotx(pi/2));
        q9a = rUR10.model.ikcon(transl(-2.2,1.05,0.5)*trotx(pi/2));
        q10a = rUR10.model.ikcon(transl(-2,2,1)*trotx(pi/2));

    %Set up path trajectories
            qPath1a = jtraj(q1a,q2a,steps);
            qPath2a = jtraj(q2a,q3a,steps);
            qPath3a = jtraj(q3a,q4a,steps);
            qPath4a = jtraj(q4a,q5a,steps);
            qPath5a = jtraj(q5a,q6a,steps);
            qPath6a = jtraj(q6a,q7a,steps);
            qPath7a = jtraj(q7a,q8a,steps);
            qPath8a = jtraj(q8a,q9a,steps);
            qPath9a = jtraj(q9a,q10a,steps);

%Set up inverse kinematics with optimisation of joint angles for UR10
        q1b = rABB.model.getpos;   
        q2b = rABB.model.ikcon(rABB.model.fkine(qABB));

 %Set up path trajectories
            qPath1b = jtraj(q1b,q2b,steps);


%Run animations
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory 
            rUR10.model.animate(qPath1a(i, :));
            rABB.model.animate(qPath1b(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory 
            rUR10.model.animate(qPath2a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
            rUR10.model.animate(qPath3a(i, :));
            drawnow();
        end

        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
            rUR10.model.animate(qPath4a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
            rUR10.model.animate(qPath5a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
            rUR10.model.animate(qPath6a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
            rUR10.model.animate(qPath7a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
            rUR10.model.animate(qPath8a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
            rUR10.model.animate(qPath9a(i, :));
            drawnow();
        end
        %for i = 1:steps
        %     %Animate LinearUR3 to run qMatrix trajectory
        %     rUR10.model.animate(qPath10a(i, :));
        %     drawnow();
        %end

end

% function collision(robotLineStart, robotLineEnd)
% %% Define the car's surface as a plane
%         carPlaneNormal = [0, 1, 0]; % Normal vector of the car's surface (assumed to be vertical)
%         carPlanePoint = [0, 0, 0];  % A point on the car's surface (assumed at the origin)
% 
%         % Define the robot arm's line segment (start and end points)
%         %robotLineStart = [1.0, 1.75, 0];
%         %[2, 1.75, 0];  % Starting position of the robot arm
%         %robotLineEnd = [1.7, 1.75, 0];
%         % [2.2, 1.75, 0];  % Endpoint of the robot arm
% 
%         % Calculate the direction vector of the robot arm's line
%         robotLineDirection = robotLineEnd - robotLineStart;
% 
%         % Calculate the parameter t for the intersection point between the line and the plane
%         t = dot(carPlaneNormal, carPlanePoint - robotLineStart) / dot(carPlaneNormal, robotLineDirection);
% 
%         % Check if the intersection point is within the bounds of the line segment
%         if t >= 0 && t <= 1
% 
%             % Calculate the intersection point
%             intersectionPoint = robotLineStart + t * robotLineDirection;
% 
%             % Check if the intersection point is on the car's surface (within a tolerance)
%             tolerance = 0.01; % Adjust the tolerance as needed
%             isCollision = norm(intersectionPoint - carPlanePoint) < tolerance;
% 
%             % Create a surface object (plane) and color it based on collision
%             vertices = [0, 0, 0; 0, 0, 1; 0, 1, 1; 0, 1, 0]; % Define vertices for the plane
%             faces = [1, 2, 3, 4]; % Define faces for the plane
% 
%             if isCollision
%                 planeColor = 'red'; % Color for collision
%             else
%                 planeColor = 'green'; % Color for no collision
%             end
%                 planeSurface = patch('Vertices', vertices, 'Faces', faces, 'FaceColor', planeColor);
% 
%             if isCollision
%                 disp('Collision detected! Stop the robot to prevent damage to the car.');
%                 % Implement actions to stop the robot or trigger safety measures.
%             else
%                 disp('No collision. The robot can continue wiping the car.');
%                 % Continue the robot's motion along the rail.
%             end
%         else
%                 disp('No collision within the line segment.');
%         end
% 
% end
