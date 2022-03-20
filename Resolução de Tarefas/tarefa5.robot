*** Settings ***
Documentation   Resolução da tarefa 5
Library    String
*** Variable ***
&{PESSOA}       nome=Tiago    sobrenome=Gomes   dominio=@testerobot.com  

*** Test Cases ***
Tarefa 05
    Email customizado
    
*** Keywords ***
Email customizado
    Nome e Sobrenome para Email   ${PESSOA.nome}   ${PESSOA.sobrenome}   
    
Nome e Sobrenome para Email
    [Arguments]     ${NOME_USUARIO}   ${SOBRENOME_USUARIO} 
    ${ALEATORIO}    Generate Random String   8  [LETTERS]1234 
    ${EMAIL}    Catenate    ${NOME_USUARIO}${SOBRENOME_USUARIO}${ALEATORIO}${PESSOA.dominio}
    Log To Console    ${EMAIL}

# Solução da Professora

# *** Settings ***
# Library   String

# *** Variables ***
# &{PESSOA}   nome=May   sobrenome=Fernandes

# *** Test Cases ***
# Imprimindo um e-mail customizado e aleatório
#     ${EMAIL_CRIADO}    Criar e-mail customizado e aleatório    ${PESSOA.nome}    ${PESSOA.sobrenome}
#     Log To Console     ${EMAIL_CRIADO}

# *** Keywords ***
# Criar e-mail customizado e aleatório
#     [Arguments]       ${NOME}  ${SOBRENOME}
#     ${ALEATORIA}      Generate Random String
#     ${EMAIL_FINAL}    Set Variable    ${NOME}${SOBRENOME}${ALEATORIA}@testerobot.com
#     [Return]          ${EMAIL_FINAL}



