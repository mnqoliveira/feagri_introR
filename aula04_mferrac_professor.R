library(datasets)
ChickWeight
chickwts
as.data.frame(HairEyeColor)

#Explorar conjunto de dados: ChickWeight
str(ChickWeight)
head(ChickWeight)
tail(ChickWeight)

ChickWeight$chick = as.character(ChickWeight$chick)
ChickWeight$diet = as.character(ChickWeight$diet)
str(ChickWeight)
#nome das colunas
colnames(ChickWeight)

#minusculos
tolower(colnames(ChickWeight))

#mudar
colnames(ChickWeight) = tolower(colnames(ChickWeight))

#Quantas dietas diferentes?
unique(ChickWeight$diet)

#Quantos individuos diferentes?
unique(ChickWeight$chick)

#Com quantos dias os pesos dos frangos foram medidos, em geral?
unique(ChickWeight$time)
length(unique(ChickWeight$time))

#Quantos frangos tiveram a dieta 1?
chick_diet = unique(ChickWeight$chick[ChickWeight$diet == 3])
length(chick_diet)

#loop quantos frangos para cada dieta?
dietas = unique(ChickWeight$diet)
for(i in 1:length(dietas)){
  chick_diet = unique(ChickWeight$chick[ChickWeight$diet == i])
  no_frangos = length(chick_diet)
  print(paste('A dieta',i,'teve',no_frangos,'frangos no experimento'))
}

#Qual dieta dava maior ganho de peso para frangos com até 10 dias?
weight10 = ChickWeight[ChickWeight$time == 10,]
medias_weight10 = c()
for(i in 1:length(dietas)){
  chick_diet = weight10[weight10$diet == i,]
  medias_weight10[i] = mean(chick_diet$weight)
}


#Media de peso dos frangos com 21 dias
weight10 = ChickWeight[ChickWeight$time == 10,]
aggregate(weight10$weight, by = list(weight10$diet), mean)

agg_day = function(df,day){
  weight10 = ChickWeight[ChickWeight$time == day,]
  aggregate(weight10$weight, by = list(weight10$diet), mean)
}


#Peso dos frangos por dieta e idade
aggregate(ChickWeight$weight, by = list(ChickWeight$diet,
                                        ChickWeight$time), mean)

##
plot(x=ChickWeight$time,y=ChickWeight$weight)
plot(x=ChickWeight$time[ChickWeight$chick == 1],
     y=ChickWeight$weight[ChickWeight$chick == 1])
plot(x=ChickWeight$time[ChickWeight$chick == 24],
     y=ChickWeight$weight[ChickWeight$chick == 24])

#Plotar varios gráficos de uma vez
chicks_to_plot = c(1,24)
for(i in chicks_to_plot){
  plot(x=ChickWeight$time[ChickWeight$chick == i],
       y=ChickWeight$weight[ChickWeight$chick == i])
}


#contar faltantes por coluna
set.seed(200)
df = data.frame(matrix(data = sample(400,400,replace=TRUE), ncol = 20))
df[df>300] = NA
head(df)

#is.na()
df$X5[2] == 297
df$X5[1] == NA

is.na(df$X5[1])

#numero de na's em uma coluna
sum(is.na(df$X5))

#for em todas as colunas
sum_colunas = c()
for(i in 1:ncol(df)){
  sum_colunas[i] = sum(is.na(df[,i]))
}
names(sum_colunas) = colnames(df)
sum_colunas

sum_linhas = c()
for(i in 1:ncol(df)){
  sum_linhas[i] = sum(is.na(df[i,]))
}
sum_linhas


#apply
apply(df,2,is.na)
colSums(apply(df,2,is.na))
rowSums(apply(df,2,is.na))

# extra -------------------------------------------------------------------
weight21 = ChickWeight[ChickWeight$time == 21,]
aggregate(weight21$weight, by = list(weight21$diet), mean)

aggregate(ChickWeight$weight, by = list(ChickWeight$diet,
                                        ChickWeight$time), mean)

groupedChicks = group_by(weight21,Diet,time)
summarise(groupedChicks, mean(weight))
