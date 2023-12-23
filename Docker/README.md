### Docker
Docker je platforma, ktorá pomáha vývojárom budovať, zdieľať a spúšťať aplikácie kdekoľvek pomocou Docker obrazov a kontajnerov.




## TODO:
# Prikaz COPY, ktory poznate, je mozne pouzit aj na kopirovanie suborov, ktore vznikli v predchadzajucom stage, tj:
# COPY --from=<stage_name> source target
# V nasom pripade sa predchadzajuci stage vola: builder (vsimnite si pomenovanie na riadku c. 4)
# Vasou ulohou je:
#  1. pridat prikaz, ktory skopiruje zo stage builder subor: /builder/main do adresara /app/ (vsimnite si na riadku c.8, ze vystupom kompilacie je subor s nazvom main)
#  2. nastavit pracovny adresar (workdir) na: /app
#  3. pridat instrukciu, ktora zabezpeci, ze po vytvoreni kontajnera sa spusti aplikacia (tj. ./main)

FROM scratch
WORKDIR /app
COPY --from=builder /build/main .
EXPOSE 9080
ENTRYPOINT ["./main"]


## TODO: Vasou ulohou je:
# 1. pridat instrukciu, ktora bude informovat o tom, ze kontajner publikuje TCP port 8080
# 2. pridat instrukciu, ktora zabezpeci, ze po vytvoreni kontajnera sa spusti nginx:
#   nginx -g daemon off;
#   TIP: pozor ako zadavate parametre do instrukcie

WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["nginx -g 'daemon off;'"]
