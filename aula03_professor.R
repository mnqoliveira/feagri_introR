# Arquivo (read, write, save, load), bibliotecas, funções, apply, e gráficos

# O arquivo classico que nos vamos ler usando o R eh o arquivo de texto. Ele
# pode e provavelmente vai ser uma tabela, mas eh menos custoso salvar dados
# na forma de texto do que em uma planilha do excel. Nao sei voces, mas quando
# eu fiz FA576, nos comprimiamos uns 20 cilindros de batata e o resultado vinha
# sob a forma de texto. Como eu posso ler esse texto usando o R? As funcoes
# para ler este tipo de arquivo geralmente vem na forma read.FORMATO.

# A funcao read.table le um arquivo em formato tabular salvo como texto. 
# Ao inspecionarmos o arquivo, vemos que temos que pular varias linhas ate
# chegarmos ate a tabela. Eu tive que especificar que o separador de colunas eh
# a tabulacao. Normalmente, nos temos que lidar com virgula ou ponto e virgula.
amostra_1 <- read.table(file = "./batatinha_full/BAT1",
                        skip = 8, header = TRUE, sep = "\t")
head(amostra_1)

# str eh outra funcao que eh usada para discriminar os tipos das variaveis, em
# particular dentro de um data-frame.
str(amostra_1)

# Ele salvou tudo como char porque nos nao indicamos que o separador decimal
# eh virgular, entao ele leu como texto.
amostra_1 <- read.table(file = "./batatinha_full/BAT1",
                        skip = 8, header = TRUE, sep = "\t", dec = ",")
head(amostra_1)
str(amostra_1)

# Eu posso fazer um loop para ler todos os arquivos da pasta e colocar uma 
# coluna adicional indicando qual a amostra a que aqueles dados se referem
# Esse exemplo nao eh trivial, mas ele nao usa quase nada que a gente nao
# tenha visto ate agora

lista_arquivos <- list.files("./batatinha_full/", full.names = TRUE)
arquivos <- list.files("./batatinha_full/")
conjunto_total <- data.frame()

for (i in 1:length(lista_arquivos)){
  
  temp <- read.table(lista_arquivos[i],
                     skip = 8, header = TRUE, sep = "\t", dec = ",")
  temp$arquivo <- arquivos[i]
  conjunto_total <- rbind(conjunto_total, temp)
  
}

head(conjunto_total)

# E para salvar, eu posso usar o formato mais classico que eh o csv. De modo
# analogo ao texto, eu preciso informar qual variavel e qual o caminho. As 
# funcoes read leem e as funcoes write escrevem.

write.csv(conjunto_total, file = "conjunto_total.csv")

# As vezes os objetos que nos queremos salvar nao sao textos. Eu posso querer 
# salvar uma informacao mais complexa, por exemplo, um modelo de regressao 
# linear.

x <- 1:10
y <- 2*x

objeto_complexo <- lm(x ~ y)

save(objeto_complexo, file = "./objeto_complexo.RData")
rm(objeto_complexo)
load("./objeto_complexo.RData")

# Existem bibliotecas tambem - e eu nao havia falado delas ate agora, mas 
# invariavelmente a experiencia de qualquer um no R envolve usar bibliotecas -
# que auxiliam por exemplo na leitura de arquivos xlsx. Nos falamos brevemente
# sobre bibliotecas quando mencionamos o swirl. A ideia da biblioteca eh que 
# alguem provavelmente ja programou funcoes que vao facilitar o que voce quer
# fazer.

install.packages("readxl")
library("readxl")
diametros <- read_xls(path = "./fa576-ap1.xls", sheet = 1, skip = 2)
head(diametros)

# Como eu posso fazer o grafico dos dados que eu li? A forma classica eh com 
# a funcao plot.

plot(amostra_1$s, amostra_1$kgf)
plot(amostra_1$s[amostra_1$kgf > -5], amostra_1$kgf[amostra_1$kgf > -5])
# Se eu quiser adicionar os dados da amostra_2?
amostra_2 <- conjunto_total[conjunto_total$arquivo == "BAT2", ]
points(amostra_2$s[amostra_2$kgf > -5], amostra_2$kgf[amostra_2$kgf > -5])

# Claramente eu preciso formatar um pouco este plot
plot(amostra_1$s[amostra_1$kgf > -5], amostra_1$kgf[amostra_1$kgf > -5],
     ylim = c(-2, 11),
     xlab = "time", ylab = "stress")
points(amostra_2$s[amostra_2$kgf > -5], amostra_2$kgf[amostra_2$kgf > -5],
       col = "blue")



t0=Sys.time()
df = read.csv('~/data/AirQualityUCI/air_quality.csv')
t1=Sys.time()
t1-t0

nums = df[,3:15]
vec = vector()
for(i in 1:13){
  vec[i] = mean(nums[,i])
}

apply(nums,2,mean)

#Criar subset do iris com as linhas pares

#write o subset

#abrir no excel

#noção de médias por coluna
#usando for e usando apply
#fazer subset por espécie
#analogia de 30 linhas com 2039402943012943 linhas