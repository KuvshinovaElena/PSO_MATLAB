function V = calcVelocity(V_prev, best_pos, X, X_best, Bl, Bc, Bs)
[N, dim] = size(X);
V = Bl*V_prev ... % инерционная компонента
    + Bc*rand(N, dim).*(X_best - X) ...  %когнитивная компонента
    + Bs*rand(N, dim).*bsxfun(@minus, X_best(best_pos), X); %социальная компонента
end