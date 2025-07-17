function select_samples(inputfile)
watch = load(inputfile);
label = watch(:,4)-1;

load matrices.mat;

%load matrixm.mat;
load prob.mat;
%L = L*-1;

A = A/norm(A);
L = L/norm(L);

M = sdpvar(3,3,'symmetric');
C1 = [M>=0];
C2 = [norm(exp(A-L*(M*M')))<=1]
N = -1*((A-B*L-0.5*estimateTR2*eye(3,3))'*M+M*(A-B*L-0.5*estimateTR2*eye(3,3))+sum(sum(estimateTR2*M)))
C3 = [N>=0]
O = [C1,C2,C3];
solvesdp(O); 
checkset(O);

Msdp = double(M);

save matrixm.mat Msdp

x1 = x(1,:);
xnew = x1;
ind = 1;
labelc =zeros(1,3);
for i = 1:size(label,1)

    xt = x(i,:);
    rhs = x1*Msdp*x1';

    lhs = xt*xt';

    if lhs - rhs > 0.2
        0
    else
       
        if labelc(label(i)) + 1 < 500 || 1
           xnew = [xnew ; xt];
           ind = [ind; i];
           labelc(label(i))=labelc(label(i))+1;
        end
    end

end

xnew = xnew(2:end,:);
ind = ind(2:end);
xnew = [xnew label(ind)];

dlmwrite('weka_input_apple_sub.csv',xnew)

dlmwrite('new_thr.txt',xnew(:,1));
dlmwrite('new_brk.txt',xnew(:,2));
dlmwrite('new_ang.txt',xnew(:,3));

end