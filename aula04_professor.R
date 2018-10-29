# Leitura de Dados --------------------------------------------------------
# Duas funcoes sao usadas para mudar pasta de trabalho, 
# onde o R vai salvar ou carregar arquivos por padr?o

# O getwd() indica qual a pasta atual
getwd()

# O setwd() muda a pasta para uma que voc? queira
#setwd("C:/Users/")

# Para ler arquivos no formato csv:
dados <- read.csv("dataset_meteorologicos.csv")

# Para visualizar os nomes dos atributos (das colunas) :
names(dados)

# Para mostrar as dimensoes:
dim(dados)

# Para mostrar a classe do conjunto de dados:
class(dados)

# Para mostrar o cabecalho do conjunto de dados:
head(dados)

# Para mostrar um resumo do conjunto de dados:
summary(dados)