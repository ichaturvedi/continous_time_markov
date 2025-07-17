function create_train_simulink(inputfile)

watch_data_final = load(inputfile);

%output_train = watch.data(:,2);
output_train = watch_data_final(:,1);
output_train = rescale(output_train,0,1);
thr = output_train;
count1 = timeseries(output_train(:,1), 1:size(output_train,1),'name', 'intersection1');
save input_thr.mat -v7.3 'count1';

%output_train = watch.data(:,1);
output_train = watch_data_final(:,2);
output_train = rescale(output_train,0,30);
ang = output_train;
count1 = timeseries(output_train(:,1), 1:size(output_train,1),'name', 'intersection1');
save input_ang.mat -v7.3 'count1';

%output_train = watch.data(:,4);
output_train = watch_data_final(:,3);
output_train = rescale(output_train,0,30);
brk = output_train;
count1 = timeseries(output_train(:,1), 1:size(output_train,1),'name', 'intersection1');
save input_brk.mat -v7.3 'count1';

options = simset('SrcWorkspace','current');
sim('SingleCylinderSparkIgnitionEngine_apple',[],options)

output_speed =  watch_data_final(:,1);
load('speed.mat')

pred_speed = ans.EngineSpeed.Data;
pred_break = ans.BrakePower.Data;
pred_ang = ans.BrakeTorque.Data;

n = 2769;

xorg = [thr brk ang];
x = [normalize(thr,'range') normalize(brk,'range') normalize(ang,'range')];
A = x'*x;
u = [normalize(pred_speed(1:n),'range') normalize(pred_break(1:n),'range') normalize(pred_ang(1:n),'range')];
B = u'*u;
L = -1*u'*x(1:n,:);
save matrices.mat A B L x u xorg

copyfile matrices.mat semidef/

end
