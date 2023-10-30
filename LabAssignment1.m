
function LabAssignment1( )

    
% Code that builds environment for robot 
surf([-2.2,-2.2; 2.2 ,2.2] ...
,[-2.2,2.2;-2.2,2.2] ...
,[0.02,0.02;0.02,0.02] ...
,'CData',imread('concrete.jpg') ...
,'FaceColor','texturemap');
hold on 

%Safety Considerations + environment 

%% Get Emergency Stop Wall Mounted 

PlaceObject('emergencyStopWallMounted.ply', [0,-1.4,0.7]);

%% Get Barriers Mounted 

%x-axis 
PlaceObject('barrier1.5x0.2x1m.ply', [0,1.5,0]);
PlaceObject('barrier1.5x0.2x1m.ply', [-1.5,-1,0]);
PlaceObject('barrier1.5x0.2x1m.ply', [1.5,1.5,0]);
PlaceObject('barrier1.5x0.2x1m.ply', [1.5,-1,0]);
PlaceObject('barrier1.5x0.2x1m.ply', [-1.5,1.5,0]);


%% Get walls Mounted 

PlaceObject('tracyYaxis_new.ply', [0.1,2,1]);
PlaceObject('tracyXaxis_new.ply', [2.3,0,1]);


                                                                                                                                        
%% Get Fire Extinguisher Mounted 

PlaceObject('fireExtinguisherElevated.ply', [-1.8,0.5,0.5]);
PlaceObject('fireExtinguisherElevated.ply', [2,0.5,0.5]);


%Plotting the bricks 
b = Brick; %calling out a class def file 
PlaceObject('brick.ply', [-0.5,0.5,0]);
PlaceObject('brick.ply', [-0.2,0.5,0]);
PlaceObject('brick.ply', [0,0.5,0]);
PlaceObject('brick.ply', [0.2,0.5,0]);
PlaceObject('brick.ply', [0.4,0.5,0]);
PlaceObject('brick.ply', [0.6,0.5,0]);
PlaceObject('brick.ply', [0.8,0.5,0]);
PlaceObject('brick.ply', [1,0.5,0]);
PlaceObject('brick.ply', [1.2,0.5,0]);



% Plotting the robot 
r = LinearUR3;
steps = 200; 


r.PlotAndColourRobot(); 



%joint angles 
q = zeros(1,8);
%Find initial location 
t1 = r.model.fkineUTS(q)*rpy2tr(180, 90, 90, 'deg');
%Set end effector location at q2
t2 = transl(-1.8,0.5,0.2)*rpy2tr(180, 0, 0, 'deg'); % Desired end location (final), can change it 
%Set end effector location at q3

t3 = transl(0.4,0.5,0.2)*rpy2tr(180, 90, 20, 'deg'); % Desired end location (final), can change it 
%Set end effector location at q3

t4 = r.model.fkineUTS(q)*rpy2tr(0, 0, 0, 'deg'); % Desired end location (final), can change it 

t5 = transl(-1.8,0.5,0.2)*rpy2tr(180, 0, 0, 'deg'); % Desired end location (final), can change it 
%Set end effector location at q2

t6 = transl(0.4,0.5,0.2)*rpy2tr(180, 90, 20, 'deg'); % Desired end location (final), can change it 

%Find initial location 
t7 = r.model.fkineUTS(q)*rpy2tr(180, 90, 90, 'deg');


%inverseKinematics to find joint angles for initial and final pose 

q1 = r.model.ikcon(t1);
q2 = r.model.ikcon(t2); 
q3 = r.model.ikcon(t3);
q4 = r.model.ikcon(t4);
q5 = r.model.ikcon(t5);
q6 = r.model.ikcon(t6);
q7 = r.model.ikcon(t7);

%Trajectory of start to finish using jtraj

path1 = jtraj(q1,q2,steps); 
path2 = jtraj(q2,q1,steps);
path3 = jtraj(q1,q3,steps);
path4 = jtraj(q3,q4,steps);
path5 = jtraj(q4,q5,steps);
path6 = jtraj(q5,q6,steps);
path7 = jtraj(q6,q7,steps);



%gripper.Model{1}.base = r.model.fkine(r.model.getpos()); 

for i = 1:steps 
    %Animate Linear UR3 to run qMatrix 

    r.model.animate(path1(i,:));
   % r.plot(qMatrix);
    drawnow(); 
end 

for i = 1:steps 
    %Animate Linear UR3 to run qMatrix 

     r.model.animate(path2(i,:));
   % r.plot(qMatrix);
    drawnow(); 
end

    for i = 1:steps 
    %Animate Linear UR3 to run qMatrix 

     r.model.animate(path3(i,:));
   % r.plot(qMatrix);
    drawnow(); 
    end 

     for i = 1:steps 
    %Animate Linear UR3 to run qMatrix 

     r.model.animate(path4(i,:));
   % r.plot(qMatrix);
    drawnow(); 
     end 

      for i = 1:steps 
    %Animate Linear UR3 to run qMatrix 

     r.model.animate(path5(i,:));
   % r.plot(qMatrix);
    drawnow(); 
      end 

       for i = 1:steps 
    %Animate Linear UR3 to run qMatrix 

     r.model.animate(path6(i,:));
   % r.plot(qMatrix);
    drawnow(); 
       end 

for i = 1:steps 
    %Animate Linear UR3 to run qMatrix 

    r.model.animate(path7(i,:));
   % r.plot(qMatrix);
    drawnow(); 
end 


hold on 
end

       
       




