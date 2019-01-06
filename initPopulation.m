% Начальная инициализация популяции
% N - число агентов популяции
% BOUNDS - ограничения пространства поиска (для каждого свободного параметра целевой функции)
function X = initPopulation(N, BOUNDS)
    down = repmat(BOUNDS(:,1)', N, 1); low = repmat(BOUNDS(:,2)', N, 1);
    X = unifrnd(down, low, N, size(BOUNDS,2));  
end