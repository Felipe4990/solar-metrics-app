#!/bin/bash

PUBLIC_PATH="/c/Users/Public"
PROJECT_NAME=solar-metrics-app
DB_NAME="solar_db" 

mkdir -p $PUBLIC_PATH/$PROJECT_NAME

curl https://download.java.net/openjdk/jdk21/ri/openjdk-21+35_windows-x64_bin.zip \
    -o $PUBLIC_PATH/$PROJECT_NAME/tmp.zip \
&& unzip $PUBLIC_PATH/$PROJECT_NAME/tmp.zip \
    -d $PUBLIC_PATH/$PROJECT_NAME \
&& rm -rf $PUBLIC_PATH/$PROJECT_NAME/tmp.zip

JAVA_HOME="$PUBLIC_PATH/$PROJECT_NAME/jdk-21"; PATH=$PATH:$JAVA_HOME/bin; echo $PATH; ./gradlew clean build

find "$(pwd)/build/libs/$PROJECT_NAME" \
    -type f \
    -print0 \
| xargs -0 mv -t $PUBLIC_PATH/$PROJECT_NAME

mv $PUBLIC_PATH/$PROJECT_NAME/$PROJECT_NAME $PUBLIC_PATH/$PROJECT_NAME/$PROJECT_NAME.jar

cp -r $(pwd)/src/main/resources $PUBLIC_PATH/$PROJECT_NAME

##cp -r $(pwd)/front/ $PUBLIC_PATH/$PROJECT_NAME

rm -rf build

echo "FOOOOOOOOOOOOOOOOOOOOO"

curl https://cdn.mysql.com//Downloads/MySQL-8.4/mysql-8.4.0-winx64.zip \
    -o $PUBLIC_PATH/$PROJECT_NAME/tmp.zip \
&& unzip $PUBLIC_PATH/$PROJECT_NAME/tmp.zip \
    -d $PUBLIC_PATH/$PROJECT_NAME \
&& rm -rf $PUBLIC_PATH/$PROJECT_NAME/tmp.zip

cp -r $(pwd)/assets/config.ini $PUBLIC_PATH/$PROJECT_NAME

"$PUBLIC_PATH/$PROJECT_NAME/mysql-8.4.0-winx64/bin/mysqld.exe" \
    --defaults-file="$PUBLIC_PATH/$PROJECT_NAME/config.ini" \
    --initialize-insecure --console

nohup "$PUBLIC_PATH/$PROJECT_NAME/mysql-8.4.0-winx64/bin/mysqld.exe" \
    --defaults-file="$PUBLIC_PATH/$PROJECT_NAME/config.ini" --console </dev/null >/dev/null 2>&1 &

sleep 17

"$PUBLIC_PATH/$PROJECT_NAME/mysql-8.4.0-winx64/bin/mysql.exe" \
    -h 127.0.0.1 -P 33061 -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'bar'";

"$PUBLIC_PATH/$PROJECT_NAME/mysql-8.4.0-winx64/bin/mysql.exe" \
    -h 127.0.0.1 -P 33061 -u root --password=bar -e "CREATE DATABASE $DB_NAME;";