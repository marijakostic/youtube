# Naredbe 1, Uslovno izvrsavanje 


#R programski jezik podrzava tri vrste uslovnih struktura:if iskaz,if...else iskaz,switch iskaz

#Opsti oblik IF iskaza:
#if (logicki_izraz) {
# jedan ili vise iskaza
#}

broj <- 5L
broj
if (broj == 5) {
  print("Broj je jednak 5.")
}
if (is.integer(broj)) {
  print("Broj je celobrojnog tipa.")
}

#Kombinovanje izara se postize operatorima &&(I) i || (ILI), a moze se koristiti i negacija (!)

# Naredbe mogu da budu i slozene, samo bi se onda ogranicile sa {}
# ako u konzoli predjemo u novi red a traje blok, on ce staviti + da oznaci to

broj <- 5L
if (broj == 5 && is.integer(broj))
{
  print("Broj je jednak 5 i celobrojnog je tipa.")
}
if (!(broj == 4)) {
  print("Broj je razlicit od 4.")
}

???# Opsti obli IF...ELSE:
#if (logicki_uslov) {
#   jedan ili vise iskaza
#  } else {
#    jedan ili vise iskaza
#  }

x <- c("Programiranje", "je", "zabavno")
if ("zabavno" %in% x) {
  print("Programiranje je zabavno.")
} else {
  print("Programiranje nije zabavno.")
}
x <- 5
if (x < 0) {
  print("Negativan broj.")
} else {
  print("Nenegativan broj.")
}

# FOR petlja:
# sintaksa: for(brojac in start:finish) {naredbe}
for (i in 1:10) print(i)
# primer sa crtanjem grafika pomocu for petlje
# x je niz brojeva 0,0.05,0.1, ..., 1
x<-seq(0,1,0.05)
# Prvo crtamo grafik y=x
plot(x,x,type="l")
# Sada hocemo da nacrtamo preko njega i x^2, x^3,.., x^8:
for(i in 2:8)
{
  lines(x,x^i)
}


# Funkcija IFELSE():
a = c(5, 7, 2, 9)
ifelse(a %% 2 == 0, "paran", "neparan")


# Opsti oblik SWITCH : switch (izraz, slucaj1, slucaj2, slucaj3, ...)
y = 3
x = switch( y,
  "Dobro jutro",
  "Dobar dan",
  "Dobro vece",
  "Laku noc")
x


