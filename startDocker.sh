#!/usr/bin/env bash
eval $(cat .env)

# caso não exista um arquivo .env cria um a partir do .env.example
FILE=./.env
if [ ! -f "$FILE" ]; then
    cp .env.example .env
fi

# faz o build da imagem do projeto caso ainda nao tenha
if [[ "$(docker images -q $PROJECT_NAME/nodejs:1.0.0 2> /dev/null)" == "" ]]; then
    docker-compose up -d
else
    docker-compose up -d --build
fi

# docker-compose logs -f

docker-compose exec app bash
