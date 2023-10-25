classdef VisualizationClass

    properties(Access = public)              
        plyFileNameStem = 'Hazard.jpg';
         end


    methods(Static)
        function visualize()
            % Visualization method to create the 3D environment and objects

            x = [-10.8 10.8 10.8 -10.8];
            y = [6 6 6 6];
            z = [0 0 6 6];

            figure()
            patch(x, y, z, [1 1 1], 'FaceColor', '#a1a19f', 'EdgeColor', '#666663', 'LineWidth', 2)
            view(3)
            xlabel('x')
            ylabel('y')
            zlabel('z')
            grid on
            axis equal
            xlim([-6 6])
            ylim([-6 6])
            zlim([-1 6])

            hold on;

            surf([-6.8, -6.8; 6.8, 6.8], ...
                [-2.2, 2.2; -2.2, 2.2], ...
                [0.01, 0.01; 0.01, 0.01], ...
                'CData', imread('Hazard.jpg'), ...
                'FaceColor', 'texturemap');

            % Objects
            Car_1 = VisualizationClass.PlaceObject('fenceAssemblyGreenRectangle4x8x2.5m.ply', [0, 0.8, -1]);
            verts = [get(Car_1, 'Vertices'), ones(size(get(Car_1, 'Vertices'), 1), 1)] * trotz(pi);
            verts(:, 1) = verts(:, 1) * 1.2;
            set(Car_1, 'Vertices', verts(:, 1:3));

            fireextinguisher_1 = VisualizationClass.PlaceObject('fireExtinguisher.ply', [-4.5, -5.8, 0]);
            verts = [get(fireextinguisher_1, 'Vertices'), ones(size(get(fireextinguisher_1, 'Vertices'), 1), 1)] * trotz(pi * 2);
            verts(:, 1) = verts(:, 1) * 1.2;
            set(fireextinguisher_1, 'Vertices', verts(:, 1:3));

            fireextinguisher_2 = VisualizationClass.PlaceObject('fireExtinguisher.ply', [-2.5, 5.8, 0]);
            verts = [get(fireextinguisher_2, 'Vertices'), ones(size(get(fireextinguisher_2, 'Vertices'), 1), 1)] * trotz(pi/4);
            verts(:, 1) = verts(:, 1) * 1.2;
            set(fireextinguisher_2, 'Vertices', verts(:, 1:3));

            Car_2 = VisualizationClass.PlaceObject('toyotaC.ply', [-0.5, 0, 0.1]);
            verts = [get(Car_2, 'Vertices'), ones(size(get(Car_2, 'Vertices'), 1), 1)] * trotz(pi);
            verts(:, 1) = verts(:, 1) * 1.2;
            set(Car_2, 'Vertices', verts(:, 1:3));

            hold on;

            surf([-10.8, -10.8; 10.8, 10.8], ...
                [-10.8, 10.8; -10.8, 10.8], ...
                [0, 0; 0, 0], ...
                'CData', imread('rm334-ae-35.jpg'), ...
                'FaceColor', 'texturemap');

            r = LinearUR10(); % Create a LinearUR10 instance
        end

        %function obj = PlaceObject(filename, position)
            % Function to place an object in the environment
            % You can implement this method or use your existing code
            % to load and position objects.
        %end
    end
end
