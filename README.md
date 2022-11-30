# TheEye
## What is TheEye?
<table>
  <tr>
    <td> <img src="./docs/images/TheEye-Of-Sauron.png"></td>
    <td> TheEye is a low-code process automation platform developed in NodeJS. Best used as BPM, Rapid Backoffice Development (RAD), Policy Manager and processes' hub.
Technically TheEye is a choreographer.
    </td>
   </tr> 
</table>
<div class="container-fluid" style="text-align: center; font-family: 'Open Sans', sans-serif; width: 100%; padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto;">
      <div class="row" style="display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px;">
        <div class="col-md-12" style="flex: 0 0 50%; max-width: 50%;">
            <table>
              <th><a href="https://bit.ly/3kyybPA"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_redes-sociales-linkedin.png" style="width: 45%; margin: 0 auto;"></a></th>
              <th><a href="https://bit.ly/3Di5FsU"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_redes-sociales-grupo-rpa-copy.png" style="width: 45%; margin: 0 auto;"></a></th>
              <th><a href="https://bit.ly/3kuVqtE"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_redes-sociales-twitter.png" style="width: 45%; margin: 0 auto;"></a></th>
              <th><a href="https://bit.ly/31PIRTb"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_blog-theeye-news.png" style="width: 45%; margin: 0 auto;"></a></th>
              <th><a href="https://bit.ly/31Q7WNT"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_redes-sociales-instagram.png" style="width: 45%; margin: 0 auto;"></a></th>
              <th><a href="https://bit.ly/2YDFs8O"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_redes-sociales-youtube.png" style="width: 45%; margin: 0 auto;"></a></th>
            </table>
        </div>
      </div>
    </div>

## Architecture

![Image of TheEye-overview](./docs/images/TheEye-core-Architect.png)

If you want more information please read the https://documentation.theeye.io

# Install all theeye components on a single machine

## Pre-Requisites
docker and docker compose installed.

Docker: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

Docker-compose: https://docs.docker.com/compose/install/

verify it by running:


```bash
docker ps
```


If you have some permision issue add your user to the docker's group:


```bash
sudo groupadd docker
sudo usermod -aG docker $USER
```



## Automatic installation

1. Clone: `git clone https://github.com/theeye-io-team/theeye-of-sauron && cd theeye-of-sauron`   


2. run: `./quickstart.sh`   


3. Navigate to http://localhost:6080    


## Manual installation

You may want to install TheEye from its source code, as if you were compiling it yourself. If that's the case, you can check [this guide](./docs/manual-setup.md) to learn how to deploy TheEye's database as a standalone image. You will also need to deploy the [Web interface](http://github.com/theeye-io-team/theeye-web), the [Supervisor](http://github.com/theeye-io-team/theeye-supervisor) and the [Gateway](http://github.com/theeye-io-team/theeye-gateway) from their respective repos

> Note:
>   This is only intended for developers that intend to work on TheEye's source code. For regular users, please follow the easy automatic installation tutorial instead

## Documentation

https://documentation.theeye.io
