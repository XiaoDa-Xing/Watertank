classdef Policy < handle
    properties
        lastspeed
        lastlevel
    end

    methods
        
        function self = Policy()
            
        end
        
        function action=action(self,observation)
            if isempty(self.lastspeed)
                self.lastspeed=0;
            end
            
            if isempty(self.lastlevel)
                self.lastlevel=observation.agent.H;
            end
            
             sys=observation.agent;
            %disp(observation);
            fis=readfis('watertank5');
            dlevel=observation.targetHeight-sys.H;
            dspd=sys.H-self.lastlevel;
            u=self.lastspeed+evalfis(fis,[dlevel dspd]);
        	action=[u];
            if u>10
                self.lastspeed=10;
            elseif u<-10
                self.lastspeed=-10;
            else
                self.lastspeed=u;
            end
            
            self.lastlevel=observation.agent.H;
        end
        
        
    end
end