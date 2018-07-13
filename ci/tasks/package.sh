#!/bin/sh

set -e +x

pushd source-code
  echo "Packaging JAR"
  ./mvnw clean package -DskipTests
popd

jar_count=`find source-code/target -type f -name *.jar | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one jar found, don't know which one to deploy. Exiting"
  exit 1
fi

find source-code/target -type f -name *.jar -exec cp "{}" package-output/application.jar \;

echo "Done packaging"
exit 0

#!/usr/bin/env bash

set -ex
echo "Building................"
pushd petclinic-sourcecode
  export TERM=dumb

    pwd
    ls -lart

    mvn clean install -e -DskipTests=true

    echo "Moving binary ................"
    pwd
    cd spring-petclinic-server
    ls -lart
    cd target
    ls -lart
    mv *.jar ../../../jarFile/
    cd ../../../jarFile
    ls -lart
    cd ..
    ls -lart


popd
echo "Build Completed !!!"
