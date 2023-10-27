classdef main 
    %Environment Class Function Called 
    %Linear ABB Function Called 
    %Linear UR10 Robot + Rail called 

         properties(Access = public)              
        plyFileNameStem = 'UR10Robot';
        linearUR10Robot;
         end

    methods(Static)
        %function e= Environment 
        

        function obj = main()
            obj.linearUR10Robot = LinearUR10();

            
            % Display the image using imshow 
            image = imread('C:\Users\Shrey\MATLAB Drive\41013_Industrial_Robotics_Spring_2023\LabAssignment2\Twin-Tech_Auto_Spa_Rev_1A\Twin-Tech_Auto_Spa-main\Hazard.jpg'); 
             % Create a figure for displaying the image
            figure;
            % Display the image as a background using surf
            surf([-6.8, -6.8; 6.8, 6.8], ...
                [-2.2, 2.2; -2.2, 2.2], ...
                [0.01, 0.01; 0.01, 0.01], ...
                'CData', image, ...
                'FaceColor', 'texturemap');

            % Set the aspect ratio of the image
            daspect([1, 1, 1]);

            % Add the robot visualization
            hold on;
            obj.linearUR10Robot.PlotAndColourRobot();
            % Calling out the UR3 file 
           
            function addCarToBackground()
            % Create and modify the Car_1 object as part of the background
            verts = [0, 0.8, -1; 0, 8.8, -1; 0, 8.8, 1; 0, 0.8, 1];
            patch(verts(:, 1), verts(:, 2), verts(:, 3), [1, 1, 1], 'FaceColor', 'g', 'EdgeColor', 'k');

        end
            

       
    end
    end
end 