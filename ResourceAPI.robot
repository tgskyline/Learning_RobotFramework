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
    Set Test Variable    ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    GET On Session    FakeAPI    Books/${ID_LIVRO}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Conferir status code
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retorna uma lista com ${QTD_LIVROS} livros
    Length Should Be    ${RESPOSTA.json()}    ${QTD_LIVROS} 

Requisitar o libro "15"   


