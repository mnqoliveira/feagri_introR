# Tools > Global Options > Code >
# Editing:
# Insert spaces for tab
# Insert matching parens/quotes
# Auto-indent code after paste
# Vertically align arguments
# Soft-wrap R source files
# Continue comment when inserting new line
# 
# Display:
# Highlight selected word
# Highlight selected line
# Show line numbers
# Show margin (70)
# 
# Completion:
# Show code completions: Automatically
# Allow automatic completions in console
# Insert parentheses after function completions
# Show help tooltip after function completions

#Os comentarios estao sem acento para nao haver corrupcao quando
#por acaso o arquivo for transferido para algum PC com padrao
#de codificacao diferente

#Para as mensagens de erro aparecerem em ingles, digitem no console
Sys.setenv(LANG = "en")

#Deste modo voce pode buscar a mensagem exata no Google para tentar
#resolver seus problemas

# Informacoes basicas -----------------------------------------------------
# O R faz operacoes matematicas simples:
1 + 2

# Armazena informacoes em variaveis:
a <- 25
b <- 'a'
c <- TRUE

# Um vetor eh uma sequencia de elementos do mesmo tipo.
# Para declarar um vetor, utiliza-se a funcao c(), 
# de "concatenate":
x <- c(2,7,5)

# Para imprimir uma variavel ja declarada, basta digita-la 
# no prompt:
a
b
x

# Existe diferenca entre maiusculas e minusculas!
A <- 15
Aa <- a + A

a
A
Aa

# Para visualizar todas as variaveis declaradas, 
# usa-se a funcao ls()
ls()

# Para remover uma ou mais variaveis declaradas, 
# usa-se a funcao rm()
rm(b) #remove uma
rm(c,x,b) #remove mais de uma variavel
# rm(list = ls()) remove todas as variaveis armazenadas
# Nao executar a linha anterior porque eu nao quero remover uma das
# variaveis

ls() #note que somente a variavel a continua armazenada

# E para fazer comentarios, usa-se a cerquilha (#)

# Tipos de dados ----------------------------------------------------------
# A funcao "class()" eh utilizada para saber qual eh a 
# classe de determinada variavel.

# LOGICAL
y <- TRUE # Verdadeiro. Pode-se usar a abreviacao T:
class(y)

y <- FALSE # Falso.Pode-se usar a abreviacao F:
class(y)

# NA
y <- NA # Not available. 
# Utilizada para quando o conjunto de dados tem valores faltantes
# O 0 nao vai servir sempre como valor faltante porque ele tem um
# significado numerico
class(y)

# NUMERIC
y <- 2  # Numerico
class(y)

y <- 2.5 # Numerico
class(y)

y <- 2L # Inteiro.
class(y)
# Ou seja, todo inteiro eh numerico, mas nem sempre um numerico 
# eh inteiro!

# CHARACTER
y <- "texto"
class(y)

# Lembrando que vetores so podem armazenar o mesmo tipo de variavel
# Se voce insere tipos diferentes em um vetor, o R forca tudo a ser 
# do mesmo tipo, de acordo com os criterios dele
x <- c('a', 1, 2)
class(x)
x

x <- c(TRUE, 1, 1)
class(x)
x

# A funcao "is.___" permite confirmar o tipo da variavel
b <- 12
is.numeric(b)
is.character(b)

# A saida da funcao e um valor logico (T ou F). Este tipo de funcao eh
# util se voce pretende fazer um teste logico

# Outra forma de criar um vetor eh gerando uma sequencia:
y <- seq(from = 4, length = 3, by = 3)

y

# Caso voce tenha duvida sobre quais sao os parametros ou 
# como utilizar uma funcao, basta inserir o simbolo "?" 
# que uma janela de ajuda sera aberta:
?seq

# Se voce mantiver a ordem indicada no padrao da funcao,
# nao precisa nomear cada parametro todas as vezes
# Nomear te permite mudar a ordem
#seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),length.out = NULL, along.with = NULL, ...)

x <- seq(from = 1, to = 10, by = 2)
x

y <- seq(1, 10, 2)
y

z <- seq(to = 10, from = 1, by = 2)
z

# Os parametros que estiverem vazios, o R preenche com o padrao da
# funcao.

# Para nomear as variaveis em um vetor, ha algumas formas:

## 1) Durante a criacao do vetor
temp_campinas_1 <- c("seg" = 25, "ter" = 27, 
                     "qua" = 32, "qui" = 30, "sex" = 25)
temp_campinas_1

