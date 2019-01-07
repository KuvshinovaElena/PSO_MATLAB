function V = calcVelocity(V_prev, best_pos, X, X_best, Bl, Bc, Bs)
[N, dim] = size(X);
V = Bl*V_prev ... % ����������� ����������
    + Bc*rand(N, dim).*(X_best - X) ...  %����������� ����������
    + Bs*rand(N, dim).*bsxfun(@minus, X_best(best_pos), X); %���������� ����������
end