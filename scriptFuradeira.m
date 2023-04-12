% Passo 1: Importe os dados do arquivo CSV
data = readmatrix('C:\Users\henri\OneDrive\Área de Trabalho\ModelagemFacil_Trab1\arquivo_modificado.csv');

% Passo 2: Crie a matriz de adjacência
distances = pdist2(data, data);
adj_matrix = distances;
adj_matrix(adj_matrix < 0) = 0;
adj_matrix(adj_matrix > 0) = 1;
adj_matrix = adj_matrix - diag(diag(adj_matrix));


% Passo 3: Use a função tspsearch para encontrar o menor caminho que percorre todos os pontos
[path, ~] = tspsearch(adj_matrix, 1);



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
    fprintf('Ponto %d: (%f, %f)\n', point, x, y);
end

