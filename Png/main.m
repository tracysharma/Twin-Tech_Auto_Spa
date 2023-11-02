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
            

            % Display the image using imshow 
            image2 = imread('C:\Users\aleis\Documents\MATLAB\Industrial Robotics\Png\Concrete.jpg'); 
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

            surf([-5, -5; -5, -5], ...
                [4, 4; -2.2, -2.2], ...
                [0,2; 0, 2], ...
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


             surf([4.01, 4.01; 4.01, 4.01], ...
                [-2, -1.1; -2, -1.1], ...
                [1.8,1.8; 1.3, 1.3], ...
                'CData', imread('Robotinuse.jpg'), ...
                'FaceColor', 'texturemap');

             surf([1.6, 0.7; 1.6, 0.7], ...
                [3.98, 3.98; 3.98, 3.98], ...
                [1.8,1.8; 1.3, 1.3], ...
                'CData', imread('Robotinuse - Copy.jpg'), ...
                'FaceColor', 'texturemap');

             surf([3.98, 3.98; 3.98, 3.98], ...
                [-2, -1.1; -2, -1.1], ...
                [1.8,1.8; 1.3, 1.3], ...
                'CData', imread('Robotinuse - Copy.jpg'), ...
                'FaceColor', 'texturemap');

             surf([3.98, 3.98; 3.98, 3.98], ...
                [-2, -1.1; -2, -1.1], ...
                [1.25,1.25; 0.85, 0.85], ...
                'CData', imread('SlipSign.jpg'), ...
                'FaceColor', 'texturemap');


             
           
            % Add the robot visualization
            obj.linearUR10Robot = LinearUR10();
            hold on;
            obj.linearUR10Robot.PlotAndColourRobot();
            % Calling out the UR3 file 
            %Call the function to add the first car to the background
            obj.addSecondCarToBackground(); % Call the function to add the second car to the background
            obj.addFirreExtinguishertoBackground();
            obj.addSecondFirreExtinguishertoBackground();
            obj.addEStopOne();
            obj.addEStopTwo();
            obj.addPersonInside();
            obj.addPersonOutside();
            obj.addBookcase();
            obj.addprinter();
        end


        function addBookcase()
            % Your provided code for Car_2 starts here
            Bookcase_1 = PlaceObject('bookcaseTwoShelves0.5x0.2x0.5m.ply',[-1.5,0.8,0]);
            verts = [get(Bookcase_1,'Vertices'), ones(size(get(Bookcase_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(Bookcase_1,'Vertices',verts(:,1:3));
            % Your provided code for Car_2 ends here
        end

        function addprinter()
            % Your provided code for Car_2 starts here
            printer_1 = PlaceObject('printer.ply',[3.8,-3.8,0.8]);
            verts = [get(printer_1,'Vertices'), ones(size(get(printer_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(printer_1,'Vertices',verts(:,1:3));
            % Your provided code for Car_2 ends here
        end     
      

        function addSecondCarToBackground()
            % Your provided code for Car_2 starts here
            Car_2 = PlaceObject('BigRedCar.ply',[-1.5,0.8,0]);
            verts = [get(Car_2,'Vertices'), ones(size(get(Car_2,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(Car_2,'Vertices',verts(:,1:3));
            % Your provided code for Car_2 ends here
        end

        function addFirreExtinguishertoBackground()
            % Your provided code for Car_2 starts here
            fireextinguisher_1 = PlaceObject('fireExtinguisherElevated.ply',[-3,-3.8,0.5]);
            verts = [get(fireextinguisher_1,'Vertices'), ones(size(get(fireextinguisher_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(fireextinguisher_1,'Vertices',verts(:,1:3));
            % Your provided code for Car_2 ends here
        end

        function addSecondFirreExtinguishertoBackground()
            % Your provided code for Car_2 starts here
            fireextinguisher_1 = PlaceObject('fireExtinguisherElevated.ply',[4,2,0.5]);
            verts = [get(fireextinguisher_1,'Vertices'), ones(size(get(fireextinguisher_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(fireextinguisher_1,'Vertices',verts(:,1:3));
            % Your provided code for Car_2 ends here
        end

        function addPersonOutside()
            % Your provided code for Car_2 starts here
            PersonOutside_1 = PlaceObject('personMaleCasual.ply',[-2.5,-3.4,0]);
            verts = [get(PersonOutside_1,'Vertices'), ones(size(get(PersonOutside_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(PersonOutside_1,'Vertices',verts(:,1:3));
            % Your provided code for Car_2 ends here
        end

        function addPersonInside()
            % Your provided code for Car_2 starts here
            PersonInside_1 = PlaceObject('personMaleCasual.ply',[-5,1,0]);
            verts = [get(PersonInside_1,'Vertices'), ones(size(get(PersonInside_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(PersonInside_1,'Vertices',verts(:,1:3));
            % Your provided code for Car_2 ends here
        end

        function addEStopOne()
            % Your provided code for Car_2 starts here
            EStopOne_1 = PlaceObject('emergencyStopWallMounted.ply',[-1,-3.9,1]);
            verts = [get(EStopOne_1,'Vertices'), ones(size(get(EStopOne_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 1.2;
            set(EStopOne_1,'Vertices',verts(:,1:3));
            % Your provided code for Car_2 ends here
        end

         function addEStopTwo()
            % Your provided code for Car_2 starts here
            EStopTwo_1 = PlaceObject('emergencyStopWallMounted.ply',[1.5,3.5,1]);
            verts = [get(EStopTwo_1,'Vertices'), ones(size(get(EStopTwo_1,'Vertices'),1),1)] * trotz(pi/2);
            verts(:,1) = verts(:,1) * 1.2;
            set(EStopTwo_1,'Vertices',verts(:,1:3));
            % Your provided code for Car_2 ends here
         end

         


    
    end
end