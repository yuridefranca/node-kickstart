
# Node Kickstart

### Repositório com o kickstart para projetos em NodeJs <br><br>

### Pré-requisitos <br>

Para fazer o uso desse kickstart você precisará ter em seu computador as seguintes ferramentas: <br>
    > Git - https://git-scm.com/  <br>
    > Docker - https://www.docker.com/  <br><br>

### Modo de usar
``` bash
# Clone o repositório
$ git clone git@github.com:yuridefranca/node-kickstart.git

# Entre no diretório do kickstart
$ cd node-kickstart

# Execute o seguinte comando
$ ./init.sh

# Abrirá um menu para onde será definido as configurações do projeto

```

### Instruções Menu <br>

Preencha o nome do projeto em kebab-case ex:

![Dialog Nome do Projeto](/images/dialog-nome-do-projeto.png)

Escolha o tipo de projeto: 

![Dialog Nome do Projeto](/images/dialog-tipo-do-projeto.png)

#### **NodeJs + Typescript** <br>
- Docker;
- NodeJs + Typescript;
- NPM/Yarn;
- Arquitetura padrão com o express;

<br>

#### **NodeJs + Typescript + Mysql** <br>
- Docker;
- NodeJs + Typescript;
- Mysql;
- NPM/Yarn;
- Arquitetura padrão com o express;

<br>

#### **NodeJs + Typescript From Scratch** <br>
- Docker;
- NodeJs;
- NPM/Yarn;
- Projeto vazio para iniciar como desejar;

<br>

### Instruções Docker

``` bash
# Para "subir" o docker execute o seguinte script:
$ ./startDocker.sh

# Para parar o docker execute o seguinte script:
$ ./stopDocker.sh

```