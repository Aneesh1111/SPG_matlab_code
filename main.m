close all
clear classes
clc

% %setpoint generator
p_initial = [3 0 0];
v_initial = [0 3 0];
npredict    = get_global_par('SPG_NPREDICT');
nobstacles  = min(10, get_global_par('SPG_NOBSTACLES'));
nintercept_positions = get_global_par('SPG_NINTERCEPT_POINTS');
p_initial_ball = [2 0];
v_initial_ball = [4 0];
d = spg.init(p_initial, v_initial, nobstacles, npredict, p_initial_ball, v_initial_ball, nintercept_positions);
% d.par.amax_move = 8.0;
% d.par.dmax_move = 5.0;
% d.input.SubtargetAvoidPolygon.valid = true;
% d.input.SubtargetAvoidPolygon.polygon = [-2 -.5;-1.5 .5;2 1;2 0].';
% d.input.SubtargetAvoidPolygon.polygon = [-4 -6.5;-3 -6.5;-3 -5.5;-4 -5.5].';

%simulation
s = SPGsimulator(d);
s.d.target.p = [-1 -1 0];
s.d.target.v = [0 0 0];
setData(s);
run(s)
% rng(0)
