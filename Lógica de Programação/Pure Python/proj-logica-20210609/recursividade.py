# Sequencia de Fibonacci

def encontra_fibonacci(n):
    if n < 0:
        raise Exception('Valor incorreto!')
    elif n == 1:
        return 0
    elif n == 2:
        return 1
    else:
        # Programação recursiva
        return encontra_fibonacci(n - 1) + encontra_fibonacci(n - 2)

# E quando usamos a Recursividade?

# Muitos problemas têm a seguinte propriedade: cada instância doproblema contém uma instância menor do mesmo problema.
# Dizemos que esses problemas têm estrutura recursiva.

# Para resolver uma instância de um problema desse tipo, podemos aplicar o seguinte método:

# 1 - Se a instância em questão for pequena, resolva-a diretamente;
# 2 - Senão, reduza-a a uma instância menor do mesmo problema;
# 3 - Aplique o método à instância menor;
# 4 - Volte à instância original;

# O programador só precisa mostrar como obter uma solução da instância original
# a partir de uma solução da instância menor; o computador faz o resto.
# A aplicação desse método produz um algoritmo recursivo.

# Somar os número de 1 até n de forma recursiva:


def soma_rec(n):
    if n > 0:
        soma = n + soma_rec(n - 1)
    else:
        soma = 0
    return soma


# Algoritmos recursivos são aplicados em diversas situações como em:
# i) problemas envolvendo manipulações de árvores;
# ii) analisadores léxicos recursivos de compiladores; e
# iii) problemas que envolvem tentativa e erro ("Backtracking").

