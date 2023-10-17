classdef LinearUR10 < RobotBaseClass
    %% LinearUR10 UR10 on a non-standard linear rail created by a student

    properties(Access = public)              
        plyFileNameStem = 'LinearUR10';
    end
    
    methods
%% Constructor
        function self = LinearUR10(baseTr)
			self.CreateModel();
            if nargin < 1			
				baseTr = eye(4);				
            end
            self.model.base = self.model.base.T * baseTr * trotx(pi/2) * troty(pi/2);
            
            self.PlotAndColourRobot();         
        end

%% CreateModel
        function CreateModel(self)   
            % Create the UR10 model mounted on a linear rail
            link(1) = Link([pi    0           0        pi/2    1]); % PRISMATIC Link
            link(2) = Link([0     0.1697      0        -pi/2   0]);
            link(3) = Link([0     0.176       0.6129   -pi     0]);
            link(4) = Link([0     0.12781     0.5716	pi      0]);
            link(5) = Link([0     0.1157      0        -pi/2	0]);
            link(6) = Link([0     0.1157      0        -pi/2	0]);
            link(7) = Link([0     0           0        0       0]);
        
            
            % Incorporate joint limits
            link(1).qlim = [-0.8   -0.01]; % Must be negative
            link(2).qlim = [-360 360]*pi/180;
            link(3).qlim = [-90 90]*pi/180;
            link(4).qlim = [-170 170]*pi/180;
            link(5).qlim = [-360 360]*pi/180;
            link(6).qlim = [-360 360]*pi/180;
            link(7).qlim = [-360 360]*pi/180;
        
            link(3).offset = -pi/2;
            link(5).offset = -pi/2;
        
            self.model = SerialLink(link,'name',self.name);
        end     
    end
end