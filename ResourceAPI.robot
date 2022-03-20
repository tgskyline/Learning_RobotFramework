*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library          RequestsLibrary
Library          Collections

*** Variables ***

${URL_API}    https://fakerestapi.azurewebsites.net/api/v1/


*** Keywords ***

Conectar a minhas API
    Create Session    FakeAPI   ${URL_API}

Requisitar todos os livros
    ${RESPOSTA}    GET On Session    FakeAPI    Books
    Log    ${RESPOSTA.text}

