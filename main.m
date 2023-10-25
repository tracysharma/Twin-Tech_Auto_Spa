classdef main 
    %Environment Class Function Called 
    %Linear ABB Function Called 
    %Linear UR10 Robot + Rail called 

         properties(Access = public)              
        plyFileNameStem = 'UR10Robot';
        linearUR10Robot;
         end

    methods
        %function e= Environment 

        function obj = main()
            obj.linearUR10Robot = LinearUR10();
            % Calling out the UR3 file 
           
        end


        %end
    end
end