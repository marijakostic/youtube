# NAredbe 2, ciklusi

#Programski jezik R poznaje tri vrste ciklusa:repeat,while,for
#Upravljacke strukture kojima se moze prekinuti izvrsenje ciklusa ili nastaviti sasledecom iteracijom su:break i next

# for petlje jedna u drugoj
# Hocemo da napravimo matricu 5*4 gde je a[i,j]=i+j
# Prazna matrica
a<-matrix(nrow=5,ncol=4)
a
for(i in 1:5)
  for(j in 1:4)
    a[i,j]<-i+j
a

# WHILE petlja:
# while (uslov) {naredbe}
x<-1
while(x<=5){
  x<-x+1
}
x

# REPEAT naredba
# sadrzi naredbe koje se izvrsavaju kao i uslov za izlazak iz petlje, inace imamo beskonacnu petlju!
# repeat{ naredbe
# if (uslov) break}
y<-0
repeat{
  y<-y+1
  if(y>=5) break
}
y

# ZADATAK: Napisati f-ju koja racuna faktorijel pomocu for, while ili repeat
# pomocu while petlje:
fact<-function(n){
  f<-1
  while(n>1){
    f<-f*n
    n<-n-1
  }
  return (f)
}

# Iskoristimo bazu sleep
data(sleep)
sleep

#ZADATAK: F-ja kojom se brisu elementi iz baze kod kojih je parametar extra manji od zadatog broja
brisi<-function(x){
  return (sleep[sleep$extra>=x,])
}

# Ako hocemo da f-ja vrati vise stvari, na primer hocemo kao prethodno, ali i da vraca broj obrisanih
# Vracamo dve stavke razlicitog tipa, pa moramo da napravimo listu
brisi1<-function(x){
  return (list(sleep[sleep$extra>=x,],nrow(sleep[sleep$extra<x,])))
}

