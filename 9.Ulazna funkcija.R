# Ulazna funkcija i operatori

# !! Nesto od ova smo imali ranije, sad detaljnije objasnjenje

# Funkcija za unos podataka od korisnika je readline()
#Parametar prompt ispisuje odgovarajucu poruku, ako je potrebno
#Sve sto se unese se karakterise kao string

readline()
Zdravo

readline(prompt = "Unesi poruku: ")
Zdravo

ime = readline("Ime: ")
Dimitrije
god = readline("Godine: ")
26

print(ime)
print(god)

#??? Operator dodele opsega : kreira elemente sa inkrementom (korakom) 1
# Ako se zeli drugaciji inkrement, koristi se funkcija seq() sa parametrom by
v <- 2:8
print(v)

# moze i 
v

v <- seq(2,8)
v

v <- seq(2,8,by=2)
v

v <- seq(2,8,by=0.5)
v

# Za pretvaranje u drugi tip podatka (konverzija,kastovanje),
# koristi se funkcija as(), uz dodatak tipa podatka u koji se vrsi konverzija
# Konverzija u ceo broj: as.integer()
# Konverzija u realan broj: as.numeric()
# Konverzija u string: as.character()
#Konverzija u niz: as.array()
# Konverzija u matricu: as.matrix()
# itd
v
as.character(v)
as.array(v)

#Operator %in% se koristi za proveru da li element pripada vektoru
v1 <- 8
v2 <- 12
t <- 1:10
v1 %in% t
v2 %in% t

