%% 
% This function defines the event function.
% In the three link biped, the event occurs when the swing foot hits the
% ground.
%%
function [value,isterminal,direction] = event_func(t, y)

% you may want to use kin_swf to set the 'value'
[~,value,~,~] = kin_swf(y(1:3),y(4:6));%
value = value +0.001;
isterminal = 1;%
direction = -1;%

end
