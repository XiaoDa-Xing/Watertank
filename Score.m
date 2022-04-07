classdef Score < handle
    properties
        score
    end
    properties (Access = private)
        rewardTime
        lastTime
        outofbound
        collide
    end
    
    
    methods
    
        function self = Score(env)
            self.score=env.sysInfo.score;
        end

        function assess(self,env)
            self.score=0;
            
        end
       
    end
end