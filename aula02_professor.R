# Subset (lógico e numérico), condicionais e loops

# Alguns conjuntos de dados ja acompanham a base do R, entao nos podemos
# trabalhar com eles enquanto nao usamos os nossos. No caso, vamos
# usar o conjunto iris. Este conjunto eh classico na estatistica e trata-se
# de comprimento e largura de petalas e sepalas da flor iris, de tres
# especies distintas.
dados <- iris
View(dados)
class(dados)

# Nos ja vimos como acessar uma coluna de um dataframe e, alem das operacoes
# entre colunas, nos podemos fazer operacoes cujo resultado eh do tipo
# logico.
dados$Sepal.Length > 5
dados$Species == "setosa"
dados$Sepal.Length > 5 & dados$Species == "setosa"

# Nos podemos explorar esse resultado logico tambem para fazer subsets. Se eu
# quiser operar apenas com as linhas do conjunto de dados para as quais uma 
# condicao eh verdadeira, mas sem que eu saiba de antemao quais linhas sao
# essas, eu posso ao mesmo tempo descobrir quais linhas sao e fazer o subset
View(dados[dados$Sepal.Length > 5, c("Species", "Petal.Length")])
View(dados[dados$Sepal.Length > 5 & dados$Species == "setosa", "Petal.Length"])


# Deixando de lado por um momento o subset usando condicoes logicas, vamos 
# trabalhar rapidamente com condicionais. Voces lembram do 'if' de MC. O R
# tambem tem ifs.

a <- 15
b <- 10
if (a > b){
  print("a eh maior do que b")
}

# O if-else tambem existe e eh parecido.
if (a < b){
  print("a eh maior do que b")
} else {
  print("b eh maior do que a")
}

# E se eu quiser fazer para todo um dataframe?

if(dados$Species == "setosa"){
  dados$Sepal.Length <- dados$Sepal.Length + 10
}

# Atencao a mensagem de alerta!!! Apesar de o R ter executado (Warning 
# significa que ele executou, apesar de ter detectado um problema), esse nao
# eh o resultado que queremos. O if soh recebe um valor logico por vez! Esse
# eh um erro bem comum e por isso estou chamando a atencao pra ele. Uma
# forma de consertar eh usar o subset logico que foi apresentado.

dados$Sepal.Length[dados$Species == "setosa"] <- dados$Sepal.Length + 10
View(dados)

# Outra forma de contornar essa situacao eh usando loops. A melhor forma eh a 
# que explora a estrutura tabular dos dados, ao inves da que passa valor por
# valor, mas eu estou usando o contexto para apresentar o loop. O loop eh
# util, mas uma das grandes vantagens do R eh quando nos conseguimos fugir dele.
# Na proxima aula vamos apresentar outra forma de fugir do loop.

for(i in 1:nrow(dados)){
  if(dados$Species == "setosa"){
   
    dados$Sepal.Length <- dados$Sepal.Length + 10
     
  }
}