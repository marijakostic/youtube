
# t-test 

# Koristimo ga pod pretpostavkom da uzorak ima normalnu raspodelu X:N(m,s^2)
# funkcija je t.test(...)
# 1. prvi nacin: imamo jedan uzorak, i testiramo Ho(m=mu)
# Funkcija je t.test(uzorak, mu) - ovo su obavezni parametri
# moguce je dodati i parametre alternative, conf.level,...
# default je da je alternativna hipoteza: m je razlicito od mu
# parametar alternative mozemo postaviti na "greater" ili "less", ako hocemo takvu alt.hipotezu
# Ovaj test vraca: 
# t-vrednost test statistike, 
# df-broj stepeni slobode studentove raspodele test statistike, 
# p-vrednost testa, na osnovu koje zakljucujemo da li prihvatamo Ho ili ne (ako je veca od nivoa znacajnosti - obicno 0.05 => prihvatamo)
# interval poverenja za m, po defaultu 95%-ni, a ako hocemo neki drugi naznacimo to parametrom conf.level
x<-rnorm(100,mean=7,sd=12)
# Proverimo graficki da li uzorak odgovara normalnoj raspodeli (ovde hoce jer je namesteno)
qqnorm(x)
# Hocemo da ispitamo Ho(m=2) t-testom:
t.test(x,mu=2)
# Vidimo da je p-vrednost testa mala, pa se odbacuje Ho
# Varijanta ovoga, hocemo da naglasimo da je alt. hipoteza m<2
t.test(x,mu=2,alternative="less")
# Pod ovim uslovima sigurno se prihvata Ho, kada je alternativa da je m manje od 2 (mi smo namestili na 7!)
# Ako je alternativna hipoteza da je m>2 (ovo ima vise smisla):
t.test(x,mu=2,alternative="greater") # vidimo da se opet odbacuje Ho u korist alternative
# Jos varijanta sa intervalom poverenja koji je razlicit od 95%:
t.test(x,mu=2,alternative="greater",conf.level=0.99)

# 2. nacin: imamo dva uzorka i testiramo da li su im srednje vrednosti jednake Ho(m1=m2)
# Funkcija je t.test()
# Parametri funkcije su:
# x - prvi vektor
# y - drugi vektor
# formula - ako necemo da prosledjujemo odvojeno vektore x i y nego delimo bazu podataka na dva dela preko model formule: kolona1~kolona2 (gde je kolona2 faktor sa dva nivoa)
# paired - logicki parametar, TRUE je ako hocemo upareni t-test
# var.equal - logicki parametar, TRUE je ako mozemo pretpostaviti da su varijanse na dva uzorka jednake (podrazumeva se da nisu), sto se proverava testom var.test(uzorak1, uzorak2)
# Ovaj test vraca vrednost test statistike, broj stepeni slobode, p-vrednost testa, interval poverenja za razliku srednjih vrednosti, kao i ocenjene srednje vrednosti na oba uzorka 
x<-rnorm(100,mean=10,sd=5)
y<-rnorm(90,mean=14,sd=5)
t.test(x,y,var.equal=T) # u ovom slucaju odbacujemo Ho - p-vrednost testa je mala
# Varijanta kada uzorke vadimo kao podskupove neke baze podataka
library(ISwR)
data(energy)
attach(energy)
energy
# Vidimo da se kolona expend moze podeliti na dva podskupa, u zavisnosti od toga da li je u koloni stature vrednost OBESE ili LEAN (faktor sa dva nivoa)
# zato mozemo koristiti t-test sa model formulom expend~stature
# prvo proveravamo da li su disperzije jednake
var.test(expend~stature)
# vidimo da je p-vrednost veca od 0.05, pa prihvatamo hipotezu o jednakosti disperzija
t.test(expend~stature,var.equal=T)
# p-vrednost je manja od nivoa znacajnosti od 0.05, pa odbacujemo hipotezu o jednakosti srednjih vrednosti u ove dve grupe
#NAPOMENA: isto bismo dobili sa
x<-expend[stature=="lean"]
y<-expend[stature=="obese"]
t.test(x,y,var.equal=T)

# Hi-kvadrat test nezavisnosti 

# Funkciji chisq.test se u ovom slucaju prosledjuje tabela (ili matrica) sa podacima, koju R shvata kao tabelu kontingencije; ili jednostavno dva vektora od kojih on sam formira odgovarajucu tabelu
# Opet se za detaljniji uvid mogu pozvati observed i expected vrednosti
data(juul)
attach(juul)
head(juul)
# Ispitujemo nezavisnost kolona tanner i sex:
chisq.test(tanner,sex) # ovako je kada prosledjujemo vektore odvojeno
# Drugi nacin je da sami napravimo tabelu i prosledimo je
tabela<-table(tanner,sex)
tabela
chisq.test(tabela)
chisq.test(tabela)$expected
chisq.test(tabela)$observed
# Mala je p-vrednost pa se Ho odbacuje, tj. zavisna su obelezja

# KS - test
# Funkcija ks.test() ispituje pripadnost raspodeli ili da li su dva uzorka iz iste rasopdele
# Argumenti x-numericki vektor, y-drigi numericki vektor ili"naziv_raspodele"
x <- rnorm(50)
y <- runif(30)
# Da li su x i y iz iste raspodele?
ks.test(x, y)
# p vrednost je mala, pa odbacujemo hipotezu tj. x i y nisu iz iste raspodele
# testiramo kojoj raspodeli pripadaju uzorci x i y
hist(y)
ks.test(y, "pgamma",2,3)
ks.test(x, "pnorm")