## 2) Apos a criacao do vetor
temperaturas <- c(25, 27, 32, 30, 25)
temp_campinas_2 <- temperaturas
temp_campinas_2

names(temp_campinas_2) <- c("seg","ter",
                            "qua","qui","sex")
temp_campinas_2

# Ou ainda:
temp_campinas_3 <- temperaturas

dias_semana <- c("seg","ter","qua","qui","sex")
names(temp_campinas_3) <- dias_semana
temp_campinas_3

# Muitas coisas em R podem ser feitas de varios jeitos. Nao se 
# surpreenda se voce fez algo diferente e funcionou.

# Operacoes aritmeticas com vetores sao realizadas "element-wise", ou seja,
# elemento por elemento:
x <- c(1,2,3) # Vetor x
y <- c(4,5,6) # Vetor y

# Soma dos vetores (elemento por elemento)
x+y

# Divisao dos vetores (elemento por elemento)
x/y

# Exponenciacao dos vetores (elemento por elemento)
x^y

# Se os vetores tiverem comprimentos distintos, o R repete o menor,
# mantendo a ordem os elementos
y <- c(4,5,6,7,8,9)

x+y

# Caso a operacao seja entre um vetor e um escalar:
a <- 5
x

a+x # Cada elemento do vetor eh, neste caso, somado 
# ao escalar e analogo para as demais operacoes!

# Para operacoes entre vetores, os operadores sao diferentes,
# por exemplo:
x <- c(2,2)
y <- c(1,2)
x%*%t(y)

# Selecao em conjunto de dados --------------------------------------------
x <- 1:3

# Para selecionar UM elemento do vetor x 
# (apenas o 2o elemento, por exemplo):
x[2]

# Para selecionar MULTIPLOS elementos do vetor x 
#(do 2o ao 3o elemento, p.e.):
# O : age como o 'ao'. Ele estabelece um comecando no primeiro numero
# e terminando no segundo.
x[2:3]

# Para selecionar todos os elementos de x, com EXCECAO de UM:
## (nao selecionar o 2o elemento, p.e.)
x[-2]

# Para selecionar todos os elementos de x, com EXCE??O de 
#DOIS OU MAIS:
## (nao selecionar o 1o e 2o elemento, p.e.)
x[-c(1,2)]

# Matrizes e data-frames --------------------------------------------------

# Uma matriz eh um conjunto de vetores;
# Um vetor eh uma sequencia de elementos do mesmo tipo;
# Logo, uma matriz possui elementos DO MESMO TIPO!!!

# Para criar uma matriz, utiliza-se a funcao matrix()
## matrix (quais_elementos, num_linhas, num_colunas)
?matrix

z <- matrix(seq(1,12),nrow = 4, ncol = 3)
# Por padrao, os elementos sao preenchidos column-wise, 
# ou seja, uma coluna por vez
z

# Para selecionar elementos de uma matriz:
## nome_matriz [num_linhas, num_colunas]
z[3:4,2:3]

## Para selecionar todas as linhas da matriz E mais de uma coluna:
z[,2:3]

## Para selecionar todas as linhas da matriz E uma coluna:
### saida em uma linha
z[,1]

# Para mostrar as dimens?es da matriz:
dim(z) #numero de linhas, numero de colunas

# Um data-frame eh uma matriz que admite mais de um tipo de dados
x <- c("Monique", "Matheus", "Lique")
class(x)
y <- c(9, 9, 10)
class(y)
z <- c(TRUE, FALSE, TRUE)
class(z)

avaliacao <- data.frame(x,y,z, stringsAsFactors = FALSE)
avaliacao

# Se eu der nome as colunas, eu consigo trabalhar com cada uma delas
# pelo nome, sem que eu tenha que saber sua posicao no data-frame
colnames(avaliacao) <- c("nome", "nota", "presenca")
avaliacao

avaliacao$nota
avaliacao$presenca

# Eh possivel inserir colunas novas depois
avaliacao$nota2 <- c(8, 9, 10)
avaliacao$nota3 <- c(9, 8, 10)

avaliacao

# Eh possivel operar com os dados das colunas
media_p3 <- mean(avaliacao$nota3)
media_p3

# Para inserir linhas novas, eu crio um data-frame novo com as linhas
# novas. Al?m disso, devo atribuir o mesmo nome de colunas ANTES 
# de juntar os dois data-frames, com o comando rbind.

aluno_novo <- data.frame("Rafaella", 9, FALSE, 9, 9, 
                         stringsAsFactors = FALSE)
colnames(aluno_novo) <- colnames(avaliacao)
aluno_novo

avaliacao <- rbind(avaliacao,aluno_novo)
