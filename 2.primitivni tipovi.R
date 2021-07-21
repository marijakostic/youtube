#2 

# Atomski vektori

# Atomski vektori predstavljaju osnovni tip podataka u R-u.
# Oni predstavljaju niz od vise elemenata (komponenti) istog tipa.

# Postoji 6 osnovnih vrsta atomskih vektora. 
# Zovu se jos i primitivnim tipovima podataka.
# To su: logicke vrednosti (TRUE, FALSE), realni brojevi, celi brojevi, kompleksni brojevi, karakteri, "Sirovi" tipovi podatka (engl. raw).

# Logicki podaci

# Logicki tip podataka ("logical")
x <- TRUE
1==1
2==3
# Pisu se velikim slovima, 2 vrednosti - TRUE, FALSE

False # ne postoji objekat
FALSE
# Kao uvek, 0 je FALSE

0==FALSE # TRUE
1==TRUE # TRUE

# Postoje operatori kao u drugim jezicima !, &&, ||
!(FALSE || TRUE) && FALSE


# Metoda class() vraca vrstu podatka kojoj promenljiva pripada.

class(TRUE)
  
# Realni i celi brojevi

# interno uvek double
5 + 6
3 / 2 # = 1.5, tj. brojevi su po default-u double, pa nema problema sa celobrojnim deljenjem

# Realni brojevi potpadaju pod tip podatka "numeric". 
class(5)
x <- 23.5
class(x)
y <- 4
class(y)

# Celi brojevi pripadaju tipu "integer". Mora se naglasiti da je podatak ceo broj tako sto se doda sufiks L. 
x <- 2L
x
class(x) 

5L / 3L # deljenje opet gleda kao realno, mora se precizirati da zelimo celobrojno deljenje

# operator celobrojnog deljenja je %/%
5 %/% 3

# mozemo i da promenimo klasu broja u integer
as.integer(5 / 3)

# Operacije nad brojevima koje su moguce su: +, -, *, /, %/%, %%, ^
4 %% 5 # ostatak pri deljenju
4 ^ 5 # stepenovanje
# postoje ugradjene funkcije exp, sin, cos, tan, atan, asin, itd.
sin(log(exp(pi)))

# rezultat ovoga nije bas nula, vec 1.22e-16 = 1.22 * 10^(-16)
# standardna prica sa poredjenjem double/float vrednosti stoji
sin(log(exp(pi))) == 0 # FALSE

abs(sin(log(exp(pi)))) < 1e-10 # TRUE, za neku toleranciju

# Kompleksni brojevi

# Kompleksni brojevi se definisu koristeci imaginarnu jedinicu i.
# Definisu se kao "complex" tip podataka. 
x <- 2+4i
x
print(class(x)) 

# Stringovi - character

# Ne postoji razlika izmedju stringa i karaktera, sve su stringovi.
# Dakle, tipu podatka "character" pripadaju i pojedinacni karakteri i stringovi.
class("Program")

# Moraju biti ili pod jednostrukim ili dvostrukim navodnicima.
a <- 'a'
b <- "e"
c <- 'string'
d <- "23.4"
class(a)
class(b)
class(c)
class(d)

# Neke korisne funkcije za stringove
# spajanje:
paste("a", "b")
paste0("a", "b") # spaja bez razmaka
paste("Ja", "R", sep = " <3 ") # sep oznacava separator
paste(1, 2, 3, sep = " < ") # ako stavimo npr broj, pretvorice se u string

# c stil formatiranja

sprintf("Broj %d. Izvucen je broj %d.", 7, 7)
sprintf("Broj %.2f.", pi) # pi postoji kao konstanta, e ne postoji vec exp(1)


# "Sirovi" tipovi podatka 

# Potpadaju pod "raw" tip podatka.
# Karakteri su predstavljeni svojim ASCII vrednostima.
x<- charToRaw("Zdravo")
class(x)

