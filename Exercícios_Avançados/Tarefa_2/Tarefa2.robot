*** Settings ***
Library    ../Tarefa_2/Libraries/MyKeywords.py
Library    MyKeywords


*** Variables ***

${n1}    2
${n2}    4

*** Test Cases ***

Teste de saudação
    Diga Hello Word

Soma dois valores
    Adição de 


*** Keywords ***

Diga Hello Word
    Saudação

Adição de
    Soma    ${n1}    ${n1}

    


