# Learning_RobotFramework

## Aprendizado sobre RobotFramework

<br>

## ANOTAÇÕES

 - Para instalar uma versão especifica do Robot Framework

> pip install --upgrade robotframework==3.2.2

 - Para instalar a versão mais recente do Robot Framewoork

> pip install robotframework

> pip install -U robotframework

<br>

## Verificar bibliotecas do Python que estão instaladas ou atualizar

-- Acessar o portal pypi.org > https://pypi.org/

> pip freeze
 
 - Libraries Externas mais utilizadas, para atualizar todas sempre utilize o comando 

> pip install -U
 
 Selenium
> pip install -U robotframework-seleniumlibrary
 
 Requests
> pip install -U robotframework-requests

<br>

## Extensão do VsCode

> Robot Framework Language Server da Robocorp

## Extensão do Google Chrome - TruePath da QaWorld

> https://chrome.google.com/webstore/detail/truepath/mgjhkhhbkkldiihlajcnlfchfcmhipmn?hl=pt-BR

<br>

## Instalação de Drivers

Driver do Firefox, digitar geckdriver no google, navegar até Assets e baixar a versão mais recente para o SO

Driver do Chrome, acessar o site abaixo e baixar a mais versão mais recente

https://sites.google.com/a/chromium.org/chromedriver/downloads

Posteriormente deve ser descompactar e alocar os arquivos .exe na pasta aonde foi instalado o Pyhton

C:\Users\Tiago Gomes\AppData\Local\Programs\Python\Python310\Scripts

<br>

## Atualizando bibliotecas

> pip freeze

- Será listado todas as bibliotecas do pyhton, selecione somente as com robot framework e utilize o comando abaixo para cada uma delas

> pip install -U [Descrição da Biblioteca]

- Usar extensão do Google Chrome True Path da qaworld

- Rodando somente um Caso de Teste da Suíte

> robot -t ["nome do teste em aspas duplas"] [nome do arquivo]

<br>

## Se mantenha atualizado com as novas releases

O significado da sigla [rc] é Release Candidate, é uma verão que ainda esta sendo desenvolvida

- Acesse o repositório do RobotFramework no GitHub pelo link abaixo e localize a pasta com a última release, estude e aplique as novidades

> https://github.com/robotframework/robotframework/tree/master/doc/releasenotes

<br>

## Rodar o Robot por linha de comando

- Formas de rodar o teste por linha de comando

> robot --help (Exibe o Help do RobotFramework)

> robot -i [digite uma tag] [nome do arquivo] (Roda somente os testes com as determinadas tags)

> robot -e [digite uma tag] [nome do arquivo] (NÃO irá rodar somente os testes com as determinadas tags)

> robot -d [nome de uma pasta] [nome do arquivo]

<br>

## Rodar por linha de comando, mas determinando qual browser usar

> robot -v [variável global:navegador]

Ex: robot -v BROWSER:firefox

- Também é possível combinar parametros para se rodar o teste via linha de comando

Ex: robot -v BROWSER:firefox -i menus -d resultados -v URL:http://www.google.com

<br>

## Tipos de variáveis

- Simples
> ${GLOBAL_SIMPLES} [String]

-Tipo Lista
> @{FRUTAS}	morango  banana  maça   uva  abacaxi

- Tipo Dicionário
> &{PESSOA}  nome=May Fernandes email=mayfernandes@exemplo.com.br  idade=28  sexo=feminino

<br>

# Boas Práticas

<br>

## Uso de Documentation

Usado para abaixo do título do cenário de teste para descrever pontos relevantes do teste, exemplo abaixo;

> [Documentation]     Exemplo de documentação
 
<br>

## Uso de Tags

Usado para classificar os testes para que posteriormente seja possível executar somente testes com a mesma classificação ou Tag, veja exemplo abaixo;

> [Tags]              exemplo_tags    exemplo_mais_de_um_tipo_tags

<br>

## Comunicação com SGBD

Para realizar testes comunicando com SGBD de sua escolha será necessário ter a Librarie [ databaselibray ] no caminho   [...\python\python310\lib\site-packages] utilize o comando pip abaixo para isso.

> pip install -U robotframework-databaselibrary

<br>

### **Driver para comunicação do Python com SGBD**

<br>

De acordo com o banco de dados que irá utilizar é necessário instalar o Driver respectivo para para o SGBD, abaixo alguns exemplo de instalação de Drivers e seus respectivos SGBD.

Para **SQLite**: não precisa instalar nada!

> pip install psycopg2 - para **PostgreSQL** 

> pip install pymysql - para **MySQL**

> pip install pymssql - para **SQL Server**

> pip install cx-Oracle - para **Oracle**


