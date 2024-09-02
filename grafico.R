

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

ggplot(dados, aes(x = predicoes_dados, y = dados[[config$colunas$preditiva]])) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "red") +
  labs(x = "Valores Preditos", y = "Valores Observados") +
  geom_ribbon(aes(ymin = predicoes_dados - 1.96*sd(predicoes_dados), 
                  ymax = predicoes_dados + 1.96*sd(predicoes_dados)), 
              alpha = 0.05, fill = "blue") +
  theme_minimal()

ggsave("saidas/grafico_predicoes_ic.pdf")

ggplot(dados, aes(x = predicoes_dados, y = dados[[config$colunas$preditiva]] - predicoes_dados)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(x = "Valores Preditos", y = "Resíduos") +
  theme_minimal()


ggsave("saidas/grafico_predicoes_residuos.pdf")
