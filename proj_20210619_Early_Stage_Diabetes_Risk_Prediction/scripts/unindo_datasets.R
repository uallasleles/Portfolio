# Criando variável para distinção dos dados
etl.trn <- treino
etl.tst <- teste

etl.trn$idx <- 0
etl.tst$idx <- 1

# Unindo os datasets de treino e teste
diabetes <- rbind( etl.trn[ ,colnames(etl.tst)],
                  etl.tst )

# Transformando em fator a variável criada
titanic$idx <- factor(titanic$idx, labels = c("treino", "teste"))

etl.full <- titanic
