%% ORIGINAL
%{
% Passo 1: Importe os dados do arquivo CSV
data = readmatrix('C:\Users\henri\OneDrive\Área de Trabalho\ModelagemFacil_Trab1\arquivo_modificado.csv');

% Passo 2: Crie a matriz de adjacência
distances = pdist2(data, data);
adj_matrix = distances;
adj_matrix(adj_matrix < 0) = 0;
adj_matrix(adj_matrix > 0) = 1;
adj_matrix = adj_matrix - diag(diag(adj_matrix));


% Passo 3: Use a função tspsearch para encontrar o menor caminho que percorre todos os pontos
[path, custo] = tspsearch(adj_matrix, 1);

% Passo 4: Trace o menor caminho na figura
figure('Position',[100 100 800 600]) % ajuste o tamanho da figura
hold on
plot(data(path,1), data(path,2), '-','Color',[0 0.4470 0.7410],'LineWidth',2) % plota o menor caminho
scatter(data(:,1),data(:,2),20,'filled','MarkerFaceColor',[0 0.4470 0.7410]) % adiciona os pontos
axis equal
box on % adiciona uma borda ao redor do gráfico
xlabel('Eixo X') % adiciona rótulos para os eixos
ylabel('Eixo Y')

for i = 1:length(path)
    point = path(i);
    x = data(point, 1);
    y = data(point, 2);
    %fprintf('Ponto %d: (%f, %f)\n', point, x, y);
    
end
fprintf("distância total percorrida: %f", custo);

%% Segunda opção
% Passo 1: Importe os dados do arquivo CSV
data = readmatrix('C:\Users\henri\OneDrive\Área de Trabalho\ModelagemFacil_Trab1\arquivo_modificado.csv');

% Passo 2: Crie a matriz de distâncias
distances = pdist2(data, data);

% Passo 3: Use a função tspsearch para encontrar o menor caminho que percorre todos os pontos
[start_node, ~] = size(data);
[path, ~] = tspsearch(distances, start_node);

% Passo 4: Calcule o custo como a soma das distâncias entre os pontos no menor caminho
n = length(path);
cost = 0;
for i = 1:n-1
    cost = cost + distances(path(i), path(i+1));
end
cost = cost + distances(path(n), path(1)); % adiciona a distância do último ponto ao primeiro

% Passo 5: Trace o menor caminho na figura
figure('Position',[100 100 800 600]) % ajuste o tamanho da figura
hold on
plot(data(path,1), data(path,2), '-','Color',[0 0.4470 0.7410],'LineWidth',2) % plota o menor caminho
scatter(data(:,1),data(:,2),20,'filled','MarkerFaceColor',[0 0.4470 0.7410]) % adiciona os pontos
axis equal
box on % adiciona uma borda ao redor do gráfico
xlabel('Eixo X') % adiciona rótulos para os eixos
ylabel('Eixo Y')

% Passo 6: Imprima o caminho que percorreu baseado no índice de cada ponto no arquivo CSV
fprintf('Caminho percorrido:\n');
for i = 1:n
    point = path(i);
    %fprintf('%d - posicao (%f:.2,%f:.2)', point,point(:,1),points(:,2));
end
%fprintf('%d\n', path(1)); % adiciona o primeiro ponto novamente ao final para completar o ciclo

% Passo 7: Imprima a distância total percorrida
fprintf('Distância total percorrida: %f\n', cost);
%}
%% TErceira opção
% importa os dados do arquivo CSV
data = readmatrix('C:\Users\henri\OneDrive\Área de Trabalho\ModelagemFacil_Trab1\arquivo_modificado.csv');

% cria uma matriz de distâncias a partir do arquivo csv
distances = pdist2(data, data);
tic;
% função tspsearch para encontrar o menor caminho que percorre cada ponto
[start_node, ~] = size(data);
[path, ~] = tspsearch(distances, start_node);

% por garantia, verifica se todos os pontos foram percorridos, caso não
% foram, adiciona-os ao fim do caminho (não é necessário para funcionar, só
% foi adicionado para um caso específico em que o código não funcionava)
n = length(path);
if n < size(data,1)
    for i = 1:size(data,1)
        if ~ismember(i,path)
            path(end+1) = i;
        end
    end
end
% Calcular 
n = length(path);
cost = 0;
for i = 1:n-1
    cost = cost + distances(path(i), path(i+1));
end
cost = cost + distances(path(n), path(1));
tempo_decorrido = toc;
disp(['O tempo de execução do script foi de ', num2str(tempo_decorrido), ' segundos.']);
% Passo 6: Trace o menor caminho na figura
figure('Position',[100 100 800 600]) % ajuste o tamanho da figura
xlim([0, 700]);
ylim([7, 680]);
hold on
plot(data(path,1), data(path,2), '-','Color','g','LineWidth',2) % plota o menor caminho
scatter(data(:,1),data(:,2),20,'filled','MarkerFaceColor',[0 0.4470 0.7410]) % adiciona os pontos
axis equal
box on % adiciona uma borda ao redor do gráfico
xlabel('Eixo X') % adiciona rótulos para os eixos
ylabel('Eixo Y')

% Passo 7: Imprima o caminho que percorreu baseado no índice de cada ponto no arquivo CSV
fprintf('Caminho percorrido:\n');
for i = 1:n
    point = path(i);
    %fprintf('%d - posicao (%f:.2,%f:.2)', point,point(:,1),points(:,2));
end
%fprintf('%d\n', path(1)); % adiciona o primeiro ponto novamente ao final para completar o ciclo

% Passo 8: Imprima a distância total percorrida
fprintf('Distância total percorrida: %f\n', cost);