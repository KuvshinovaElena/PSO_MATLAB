function V = calcVelocity(V_prev, best_pos, X, X_best, Bl, Bc, Bs, dim)
V = Bl*V_prev ... % инерционная компонента
    + unifrnd(0, Bc, dim).*(X_best - X) ...  %когнитивная компонента
    + unifrnd(0, Bs, dim).*(best_pos - X); %социальная компонента
end