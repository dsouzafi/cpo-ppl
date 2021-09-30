# Carregar o pacote lpSolve
install.packages("linprog")
library(linprog)

## Entrar com o vetor dos coeficientes da função objetivo -> c
c_Vector <- c(20, 60)
names(c_Vector) <- c("x1","x2")

# Entrar com a matriz dos coeficientes das variáveis nas restrições -> A
A_Matrix <- rbind(
  c(30, 20),  # restrição: horas de trabalho (ht)
  c(5, 10),   # restrição: horas de máquina (hm)
  c(1, 1)     # restrição: produção mínima (pm)
)
rownames(A_Matrix) <- c("ht","hm","pm")
colnames(A_Matrix) <- c("x1","x2")

# Entrar com o vetor dos coeficientes de limitação das restrições -> b
b_Vector <- c(2700, 850, 95)
names(b_Vector) <- c("ht","hm","pm")

# Rodar a função para obter os resultados da otimização
solveLP(c_Vector, b_Vector, A_Matrix, TRUE, const.dir = c("<=", "<=", ">="))
