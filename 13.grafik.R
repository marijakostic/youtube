
# Crtanje grafika (osnovno, kasnije detaljnije-mozda xD )


# najjednostavniji grafik
x<-seq(2,16,1)
y<-c(5,6,5,9,3,11,6,15,19,5,7,14,8,12,1)
plot(x,y)

#type-tip nacrta koji ce biti prikazan
# "p" za tacke, "l" za linije,"b" za oboje, "h" za histogram, "s" i "S" za stepenicaste prikaze
#main -naslov nacrta
#sub - podnaslov nacrta
#xlab i ylab - naslov za x-osu i y-osu
#pch - oblik tacaka
#lwd - debljina linije
# xlim i ylim - granica za x-osu i y-osu

plot(x,y,main="Naslov",sub="podnaslov",xlab="x-osa",ylab="y-osa")
# duzinu osa mozemo i eksplicitno navesti parametrima xlim i ylim
plot(x,y,xlim=c(0,30),ylim=c(0,30))
# mogu se dodati linije i tacke, ili u okviru poziva plot ili kasnije
# Dodavanje tacaka
points(25,25) # Zadajemo koordinate tacke koju dodajemo
# Dodavanje teksta  
text(3,3,"tekst") # Zadajemo koordinate i tekst koji se ispisuje 

# Ubacivanje linije na postojeci grafik: f-ja ABLINE(a,b) crta grafik f-je y=a+bx
# Ako je argument h=... ili v=..., crta horizontalnu odnosno vertikalnu liniju sa datom koordinatom
abline(0,1) # Dobili smo grafik f-je y=x
abline(h=20)
abline(v=20)
# moze i abline(h=20,v=20)

# Ako hocemo da grafik bude veoma slozen, cesto je dobra ideja da na pocetku izostavimo sve elemente i posle ih pojedinacno dodajemo
plot(x,y,type="n",xlab="",ylab="",axes=F)
# Ne crta ose, ne obelezava ih, type="n" znaci da se tacke izostavljaju
# Naknadno dodajemo elemente
points(x,y) # Dodaje sve tacke na grafik
axis(1) # Dodaje prvu osu
axis(2,at=seq(0,20,5)) # Dodaje drug uosu, ali je obelezava na mestima naznacenim vektorom seq(..)
box() # Dodaje okvir
title(main="Glavni naslov",sub="podnaslov",xlab="x-osa",ylab="y-osa")


# Grafik funkcije x^3
x <- seq(-2,2,0.01)
plot(x, x^3, type = "l", main = "y=x^3", xlab ="x-osa", ylab ="y-osa", col = "blue")
curve(x^3,from=-2,to=2, col = "blue",main = "y=x^3", xlab ="x-osa", ylab ="y-osa")

# FUNKCIJA PAR se koristi za naprednija podesavanja svih grafickih parametara
# Neka od ovih podesavanja mogu i preko plot fje
# Razlika je sto ih par trajno podesava, dok se ne vrate na staro
# Neke od opcija su boja, debljina i tip linija, podela osa, velicina grafika, podela na vise povrsina, itd.
# Trenutno stanje svih parametara
par()
# Znacenje svih parametara mozemo procitati ako pozovemo 
help(par) # npr. col oznacava boju grafika, bg boju pozadine, itd.
# Menjamo ih pozivom f-je par sa njima kao argumentima
# Menjanje boje grafika
par(col="red")
# Parametar mfrow oznacava koliko se grafika odjednom moze nalaziti na platnu, to je vektor sa dimenzijama
# Deljenje platna za crtanje


# Kombinovanje vise grafika jedan preko drugog - Grafici uzorka normalne raspodele
x1 <- rnorm(20) 
par(mfrow = c(2,2))
plot(x1, type = "p", main = "points", ylab = "y-osa", xlab = "x-osa", col = "red")
plot(x1, type = "l", main = "lines", ylab = "y-osa", xlab = "x-osa", col = "orange")
plot(x1, type = "b", main = "both", ylab = "y-osa", xlab = "x-osa", col = "blue")
plot(x1, type = "o", main = "both overplot", ylab = "y-osa", xlab = "x-osa", col = "green")

#Osim navedene funkcije plot(), postoje i druge brojne funkcije koje iscrtavaju podatke na razlicite graficke nacine
#Navedimo neke od njih: 
#hist() - iscrtavanje histograma
#barplot() - iscrtavanje slicno histogramu, ali sa razmacima izmedju kolona
#pie() - iscrtavanje pita-dijagrama

# Histogrami
library(help="datasets") # pregled baza

summary(rivers)
# Argumenti: breaks - vektor tacaka prekida izmedju celija histograma, freq - da li su apsolutne ili relativne frekvencije, u drugom slucaju ukupna povrsina je 1
# opet imamo col, border, main, xlab,ylab, xlim, ylim 
# right:kada je TRUE celije su oblika (a,b] , za false obrnuto
hist(rivers)
hist(rivers,freq=F, col="orchid", right=F,breaks=c(0,500,1000,2000,3000,4000),border="lightblue",main="Histogram baze podataka rivers")

