# 4

# Tabele (data.frame)

# Tabele (data.frame) su verovatno najbitniji i najcesci tip podataka u R-u. 
# Format data.frame je najslicniji tabelama koje srecemo u programima kao sto su Excel, Statistica, SPSS ili SAS.

# Kreiranje tabela

# Tabele u R-u mozemo kreirati na vise nacina: 
#   .	spajanjem vise vektora
#   .	ekstrakcijom podataka iz postojece tabele
#   .	ucitavanjem tabele iz drugog formata (.txt, .csv, itd.)
#   .	pretvaranjem matrice u data.frame, itd. 

# Spajanje vise vektora se vrsi na sledeci nacin:
starost.stabla <- c(75,84,77,80)
zdravstveno.stanje <- c("suvo","zdravo","zdravo","suvo")
visina.stabla <- c(29,31,30,27)
hrastovi <- data.frame(starost.stabla,zdravstveno.stanje,visina.stabla)
hrastovi

is.data.frame(hrastovi)

# Funkcija View() ce prikazati citavu tabelu 
View(trees)

#U bazicnoj instalaciji R-a postoji veci broj kompleta podataka. 
#Celokupna lista objekata sa podacima se ispisuje funkcijom:
data()

# Biramo komplet podataka trees koji ima 31 red i tri kolone.
dim(trees)

# U njemu su prikazani podaci o prsnom precniku stabala u incima (in), visinom izrazenom u stopama (ft) i zapreminu izrezenu u kubnim stopama (ft3).
?trees

# Provera da li je objekat trees data.frame?
is.data.frame(trees)

# Za prikaz uopstenih podataka o bazi - f-ja SUMMARY
summary(trees)

# Funkcija head() ispisuje prvih sest redova data.frame-a tress:
head(trees)

# Funkcija tail() ispisuje poslednjih sest redova.
tail(trees)

# Pristupanje elementima preko $
trees$Height

# Funkcija ATTACH primenjena na bazu podataka
# Elementima mozemo da pristupamo bez navodjenja imena baze
attach(trees)
Volume

# Dodatnim argumentom n = broj redova, se tacno moze naznaciti koji broj redova se zeli prikazati funkcijom head() i tail().
# Nova tabela se moze kreirati odabirom odredenih podataka iz postojece tabele, npr. ekstrakcijom redova, u konkretnom slucaju od 7 do 13.
trees1 <- trees[7:13,]
trees1

# Takode, moze se izvrsiti ekstrakcija odredene kolone, konkretno druge i trece izborom kolona po njihovom redosledu:
trees2 <- trees[,2:3]
head(trees2)

# ili izvrsiti isto selekcijom kolone na osnovu njihovog imena.
trees3 <- data.frame(trees$Height,trees$Volume)
head(trees3)

# Dobijena je tabela sa istim vrednostim ali su nazivi kolona razliciti. Dodela novih imena kolonama se vrsi funkcijom names().
names(trees3) <- c("Height","Volume")
head(trees3)

# Tabele u R-u cuvaju podatke kao sekvencu kolona.
# Svaka kolona moze sadrzati razlicit tip podataka, ali sve kolone moraju biti iste duzine. 
# Treba izbegavati rucno unosenje podataka, jer je to vremenski zahtevno i moze dovesti do pogresnih rezultata ili zakljucaka usled gresaka prilikom kucanja. 
# Sa druge strane treba koristiti svaku priliku za kucanje funkcija u cilju sto brzeg ovladavanja sintaksom jezika.

# Ranije kreirane tabele u drugim programima mogu se ucitati funkcijama read.table() i read.csv()
# tabela1 <- read.table("/put/do/fajla/imefajla.txt", sep="", header=TRUE)
# gde je tabela1 ime novog objekta, argument sep ukazuje na nacin kako su razdvojene kolone (podrazumevan je beli prazan prostor izmedu, ali moze podesiti da bude , , ; , \t , itd.), a header definise da li u tabeli koja se ucitava postoji zaglavlje, odnosno imena kolona ili ne (vrednosti su TRUE ili FALSE). 
# Ova funkcija ima na rapolaganju niz argumenata cija se lista i opis moze videti pokretanjem komande:
?read.table
# Tabele je moguce ucitati direktno sa interneta. 
# Na primer Vlada SAD-a je ucinila dostupnim veliki broj kompleta podataka (https://catalog.data.gov/dataset).

