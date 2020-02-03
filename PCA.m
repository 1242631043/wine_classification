function [DS, com_num, PV, score] = PCA(SA, T, option)
%PCA��ά
% Inputs:
%    SA:��׼������������  T:���ɷֵ���Ϣ������  options:��ѡ
% Outputs:
%    DS:����ֵ�������ʡ��ۼƹ�����
%    com_num:T��Ӧ�����ɷ���
%    PV:��������
%    score:���ɷֵ÷�

n = size(SA,2);
CM = cov(SA);    %����Э���������Ϣ��С�÷���������
[V,D] = eig(CM);   %����CM����������������ֵ���ų����������
DS = zeros(n,3);
for i = 1:n
    DS(i,1) = D(n-i+1,n-i+1);       %������ֵ���������е�DS��
end
%���㷽����ʣ�����ֵԽ����Ӧ�Ĺ�����Խ��
for i = 1:n
    DS(i,2) = DS(i,1) / sum(DS(:,1));           %�����������
    DS(i,3) = sum(DS(1:i,1)) / sum(DS(:,1));    %�ۼƷ������
end
for i = 1:n
    if DS(i,3) >= T
        com_num = i;
        break;
    end
end
PV = zeros(n,com_num);
for j = 1:com_num         %��ȡ���ɷֵ������������õ���ά��ı�׼������
    PV(:,j) = V(:,n-j+1); %��ʵ�Գƾ���ͬ����ֵ��Ӧ����������������
end
score = SA*PV; %�õõ��ı�׼������ʵ�����ݼ���ͶӰ���������ɷֵ÷�

if nargin > 2
    switch option
        case 'ShowFigure'
            figure;
            hold on;
            xlabel('���ɷ�');
            ylabel('�������');
            bar(1:n,DS(:,2));
            plot(1:n,DS(:,3),'b-');
            legend({'����������','�ۼƹ�����'},'Location','NorthWest');
        otherwise
            fprintf('ѡ�����');
    end
end

end

