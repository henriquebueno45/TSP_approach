clear all; close all; clc; % Limpa memória
%% Universidade Federal de Santa Catarina
% Campus Blumenau
% Departamento de Engenharia de Controle, Automação e Computação
% BLU3504 – Modelagem, Análise e Avaliação de Desempenho de Sistemas Automatizados
% Prof. Guilherme B. Pintarelli - guilherme.pintarelli@ufsc.br
% Esse é um arquivo exemplo do uso da função do MATLAB (graph e minspantree).
%% Input locais descritos em XY
XY_Points = [
6.15 0
7.45 0.29
9 0
8.72 1.35
5.58 3.7
5.45 6.23
2.91 7.22
8.13 6.25
9.29 6.59
10.34 6.94
10.13 5.93
10.44 5.07
11 8 
12.25 7.36
11.96 4.71
11.37 3.95
13 2 
8.21 4.54
14.23 0
14.27 2.67
15.7 0.97
15.71 3.87
16.57 3.43
14.27 5.34
16.84 6.82
18.59 6.92
19.2 3.56
18.57 0 
20.74 0.61
5.92 6.65
];
nodesName = {'1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19' '20' '21' '22' '23' '24' '25' '26' '27' '28' '29' '30'}';
%% Cálculo de relações (distâncias)
Adj_ndir = squareform(pdist(XY_Points)); % Essa função possui internamente o cálculo geométrico de distância
%entre pontos
%% Cria tabela de nós e arcos. Entrada 'upper'/'lower' (não dirigido)
G1 = graph(Adj_ndir,nodesName(1:length(Adj_ndir))); % Grafo não dirigido
% Plota o grafo
figure('Name','G1');
%P1 = plot(G1,'XData',(XY_Points(:,1))','YData',(XY_Points(:,2))',...
% 'NodeFontSize',20,'NodeColor','k','EdgeColor','b','LineWidth',0.1,...
% 'Marker','o','MarkerSize',10);
%%
%[T,pred] = minspantree(G1, 'Method', 'dense');
%highlight(P1,T,'EdgeColor','g')
%axis equal
%grid on

%% Algoritmo de Dijkstra para encontrar menores caminhos (para ser utilizado na Q5)
%[path1,d] = shortestpath(G1,'7','29');
%highlight(P1,path1,'EdgeColor','g');

T = minspantree(G1);
plot(G1, 'XData', XY_Points(:,1), 'YData', XY_Points(:,2));
hold on
plot(T, 'XData', XY_Points(:,1), 'YData', XY_Points(:,2), 'EdgeColor', 'g', 'LineWidth', 3);
hold off

%{
[T,pred] = minspantree(G1, 'Method', 'dense');
hold on
plot(pred(:,1), pred(:,2), '-','Color',[0 0.4470 0.7410],'LineWidth',2) % plota o menor caminho
P1 = scatter(XY_Points(:,1),XY_Points(:,2),20,'filled','MarkerFaceColor',[0 0.4470 0.7410]);
axis equal
grid on
%}