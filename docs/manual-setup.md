# Database Setup 

![TheEye Logo](./images/logo-theeye-theOeye-logo2.png)

TheEye's database comes packaged and preconfigured to work with the [quick start](./README.md#automatic-installation) script. In order to install it manually there are a couple of changes necesary.

1. Create a `mongodump` folder in the root folder of this repo. This folder will be mounted inside the `theeye-mongo` container in the path `/data/dump/`
   
   ```bash
   mkdir mongodump
   ```

2. Run the Docker Compose image to create and start up the database containers

    ```bash
    docker-compose -f docker-storage-compose.yml up -d
    ```

3. Make a copy of the file `db-import.js` inside `mongodump`

    ```bash
    cp db-import.js mongodump
    ```

4. Now edit the file. In line 14, replace the name `theeye-docs` to `theeye`

    ```javascript
    // const dbName = 'theeye-docs'   // Old name
    const dbName = 'theeye'           // New name
    ```

> Note: 
>   You can set any name you want instead of TheEye, but that's the default name the other TheEye components expect by default. Choosing another name will require you to modify all the compontnts config files, which is not recommended

5. Save the script and execute it in the `theeye-mongo` container 

>! WARNING: 
>!   Executing the script will destroy the existing databse and create an empty one in its place. 

    ```bash
    docker exec -it theeye-mongodb mongo /data/dump/db-import.js
    ```

The database should now be up and running! Enjoy using TheEye, and if you encounter any issues please open an issue on the respective GitHub repos.
