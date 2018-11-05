library(datasets)
ChickWeight
chickwts
as.data.frame(HairEyeColor)

#Explorar conjunto de dados: ChickWeight
str(ChickWeight)
head(ChickWeight)
tail(ChickWeight)

ChickWeight$Chick = as.character(ChickWeight$Chick)
ChickWeight$Diet = as.character(ChickWeight$Diet)
str(ChickWeight)
#Quantas dietas diferentes?
unique(ChickWeight$Diet)

#Quantos individuos diferentes?
unique(ChickWeight$Chick)

#Com quantos dias os pesos dos frangos foram medidos, em geral?
unique(ChickWeight$Time)
length(unique(ChickWeight$Time))

#Quantos frangos tiveram a dieta 1?
chick_diet = unique(ChickWeight$Chick[ChickWeight$Diet == 3])
length(chick_diet)

#loop quantos frangos para cada dieta?
dietas = unique(ChickWeight$Diet)
for(i in 1:length(dietas)){
  chick_diet = unique(ChickWeight$Chick[ChickWeight$Diet == i])
  no_frangos = length(chick_diet)
  print(paste('A dieta',i,'teve',no_frangos,'frangos no experimento'))
}

#Qual dieta dava maior ganho de peso para frangos com até 10 dias?
weight10 = ChickWeight[ChickWeight$Time == 10,]
medias_weight10 = c()
for(i in 1:length(dietas)){
  chick_diet = weight10[weight10$Diet == i,]
  medias_weight10[i] = mean(chick_diet$weight)
}


#Media de peso dos frangos com 21 dias
weight10 = ChickWeight[ChickWeight$Time == 10,]
aggregate(weight10$weight, by = list(weight10$Diet), mean)

agg_day = function(df,day){
  weight10 = ChickWeight[ChickWeight$Time == day,]
  aggregate(weight10$weight, by = list(weight10$Diet), mean)
}


#Peso dos frangos por dieta e idade
aggregate(ChickWeight$weight, by = list(ChickWeight$Diet,
                                        ChickWeight$Time), mean)

##
plot(x=ChickWeight$Time,y=ChickWeight$weight)
plot(x=ChickWeight$Time[ChickWeight$Chick == 1],
     y=ChickWeight$weight[ChickWeight$Chick == 1])
plot(x=ChickWeight$Time[ChickWeight$Chick == 24],
     y=ChickWeight$weight[ChickWeight$Chick == 24])

chicks_to_plot = c(1,24)
for(i in chicks_to_plot){
  plot(x=ChickWeight$Time[ChickWeight$Chick == i],
       y=ChickWeight$weight[ChickWeight$Chick == i])
}



weight21 = ChickWeight[ChickWeight$Time == 21,]
aggregate(weight21$weight, by = list(weight21$Diet), mean)

aggregate(ChickWeight$weight, by = list(ChickWeight$Diet,
                                        ChickWeight$Time), mean)

groupedChicks = group_by(weight21,Diet,Time)
summarise(groupedChicks, mean(weight))
