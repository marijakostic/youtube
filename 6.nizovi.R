# 6

# Nizovi(arrays)

# Nizovi (arrays) su objekti koji imaju sposobnost skladistenja podataka u vise od dve dimenzije. 
# Prakticno, mogu se zamisliti kao grupa matrica, poredanih jedna na drugu, gde dodavanjem svake nove dobijamo po jednu novu dimenziju, slicno NetCDF formatu (.nc) koji se koristi u meteorologiji za skladistenje prostorno-vremenskih podataka.

# Kreiranje nizova
# Nizovi se kreiraju pomocu funkcije array(). 
v1 <- runif(5,100,200)
v <- c(2,6,7,7)
# Moguce je kreirati trodimenzioni niz na sledeci nacin:
niz <- array(c(v,v1),dim = c(3,3,2))
niz

# Redovima, kolonama i matricama je moguce dodeliti nazive prilikom kreiranja niza.
imena.kolona <- c("kolona1","kolona2","kolona3")
imena.redova <- c("red1","red2","red3")
imena.matrica <- c("matrica1","matrica2")

niz <- array(c(v,v1),dim=c(3,3,2), 
             dimnames=list(imena.kolona,imena.redova,imena.matrica))
niz

# ili
niz <- array(c(v,v1),dim=c(3,3,2), 
             dimnames=list(c("red1","red2","red3"), 
                           c("kolona1","kolona2","kolona3"), 
                           c("matrica1","matrica2")))
niz

# Naknadna promena imena kolona, redova i matrica unutar niza moze se izvrsiti samostalnom funkcijom dimnames().
dimnames(niz) <- list(c("red11","red22","red33"), 
                      c("kolona11","kolona22","kolona33"), 
                      c("matrica11","matrica22"))
niz

# Elemente niza, broj redova, kolona i matrica (dimenzija) je moguce izvesti i u jednom koraku, npr.:
niz2 <- array(c(6:14), dim=c(2,2,3),
              dimnames=list(c("r1","r2"), c("k1","k2"),
                            c("m1","m2","m3")))
niz2

# Primecuje se da elementi skupa brojeva od 6 do 14 pocinju da se ponavljaju kako bi popunili prazna mesta unutar niza. 
# U slucaju da je tih elemenata bilo vise nego slobodnih mesta, preostali elementi bi bili odbaceni.

# Selekcija i ekstrakcija elemenata niza
# Podacima niza je moguce pristupiti navodenjem indeksa ili imena, kao i kada je rec o drugim objektima (vektorima, tabelama, matricama, itd.), s tim da u slucaju nizova imamo i treci indeks ("rednibrojreda", "rednibrojkolone","rednibrojdimenzije/matrice"):
niz2[1,2,]

# Navedena komanda ispisuje elemente prvog reda, druge kolone i svih dimenzija, dok komanda:
niz2[,,2:3]
# prikazuje sve kolone i redove unutar 2. i 3. matrice niza, ili koriscenjem imena redova, kolona i matrica:
niz2["r1","k2",]
# sto je rezultat ekvivalentan prvom primeru izbora elementa prvog reda i druge kolone u sve tri matrice niza.

# Operacije sa nizovima
# Operacije sa nizovima se najcesce izvode kroz provobitnu selekciju elemenata, cime se dobijaju vektori, matrice ili novi nizovi, kojima se u R-u odmah pripisuje odgovarajuca klasa objekta:
is.vector(niz2["r1","k2",])
is.matrix(niz2[,,3])
is.array(niz2[,,2:3])

# Npr. mnozenje elemenata druge i trece matrice unutar niza2 se moze uraditi na sledeci nacin:
niz2[,,2]*niz2[,,3]
# Ili mnozenje dva vektora (prve kolone prve matrice sa drugom kolonom druge matrice):
niz2[1,,1]*niz2[2,,2]

# Pored operacija sa elementima, na nizovima se mogu izvrsiti osnovne matematicke funkcije, kao racunanje sume, srednje vrednosti svih elemenata, odredivanje najvise i najnize vrednosti, itd.
sum(niz2)
mean(niz2)
min(niz2)
max(niz2)
