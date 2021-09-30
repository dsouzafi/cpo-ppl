# Carregar o pacote lpSolve
install.packages("linprog")
library(linprog)

## Entrar com o vetor dos coeficientes da função objetivo -> c
c_Vector <- c(0.07, 0.03, 0.15, 0.12, 0.05)
names(c_Vector) <- c("x1","x2","x3","x4","x5")

# Entrar com a matriz dos coeficientes das variáveis nas restrições -> A
A_Matrix <- rbind(
  c(1, 1, 1, 1, 1),
  c(1, 0, 0, 0, 0),
  c(-0.05, 0.95, -0.05, -0.05, -0.05),
  c(0.5, 0.5, -0.5, -0.5, 0.5),
  c(0, 0, -2.5, 1, 0),
  c(0, 0, 1, 0, 0),
  c(0, 0, 1, 0, 0),
  c(-0.15, -0.15, -0.15, -0.15, 0.85),
  c(0, 0, 0, 0, 1),
  c(2, 0.3, 1.8, 0.9, 2)
)
rownames(A_Matrix) <- c("r1","r2","r3","r4","r5","r6","r7","r8","r9","r10")
colnames(A_Matrix) <- c("x1","x2","x3","x4","x5")

# Entrar com o vetor dos coeficientes de limitação das restrições -> b
b_Vector <- c(5000, 500, 0, 0, 0, 300, 900, 0, 100, 2500)
names(b_Vector) <- c("r1","r2","r3","r4","r5","r6","r7","r8","r9","r10")

# Rodar a função para obter os resultados da otimização
solveLP(c_Vector, b_Vector, A_Matrix, TRUE, const.dir = c("<=",">=","<=","<=","<=",">=","<=","<=",">=","<="))
