load('PT_t.mat');
n = size(QS_T,2);
Janaold = eye(6).*0.01;
Xdd = [];
Xd = [];
X = [];
q_old = [-1.26487550666180;0.125616230592387;-1.62771048380492;0.389422103425747;-1.67231811224680;-1.04372473864892];
dq_old = [-6.66133814775094e-13;-2.08166817117217e-14;-3.33066907387547e-13;5.55111512312578e-14;-2.77555756156289e-13;-1.11022302462516e-13];
ddq_old = [-2.52435489670724e-26;-3.94430452610506e-27;-1.26217744835362e-26;-6.31088724176809e-27;3.78653234506086e-26;-8.51969777638693e-26];
for i = 1 : n
    q = QS_T(:,i) ./ 10 ./ 180 .* pi;
    dq = (q - q_old)./0.004;
    ddq = (dq_old - dq)./0.004;
    [Xdd_record, Xd_record, X_record, Jana] = getDesiredX(q,dq,ddq,Janaold);
    Janaold = Jana;
    Xdd = [Xdd,Xdd_record];
    Xd = [Xd,Xd_record];
    X = [X,X_record];
end
X = X';
plot3(X(:,1),X(:,2),X(:,3),'b')