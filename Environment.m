classdef Environment 
    %Environment Class Function 

    methods(Static)
        function obj = main()
            
            % Display the image using imshow 
            image2 = imread('D:\MathWorks_Matlab\documents\A2\Environment\Concrete.jpg'); 
            % Create a figure for displaying the image
            figure;
            % Display the image as a background using surf
            surf([4, 4; 4, 4], ...
                [4, -2.2; 4, -2.2], ...
                [0, 0; 2, 2], ...
                'CData', image2, ...
                'FaceColor', 'texturemap');

            % Set the aspect ratio of the image
            daspect([1, 1, 1]);
            hold on;

            % Display the image as a background using surf
            surf([-5, -5; 4, 4], ...
                [-2.2, 4; -2.2, 4], ...
                [0, 0; 0, 0], ...
                'CData', image2, ...
                'FaceColor', 'texturemap');

            surf([-5, 4; -5, 4], ...
                [4, 4; 4, 4], ...
                [0, 0; 2, 2], ...
                'CData', image2, ...
                'FaceColor', 'texturemap');

            surf([3.9, 3.9; 3.9, 3.9], ...
                [3, -1; 3, -1], ...
                [0, 0; 1.8, 1.8], ...
                'CData', imread('ShutterDoor.jpg'), ...
                'FaceColor', 'texturemap');

            surf([4, 4; 9, 9], ...
                [4, -2.2; 4, -2.2], ...
                [0, 0; 0, 0], ...
                'CData', imread('Grass.jpg'), ...
                'FaceColor', 'texturemap');

             surf([4.1, 4.1; 4.1, 4.1], ...
                [3, -1; 3, -1], ...
                [0, 0; 1.8, 1.8], ...
                'CData', imread('ShutterDoor.jpg'), ...
                'FaceColor', 'texturemap');

             surf([4, 4; -4, -4], ...
                [2.5, -1; 2.5, -1], ...
                [0, 0; 0, 0], ...
                'CData', imread('Hazard.jpg'), ...
                'FaceColor', 'texturemap');

            % % Your provided code for Fence starts here
            % Fence = PlaceObject('fenceAssemblyGreenRectangle4x8x2.5m.ply',[1.45,0,-1]);
            % verts = [get(Fence,'Vertices'), ones(size(get(Fence,'Vertices'),1),1)] * trotz(pi);
            % verts(:,1) = verts(:,1) * 0.8;
            % set(Fence,'Vertices',verts(:,1:3));
            % % Your provided code for Fence ends here

            % Your provided code for Car starts here
            Car = PlaceObject('BigRedCar.ply',[-1.5,0.8,0]);
            verts = [get(Car,'Vertices'), ones(size(get(Car,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(Car,'Vertices',verts(:,1:3));
            % Your provided code for Car ends here

            % Your provided code for fireextinguisher_1 starts here
            fireextinguisher_1 = PlaceObject('fireExtinguisherElevated.ply',[-3,-3.8,0.5]);
            verts = [get(fireextinguisher_1,'Vertices'), ones(size(get(fireextinguisher_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(fireextinguisher_1,'Vertices',verts(:,1:3));
            % Your provided code for fireextinguisher_1 ends here

            % Your provided code for fireextinguisher_2 starts here
            fireextinguisher_2 = PlaceObject('fireExtinguisherElevated.ply',[4,2,0.5]);
            verts = [get(fireextinguisher_2,'Vertices'), ones(size(get(fireextinguisher_2,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(fireextinguisher_2,'Vertices',verts(:,1:3));
            % Your provided code for fireextinguisher_2 ends here

            % Your provided code for PersonOutside_1 starts here
            PersonInside_1 = PlaceObject('personMaleCasual.ply',[2.6,-2.7,0]);
            verts = [get(PersonInside_1,'Vertices'), ones(size(get(PersonInside_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(PersonInside_1,'Vertices',verts(:,1:3));
            % Your provided code for PersonOutside_1 ends here

            %Your provided code for PersonInside_1 starts here
            PersonOutside_1 = PlaceObject('personMaleCasual.ply',[-5,1,0]);
            verts = [get(PersonOutside_1,'Vertices'), ones(size(get(PersonOutside_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(PersonOutside_1,'Vertices',verts(:,1:3));
            %Your provided code for PersonInside_1 ends here

            % Your provided code for EStopOne_1 starts here
            EStopOne_1 = PlaceObject('emergencyStopWallMounted.ply',[-1,-3.9,1]);
            verts = [get(EStopOne_1,'Vertices'), ones(size(get(EStopOne_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(EStopOne_1,'Vertices',verts(:,1:3));
            % Your provided code for EStopOne_1 ends here

            % Your provided code for EStopTwo_1 starts here
            EStopTwo_1 = PlaceObject('emergencyStopWallMounted.ply',[1.5,3.5,1]);
            verts = [get(EStopTwo_1,'Vertices'), ones(size(get(EStopTwo_1,'Vertices'),1),1)] * trotz(pi/2);
            verts(:,1) = verts(:,1) * 1.2;
            set(EStopTwo_1,'Vertices',verts(:,1:3));
            % Your provided code for EStopTwo_1 ends here
        end
    end
end