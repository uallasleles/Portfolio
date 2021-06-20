source(file = "scripts/set_wd.R")

source(file = "scripts/packages.R")

source(file = "scripts/functions.R")

source(file = "scripts/ds_load.R")

source(file = "scripts/unindo_datasets.R")

source(file = "scripts/peek_data.R")


"Através da *Matriz de Confusão* obtivemos a Acurácia de ***`r round((cm$table[1,1] + cm$table[2,2]) / (cm$table[1,1] + cm$table[1,2] + cm$table[2,1] + cm$table[2,2]) * 100, 2)`%***, ela corresponde a fração das premissas corretas em relação ao total de observações. Esta métrica também poderia ser calculada utilizando a função *table()* ou a função *CrossTable()*, pois ela corresponde a soma das predições corretas dividida pelo total de observações.
Porém, não é suficiente (e nem segura) para avaliarmos a eficiência do modelo. Analisamos então, outras métricas obtidas pela Confusion Matrix, que nos informe não apenas o percentual de acertos, mas também a precisão e a sensibilidade."


***95% CI***

    O ***Intervalo de Confiança***, denotado por *95% CI*, é ***[`r round(cm$overall["AccuracyLower"], 4)`, `r round(cm$overall["AccuracyUpper"], 4)`]***. Ele é uma *estimativa por intervalo* de um *parâmetro populacional*, que com dada frequência (*Nível de Confiança*), inclui o parâmetro de interesse. Nesse caso específico, significa dizer que 95% dos *intervalos de confiança* observados têm o valor real do parâmetro.
