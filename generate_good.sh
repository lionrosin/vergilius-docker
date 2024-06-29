#!/bin/bash

./gradlew bootRun &
sleep 1m
git clone https://github.com/VergiliusProject/kernels-data.git

for f in kernels-data/yml/*.yml
do
    echo importing $f
    curl -s -F "file=@$f" http://localhost:8080/admin
done