# Função para cálculo da moda.
moda <- function(dados)
{
    vetor = table(as.vector(dados))
    m = names(vetor)[vetor == max(vetor)]
    return(m)
}

# Função para criar a Tabela de Distribuição de Frequências
dist_freq <- function(v){

    # Tabela de Contingência
    t <- table(v)

    # Adiciona linha de soma
    data.frame(cbind("Freq. Absoluta" = addmargins(t),
                     "Freq. Relativa" = addmargins(round(prop.table(t), 2)),
                     "% Freq. Relat." = addmargins(round(prop.table(t)*100, 2))))

}

# ====================================================
# Outros códigos em desenvolvimento ou descontinuados
# ====================================================
#
# Distribuição de Frequências: Variáveis Quantitativas
# for(i in 1:ncol(treino)){
#     if(is.numeric(treino[,i])){
#
#         observ = treino[,i] # Observações
#         min_obs = min(observ)
#         max_obs = max(observ)
#
#         # 1 - Fórmula para calcular o número de classes
#         num_cls <- round(1+3.22*log10(nrow(as.array(observ))))
#
#         # 2 - Fórmula para calcular a largura da classe
#         lrg_cls = round(diff(range(observ))/num_cls)
#
#         # 3 - Contruindo os intervalos de classe
#         brk = seq(round(min_obs), round(max_obs)+lrg_cls, lrg_cls)
#
#         # 4 - Criando o vetor com os nomes dos intervalos de classe
#         cls <- as.character()
#         for(i in 1:length(brk)-1){
#             cls <- c(cls, sprintf("%d - %d", brk[i], brk[i+1]-1))
#         }
#
#         # 5 - Criando a tabela de distribuição de frequências
#         cut(observ , breaks = brk, right = FALSE, labels = cls) %>%
#             dist_freq() -> d
#         print(d)
#     }
# }

# Função para calcular a moda da idade por grupos, com o objetivo de fazer imputação de dados nas observações com idade missing.
# age_calc = function(ds)
# {
#     ds_com_age <- subset(ds, !is.na(Age))
#     ds_sem_age <- subset(ds, is.na(Age))
#
#     for(idx_sex in levels(ds$Sex)){
#
#         filtro_sex1 <- subset(ds_com_age, Sex == idx_sex)
#         filtro_sex2 <- subset(ds_sem_age, Sex == idx_sex)
#
#         for(idx_sib in levels(ds$SibSp))
#         {
#             filtro_sib1 <- subset(filtro_sex1, SibSp == idx_sib)
#             filtro_sib2 <- subset(filtro_sex2, SibSp == idx_sib)
#
#             for(idx_par in levels(ds$Parch))
#             {
#                 filtro_par1 <- subset(filtro_sib1, Parch == idx_par)
#                 filtro_par2 <- subset(filtro_sib2, Parch == idx_par)
#
#                 if(nrow(filtro_par1) > 0){
#                     moda_age <- round(mean(as.numeric(moda(filtro_par1$Age))), 2)
#                     for(i in unique(unlist(rownames(filtro_par2)))){
#                         ds_sem_age[i,"Age"] <- moda_age
#                     }
#                 }
#                 else{
#                     if(nrow(filtro_sib1) > 0){
#                         moda_age <- round(mean(as.numeric(moda(filtro_sib1$Age))), 2)
#                         for(i in unique(unlist(rownames(filtro_par2)))){
#                             ds_sem_age[i,"Age"] <- moda_age
#                         }
#                     }
#                     else{
#                         if(nrow(filtro_sex1) > 0){
#                             moda_age <- round(mean(as.numeric(moda(filtro_sex1$Age))), 2)
#                             for(i in unique(unlist(rownames(filtro_par2)))){
#                                 ds_sem_age[i,"Age"] <- moda_age
#                             }
#                         }
#                     }
#                 }
#             }
#         }
#     }
#     return(ds_sem_age$Age)
# }


