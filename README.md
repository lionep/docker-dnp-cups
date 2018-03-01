# DNP printer in a docker

## Docker compose

```
version: '2.1'

services:
  cups:
    image: lionep/dnp-cups:latest
    hostname: cups
    devices:
      - /dev/bus/usb:/dev/bus/usb
    ports:
      - 127.0.0.1:8631:631
```


Override PPD file with :

```
    volumes:
      - ./file.ppd:/root/DNP.ppd

```
