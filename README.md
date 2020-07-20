# code-server-pam
Sa se yon kantenè baze sou linuxserver/code-server avèk konfigirasyon pam

Men orijinal la san konfigirasyon

https://hub.docker.com/r/linuxserver/code-server

# Pou itilize l 

```
docker create \
  --name=code-server-pam \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/New_York \
  -e PASSWORD=password `#optional` \
  -e SUDO_PASSWORD=password `#optional` \
  -p 8443:8443 \
  --restart unless-stopped \
  nucklehead/code-server-pam
```
```
docker start code-server-pam
```
