% �������� ��� ������
% N - ����� ������ ���������
% ITER - ����� �������� ��������� (�������� ���������)
% BOUNDS - ������ ����������� ������������ ������ (��� ������� ����������
%          ��������� ������� �������)
% opt - ���� ����������� (1 - ������������, 2 - �����������)
% ��������� ��������� ��������� (�� ������������ ���������)
% Bl - ����������� ����������� ������� ������ (������������� = 0.7298)
% Bl_damp - ����������� �������� ��������� ��������� Bl � ������ ���������
%           (������������� 0.4 - 0.9)
% Bc - ����������� ����������� ���������� (������������� = 1.49618)
% Bs - ����������� ���������� ���������� (������������� = 1.49618)
function [F, P] = PSO(func, N, ITER, BOUNDS, opt, Bl, Bc, Bs, Bl_damp)
if nargin < 3
    opt = 0;
    %������������� �������������� ���������� ����������������� ����������
    Bl = 0.7298; Bl_damp = 0.9; Bc = 1.49618; Bs = 1.49618;
end

if opt == 1
    opt_func = @max;
else
    opt_func = @min;
end

X = initPopulation(N, BOUNDS);
X_best.pos = X;
X_best.fitness = fitnessAgent(X, func);

[~, best_i] = opt_func(X_best.fitness);
BEST = best_i;  % ������ ���������� ������� � ������� X_best

V = zeros(N, size(X, 2));

for i=1:ITER
    V = calcVelocity(V, BEST, X, X_best.pos, Bl, Bc, Bs);
    X = X + V;
    for j=1:N
        X(j,:) = max(X(j,:), BOUNDS(:,1)');    %�������� ������ ������������ ������
        X(j,:) = min(X(j,:), BOUNDS(:,2)');
        fitness = func(X(j,:));
        [X_best.fitness(j), swap] = opt_func([fitness X_best.fitness(j)]);
        if swap == 1
            X_best.pos(j, :) = X(j,:);
        end
    end
    [~, BEST] = opt_func(X_best.fitness);
    Bl = Bl * Bl_damp;  %�������� ������� ������
end
F = X_best.fitness(BEST); P = X_best.pos(BEST,:);
end