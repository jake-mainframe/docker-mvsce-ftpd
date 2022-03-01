# MVS/CE Docker Image

```
     888b     d888 888     888  .d8888b.        d88P  .d8888b.  8888888888
     8888b   d8888 888     888 d88P  Y88b      d88P  d88P  Y88b 888
     88888b.d88888 888     888 Y88b.          d88P   888    888 888
     888Y88888P888 Y88b   d88P  "Y888b.      d88P    888        8888888
     888 Y888P 888  Y88b d88P      "Y88b.   d88P     888        888
     888  Y8P  888   Y88o88P         "888  d88P      888    888 888
     888   "   888    Y888P    Y88b  d88P d88P       Y88b  d88P 888
     888       888     Y8P      "Y8888P" d88P         "Y8888P"  8888888888
```

This is the docker container for the MVS/CE mainframe with vulnerable FTPD server auto started. 


| Port | Description                            |
|:----:|----------------------------------------|
| 3270 | Unencrypted TN3270                     |
| 21021| Unencrypted FTPD (localhost port 2121) |
| 3505 | ASCII JES2 listener                    |
| 3506 | EBCDIC JES2 listener                   |


## Users

| Username  | Password |
|:---------:|:--------:|
| IBMUSER   | SYS1     |
| MVSCE01   | CUL8TR   |
| MVSCE02   | PASS4U   |

## Build and run

docker build --tag "mainframed767/mvsce:latest" .  
sudo docker run --rm -it -v /home/jake/docker-mvsce/printers:/home/docker/MVSCE/printers  --name=mvsce mainframed767/mvsce  

## Notes

FTPD proc outputs SYSUDUMP to printers/prt00e.txt (SYSOUT=A)   
Every FTPD crash requires a restart due to it not giving up the port   
