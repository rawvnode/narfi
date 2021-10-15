#!/bin/bash

cd /Users/vinodhravi/microglia/aws-sandbox/buri/services/litr


while [[ "$#" -gt 0 ]]; do
    case $1 in
        -c|--cache) cache="$2"; shift ;;
        *) echo "unknown option: $1"; exit 1 ;;
    esac
    shift
done

echo "cache: $cache"


if [ $cache == "yes" ]
then
    docker build --no-cache --label litr --tag litr --file docker/Dockerfile . --target development
else
    docker build --label litr --tag litr --file docker/Dockerfile . --target development
fi

