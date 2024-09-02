library(jsonlite)

config = read_yaml("config.yaml")

modelo = readRDS("saidas/modeloajustado.rds")

novos_dados = fromJSON("entradas/novos_dados.json")
X_novos = as.data.frame(novos_dados)

if (inherits(modelo, "lm")) {
  predicoes = predict(modelo, newdata = X_novos)
} else if (inherits(modelo, "glmnet")) {
  X_novos_matrix = as.matrix(X_novos)
  predicoes = predict(modelo, newx = X_novos_matrix, type = "response")
}

write_json(predicoes, "saidas/predicoes.json")
