modelo_lin = function(tabela, preditiva, preditoras){
  regression = glue(preditiva,"~",paste(preditoras,collapse = " + "))
  ajuste = lm(as.formula(regression), data = tabela)
  return(ajuste)
}
modelo_lasso = function(tabela,preditiva,preditoras,lambda){
  x = as.matrix(tabela[,preditoras])
  y = unlist(tabela[,preditiva])
  if (is.null(lambda) == TRUE){
    lambdas = 10^seq(-3, 5, length.out = 100)
    lasso_cv = cv.glmnet(x, y, alpha = 1, lambda = lambdas,
                          standardize = TRUE, nfolds = 10)
    lambda_melhor = lasso_cv$lambda.min
    modelo_cv = glmnet(x, y, alpha = 1,
                       lambda = lambda_melhor, standardize = TRUE)
  } else if (is.null(lambda) == FALSE){
    modelo_cv = glmnet(x, y, alpha = 1, 
                       lambda = lambda, standardize = TRUE)
  }
  return(modelo_cv)
}

modelo_ridge = function(tabela,preditiva,preditoras,lambda){
  x = as.matrix(tabela[,preditoras])
  y = unlist(tabela[,preditiva])
  if (is.null(lambda) == TRUE){
    lambdas = 10^seq(-3, 5, length.out = 100)
    ridge_cv = cv.glmnet(x, y, alpha = 0, lambda = lambdas,
                         standardize = TRUE, nfolds = 10)
    lambda_melhor = ridge_cv$lambda.min
    modelo_cv = glmnet(x, y, alpha = 0,
                      lambda = lambda_melhor, standardize = TRUE)
  } else if (is.null(lambda) == FALSE){
    modelo_cv = glmnet(x, y, alpha = 0, 
                      lambda = lambda, standardize = TRUE)
  }
  return(modelo_cv)
}

instala_pacotes = function(pacotes) {
  pacotes_faltantes <- setdiff(pacotes, rownames(installed.packages()))
  
  if (length(pacotes_faltantes) > 0) {
    install.packages(pacotes_faltantes, dependencies = TRUE, type = "binary")
  }
}
