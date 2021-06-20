### Pré-visualização dos Dados

# TREINO: Pré-visualização das primeiras observações:
etl.full %>%
    head() %>%
    tibble(format = "markdown", caption = "Primeiras observações")
print(etl.full)


## Resumo da Importação

### Dimensões
dim(treino) # Dimensões do dataset de treino
dim(teste)  # Dimensões do dataset de teste

### Estrutura
str(titanic) # Estrutura do dataset


## Dicionário de Atributos

# 1    PassengerId: ID
# 2       Survived: Sobrevivência
#                   - 0 = Não
#                   - 1 = Sim
# 3         Pclass: Classe de ingresso | 1 = 1ª, 2 = 2ª, 3 = 3ª
#                   - Uma proxy para o status socioeconômico (SES)
#                   1st = Upper
#                   2nd = Middle
#                   3rd = Lower
# 4           Name: Nome
# 5            Sex: Sexo
# 6            Age: Idade em anos
#                   - A idade é fracionária se menor que 1.
#                   - Se a idade é estimada, está na forma de xx.5
# 7          SibSp: Nº de irmãos / Cônjuges a bordo do Titanic
#                   - O conjunto de dados define as relações familiares
#                     dessa maneira:
#                   Sibling =
#                       - irmão
#                       - irmã
#                       - meio-irmão
#                       - meia-irmã
#                   Spouse =
#                       - marido
#                       - esposa
#                       - (amantes e noivos foram ignorados)
# 8          Parch: Nº de pais / filhos a bordo do Titanic
#                   - O conjunto de dados define as relações familiares
#                     dessa maneira:
#                   Parent =
#                       - mãe
#                       - pai
#                   Child =
#                       - filha
#                       - filho
#                       - enteada
#                       - enteado
#                       Algumas crianças viajavam apenas com uma babá,
#                       portanto:
#                       - Parch = 0 para elas.
# 9         Ticket: Número do bilhete
# 10          Fare: Tarifa de passageiro
# 11         Cabin: Número da cabine
# 12      Embarked: Porto de embarcação
#                   - C = Cherbourg
#                   - Q = Queenstown
#                   - S = Southampton
