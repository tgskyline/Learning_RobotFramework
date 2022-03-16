*** Settings ***
Documentation   Exemplo de teste para se exibir a listagem dos meses 
*** Variable ***
#Tipo Lista
@{MES}    Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro 

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
   
    #Lista
    Log    Meses do Ano: ${MES}