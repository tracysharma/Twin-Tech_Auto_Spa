classdef Brick< handle

 

   %#ok<*TRYNC>  

    %ROBOT\

    properties (Constant)

        %> Max height is for plotting of the workspace
        maxHeight = 5;
    end

 
    properties
        %> Number of bricks
        BrickCount = 9;
        %> A cell structure of Count models
        BrickModel;
        %> paddockSize in meters
        paddockSize = [0.6,0.6];        
        %> Dimensions of the workspace in regard to the padoc size
        workspaceDimensions;
    end

    methods


        %% ...structors
        function self = Brick(BrickCount)
            if 0 < nargin
            self.BrickCount = BrickCount;
            end



            self.workspaceDimensions = [-self.paddockSize(1)/2, self.paddockSize(1)/2 ...
                                       -self.paddockSize(2)/2, self.paddockSize(2)/2 ...
                                       0,self.maxHeight];

 

 

 

            % Calculate the number of rows and columns for the grid
            % dependent on number of chosen

            colCount = ceil(sqrt(self.BrickCount));

            rowCount = ceil(self.BrickCount/colCount);

 

            % Calculate the spacing between


            xSpace = self.paddockSize(1)/(colCount+1);

            ySpace = self.paddockSize(2)/(rowCount+1);

 

            % Create  in a grid formation

 

            for i = 1:self.BrickCount

 

                % Calculate the row and column

                row = ceil(i/colCount);

                col = mod(i-1, colCount)+1;


                % Calculate x and y position

                xPos = col * xSpace - self.paddockSize(1) / 2;

                yPos = row * ySpace - self.paddockSize(2) / 2;
                
       

                % Sub in positioning and set orientation

 

                basePose = SE3(SE2(xPos, yPos, pi));

 

                self.BrickModel{i} = self.GetBrickModel(['brick', num2str(i)]);

 

                self.BrickModel{i}.base = basePose;

 

                

 

                % Plot 3D model

 

                plot3d(self.BrickModel{i}, 0, 'workspace', self.workspaceDimensions, 'view', [-5, 5], 'delay', 0, 'noarrow', 'nowrist');

 

                % Hold on after the first plot (if already on there's no difference)

 

                if i == 1

 

                    hold on;

 

                end

            end

 

 

            axis equal

 

            if isempty(findobj(get(gca,'Children'),'Type','Light'))

 

                camlight

 

            end

 

        

 

             function delete(self)

 

            for index = 1:self.BrickCount

 

                handles = findobj('Tag', self.BrickModel{index}.name);

 

                h = get(handles,'UserData');

 

                try delete(h.robot); end

 

                try delete(h.wrist); end

 

                try delete(h.link); end

 

                try delete(h); end

 

                try delete(handles); end

 

            end

 

        end       

 

        end

    end

 

methods (Static)

 

        %% Get Brick Model

 

        function model = GetBrickModel(name)

 

            if nargin < 1

 

                name = 'brick';

 

            end

 

            [faceData,vertexData] = plyread('brick.ply','tri');

 

            link1 = Link('alpha',pi,'a',1.2,'d',0.06,'offset',0);
            transl(-1,1,0)
 

            model = SerialLink(link1,'name',name);

 

            

 

            % Changing order of cell array from {faceData, []} to

 

            % {[], faceData} so that data is attributed to Link 1

 

            % in plot3d rather than Link 0 (base).

 

            model.faces = {[], faceData};

 

 

 

            % Changing order of cell array from {vertexData, []} to

 

            % {[], vertexData} so that data is attributed to Link 1

 

            % in plot3d rather than Link 0 (base).

 

            model.points = {[], vertexData};

 

        end

 

    end    

 

end