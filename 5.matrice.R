# 5

# Matrice

# Kreiranje matrice

# Matrice su objekti koji skladiste dvodimenzione nizove poput matrica u linearnoj algebri.
# Matricu je moguce kreirati dodavanjem dimenzija atomskom vektoru funkcijom matrix() kroz definisanje broja kolona ili redova.

# Nacini zadavanja:
# 1. pravimo matricu od elemenata jednodimenzionog vektora promenom dimenzija
x<-1:12
dim(x)<-c(3,4)
# x je sada 2d vektor sa 3 vrste i 4 kolone
x

# 2. matricu formiramo pomocu f-je MATRIX
x<-matrix(1:12, nrow=3)
# nrow = broj vrsta matrice
x
#i sto je i:
x<-matrix(1:12,ncol=4)
# ncol = broj kolona
x
# Primecujemo da se pri kreiranju matrice prvo popunjava elementima prva kolona, pa druga, itd.
# Ako hocemo da se popunjava vrsta po vrsta, dodamo parametar BYROW
x <- matrix(1:12,nrow=3,byrow=T)
x

# Davanje imena kolonama i vrstama matrice preko f-ja COLNAMES i ROWNAMES
rownames(x)<-c('A','B','C')
x

# NAPOMENA: U R-u postoji ugradjen vektor LETTERS koji sadrzi slova alfabeta
LETTERS
letters
# prethodna komanda moze da izgleda i ovako:
rownames(x)<-LETTERS[1:3]
x
# Jos ugradjenih vektora korisnih za imena kolona i vrsta matrica: 
month.name
month.abb
colnames(x)<-month.abb[1:4]
x

# 3. Matrica se moze dobiti nalepljivanjem vektora funkcijama CBIND i RBIND:
# f-ja CBIND vezuje vektore kao kolone matrice
a<-1:4
a
b<-5:8
b
c<-9:12
c
cbind(a,b,c)
# skraceno, to je isto sto i:
cbind(1:4,5:8,9:12)
# f-ja RBIND povezuje vektore kao vrste matrice
rbind(1:4,5:8,9:12)

# Pristupanje elementima matrice
x[1,2]
# Pristupanje celoj vrsti/koloni
x[3,]
x[,4]

# OPERACIJE SA MATRICAMA
x<-matrix(c(2,5,3,7,5,1,7,4,3),ncol=3)
# Transponovana matrica
t(x)
# Samo elementi sa dijagonale
diag(x)
# Determinanta
det(x)
# Inverzna matrica
solve(x)
# Mnozenje matrica
a<-cbind(1:3,4:6,7:9)
a
b<-cbind(7:9,4:6,1:3)
b
# Mnozenje elemenata sa istim indeksom
a*b
# Matricno mnozenje
a%*%b

# sume/srednje vrednosti po kolonama/vrstama
rowSums(x)
rowMeans(x)
colSums(x)
colMeans(x)

