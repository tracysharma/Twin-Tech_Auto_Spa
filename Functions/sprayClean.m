function sprayClean(rABB, qABB, rUR10, qUR10, steps)

%Set up inverse kinematics with optimisation of joint angles for ABB
        q1a = rABB.model.ikcon(rABB.model.fkine(qABB));   
        q2a = rABB.model.ikcon(transl(-2,1.5,2)*rpy2tr(-180, 90, -90, 'deg'));
        q3a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q4a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q5a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q6a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q7a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q8a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q9a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q10a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));

    %Set up path trajectories
            qPath1a = jtraj(q1a,q2a,steps);
            qPath2a = jtraj(q2a,q3a,steps);
            qPath3a = jtraj(q3a,q4a,steps);
            qPath4a = jtraj(q4a,q5a,steps);
            qPath5a = jtraj(q5a,q6a,steps);
            qPath6a = jtraj(q6a,q7a,steps);
            qPath7a = jtraj(q7a,q8a,steps);
            qPath8a = jtraj(q8a,q9a,steps);
            qPath9a = jtraj(q9a,q10a,steps);


 %Set up inverse kinematics with optimisation of joint angles for UR10
        q1b = rUR10.model.getpos;   
        q2b = rUR10.model.ikcon(rUR10.model.fkine(qUR10));

    %Set up path trajectories
            qPath1b = jtraj(q1b,q2b,steps);

%Run animations
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory 
            rABB.model.animate(qPath1a(i, :));
            rUR10.model.animate(qPath1b(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory 
            rABB.model.animate(qPath2a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath3a(i, :));
            drawnow();
        end

        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath4a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath5a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath6a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath7a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath8a(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath9a(i, :));
            drawnow();
        end
        %for i = 1:steps
        %     %Animate LinearUR3 to run qMatrix trajectory
        %      rABB.model.animate(qPath10a(i, :));
        %     drawnow();
        %end

end
