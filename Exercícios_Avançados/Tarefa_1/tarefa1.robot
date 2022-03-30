*** Settings ***
Documentation    Teste com o uso da library DiffLibrary
...              Com ela é possível comparar dois ou mais arquivos com a mesma extensão
Library          OperatingSystem
Library          DiffLibrary

*** Test Cases ***

1º Comparar dois arquivos .txt
    [Documentation]    Caminho Feliz
    Dado que tenho dois arquivos de cadastro em .txt
    Quando comparado os dois arquivos
    Então devem ser iguais

2º Comparar dois arquivos .txt que são diferentes
    [Documentation]    Caminho Triste
    Dado que tenho dois arquivos de cadastro em .txt são diferentes
    Quando comparado os dois arquivos diferentes
    Então devem ser diferentes

3º Compara dois arquivos .JSON
    [Documentation]    Caminho Feliz
    Dado que tenho dois arquivos de cadastro em .JSON
    Quando comparado os dois arquivos JSON
    Então devem ser iguais

*** Keywords ***

Dado que tenho dois arquivos de cadastro em .txt
    ${ARQ1}    File Should Exist    ./Exercícios_Avançados/Tarefa_1/Arqs/Cad-1.txt
    ${ARQ2}    File Should Exist    ./Exercícios_Avançados/Tarefa_1/Arqs/Cad-2.txt

Dado que tenho dois arquivos de cadastro em .txt são diferentes
    ${ARQ3}    File Should Exist    ./Exercícios_Avançados/Tarefa_1/Arqs/Cad-3.txt
    ${ARQ4}    File Should Exist    ./Exercícios_Avançados/Tarefa_1/Arqs/Cad-4.txt  

Dado que tenho dois arquivos de cadastro em .JSON
    ${ARQ5}    File Should Exist    ./Exercícios_Avançados/Tarefa_1/Arqs/Cad-5.json
    ${ARQ6}    File Should Exist    ./Exercícios_Avançados/Tarefa_1/Arqs/Cad-6.json 

Quando comparado os dois arquivos
    ${COMPARA}    Diff Files    /Users/tiago.santos/OneDrive/Documentos/Automação de Testes/RobotFramework/WebTesting/Exercícios_Avançados/Tarefa_1/Arqs/Cad-1.txt    /Users/tiago.santos/OneDrive/Documentos/Automação de Testes/RobotFramework/WebTesting/Exercícios_Avançados/Tarefa_1/Arqs/Cad-2.txt     

Quando comparado os dois arquivos diferentes
    ${COMPARA}    Diff Files    /Users/tiago.santos/OneDrive/Documentos/Automação de Testes/RobotFramework/WebTesting/Exercícios_Avançados/Tarefa_1/Arqs/Cad-3.txt    /Users/tiago.santos/OneDrive/Documentos/Automação de Testes/RobotFramework/WebTesting/Exercícios_Avançados/Tarefa_1/Arqs/Cad-4.txt      

Quando comparado os dois arquivos JSON
    ${COMPARA}    Diff Files    /Users/tiago.santos/OneDrive/Documentos/Automação de Testes/RobotFramework/WebTesting/Exercícios_Avançados/Tarefa_1/Arqs/Cad-5.json    /Users/tiago.santos/OneDrive/Documentos/Automação de Testes/RobotFramework/WebTesting/Exercícios_Avançados/Tarefa_1/Arqs/Cad-6.json   

Então devem ser iguais
    Log    Arquivos são iguais

Então devem ser diferentes
    Log    Arquivos são diferentes


# *****************Resolução da Professora******************


# *** Settings ***
# Library     DiffLibrary

# *** Test Cases ***
# Comparar dois conteúdos
#      Compare "meu_arquivo.txt" e "meu_outro_arquivo.txt"

# *** Keywords ***
# Compare "${ONE}" e "${TWO}"
#      Diff Files     ${ONE}     ${TWO}

# *****************Resolução de colegas******************

# *** Settings ***
# Documentation    Essa suíte faz um teste prático com a library DiffLibrary
# Library    DiffLibrary
# Resource    Apresentação.robot
# Resource    Apresentação (2).robot

# *** Variables ***
# ${FILE_01}  ${CURDIR}/Apresentação.robot
# ${FILE_02}  ${CURDIR}/test/Apresentação (2).robot

# *** Test Cases ***
# Comparar dois conteúdos
#     Diferencie "Apresentação.robot" e "Apresentação (2).robot"

# *** Keywords ***
# Diferencie "${FILE_01}" e "${FILE_02}"
#     Diff Files    ${FILE_01}    ${FILE_02}
