function washNrinse(rABB, qABB, rUR10, qUR10, steps)

%Set up inverse kinematics with optimisation of joint angles for ABB
        q1a = rABB.model.getpos;   
        q2a = rABB.model.ikcon(transl(-2,1.5,2)*rpy2tr(-180, 90, -90, 'deg'));
        q3a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q4a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q5a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q6a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q7a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q8a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q9a = rABB.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q10a = rABB.model.ikcon(rABB.model.fkine(qABB));

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
        q2b = rUR10.model.ikcon(transl(-2,1.5,2)*rpy2tr(-180, 90, -90, 'deg'));
        q3b = rUR10.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q4b = rUR10.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q5b = rUR10.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q6b = rUR10.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q7b = rUR10.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q8b = rUR10.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q9b = rUR10.model.ikcon(transl(-2,1.6,1.5)*rpy2tr(-180, 90, -90, 'deg'));
        q10b = rUR10.model.ikcon(rUR10.model.fkine(qUR10));

    %Set up path trajectories
            qPath1b = jtraj(q1b,q2b,steps);
            qPath2b = jtraj(q2b,q3b,steps);
            qPath3b = jtraj(q3b,q4b,steps);
            qPath4b = jtraj(q4b,q5b,steps);
            qPath5b = jtraj(q5b,q6b,steps);
            qPath6b = jtraj(q6b,q7b,steps);
            qPath7b = jtraj(q7b,q8b,steps);
            qPath8b = jtraj(q8b,q9b,steps);
            qPath9b = jtraj(q9b,q10b,steps);

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
            rUR10.model.animate(qPath2b(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath3a(i, :));
             rUR10.model.animate(qPath3b(i, :));
            drawnow();
        end

        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath4a(i, :));
             rUR10.model.animate(qPath4b(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath5a(i, :));
             rUR10.model.animate(qPath5b(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath6a(i, :));
             rUR10.model.animate(qPath6b(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath7a(i, :));
             rUR10.model.animate(qPath7b(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath8a(i, :));
             rUR10.model.animate(qPath8b(i, :));
            drawnow();
        end
        for i = 1:steps
            %Animate LinearUR3 to run qMatrix trajectory
             rABB.model.animate(qPath9a(i, :));
             rUR10.model.animate(qPath9b(i, :));
            drawnow();
        end
        %         for i = 1:steps
        %     %Animate LinearUR3 to run qMatrix trajectory
        %      rABB.model.animate(qPath10a(i, :));
        %      rUR10.model.animate(qPath10b(i, :));
        %     drawnow();
        % end

end
