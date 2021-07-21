# 1

# RCode0
print("Zdravo svete!")

# Postupak sa instaliranje paketa:
# install.packages("ime_paketa") instalira direktno sa neta
# ili skinuti u zip formatu sa sajta, pa tools--install packages---
# Kada je paket instaliran ucitava se sa library(ime_paketa)
# Sada su nam na raspolaganju njegove f-je, baze podataka i ostalo
# Na primer paket PASWR sadrzi korisne f-je i baze za verovatnocu i statistiku
install.packages("PASWR")
library(PASWR) #paket probability and statistics with R
#kada je paket ucitan bazu ucitavamo sa data(BAZA)
data(Aggression)
Aggression
# Ako necemo da ucitavamo ceo paket, mozemo ucitati samo neku od baza, bez prethodnog poziva library
data(Aggression,package="PASWR")

# U ovom paketu ima i korisnih statistickih testova,npr test koji proverava hipotezu o srednjoj vrednosti uzorka iz normalne raspodele
# Ho je da je srednja vrednost 0:
x<-rnorm(100)
z.test(x,sigma.x=1) # navodimo uzorak, kao i pretpostavljenu standardnu devijaciju raspodele 

# Jos neki paketi:
install.packages("fortunes")
library(fortunes)
fortune()

install.packages("fields")
library(fields)
data(CO2)
bplot(CO2)

#Kada zavrsimo sa radom:
detach("package:PASWR")

# Ugradjeni paketi u R-u: base, datasets, utils, graphics, i mnogi drugi
# Za prikaz nekog paketa
help(datasets)
# ili 
library(help="datasets")
help("airquality")
# Odavde vidimo imena baza, jedna od njih sadrzi podatke o vazduhu iz Njujorka
data(airquality)
head(airquality)
summary(airquality)
help("airquality")


# RCode2
# Ova linija je komentar

#RCode3
"Ovo je viselinijski komentar
Interperter ce ga izvrsiti,
ali ne dolazi u sukob sa
ostatkom koda"

#RCode4
x<-3
#(isto sto i 3->x)

#ispisivanje vrednosti:
x
#R je case sensitive, dakle X!=x

#ovako deklarisanu promenljivu sada mozemo koristiti u izrazima
x+x
x+3
exp(x^2)

#promenljive tipa character sadrze stringove:
x<-"neke reci" 
x

#logicki tip: moze da ima vrednost TRUE ili FALSE (u R-u isto sto i T, F)
A<-TRUE
A


#logicke promenljive dobijamo i kao rezultat relacijskih izraza tipa: 
3<4

3!=3

#logicki operatori: <=, >=, ==, !=, <, >, & (AND), | (OR), ! (NOT)

(2<4)&(3==3)

x<-(2<4)&(3==3)
x

# RCode5
# Kreiranje promenljivih jabuke i kruske
jabuke <- 5
kruske <- 6
# Sabiranje ovih promenljivih
jabuke + kruske
# Kreiranje promenljive voce
voce <- jabuke + kruske
voce

# RCode6
ls() 
ls(pattern="ja")

rm(voce)
ls() 

rm(list = ls())
ls() 
