# 7

# Liste (lists)

# Liste su u neku ruku slicne atomskim vektorima jer grupisu podatke u jednoj dimenziji.
# Medutim, ono sto je za njih posebno je da ne grupisu individualne vrednosti, vec R objekte (vektore, tabele, matrice, druge liste, itd.). 
# One su strukturno kompleksni objekti koji svoje elemente skladiste hijerarhijski.
# Skladistenjem listi unutar liste se dobije granajuca struktura poput dendrograma.

# Kreiranje liste

# Liste se kreiraju pomocu funkcije list(), koja je ekvivalent funkciji c() kod atomskih vektora:
l <- list(1:5, "M", c(TRUE,FALSE,TRUE), c(2,6,7,7))
str(l)

# Listu moze cinite vise drugih lista, ili lista listi.
lx <- list(list(list(list(l))))
str(lx)

# Selekcija i ekstrakcija elemenata liste

# Elemente liste i objekata unutar liste mozemo selektovati na vise nacina. 
#Izborom rednog broja elementa objekta:
l[[3]]
# dobijamo 3. element liste, dok koriscenjem samo jednog para uglastih zagrada dobijamo 3. element kao novu listu.
l[3]
is.list(l[[3]])
is.list(l[3])

# Elemente liste je moguce selektovati i pomocu njihovih imena, kao sto je slucaj sa elementima svih ostalih objekata. 
# S obzirom da prvobitno kreirana lista nema imena elemenata, valja kreirati novu.
l1 <- list(a=1:5, b="M", c = c(TRUE,FALSE,TRUE), d=c(2,6,7,7))
str(l1)

# Funkcija str() je veoma bitna prilikom koriscenja listi, jer omogucava sagledavanje strukture objekta bez ispisivanja svih elemenata, sto je posebno bitno kada se radi o vecim kolicinama podataka.
# Selektovanje elemenata liste na slican nacin kao i kod ostalih objekata u R-u pomocu operatora $.
# Tako, na primer, sledecom komandom mozemo da selektujemo vektor a, pri cemu dobijeni objekat zadrzava svoj originalni tip vector.
l1$a

# Takode, iz kreirane liste l1 mozemo ekstrahovati elemente a, c ili bilo koji drugi kao novu listu koriscenjem jednostrukih uglastih zagrada.
l1["a"]
l1["c"]
is.list(l1["a"])
is.list(l1["c"])

# Koriscenjem dvostrukih zagrada rezultat ce biti iskljucivo vektor, a ne lista.
l1[["a"]]
is.vector(l1[["a"]])
is.list(l1[["a"]])

# Navodeci imena elemenata liste moguce je kreirati novu listu.
l2 <- l1[c("a","c")]
str(l2)

# Dodeljivanje imena prvobitnoj listi l je bilo moguce i pomocu funkcije names().
str(l)
names(l)<-c("a","b","c","d")
str(l)

# Moguce je izvrsiti dodavanje novih elemenata postojecoj listi.
# Funkcijom length() se proverava duzina liste.
length(l)

# Na prvo naredno mesto dodaje se novi clan sa odredenim elementima.
l[["e"]] <- 8:17
length(l)
str(l)

# Na slican nacin kao i kod drugih objekata u R-u, iskljucuje se odredeni element liste.
l <- l[-3]
str(l)

# Operacije sa listama

# Operacije koje se izvode na objektima nastalim selekcijom i ekstrakcijom podataka su objasnjena u prethodnim poglavljima (vektori, tabele, matrice i nizovi).
# Ono sto sto je karakteristicno za liste je njihovo ucesce u procesu paralelizacije izvrsenja funkcija nad elementima liste pomocu funkcija iz familije apply koje se nalaze u bazicnoj instalaciji R-a. 
# Ove funkcije se koriste za eliminaciju koriscenja petlje for omogucavajuci time paralelno izvrsavanje procesa nad zeljenim elementima, umesto izvrsavanja operacija nad jednim elementom u jednom trenutku.

