library(readr)
library(glue)
library(vroom)
library(jsonlite)
library(yaml)
config = read_yaml("config.yaml")
source("funcoes.R")
dados = read_csv(glue("entradas/{config$tabela}"))
if (config$metodo == "linear"){
  resultado = modelo(dados,config$colunas$preditiva,config$colunas$preditoras)
  saveRDS(resultado, file = "saidas/modeloajustado.rds")
}
