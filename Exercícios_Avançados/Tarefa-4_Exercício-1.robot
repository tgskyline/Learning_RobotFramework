*** Settings ***
Documentation       Exemplos da própria Library: https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot
...                 Doc da API do GitHub: https://developer.github.com/v3/
Library             RequestsLibrary
Library             Collections
Library             String
Resource            ../Advanced_RobotFramework/API/variables/my_user_and_passwords.robot

*** Variables ***
${GITHUB_HOST}      https://api.github.com
${ISSUES_URI}       /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues/12/comments

*** Test Cases ***
Tarefa 4 Exercício 1 Advanced API
    Conectar com autenticação por token na API do GitHub
    POST na Issue "12" comentando "Comentário cadastrado via Robot Framework!"

*** Keywords ***

Conectar com autenticação por token na API do GitHub
    ${HEADERS}          Create Dictionary    Authorization=Bearer ${MY_GITHUB_TOKEN}
    Create Session      alias=mygithubAuth   url=${GITHUB_HOST}     headers=${HEADERS}     disable_warnings=True

Confere sucesso na requisição
    [Arguments]      ${RESPONSE}
    Should Be True   '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...  msg=Erro na requisição! Verifique: ${RESPONSE}

POST na Issue "12" comentando "Comentário cadastrado via Robot Framework!"
    ${BODY}         Format String    
    ...             C:/Users/tggom/OneDrive/Documentos/Automação de Testes/RobotFramework/WebTesting/Advanced_RobotFramework/API/data/input/post_comment.json
    Set Test Variable    ${BODY}
    ${RESPONSE}     POST On Session    alias=mygithubAuth    url=${ISSUES_URI}   data=${BODY}  expected_status=201
    Confere sucesso na requisição   ${RESPONSE}

