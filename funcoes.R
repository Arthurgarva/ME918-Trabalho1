modelo = function(tabela, preditiva, preditoras){
  regression =glue(preditiva,"~",paste(preditoras,collapse = " + "))
  ajuste = lm(as.formula(regression), data = tabela)
  return(ajuste)
}
