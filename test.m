function test() 
close all 
r = LinearUR3; 
% r.TestMoveJoints; 
cow = RobotCows(1);
axis([-2,2,-2,2,0,4])
cow.cowModel{1}.base = r.model.fkine(r.model.getpos()); 
qPath = jtraj(r.model.qlim(:,1)', r.model.qlim(:,2)',200);

for i = 1:length(qPath)
    r.model.animate(qPath(i,:))
    drawnow(); 
    cow.cowModel{1}.base = r.model.fkine(r.model.getpos());
    cow.cowModel{1}.animate(0); 
    drawnow();
    pause(0)
end



