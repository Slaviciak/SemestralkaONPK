### Docker
Docker je platforma, ktorá pomáha vývojárom budovať, zdieľať a spúšťať aplikácie kdekoľvek pomocou Docker obrazov a kontajnerov.

### Backend Dockerfile
Do backendovej časti dockerfile sme doplnili nasledujúce príkazy:
```
WORKDIR /app
COPY --from=builder /build/main .
EXPOSE 9080
ENTRYPOINT ["./main"]
```
### Frontend Dockerfile
Do frontendovej časti dockerfile sme doplnili nasledujúce príkazy:
```
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["nginx -g 'daemon off;'"]
```