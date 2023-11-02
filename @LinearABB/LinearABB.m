classdef LinearABB < RobotBaseClass
    %% LinearABBIRB2600-12 on a non-standard linear rail 

    properties(Access = public)              
        plyFileNameStem = 'LinearABB';
    end
    
    methods
%% Define robot Function 
function self = LinearABB(baseTr)
			self.CreateModel();
            if nargin < 1			
				baseTr = eye(4);				
            end
            self.model.base = self.model.base.T * baseTr * trotx(pi/2) * troty(pi/2);

            self.PlotAndColourRobot(); 
            
        end

%% Create the robot model
        function CreateModel(self)   
            % Create the UR5 model mounted on a linear rail
            link(1) = Link([pi     0       0       pi/2    1]); % PRISMATIC Link - linear rail
%%ABB-IRB-2600/12's dh parameters ADDED
            link(2) = Link('d',0.455,'a',0.150,'alpha',-pi/2,'qlim',[-180 180]*pi/180);
            link(3) = Link('d',0,'a',0.900,'alpha',0,'qlim', [-95 155]*pi/180,'offset', -pi/2);
            link(4) = Link('d',0,'a',-0.115,'alpha',pi/2,'qlim',[-180 75]*pi/180,'offset',pi);
            link(5) = Link('d',0.795,'a',0,'alpha',pi/2,'qlim',[-400 400]*pi/180);
            link(6) = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-120 120]*pi/180,'offset',pi);
            link(7) = Link('d',0.165,'a',0,'alpha',-pi/2,'qlim',[-400 400]*pi/180,'offset',pi/2);

            % Incorporate joint limits
            link(1).qlim = [-3.8   -0.01];
            
        
            self.model = SerialLink(link,'name',self.name);

            % self.model.teach()
        end
     
    end
end