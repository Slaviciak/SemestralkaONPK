### Docker
Docker je platforma, ktorá pomáha vývojárom budovať, zdieľať a spúšťať aplikácie kdekoľvek pomocou Docker obrazov a kontajnerov.

### Backend Dockerfile

# WORKDIR /app
# COPY --from=builder /build/main .
# EXPOSE 9080
# ENTRYPOINT ["./main"]

### Frontend Dockerfile

# WORKDIR /app
# EXPOSE 8080
# ENTRYPOINT ["nginx -g 'daemon off;'"]