# 9

# Kreiranje funkcija

# R ostavlja mogucnost svakom korisniku da kreira svoje funkcije.
# Na taj se nacin postize cistiji kod u kome ima manje ponavljanja. 
# Funkcija treba da ima ime, argument(e) i kod koji izvrsava neku radnju.
# Bitna karakteristika funkcije je da su objekti koji se u njoj nalaze, lokalni i ne postoje izvan nje sve dok se funkcijom return() ne prebace u globalno okruzenje.
# Opsta forma bi glasila:
ime.funkcije <- function(argument) {
  komanda
  return(ime.objekta)
}

#Argument, ili vise njih, mogu biti bilo kog tipa (skalar, vektor, matrica, tabela, itd.) i nije ih neophodno dodatno definisati.
# Prosta funkcija bi mogla da vrsi stavljanje ulazne vrednosti na kub.
kub.broja <- function(x) {
  kub <- x^3
  return(kub)
}

# Nakon kreiranja funkcije, moguce je njeno izvrsenje navodenjem njenog imena i odgovarajuceg argumenta (broja ili objekta).
kub.broja(3)
kub.broja(1000)
kub.broja(BOD)

# Primer f-je koja vraca binomni koeficijent - n nad k
binomni<-function(n,k){
  koef<-factorial(n)/(factorial(k)*factorial(n-k))
  return(koef)
}
# Poziv 
binomni(4,2)

# F-ja koja spaja dva vektora kao kolone matrice
spoji<-function(v1,v2){
  return (cbind(v1,v2))
}
# Poziv
spoji(c(0,1,2,3),seq(0,3,1))

# Kad pozivamo f-ju, argumente navodimo istim redom kao u definiciji f-je, osim ako ih navedemo po imenu,onda moze proizvoljno.
binomni(k=2,n=4)

# Funkcija "popust" izracunava popust na artikle na sledeci nacin:
# > Na artikle cene 1000 - 1999 popust je 10%, i
# > Na artikle cene vece od 1999 popust je 20%.
popust <- function(cene){
  cena <- cene
  n <- length(cene)
  for(i in 1:n){
    if(cene[i] > 1999)
      cena[i] <- 0.8 * cene[i]
    else if(cene[i] >= 1000)
      cena[i] <- 0.9 * cene[i]
    else
      cena[i] = cene[i]
  }
  return(cena)
}


popust(1500)

# Funkcija ne mora da sadrzi RETURN naredbu,samo da napravi neke izmene, medjutim one vaze samo u telu f-je
# Npr. f-ja koja racuna kvadrat broja
SQ<-function(x){
  x<-x^2
}
a<-3
SQ(a)
a # nije se izmenilo van funkcije
# ali ako kazemo 
a<-SQ(a)
a

# Ukoliko kreirana funkcija ima vise argumenata, R ce ih uzimati u obzir po redosledu kako su navedeni, medutim, moguce je i njihovo eksplicitno navodenje u cilju lakseg snalazenja, sto se posebno preporucuje kada se koristi veci broj argumenata.
kub.transpozicija.proizvod <- function(x,y) {
  kub <- x^3
  transpozicija <- t(kub)
  proizvod <- transpozicija*y
  return(proizvod)
}
kub.transpozicija.proizvod(BOD,5)
kub.transpozicija.proizvod(x=BOD,y=5)

# U slucaju da se kao rezultat zeli dobiti vise objekata iz funkcije, neophodno ih je objediniti u listu.
kub.transpozicija.proizvod <- function(x,y) {
  kub<-x^3
  transpozicija<-t(kub)
  proizvod<-transpozicija*y
  return(list(kub,transpozicija,proizvod))
}
kub.transpozicija.proizvod(BOD,5)

# Argument pored sirovog podatka, moze biti i objekat razlicitog formata, sto se vidi iz prethodnih primera.
# Medutim, unutar funkcije moze biti i druga funkcija. 
# Tada R krece sa izvrsavanjem od unutra ka spolja.

# ZADATAK: Napisati funkciju koja crta dva grafika y(x) i x(y) u proizvoljnoj boji
colors() #sve postojece boje u R-u
crtaj<-function(v1,v2){
  par(mfrow=c(1,2),col="turquoise")
  plot(v1,v2)
  plot(v2,v1)
  par(mfrow=c(1,1),col="black")
}

# Da bismo isprobali rad f-je pravimo dva vektora, koji predstavljaju uzorke iz U[0,1] odnosno N(0,1) raspodele:
x<-sample(1:1000,100)
y<-sample(1:1000,100)
crtaj(x,y)


