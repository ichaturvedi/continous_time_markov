function create_train_simulink2()

output_train = load('new_thr.txt')';
output_train = rescale(output_train,0,1);
thr = output_train';
count1 = timeseries(output_train(:,1), 1:size(output_train,1),'name', 'intersection1');
save input_thr.mat -v7.3 'count1';

output_train = load('new_ang.txt')';
output_train = rescale(output_train,0,1);
ang = output_train';
count1 = timeseries(output_train(:,1), 1:size(output_train,1),'name', 'intersection1');
save input_ang.mat -v7.3 'count1';

output_train = load('new_brk.txt')';
output_train = rescale(output_train,0,5);
brk = output_train';
count1 = timeseries(output_train(:,1), 1:size(output_train,1),'name', 'intersection1');
save input_brk.mat -v7.3 'count1';

options = simset('SrcWorkspace','current');
sim('SingleCylinderSparkIgnitionEngine_apple2',[],options)

output_speed = load('new_thr.txt');
load('speed.mat')

pred_speed = ans.EngineSpeed.Data;
pred_break = ans.BrakePower.Data;
pred_ang = ans.BrakeTorque.Data;

n2 = size(output_train,2);

x = [normalize(thr,'range') normalize(brk,'range') normalize(ang,'range')];
A = x'*x;
u = [normalize(pred_speed(end-n2+1:end),'range') normalize(pred_break(end-n2+1:end),'range') normalize(pred_ang(end-n2+1:end),'range')];
B = u'*u;

load('weka_input_apple_sub.csv');
dlmwrite('weka_input_apple_semidef.csv',[x(2:end,1:3) u(2:end,1) weka_input_apple_sub(2:end,4)]);

end