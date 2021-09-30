# Carregar o pacote lpSolve
install.packages("lpSolve")
library(lpSolve)

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

# Entrar com os sinais das restrições
constraints_direction <- c("<=",">=","<=","<=","<=",">=","<=","<=",">=","<=")

# Entrar com o vetor dos coeficientes de limitação das restrições -> b
b_Vector <- c(5000, 500, 0, 0, 0, 300, 900, 0, 100, 2500)
names(b_Vector) <- c("r1","r2","r3","r4","r5","r6","r7","r8","r9","r10")

# Encontrar a solução ótima da função objetivo (ROI)
optimum <- lp("max", c_Vector, A_Matrix, constraints_direction, b_Vector, compute.sens=TRUE)

# Apresentar o resultado da otimização
if(optimum$status==0) print("Sucesso. Solução encontrada") else print("Não há solução viável")
best_sol <- optimum$solution
names(best_sol) <- c("x1","x2","x3","x4","x5") 
print(best_sol)
print(paste("ROI em K$: ", optimum$objval, sep=""))

# Análise de sensibilidade do "dual price" ou "shadow price"
duals_result <- optimum$duals
names(duals_result) <- c("r1","r2","r3","r4","r5","r6","r7","r8","r9","r10","x1","x2","x3","x4","x5")
print(duals_result)
