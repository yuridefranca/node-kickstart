#!/usr/bin/env bash

CURRENT_PATH=$(pwd)
PREVIOUS_PATH=$(dirname "$CURRENT_PATH")

POSTGRES_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)

function initMenu() {
    if ! dpkg-query -W -f='${Status}' dialog | grep "ok installed"; then
        AptUpdate
        $SUDO apt-get install -y dialog
    fi

    projectNameDialog

    projectTypeDialog

    setUpProject
}

function projectNameDialog() {
    PROJECT_NAME=$(                                                             \
                dialog                                                          \
                    --title "Nome do Projeto"                                   \
                    --inputbox "Digite o nome do Projeto:"                      \
                    8 50                                                        \
                    $PROJECT_NAME                                               \
                    3>&1 1>&2 2>&3 3>&-
	)
}

function projectTypeDialog() {
    PROJECT_TYPE=$(                                                             \
            dialog                                                              \
                --clear                                                         \
                --title "Tipo do projeto:"                                      \
                --menu "Escolha o tipo do projeto que você está iniciando"      \
                15 50 10                                                         \
                1 "Nodejs"                                                      \
                2 "Nodejs + PostgreSQL"                                           \
                3 "Nodejs + Typescript"                                         \
                4 "Nodejs + Typescript + PostgreSQL"                              \
                5 "Nodejs + Typescript + HubSpot"                               \
                6 "Nodejs From Scratch"                                         \
                2>&1 >/dev/tty
    )

    case $PROJECT_TYPE in
        1) 
            PROJECT_BRANCH=feature/nodejs
            ;;
        2) 
            PROJECT_BRANCH=feature/nodejs-postgres
            ;;
        3) 
            PROJECT_BRANCH=feature/typescript
            ;;
        4) 
            PROJECT_BRANCH=feature/typescript-postgres
            ;;
        5) 
            PROJECT_BRANCH=feature/typescript-hubspot
            ;;
        6) 
            PROJECT_BRANCH=feature/scratch
            ;;
    esac   
}

setUpProject() {
    NEW_PATH="${PREVIOUS_PATH}/${PROJECT_NAME}"

    cp -r $CURRENT_PATH $NEW_PATH
    
    cd $NEW_PATH

    git checkout -f $PROJECT_BRANCH

    rm -rf .git

    git init

    sed -i "s/PROJECT_NAME=.*/PROJECT_NAME=$PROJECT_NAME/g" $NEW_PATH/.env.example
    sed -i "s/POSTGRES_DB=.*/POSTGRES_DB=${PROJECT_NAME}_db/g" $NEW_PATH/.env.example
    sed -i "s/POSTGRES_USER=.*/POSTGRES_USER=docker/g" $NEW_PATH/.env.example
    
    cp .env.example .env
    
    sed -i "s/POSTGRES_PASSWORD=.*/POSTGRES_PASSWORD=$POSTGRES_PASSWORD/g" $NEW_PATH/.env

    cp www/.env.example www/.env

    sed -i "s/\"name\":.*/\"name\": \"${PROJECT_NAME}\",/g" $NEW_PATH/www/package.json

    git add .

    git commit -m "Initial Commit"

    code .
}


initMenu

clear

cd $NEW_PATH