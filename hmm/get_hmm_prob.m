function get_hmm_prob(inputfile)

watch = load(inputfile);

output_train = watch(:,1);
thr = output_train;

output_train = watch(:,2);
ang = output_train;

output_train = watch(:,3);
brk = output_train;

gear = watch(:,4);

thr2 = discretize(thr,3);
brk2 = discretize(brk,3);
ang2 = discretize(ang,3);
gear2 = discretize(gear,3);
input2 = discretize([normalize(thr,'range') normalize(ang,'range') normalize(brk,'range')],3);

[estimateTR1,estimateE1] = hmmestimate([brk2],gear2);
[estimateTR2,estimateE2] = hmmestimate(input2,gear2);

save prob.mat estimateE2 estimateTR2;

end

