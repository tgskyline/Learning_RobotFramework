*** Settings ***
Documentation   Resolução da Tarefa 06
Library    SeleniumLibrary
Library    String

*** Variables ***

@{NUMEROS}    0    1    2    3    4    5    6    7    8    9    10

*** Test Case ***
Eu sou o numero


*** Keywords ***
Eu sou o numero
    Log to console ${\n}
    FOR    ${INDICE}   ${VALOR}    IN ENUMERATE    @{NUMEROS}
        Log To Console    ${VALOR}
    END
        

    