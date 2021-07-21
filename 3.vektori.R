# 3

# Vektori

# Vektor predstavlja skup podataka istog ili razlicitog osnovnog tipa.
# Indeksi elemenata vektora krecu od 1.

# Nacini zadavanja vektora:
# 1. funkcija COMBINE
v<-c(2,3,4,4)
v
# Kreiranje vektora sacinjenih od karaktera tece na isti nacin.
v<-c("crvena","zuta","plava")
v
# 2. zadavanjem pocetnog i krajnjeg elementa 
v<-1:30
v
# 3. f-ja SEQUENCE
# Zadajemo pocetni i krajnji element.
# Ako zelimo da se svaki sledeci element uvecava za 1:
v<-seq(5,25)
v
# Ako zelimo da korak bude razlicit od 1, navodimo korak kao treci argument.
# Za mnoge f-je postoje opcioni argumenti, koji ako se eksplicitno ne navedu u pozivu f-je, uzimaju neku default vrednost, ovde je to 1.
v<-seq(5,25,5)
v

v<-seq(0,1,0.1)
v
# Varijanta ovoga je i opadajuci niz:
v<-seq(10,1,-1)
v

# 4. pomocu odredene funkcije
v<-runif(5, 100, 200)
v

# Takode, izdvajanje odredene kolone iz tabele (data.frame-a) daje kao rezultat vektor. 
# Izborom seta PlantGrowth dobijamo tabelu od 30 redova i dve kolone.

data("PlantGrowth")
PlantGrowth
is.vector(PlantGrowth)
is.data.frame(PlantGrowth)

v1<-PlantGrowth$weight
v1
is.vector(v1)

# Operacije sa vektorima

# Na vektorima se kasnije mogu izvsiti razlicite operacije ili funkcije.
v<-c(2,6,7,7,25)
v
# Prikazivanje jedinstvenih vrednosti:
unique(v)

# Prebrojavanje jedinstvenih vrednosti:
table(v)
# Vektore iste duzine je moguce sabirati, oduzimati, mnoziti, deliti ili stepenovati.
c(1,3)+c(2,4)
# Sabiranje i oduzimanje svih elemenata vektora u jednom koraku:
v+10
v-5

# Mnozenje i deljenje elemenata vektora skalarom je jednostavno kao i sabiranje i oduzimanje:
v*11
v/5
# Stepenovanje elemenata vektora:
v^2
v^5
# Kvadratni koren:
sqrt(v)

# Graficko prikazivanje vektora
barplot(v)

# Duzina vektora (broj elemenata) moze biti lako proverena funkcijom:
length(v)

# Funkcije skalara, primenjene na vektor,deluju na svaki element vektora posebno
sin(v)

# Nad vektorima postoje razne funkcije poput sum, mean, var, sd, median, itd.,
# a i sve elementarne funkcije koje postoje nad brojevima su vektorizovane za vektore, pa je npr. sin(c(1, 2)) = c(sin(1), sin(2))
sin(c(1, 2)) == c(sin(1), sin(2))

max(v) # maksimum
min(v) # minimum
range(v) # minimum i maksimum
sort(v) # sortiranje
rev(v) # promena prvobitnog redosleda
order(v)
sum(v) #suma
mean(v) #uzoracka sredina
var(v) #popravljena uz. disperzija
sd(v) #standardna devijacija

v2<-c("crvena","zuta","plava")
v2
sort(v2)
rev(v2)
# Broj karaktera svakog elementa:
nchar(v2)

# Vektore iste duzine je moguce sabirati, oduzimati, mnoziti, deliti ili stepenovati.
v
v3<-v-2
v3
v+v3
v-v3
v*v3
v/v3
v^v3
# Ako su vektori razlicitih duzina moguce je ponovo izvsiti bilo koju od navedenih operacija.
# U tom slucaju kraci vektor ce se reciklirati (ponoviti) neophodan broj puta.
# Ako kolicnik izmedu elemenata duzeg i kraceg vektora nije prirodan broj, pored razultata bice prikazano i upozorenje da to nije slucaj, medutim, rezultat ce biti dobijen bez obzira na upozorenje.
v1/v

# Kopija vektora:f-ja REPLICATE
rep(v)

# Varijacije ove funkcije:
rep(v,5) # novi vektor koji sadrzi 5 nadovezanih kopija pocetnog, isto sto i rep(v,times=5)
rep(v,each=3) # kopira svaki element 3 puta uzastopno
rep(v,length.out=2) # kopira prva dva elementa
# postoje funkcije any, all
any(rep(2, 3) < 1:3)
all(rep(2, 3) < 1:3)

a<-c(1,2,3,4)
b<-c(2,3,4,5)

# Crtanje grafika,(zavisnost b od a) pomocu funkcije plot
# a je na x-osi, b je na y-osi
plot(a,b)
plot(b,a) # obrnute ose

# Vektori mogu sadrzati elemente samo jednog primitivnog tipa.
c(1, 2)
c(1L, 2L)
c("a", "b")
c("a", 2)
c(TRUE, FALSE)

# Ukoliko se tipovi ne slazu, pretvorice se u najfleksibilniji tip, znaci logical -> integer -> numeric -> character
class(c(TRUE, 1L, 1, "1"))

# I logicki operatori su vektorizovani, pa je

1:5 <= c(1, 1, 2, 2, 5) # TRUE FALSE FALSE FALSE TRUE

# Elementi vektora mogu biti poredeni i logicki.
# Logicki vektori dobijaju se kao rezultat relacijskih izraza sa vektorima:
v<-c(2,6,3,7,8)
v==1:5
# Poredi svaki element vektora sa odgovarajucim!
v>3
# Poredi svaki el. sa trojkom

