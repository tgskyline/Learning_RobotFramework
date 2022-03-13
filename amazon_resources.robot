*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/

*** Keywords ***
Abrir o navegador
    Open Browser     browser=chrome
Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go to    url=${URL} 