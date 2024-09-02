library(readr)
library(glue)
library(vroom)
library(jsonlite)
library(yaml)
config = read_yaml("config.yaml")
source("funcoes.R")
dados = read_csv(glue("entradas/{config$tabela}"))
if (config$metodo == "linear"){
  resultado = modelo_lin(dados,config$colunas$preditiva,config$colunas$preditoras)
  saveRDS(resultado, file = "saidas/modeloajustado.rds")
} else if (config$metodo == "lasso"){
  resultado = modelo_lasso(dados,config$colunas$preditiva,
                           config$colunas$preditoras,config$lambda)
  saveRDS(resultado, file = "saidas/modeloajustado.rds")
}
