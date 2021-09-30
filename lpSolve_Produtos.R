# Carregar o pacote lpSolve
install.packages("lpSolve")
library(lpSolve)

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

# Entrar com os sinais das restrições
constraints_direction <- c("<=", "<=", ">=")

# Entrar com o vetor dos coeficientes de limitação das restrições -> b
b_Vector <- c(2700, 850, 95)
names(b_Vector) <- c("ht","hm","pm")

# Encontrar a solução ótima da função objetivo (lucro total em M$)
optimum <- lp("max", c_Vector, A_Matrix, constraints_direction, b_Vector, compute.sens=TRUE)

# Apresentar o resultado da otimização
if(optimum$status==0) print("Sucesso. Solução encontrada") else print("Não há solução viável")
best_sol <- optimum$solution
names(best_sol) <- c("x1","x2") 
print(best_sol)
print(paste("Lucro total em M$: ", optimum$objval, sep=""))

# Análise de sensibilidade do "dual price" ou "shadow price"
duals_result <- optimum$duals
names(duals_result) <- c("ht","hm","pm","x1","x2")
print(duals_result)
