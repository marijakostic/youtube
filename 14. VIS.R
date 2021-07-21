

# Verovatnoca i statistika u R-u

# Postoje ugradjene funkcije za f-ju raspodele, gustinu, f-je kvantila, i generisanje slucajnih brojeva iz zadate raspodele
# Nazivi raspodela su: unif, norm, pois, beta, gamma, binom, cauchy, chisq, t, exp, f...
# Odredjeni prefiksi se dodaju na ime raspodele u zavisnosti od toga sta hocemo da izracunamo
# Funkcija raspodele - p 
# Gustina - d (kod diskretnih ovo je bas verovatnoca neke vrednosti)
# Kvantili - q - inverzna od f-je raspodele (za verovatnocu p vraca q tako da je p=P{X<=q})
# Generisanje slucajbih velicina iz neke raspodele - r (od random)
# Na primer normalnu raspodelu imamo pnorm, dnorm, qnorm, rnorm

# Binomna raspodela: B(n,p)
# Za racunanje pojedinacnih verovatnoca: dbinom(x,size,prob,log=FALSE)
dbinom(0,size=10,prob=0.5)
# F-ja raspodele: pbinom(q,size,prob,lower.tail=T,log.p=F)
#lower.tail podrazumeva da trazimo P{X<=q}, da smo to postavili na FALSE, racunalo bi se P{X>q}
#log.p=T znacilo bi da vraca log(p) umesto p
pbinom(8,size=10,prob=0.3)
# F-ja kvanitla: q, takvo da je P{X<=q}=p: qbinom(p,size,prob,lower.tail=T,log.p=F)
qbinom(0.99,size=10,prob=0.5)
# Uzorak elemenata iz binomne raspodele: rbinom(n,size,prob), gde je n obim uzorka
rbinom(20,10,0.5)

# Crtanje verovatnoca npr B(50, 0.4)
x<-0:50
plot(x,dbinom(x,size=50,prob=0.4))
# Bolje se vidi ako verovatnoce predstavimo stubicima
plot(x,dbinom(x,size=50,prob=0.4),type="h") #h od histogram
# Mozemo dodati naslov, podnaslov, font i sve ostalo na plot
plot(x,dbinom(x,size=50,prob=0.4),type="h",main="Binomna raspodela B(50, 0.4)",xlab="k",ylab="binomne verovatnoce")
# Binomni koeficijenti - f-ja CHOOSE(n,k)
choose(4,2)

# Normalna raspodela: N(m,sigma^2)
# Gustina - dnorm(x,mean=0,sd=1,log=F), mean=m, sd=sigma
dnorm(3,mean=2,sd=4)
# F-ja raspodele pnorm(z,mean=0,sd=1,lower.tail=T,log.p=F)
pnorm(0)
pnorm(3,mean=4,lower.tail=F)
pnorm(3,mean=4,lower.tail=F,log.p=T)
# Crtanje gustine
x<-seq(-5,5,0.01)
plot(x,dnorm(x),type="l")
# Drugi nacin
curve(dnorm(x),from=-5,to=5)
# Crtanje f-je raspodele
plot(x,pnorm(x),type="l")
# Kvantili qnorm(p,mean=0,sd=1)
qnorm(0.9)
qnorm(pnorm(2)) # Vraca bas 2, ovo su inverzne f-je 
# Uzorak pseudoslucajnih brojeva iz N(m,sigma^2) raspodele rnorm(size,mean=0,sd=1)
rnorm(20) #iz N(0,1)

# Uniformna raspodela: U[a,b]
# dunif(x,min=0,max=1,log=F), min=a,max=b
dunif(2)
dunif(2,min=3,max=5)
# punif(q,min=0,max=1,lower.tail=TRUE,log.p=FALSE)
punif(1,min=0,max=3)
# qunif(p,min=0,max=1,lower.tail=TRUE,log.p=FALSE)
qunif(0.5)
runif(10) #iz U[0,1]

# Eksponencijalna raspodela: E(lambda)
# dexp(x,rate=1,log=F) rate=lambda
# pexp(q,rate=1,lower.tail=T,log.p=F)
# qexp(p,rate=1,lower.tail=T,log.p=F)
dexp(2,rate=2)
pexp(qexp(0.4))
x<-seq(0,25,0.01)
y<-dexp(x,rate=3)
plot(x,y,main="gustina eksp(3) raspodele",ylab="f(x)",type="l")

# Studentova raspodela
# dchisq(x, df, ncp = 0, log = FALSE)
# pchisq(q, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# qchisq(p, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# rchisq(n, df, ncp = 0)
dt(3,df=3)
rt(25,df=6)

# Hi-kvadrat raspodela:
# dchisq(x, df, ncp = 0, log = FALSE)
# pchisq(q, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# qchisq(p, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# rchisq(n, df, ncp = 0)

# Fiserova raspodela: f(n1,n2) dobija se kao hi1/n1:hi2/n2, gde su te dve nezavisne
# df(x,df,log=F)
# ostale f-je slicno
x<-seq(0,100,0.01)
curve(df(x,12,10),from=0,to=100) #nacrtana gustina


## Pravljenje uzorka iz neke populacije: f-ja SAMPLE 
# sample(x,size,replace,prob) - x - odakle biramo vrednosti za elemente uzorka, size - koliko ce ih biti, replace - da li je sa vracanjem ili ne, prob koristimo ako nisu jednakoverovatni, treba istaci koja je verovatnoca kog istim redosledom
sample(1:20,size=10,replace=T)
# Ako je x samo jedan broj, podrazumeva se da se bira iz 1:x
sample(4,size=10,replace=T)
# Ako svaki mozemo izabrati samo jednom - biranje bez vracanja
sample(1:20,5,replace=FALSE)
# Ako nemaju svi jednaku verovatnocu pojavljivanja
sample(c(0,1),replace=T,prob=c(0.8,0.2))

## PAKET PASWR - Probability and Statistics with R
install.packages("PASWR")
library(PASWR)
# Sadrzi mnogo baza 
# Neke funkcije u ovom paketu vezane za verovatnocu
# bino.gen(samples,n,pi) - simulacija binomne raspodele
bino.gen(10,20,0.4) # crta i teoretsku preko uzoracke raspodele
# Combinations(n,k) ispisuje sve moguce kombinacije
Combinations(6,2)

# SRS - Sample Random Sampling
# SRS(Values, n) - vraca sve moguce uzorke iz populacije Values obima n
SRS(1:10,5) #uzorak sa razlicitim elementima

# Jos jedan paket sa bazama podataka ISwR
install.packages("ISwR")
library(ISwR)
# ispitati u manual-u sta sve sadrzi..


# Osnovne funkcije
x<-rnorm(50)
# Uzoracka sredina
mean(x)
# Uzoracka medijana
median(x)
# Standardna devijacija
sd(x)
# Popravljena uzoracka disperzija
var(x)
# Funkcija koja vraca kvantile (0%, 25%, 50%, 75%, 100%)
quantile(x)
# Ako zelimo druge verovatnoce, prosledjujemo ih u vektoru
p<-seq(0,1,0.1)
quantile(x,p)

# Podaci sa nedostajucim vrednostima:
library(ISwR)
data(juul)
attach(juul)
head(juul)
mean(igf1)# ne moze da izracuna zbog NA vrednosti, pa zato
mean(igf1,na.rm=T)
summary(igf1) # vidimo da ima 321 NA vrednost
