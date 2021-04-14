871*1.21
precio <- 871*1.21

dado<-c(1,2,3,4,5,6)

dado + dado
dado * 2
dado / 2
dado%*%dado
typeof(dado)
dado2<-c(1L,2L,3L,4L,5L,6L)
typeof(dado2)

coin<-c("H","T")

a<-c(TRUE, FALSE, TRUE)
a<-c(1<2,1>2,2<3)
# Es lo mismo
c<-1<2 & 2<1

b<-c(factor("A"), factor("B"))

sqrt(2)^2-2
# vemos precision de 16 decimales


mano1<-c("ReyCopas","AsBastos","AsEspadas","AsOros")
mano2<-c("AsCopas","ReyBastos","ReyEspadas","ReyOros")
typeof(mano)
partida<-rbind(mano1,mano2)
partidac<-cbind(mano1,mano2)

partida
partidac

colnames(partidac)
colnames(partida)

rownames(partidac)<-c("c1","c2","c3","c4")
partidac
mano1[1]
partidac[1,1]
partidac[,1]
partidac[1,]


partidac[1,1]<-"ReyOros"
partidac

moneda<-c("H","T")
moneda
premio<-c(1,-1)
juego<-data.frame(moneda,premio)
juego$moneda

juego$premio
sum(juego$premio)
sum(juego[,2])


x<-c(1:10)
y<-x**2
gender<-factor(c(rep("M",5),rep("F",5)))


summary(lm(y~x+gender)) #No se lo que es

baraja<-list(
  c(1:10),
  c("Oros","Espadas","Bastos","Copas"),
  c(11,0,10,0,0,0,0,2,3,4)
)

names(baraja)<-c("num","palos","puntuacion")


baraja<-list(
  num=1:10,
  palos=c("Oros","Espadas","Bastos","Copas"),
  puntuacion=c(11,0,10,rep(0,4),2,3,4)
)


baraja

baraja.df<-data.frame(
  num = rep(baraja$num,4),
  palo = c(rep(baraja$palos[1],10), rep(baraja$palos[2],10), rep(baraja$palos[3],10), rep(baraja$palos[4],10)),
  punt = rep(baraja$puntuacion,4)
)

baraja.df<-data.frame(
  num = rep(baraja[[1]],4),
  palo = rep(baraja$palos,each=10),
  punt = rep(baraja$puntuacion,4)
)


View(baraja.df)

sum(baraja.df$punt)

throw<-function(dado){
  return(sample(dado,1))
}

throw(dado)

v<-numeric()

for (i in 1:100000){
  v[i]<-throw(dado)
}
hist(v)

baraja.df[,-1]
baraja.df$num==1

which(baraja.df$num==1)
baraja.df[which(baraja.df$num==1),]

baraja.df[(baraja.df$num==1),]

baraja.df$num%in%c(1,3)
baraja.df[baraja.df$num%in%c(1,3),]


shuffle<-function(baraja){
  order<-sample(1:40,40)
  return(baraja[order[1],])
}

shuffle<-function(baraja){
  order<-sample(1:40,40)
  dummy<-baraja[order,]
  return(dummy[1,])
}

shuffle<-function(baraja){
  return(baraja[sample(1:40,40)[1],])
}

shuffle(baraja.df)

throw2<-function(){
  dado<-rep(1,6)
  return(sample(dado,1))
}

throw2()

baraja.df2<-baraja.df

baraja.df2[baraja.df2$num==1,]$punt=0
baraja.df2$punt[baraja.df2$num==1]<-0

sum(baraja.df2$punt)

baraja.df2[baraja.df2$num==1 & baraja.df2$palo=="Oros",]$punt=20
baraja.df2$punt[baraja.df2$num==1 & baraja.df2$palo=="Oros"]<-20

sum(baraja.df2$punt)

is.na(c(1,2,NA))
!is.na(c(1,2,NA))
which(!is.na(c(1,2,NA)))

mean(c(1,2,NA))
mean(c(1,2,NA), na.rm=T)

num<--1
if (num<0){
  print("num is negative")
  num<-num*-1
  print(num)
}

a<-3.14
dec<-a-trunc(a)

if (dec>0.5){
  a<-trunc(a)+1
}else{
  a<-1
}

