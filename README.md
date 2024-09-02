
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ME918-Trabalho1

Passos para rodar seu produto:

**1)** Adicione seu banco de dados “.csv” a pasta “entradas”.

**2)** Abra o arquivo “config.yaml” e altere as variáveis como a seguir:

**tabela:** banco_de_dados.csv (nome do arquivo do seu banco de dados)

**dadosjson:** novos_dados.json (nome do arquivo .json que vai adicionar
com os valores das variáveis preditoras que serão utilizadas para gerar
a preditiva. )

O formato deve seguir o seguinte padrão:

\[<br> {“Variavel 1”: valor da variavel 1, “Variavel 2”: valor da
variavel 2, “Variavel n”: valor da variavel n},<br> {“Variavel 1”: valor
da variavel 1, “Variavel 2”: valor da variavel 2, “Variavel n”: valor da
variavel n},<br> {“Variavel 1”: valor da variavel 1, “Variavel 2”: valor
da variavel 2, “Variavel n”: valor da variavel n}<br>\]<br>

**metodo:** “linear” ou “lasso” (tipo de regressão desejada)

**lambda:** número desejado para lambda ou deixe em branco se quiser
fazer a validação cruzada (somente nescessario no caso da regressão
lasso)

**colunas:**<br> **preditiva:** <br> - nome da coluna que deseja
predizer <br> **preditoras:** <br> - nome da variável 1 que deseja
utilizar para predizer a preditiva <br> - nome da variável 2 que deseja
utilizar para predizer a preditiva <br> - nome da variável n que deseja
utilizar para predizer a preditiva <br>

**3)** Abra e rode todas as linhas do arquivo “main.R”.

**4)** Na pasta saída serão encontrados os resultados do seu produto:

\-**grafico_predicoes.pdf** (gráfico dos valores da variável de
interesse do banco de dados comparados aos valores preditos para as
mesmas observações pelo modelo geraddo, com interceptos no eixo x para
as predições das novas observações)

\-**modeloajustado.rds** (o modelo ajustado em formato rds)

\-**predicoes.json** (as predições da variável de interesse para as
novas observações)
