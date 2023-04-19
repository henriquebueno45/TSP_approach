% Carrega os dados da tabela .CSV (x,y)
data = readmatrix('C:\Users\henri\OneDrive\Área de Trabalho\ModelagemFacil_Trab1\arquivo_modificado.csv');
x = data(:, 1);
y = data(:, 2);

% Calcula a matriz de distâncias
n = length(x);
dist = zeros(n);
for i = 1:n
    for j = 1:n
        dist(i,j) = sqrt((x(i)-x(j))^2 + (y(i)-y(j))^2);
    end
end

% Define a rota inicial
rota = 1:n;
tic;
% Aplica o algoritmo de 2-opt
melhor_custo = Inf;
while true
    for i = 2:n-1
        for j = i+1:n-1
            nova_rota = [rota(1:i-1) rota(j:-1:i) rota(j+1:end)];
            novo_custo = 0;
            for k = 1:n-1
                novo_custo = novo_custo + dist(nova_rota(k), nova_rota(k+1));
            end
            novo_custo = novo_custo + dist(nova_rota(n), nova_rota(1));
            if novo_custo < melhor_custo
                melhor_custo = novo_custo;
                rota = nova_rota;
                break;
            end
        end
        if novo_custo < melhor_custo
            break;
        end
    end
    if novo_custo >= melhor_custo
        break;
    end
end
tempo_decorrido = toc;
% Plota a rota final
disp(['O tempo de execução do script foi de ', num2str(tempo_decorrido), ' segundos.']);
figure(2);
plot(x(rota), y(rota), '-o', 'LineWidth', 2);
axis equal;