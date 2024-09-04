pacotes <- c("yaml", "readr", "glue", "jsonlite", "glmnet", "ggplot2", "vroom")

source("funcoes.R")

instala_pacotes(pacotes)
lapply(pacotes, library, character.only = TRUE)

config = read_yaml("config.yaml")
dados = read_csv(glue("entradas/{config$tabela}"))

source("treinamento.R")
source("predicao.R")
source("grafico.R")

