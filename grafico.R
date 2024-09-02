

if (inherits(modelo, "lm")) {
  predicoes_dados = predict(modelo, newdata = dados[,config$colunas$preditoras])
} else if (inherits(modelo, "glmnet")) {
  X_novos_matrix = as.matrix(X_novos)
  predicoes_dados = predict(modelo, newx = as.matrix(dados[,config$colunas$preditoras])
                      , type = "response")
}

ggplot(dados, aes(x = predicoes_dados, y = dados[[config$colunas$preditiva]])) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "red") +
  labs(x = "Valores Preditos", y = "Valores Observados") +
  geom_vline(xintercept = predicoes, color = "navy") +
  theme_minimal()

ggsave("saidas/grafico_predicoes.pdf")
