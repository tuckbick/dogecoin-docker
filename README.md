```yml
version: '2'
services:
  dogecoin:
    container_name: dogecoin
    image: tuckbick/dogecoin:latest
    ports:
      - 22555:22555
      - 22556:22556
    volumes:
      - /etc/localtime:/etc/localtime
      - /my/dir/.dogecoin:/root/.dogecoin
    restart: always
    network_mode: host
```