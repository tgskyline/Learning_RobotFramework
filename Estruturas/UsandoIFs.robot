*** Settings ***
Documentation   Suíte para exemplificar o uso de IF nos testes
...             O IF deve ser pouco utilizado, mas tem hora que não tem jeito
...             e precisamos dele mesmo, então vamos ver como é!
...             IF: use com moderação!

*** Variable ***
@{FRUTAS}   maça  banana  uva  abacaxi

*** Test Case ***
Caso de teste exemplo 01
    Rodando uma keyword dada uma condição = true
    Rodando uma keyword dada uma condição = false
    Armazenando um valor em uma variável dada uma condição

*** Keywords ***
Rodando uma keyword dada uma condição = true
    Run Keyword If      '${FRUTAS[1]}' == 'banana'      Log   O item número 1 é a banana!!

Rodando uma keyword dada uma condição = false
    Run Keyword Unless  '${FRUTAS[1]}' == 'maça'        Log   O item número 1 não é uma maça!!

Armazenando um valor em uma variável dada uma condição
    ${VAR}     Set Variable If   '${FRUTAS[2]}' == 'uva'     uva
    Log        Minha variável VAR é uma ${VAR}!!
