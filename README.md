# Learning_RobotFramework
Aprendizado sobre RobotFramework

## ANOTAÇÕES

 - Para instalar uma versão especifica do Robot Framework

> pip install --upgrade robotframework==3.2.2

 - Para instalar a versão mais recente do Robot Framewoork

> pip install robotframework

> pip install -U robotframework

 -  Para verificar os pacotes/bibliotecas do Python instalado e atualização

-- Acessar o portal pypi.org > https://pypi.org/

> pip freeze
 
 - Libraries Externas mais utilizadas, para atualizar todas sempre utilize o comando 

> pip install -U
 
 Selenium
> pip install -U robotframework-seleniumlibrary
 
 Requests
> pip install -U robotframework-requests

## Extensão do VsCode

<h3> Robot Framework Language Server da Robocorp </h3>

## Instalação de Drivers

Driver do Firefox, digitar geckdriver no google, navegar até Assets e baixar a versão mais recente para o SO

Driver do Chrome, acessar o site abaixo e baixar a mais versão mais recente

https://sites.google.com/a/chromium.org/chromedriver/downloads

Posteriormente deve ser descompactar e alocar os arquivos .exe na pasta aonde foi instalado o Pyhton

C:\Users\Tiago Gomes\AppData\Local\Programs\Python\Python310\Scripts

- Atualizando bibliotecas

> pip freeze

- Será listado todas as bibliotecas do pyhton, selecione somente as com robot framework e utilize o comando abaixo para cada uma delas

> pip install -U [Descrição da Biblioteca]

- Usar extensão do Google Chrome True Path da qaworld

- Rodando somente um Caso de Teste da Suíte

> robot -t ["nome do teste em aspas duplas"] [nome do arquivo]

## Se mantenha atualizado com as novas releases

O significado da sigla [rc] é Release Candidate, é uma verão que ainda esta sendo desenvolvida

- Acesse o repositório do RobotFramework no GitHub pelo link abaixo e localize a pasta com a última release, estude e aplique as novidades

> https://github.com/robotframework/robotframework/tree/master/doc/releasenotes

## Rodar o Robot por linha de comando

- Formas de rodar o teste por linha de comando

> robot --help (Exbide Help do RobotFramework)

> robot -i [digite uma tag] [nome do arquivo] (Roda somente os testes com as determinadas tags)

> robot -e [digite uma tag] [nome do arquivo] (NÃO irá rodar somente os testes com as determinadas tags)

> robot -d [nome de uma pasta] [nome do arquivo]

## Rodar por linha de comando, mas determinando qual browser usar

> robot -v [variável global:navegador]

Ex: robot -v BROWSER:firefox

- Também é possível combinar parametros para se rodar o teste via linha de comando

Ex: robot -v BROWSER:firefox -i menus -d resultados -v URL:http://www.google.com

## Tipos de variáveis

- Simples
> ${GLOBAL_SIMPLES} [String]

-Tipo Lista
> @{FRUTAS}	morango  banana  maça   uva  abacaxi

- Tipo Dicionário
> &{PESSOA}  nome=May Fernandes email=mayfernandes@exemplo.com.br  idade=28  sexo=feminino

# Boas Práticas

## Uso de Documentation

Usado para abaixo do título do cenário de teste para descrever pontos relevantes do teste, exemplo abaixo;

*** Test Cases ***

Cenário exemplo
    [Documentation]     Exemplo de documentação
    Acessar o menu
    Logar com usuário válido
    Clicar em "ok"

## Uso de Tags

Usado para classificar os testes para que posteriormente seja possível executar somente testes com a mesma classificação ou Tag, veja exemplo abaixo;

*** Test Cases ***

Cenário exemplo
    [Documentation]     Exemplo de documentação
    [Tags]              exemplo_tags    exemplo_mais_de_um_tipo_tags
    Acessar o menu
    Logar com usuário válido
    Clicar em "ok"



