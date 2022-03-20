*** Settings ***
Documentation   Suíte para exemplificar o uso de LOOPS nos testes
...             Os LOOPS devem ser pouco utilizados, mas tem hora que não tem jeito
...             e precisamos dele mesmo, então vamos ver como é!
...             LOOPS: use com moderação!
...             Infelizmente o Loop FOR ainda não tem uma estrutura keyword-driven
...             Mas o criador do Robot já disse que estão estudando uma solução!

*** Variable ***
@{FRUTAS}    maça  banana  uva  abacaxi

*** Test Case ***
Caso de teste exemplo 01
    Usando FOR com RANGE
    Usando FOR com LISTA
    Saindo de um FOR
    Usando a keyword REPEAT

*** Keywords ***
Usando FOR com RANGE
    :FOR    ${COUNT}    IN RANGE    1    6
    \    Log    Meu contador atual é: ${COUNT}. O range será de 1 a 5!
    \    Run Keyword If    ${COUNT} == 5    Log    Acabou o loop!!!

Usando FOR com LISTA
    :FOR    ${ITEM}    IN    @{FRUTAS}
    \    Log    Minha fruta é: ${ITEM}
    \    Run Keyword If    '${ITEM}' == 'abacaxi'    Log    Acabou o loop!!!

Saindo de um FOR
    :FOR    ${ITEM}    IN    @{FRUTAS}
    \    Exit For Loop If    '${ITEM}' == 'uva'
    \    Log    Minha fruta é: ${ITEM}

Usando a keyword REPEAT
    Repeat Keyword    4    Log    Vamos logar essa frase 4 vezes!!!