# Empirijska funkcija raspodele: za element uzorka sa rangom k vraca k/n
x<-rnorm(100)
n<-length(x)
plot(sort(x),(1:n)/n,type="s",ylim=c(0,1)) # type=s znaci stepenasta funkcija
# Detaljnije oko ovoga pogledati u paketu stepfun

# Q-Q plot: (quantile versus quantile)
# k-ta vrednost po velicini se plotuje sa ocekivanom k-tom vrednoscu po velicini u normalnoj raspodeli, i to je q-q plot
# ako dobijemo priblizno pravu liniju, jeste normalna raspodela
# f-ja QQNORM:
qqnorm(x)

# BOXPLOT 
data(InsectSprays)
attach(InsectSprays)
boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
means <- tapply(count,spray,mean)
points(means,col="red",pch=18)
boxplot(count ~ spray, data = InsectSprays, horizontal=T, col = "lightblue")


# Histogram za grupisane podatke
data(energy)
attach(energy)
head(energy)
# Delimo podatke u dve grupe
expend.lean<-expend[stature=="lean"]
expend.obese<-expend[stature=="obese"]
par(mfrow=c(2,1))
hist(expend.lean)
# ovde breaks prosledjujemo kao broj celija koje hocemo, ali R zadrzava pravo da ga izmeni da bi granice bile sto zaokruzeniji brojevi
hist(expend.obese)
par(mfrow=c(1,1))

# BARPLOT
VADeaths
barplot(VADeaths)
barplot(t(VADeaths), col = gray(c(0.25,0.5,0.75, 1)))
barplot(t(VADeaths), beside = TRUE)

# Boxplot za grupisane podatke
# Ako hocemo boxplot za svaku grupu, a da su grupisani podaci prvog vektora preko podataka iz drugog
boxplot(expend~stature)
# y~x, za neke vektore x i y znaci: y je opisano preko x, i zove se model formula
# drugi nacin
boxplot(expend.lean, expend.obese) 
# samo ih shvata kao odvojene vektore, pa crta i odvojene plotove 

# DOTCHART - tackasti dijagram
dotchart(VADeaths, xlab="Broj umrlih na 1000 ljudi",main="Stopa smrtnosti u Virdziniji")

# PIECHART - pitice
par(mfrow = c(2,2))
pie.sales <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12)
names(pie.sales) <- c("Blueberry", "Cherry",
                      "Apple", "Boston Cream", "Other", "Vanilla")
pie(pie.sales, main = "Obicna pitica")
pie(pie.sales, col = gray(seq(0.4, 0.9, length = 6)), clockwise = TRUE, main = "Nijanse sive")
pie(pie.sales, col = rainbow(6), clockwise = TRUE, main = "Boje duge")
library(plotrix)
pie3D(pie.sales, main = "3D pitica")

# PAKET lattice
install.packages("lattice")
library(lattice) 
data(mtcars)
attach(mtcars)
# kreiramo faktore 
gear.f<-factor(gear,levels=c(3,4,5),labels=c("3gears","4gears","5gears")) 
cyl.f <-factor(cyl,levels=c(4,6,8),labels=c("4cyl","6cyl","8cyl")) 
# gustina
densityplot(~mpg, main="Density Plot",xlab="Miles per Gallon")
# gustina po faktorima
densityplot(~mpg|cyl.f, main="Density Plot by Number of Cylinders",xlab="Miles per Gallon")
# gustina po faktorima 
densityplot(~mpg|cyl.f, main="Density Plot by Numer of Cylinders", xlab="Miles per Gallon",layout=c(1,3))

# TABELE
attach(hellung)
head(hellung)
tabela<-table(glucose, conc)
tabela #prikazuje koliko elemenata ima u preseku svake dve mogucnosti za glucose i conc 
# slicno sa
data(juul)
attach(juul)
head(juul)
table(menarche, tanner)
# tabelu mozemo transponovati kao i matricu
t(tabela)
# Marginalne tabele - zbirovi tabele po kolonama i vrstama (umesto sum na svaku vrstu/kolonu redom, moze i tako)
m1<-margin.table(tabela,1) # po vrstama
m2<-margin.table(tabela, 2) # po kolonama
m1
m2
# Ako necemo da ih broji (apsolutne frekvencije), nego da vraca relativne frekvencije
prop.table(tabela,1)
prop.table(tabela,2)
# Sume po vrstama i kolonama treba da su 1

# GRAFICKI PRIKAZ TABELA

# bar plot
# F-ja barplot, ciji je argument vektor ili matrica
barplot(m1) # moze se podesiti i boja sa col, itd.
# Ako je argument matrica, bice naslagane vrste jedna preko druge u okviru kolone, po udelu
tab1<-table(menarche, tanner)
par(mfrow=c(2,2))
barplot(tab1,col="white")
barplot(t(tab1),col="white")
barplot(tab1,beside=T)# da slaze vrste jednu do druge a ne vertikalno
barplot(prop.table(tab1,2),col="white",beside=T)
par(mfrow=c(1,1))