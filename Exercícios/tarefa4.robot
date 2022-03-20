*** Settings ***
Documentation   Tarefa para se crair um dicionário que informe no log a quantidade de dias
*** Variable ***

#Tipo Dicionário
&{MES_DIAS}    Janeiro=31    Fevereiro=28    Março=31    Abril=30    Maio=31    Junho=30    Julho=31    Agosto=30    Setembro=31    Outubro=30    Novembro=31    Dezembro=30 

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
 
    #Dicionário
    Log To Console    Meses do ano e suas quantidade de dias:${MES_DIAS} 
