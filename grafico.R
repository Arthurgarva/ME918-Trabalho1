library(ggplot2)
library(glue)
predicoes <- predict(modelo, newdata = dados)

ggplot(dados, aes(x = predicoes, y = dados[[config$colunas$preditiva]])) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "red") +
  labs(x = "Valores Preditos", y = "Valores Observados") +
  theme_minimal()

ggsave("saidas/grafico_predicoes.pdf")
