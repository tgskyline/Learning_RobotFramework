
*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library          RequestsLibrary
Library          Collections

*** Variables ***

${URL_API}    https://fakerestapi.azurewebsites.net/api/v1/

&{BOOK_15}    id=15    title=Book 15    pageCount=1500

&{CAD_BOOK}    id=0
...            title=teste
...            description=teste
...            pageCount=200
...            excerpt=teste
...            publishDate=2022-03-21T01:24:10.903Z

&{ALT_BOOK}    id=150
...            title=teste
...            description=teste
...            pageCount=150
...            excerpt=teste
...            publishDate=2022-03-21T02:06:54.408Z


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

Conferir se retorna todos os dados corretos do livro 15
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id           ${BOOK_15.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title        ${BOOK_15.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount    ${BOOK_15.pageCount}
    Should Not Be Empty    ${RESPOSTA.json()["description"]}    
    Should Not Be Empty    ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty    ${RESPOSTA.json()["publishDate"]}    

Cadastrar um novo livro
    ${HEADERS}    Create Dictionary    content-type=application/json
    ${RESPOSTA}    POST On Session     FakeAPI    Books
    ...                                data={"id":0,"title":"teste","description":"teste","pageCount":200,"excerpt":"teste","publishDate":"2022-03-21T01:24:10.903Z"}
    ...                                headers=${HEADERS}
    Set Test Variable    ${RESPOSTA}   

Conferir de retorna todos os dados alterados do livro
    [Arguments]    ${ID_150}
    ${HEADERS}     Create Dictionary    content-type=application/json
    ${RESPOSTA}    Put Request    FakeAPI    Books/${ID_150}
    ...                               data={"id":150,"title":"teste","description":"teste","pageCount":150,"excerpt":"teste","publishDate":"2022-03-21T02:06:54.408Z"}
    ...                               headers=${HEADERS}                  

      
Conferir se deleta o livro ${ID_200} (o response body deve ser vazio)
    ${RESPOSTA}    Delete Request    FakeAPI    ${ID_200}
    Should Be Empty    ${RESPOSTA.text}    
    

    


