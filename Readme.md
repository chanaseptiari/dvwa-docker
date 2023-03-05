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

## Optional Running

```sh
podman run --rm -p 8080:80 dvwa-docker -e "recaptcha_public_key=''" -e "recaptcha_private_key=''" -e "default_security_level=low" -e "default_phpids_level=disabled" -e "default_phpids_level=false" -e "default_phpids_level=en"
```

## Referensi

Source Code : [digininja/DVWA](https://github.com/digininja/DVWA)
