% �������-������ ���������
% X - ���������� ������ ��������� �� i-�� ����
% func - ������� �������
function FITNESS = fitnessAgent(X, func)
N = size(X,1);
FITNESS = zeros(N, 1);
for i=1:N
    FITNESS(i) = func(X(i,:));
end