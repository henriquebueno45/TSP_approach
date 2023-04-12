function [path, cost] = tspsearch(adj_matrix, start)
% TSPSEARCH encontra o menor caminho que visita todos os nós em uma matriz de adjacência
% INPUTS:
%     adj_matrix: uma matriz de adjacência simétrica com as distâncias entre cada nó
%     start: o nó inicial para começar a busca
% OUTPUTS:
%     path: um vetor com a ordem dos nós visitados na busca
%     cost: o custo total do menor caminho encontrado
    n = size(adj_matrix, 1); % número de nós
    unvisited = 1:n; % nós não visitados
    path = zeros(1, n); % vetor para armazenar a ordem dos nós visitados
    path(1) = start; % comece a busca a partir do nó inicial
    unvisited(unvisited == start) = []; % remova o nó inicial da lista de não visitados
    current_node = start; % inicie a partir do nó inicial
    for i = 2:n % visitar cada nó uma vez
        [~, idx] = min(adj_matrix(current_node, unvisited)); % encontrar o nó não visitado mais próximo
        next_node = unvisited(idx); % selecionar o próximo nó
        path(i) = next_node; % adicionar o nó à ordem dos nós visitados
        unvisited(unvisited == next_node) = []; % remover o nó da lista de não visitados
        current_node = next_node; % atualizar o nó atual para o próximo nó
    end
    % calcular o custo do caminho encontrado
    cost = 0;
    for i = 1:n-1
        cost = cost + adj_matrix(path(i), path(i+1));
    end
    cost = cost + adj_matrix(path(end), path(1)); % adicionar o custo do último nó para o nó inicial
end
