# Subset (Lógico e numérico) + If + For

# A seguir ha uma lista de nomes que coincidem com os nomes
# dos matriculados na turma:

nomes <- c("Alice","Sophia","Helena","Laura","Isabella","Manuela",
           "Júlia","Heloísa","Miguel","Arthur","Bernardo",
           "Heitor", "Davi", "Lorenzo", "Pedro", "Gabriel")

## Serao gerados tantos numeros aleatorios entre 0 e 10 quantos 
## nomes ha na variavel "nomes", usando a funcao runif.
## A funcao round arredonda as notas para duas casas decimais

P1 <- round(runif(length(nomes), 0.0, 10.0),2)
P2 <- round(runif(length(nomes), 0.0, 10.0),2)
P3 <- round(runif(length(nomes), 0.0, 10.0),2)

# Para criar um data-frame com as notas, posso usar a funcao cbind
notas_turma <- as.data.frame(nomes, stringsAsFactors = FALSE)
notas_turma <- cbind(notas_turma,P1)