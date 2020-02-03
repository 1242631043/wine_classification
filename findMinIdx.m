function  flag = findMinIdx(data, vects)
%�ҵ���С���������������ֵ
% Inputs:
%    data:������  vects:������
% Output:
%    flag:����ֵ������������

m = size(data, 1);
N = size(vects, 1);
flag = zeros(m, 1);
dist = zeros(1, N);

for i = 1:m
    for k = 1:N
        dist(k) = norm(data(i, :) - vects(k, :));%���㵽ÿ���������ĵľ���
    end
    [~, flag(i, 1)] = min(dist);      %����С�ľ���
end

end