# Kad su logicki vektori u pitanju obratiti paznju na & i &&, kao i | i ||
A <- c(FALSE, TRUE, TRUE, FALSE)
B <- c(TRUE, FALSE, TRUE, FALSE)
# & i | rade vektorski - element po element i vracaju vektor!
A & B 
A | B
# && i || porede samo prve elemente
A && B
A || B

#Selekcija i ekstrakcija elemenata vektora

# Elemente vektora mozemo selektovati na osnovu njihovog polozaja, vrednosti ili naziva elementa.
v
# Izbor drugog elementa vektora v:
v[2]
# Izbor svih osim drugog elementa:
v[-2]
# Menjanje vrednosti elementa vektora:
v[2]<-27
v
# Dodavanje novog elementa na kraj:
v[6]=0
v
# Mozemo izdvojiti i podvektor na slican nacin, navodjenjem indeksa elemenata koje izdvajamo:
v[1:3]

# Podvektor koji sadrzi prvi i treci element
v[c(1,3)]


# Izbor svih elemenata osim desetog do tridesetog elementa vektora v2:
v1[-(10:30)]
# Izbor drugog, treceg i desetog elementa:
v1[c(2,3,10)]
# Vektor moze biti selektovan i pomocu njegove vrednosti. Izbor svih elemenata vrednosti 7:
v[v == 7]
#Izbor svih elemenata vecih od 6:
v1[v1 > 6]

# Faktor vektori

# Faktori su promenljive u R-u koje primaju ogranicen broj razlicitih vrednosti, kategorijalnih promenljivih. 
# Oni se sastoje od niza integer-a koje prate set promenljivih koje se sastoje od karaktera, a koje se prikazuju prilikom ispisa sadrzaja vektora.
# Oni su bitan tip podataka u R-u, narocito kada se radi o kreiranju modela, jer obezbeduju da model obradi kategorijalne promenljive na pravi nacin. 
# Ranije kreirani vektor v2 se moze pretvoriti u faktor vektor.
# Vektoru v2 dodajemo jos dva elementa:
v2
v3<-c(v2,"plava","plava")
v3

# Prevodimo vektor u faktor:
v3factor<-as.factor(v3)
v3factor
# Osim prikazivanja svakog elementa, R prikazuje i nivoe faktora.
# Nivoi predstavljaju jedinstvene vrednosti faktor objekta. 
# Oni poseduju i numericke vrednosti koje odgovaraju elementima.
as.numeric(v3factor)

# U vecini slucajeva, redosled nivoa faktora nije bitan.

factor(x=c("Jan","Feb","Mar","Apr","Maj","Jun","Jul","Avg","Sep","Okt","Nov","Dec"))

# Ponekad, kada je redosled bitan, moguce je ukljuciti argument ordered.

factor(x=c("Jan","Feb","Mar","Apr","Maj","Jun","Jul","Avg","Sep","Okt","Nov","Dec"),
       levels=c("Jan","Feb","Mar","Apr","Maj","Jun","Jul","Avg","Sep","Okt","Nov","Dec"), ordered=TRUE)
# Faktori olaksavaju posao prilikom ukljucivanja kategorijalnih promenljivih u statisticki model, medutim mogu unositi konfuziju jer izgledaju kao stringovi (karakteri), a ponasaju se kao intedzeri. Moguca je njihova konverzija u karaktere funkcijom:
as.character()

# Integer vektori

# Integer vektori sadrze brojeve koji mogu biti napisani bez decimalnog zareza.
# Njihovo koriscenje nije cesto u svakodnevnom radu. 
# U vecini situacija moguce je glatko koriscenje R bez dobrog poznavanja sistema skladistenja brojeva.
# Vektori mogu biti klase integer ili numeric. 
# Kreiranje intedzera se vrsi dodatkom slova L iza broja.
v <- c(2,6,7,7)
is.integer(v)

# Numerici su formata double (realni brojevi dvostruke preciznosti sacuvani iz dva dela broja sa vise decimala i eksponenta).
typeof(v)

v <- c(2L,6L,7L,7L)
is.integer(v)
typeof(v)

#Integer je podgrupa klase numeric.
is.numeric(v)

#Koja je velicina formata integer i double?
.Machine$integer.max
.Machine$double.xmax

# Ako drugacije ne bude naglaseno, integer-i bez slova L ce biti sacuvani u memoriji kompjutera u formatu double. 
# Integer-i su definisani preciznije od brojeva u formatu double, osim kada se radi o izuzetno velikim ili malim brojevima.

# Kod formata double postoji greska vezana za pokretni zarez koja nastaje usled zaokruzivanja brojeva, sto mozemo primetiti iz primera da se kvadrat kvardratnog korena iz 2 (3, 5, 6, itd.) razlikuje na 16 decimali.
sqrt(2)^2 - 2

# Medutim, to je greska koja nije vezana iskljucivo za R, vec je fenomen u okviru kompjuterskog programiranja vezan za aritmetiku pokretnog zareza.

# NAPOMENA: ':' ima veci prioritet od aritm. operacija, npr:
n<-10
v1<-1:n-1
v1
v2<-1:(n-1)
v2

# NA vrednosti - not available
v<-c(1,4,6,NA,23)
sum(v)
# Ako hocemo da funkcija ignorise NA vrednosti
sum(v,na.rm=T)

# Cuvanje vektora
# Vektore mozemo sacuvati kao datoteke pomocu funkcije:
write(v, file = "imefajla.txt")