# Tabela o broju rodenih beba, stopama nataliteta i rasi majke za period 1960-2013. u SAD se moze ucitati komandom:
x<-"https://data.cdc.gov/api/views/89yk-m38d/rows.csv?accessType=DOWNLOAD"
rodjenje <- read.csv(x)
head(rodjenje)

# Ako su tabele (objekti) kreirani u R-u, mozemo ih ucitati funkcijom: load('imefajla.RData') .

# Selekcija i ekstrakcija elemenata tabele

# U cilju ekstrakcije pojedinacnih vrednosti ili delova tabele, neophodno je navesti ime tabele koje prati par uglastih zagrada.
# Unutar zagrade ce biti napisana dva indeksa odvojena zarezom. 
# Prvi indeks oznacava redove koji se izdvajaju, a drugi kolone.
# Na prethodnom primeru se mogu videti razlicite kombinacije izdvajanja clanova tabele trees3.
# Selektujemo prvih 10 redova i cuvamo dobijeno u istom objekatu trees3.
trees3 <- trees[1:10,]
trees3
# Identican rezultat bi se dobio da je u zagradi stajalo [1:10, 1:2]. Na isti nacin izdvajamo pojedninacne elemente ili kolone:
trees3[1,1]
# ili
trees3[3,2]

# Ili npr. 3., 6. i 8. element druge kolone:
trees3[c(3,6,8),2]
# cime se dobija vektor:
is.vector(trees3[c(3,6,8),2])
# Takode, na isti nacin se moze izdvojiti i citava kolona kao vektor.
trees3[,2]

# Ukoliko je neophodno izdvojiti vise kolona iz tabele, dobijeni objekat ce ostati tipa data.frame. Medutim kada je potrebno izdvojiti jednu kolonu, a da objekat ostane formata data.frame dodaje se argument drop=FALSE.
head(trees3[,2, drop = FALSE])
is.vector(head(trees3[,2, drop = FALSE]))
# i
is.data.frame(head(trees3[,2, drop = FALSE]))

# Indeksiranje prilikom selekcije i ekstrakcije podataka moze biti i negativno, kao i kod vektora i drugih objekata. 
# U tom slucaju, selektovano biva sve osim onog sto je indeksirano negativnim predznakom.
trees3[-(2:31),-2]

# sto je identican rezultat operaciji sa pocetka gde je selektovan prvi element prvog reda.
# Na kraju, elemente tabele je moguce selektovati i na osnovu imena kolona.
trees3[1:5,"Volume", drop=FALSE]

# ili
trees3$Volume[1:5]

# Za izdvajanje odredenih elemenata moze posluziti i funkcija subset() koja moze pomoci u izdvajanju odredenih delova tabele (moguce je primeniti je i na vektor i matricu) na osnovu specificnog kriterijuma.
subset(trees, trees$Height>80)

# Dodavanje vektora u data frame

# Dodajemo kolonu brojeva 10,9,8,...1
cbind(trees3,seq(10,1,-1))
# isto tako mozemo dodati i vrstu
rbind(trees3,c(2.0,1,1))

# Hocemo da neku od kolona transformisemo, f-ja TRANSFORM
# U novoj koloni abs.extra da nam ispisuje aps. vrednosti kolone extra
transform(trees3,abs.volume=abs(Volume))


# Cuvanje tabele

# Tabele je moguce sacuvati pomocu funkcija write.table() ili write.csv().
# Obe funkcije sadrzi veci broj argumenata, sto se moze videti pomocu komandi:
?write.csv
?write.table
# Na primer komandom:
write.csv(trees, file="trees.csv", row.names=FALSE)
# Gde je definisan objekat (trees), ime fajla u kojem ce podaci iz objekta biti sacuvani (trees.csv) i argument
# row.names koji sprecava R da na pocetku tabele doda kolonu sa rednim brojevima.
# U slucaju da zelimo da izvrsimo kompresiju fajla, stavljamo ime fajla u zagradu nakon funkcije za kompresiju i menjamo ekstenziju.
write.csv(trees, file=bzfile("trees.csv.bz2"), row.names=FALSE)
# Za kompresiju pojedinacnih tekstualnih fajlova mogu se pored bzfile koristiti i formati gzfile ili xzfile u Linux-u.

