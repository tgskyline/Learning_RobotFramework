# Learning_RobotFramework

## Aprendizado sobre RobotFramework

<br>

## ANOTAÇÕES

 - Para instalar uma versão especifica do Robot Framework

<br>

    pip install --upgrade robotframework==3.2.2

 - Para instalar a versão mais recente do Robot Framewoork

<br>

    pip install robotframework

<br>

    pip install -U robotframework

<br>

## Verificar bibliotecas do Python que estão instaladas ou atualizar

-- Acessar o portal pypi.org  https://pypi.org/

    pip freeze
 
 - Libraries Externas mais utilizadas, para atualizar todas sempre utilize o comando 

<br>    

    pip install -U
 

 Selenium
 <br>

    pip install -U robotframework-seleniumlibrary
 
 Requests
 <br>
    
    pip install -U robotframework-requests

<br>

## Extensão do VsCode

 Robot Framework Language Server da Robocorp

<br>

## Extensão do Google Chrome - TruePath da QaWorld

 https://chrome.google.com/webstore/detail/truepath/mgjhkhhbkkldiihlajcnlfchfcmhipmn?hl=pt-BR

<br>

## Instalação de Drivers

**Driver do Firefox** digitar geckdriver no google, navegar até Assets e baixar a versão mais recente para o SO

**Driver do Chrome** acessar o site abaixo e baixar a mais versão mais recente

https://sites.google.com/a/chromium.org/chromedriver/downloads

Posteriormente deve ser descompactar e alocar os arquivos .exe na pasta aonde foi instalado o Pyhton

C:\Users\Tiago Gomes\AppData\Local\Programs\Python\Python310\Scripts

<br>

## Atualizando bibliotecas

    pip freeze

- Será listado todas as bibliotecas do pyhton, selecione somente as com robot framework e utilize o comando abaixo para cada uma delas

<br>

    pip install -U [Descrição da Biblioteca]

- Usar extensão do Google Chrome True Path da qaworld

- Rodando somente um Caso de Teste da Suíte

<br>

    robot -t ["nome do teste em aspas duplas"] [nome do arquivo]

<br>

## Se mantenha atualizado com as novas releases

O significado da sigla [rc] é Release Candidate, é uma verão que ainda esta sendo desenvolvida

- Acesse o repositório do RobotFramework no GitHub pelo link abaixo e localize a pasta com a última release, estude e aplique as novidades

 https://github.com/robotframework/robotframework/tree/master/doc/releasenotes

<br>

## Rodar o Robot por linha de comando

- Formas de rodar o teste por linha de comando

<br>

    robot --help (Exibe o Help do RobotFramework)

<br>

    robot -i [digite uma tag] [nome do arquivo] (Roda somente os testes com as determinadas tags)

<br>
 
    robot -e [digite uma tag] [nome do arquivo] (NÃO irá rodar somente os testes com as determinadas tags)

<br>

    robot -d [nome de uma pasta] [nome do arquivo]

<br>

## Rodar por linha de comando, mas determinando qual browser usar

    robot -v [variável global:navegador]

Ex: robot -v BROWSER:firefox

- Também é possível combinar parametros para se rodar o teste via linha de comando

Ex: robot -v BROWSER:firefox -i menus -d resultados -v URL:http://www.google.com

<br>

## Tipos de variáveis

- Simples
 ${GLOBAL_SIMPLES} [String]

-Tipo Lista
 @{FRUTAS}	morango  banana  maça   uva  abacaxi

- Tipo Dicionário
 &{PESSOA}  nome=May Fernandes email=mayfernandes@exemplo.com.br  idade=28  sexo=feminino

<br>

# Boas Práticas

## Uso de Documentation

Usado para abaixo do título do cenário de teste para descrever pontos relevantes do teste, exemplo abaixo;

 [Documentation]     Exemplo de documentação
 
<br>

## Uso de Tags

Usado para classificar os testes para que posteriormente seja possível executar somente testes com a mesma classificação ou Tag, veja exemplo abaixo;

 [Tags]              exemplo_tags    exemplo_mais_de_um_tipo_tags

<br>

## Comunicação com SGBD

Para realizar testes comunicando com SGBD de sua escolha será necessário ter a Librarie [ databaselibray ] no caminho   [...\python\python310\lib\site-packages] utilize o comando pip abaixo para isso.

    pip install -U robotframework-databaselibrary

<br>

### **Driver para comunicação do Python com SGBD**

<br>

De acordo com o banco de dados que irá utilizar é necessário instalar o Driver respectivo para para o SGBD, abaixo alguns exemplo de instalação de Drivers e seus respectivos SGBD.

Para **SQLite**: não precisa instalar nada!

Para **PostgreSQL** 

    pip install psycopg2 

Para **MySQL**

    pip install pymysql

Para **SQL Server**

    pip install pymssql 

Para **Oracle**

    pip install cx-Oracle

### **Keyword de conexão com o SGBD**

<br>

**PostgreSQL**
<br>

    Connect To Database   dbapiModuleName=psycopg2   dbName=robot   dbUsername=postgres   dbPassword=postgres   dbHost=localhost   dbPort=5432
<br>

**SQLite 3**
<br>

    Connect To Database Using Custom Params   dbapiModuleName=sqlite3    db_connect_string=database="./${DBName}.db", isolation_level=None
<br>

**MySQL**
<br>

    Connect To Database   dbapiModuleName=pymysql   dbName=${DBName}   dbUsername=${DBUser}   dbPassword=${DBPass}   dbHost=${DBHost}   dbP{DBPort}
<br>

**SQL Server**
<br>

    Connect To Database   dbapiModuleName=pymssql   dbName=${DBName}   dbUsername=${DBUser}   dbPassword=${DBPass}   dbHost=${DBHost}   dbPort=${DBPort}	  
<br>

**Oracle**
<br>

      # Connect To Database Using Custom Params    dbapiModuleName=cx_Oracle    db_connect_string="${DBName}/${DBUser}@${DBHost}:${DBPort}/${DBalias}"
