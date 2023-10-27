classdef main 
    %Environment Class Function Called 
    %Linear ABB Function Called 
    %Linear UR10 Robot + Rail called 

    properties(Access = public)              
        plyFileNameStem = 'UR10Robot';
        linearUR10Robot;
    end

    methods(Static)
        function obj = main()
            obj.linearUR10Robot = LinearUR10();

            % Display the image using imshow 
            image = imread('C:\Users\aleis\Documents\MATLAB\Industrial Robotics\Png\Concrete.jpg'); 
            % Create a figure for displaying the image
            figure;
            % Display the image as a background using surf
            surf([-5, -5; 5, 5], ...
                [-2.2, 3.5; -2.2, 3.5], ...
                [0, 0; 0, 0], ...
                'CData', image, ...
                'FaceColor', 'texturemap');

            % Set the aspect ratio of the image
            daspect([1, 1, 1]);

            % Add the robot visualization
            hold on;
            obj.linearUR10Robot.PlotAndColourRobot();
            % Calling out the UR3 file 
            obj.addCarToBackground(); % Call the function to add the first car to the background
            obj.addSecondCarToBackground(); % Call the function to add the second car to the background
        end
        
        function addCarToBackground()
            % Your provided code for Car_1 starts here
            Car_1 = PlaceObject('fenceAssemblyGreenRectangle4x8x2.5m.ply',[1.45,0,-1]);
            verts = [get(Car_1,'Vertices'), ones(size(get(Car_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 0.8;
            set(Car_1,'Vertices',verts(:,1:3));
            % Your provided code for Car_1 ends here
        end

        function addSecondCarToBackground()
            % Your provided code for Car_2 starts here
            Car_2 = PlaceObject('toyotaC.ply',[-0.5,-0.5,0.1]);
            verts = [get(Car_2,'Vertices'), ones(size(get(Car_2,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(Car_2,'Vertices',verts(:,1:3));
            % Your provided code for Car_2 ends here
        end
    end
end