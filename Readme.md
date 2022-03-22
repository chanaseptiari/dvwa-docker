# Damn Vulnerable Web App In Docker

Damn Vulnerable Web App merupakan sebuah aplikasi berbasis website dengan bahasa PHP. tujuan utama dari DVWA adalah profesional keamanan menguji keterampilan dan alat mereka di lingkungan hukum, untuk membantu pengembang web lebih memahami proses melindungi aplikasi web, dan untuk membantu siswa dan guru belajar tentang keamanan aplikasi web. 

___
## Build images docker

```shell
docker build -t dvwa-docker .
```
___
## Running images docker

```sh
docker run --rm -p 8080:80 dvwa-docker
```
___
## Running Docker Container

```sh
docker run --rm -p 8080:80 chanaseptiari/dvwa-docker
```

## Referensi
Source Code : [digininja/DVWA](https://github.com/digininja/DVWA)