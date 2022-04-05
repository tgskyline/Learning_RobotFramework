*** Settings ***
Documentation       Exemplos da própria Library: https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot
...                 Doc da API do GitHub: https://developer.github.com/v3/
Library             RequestsLibrary
Library             Collections
Library             String
Resource            ./variables/my_user_and_passwords.robot

*** Variables ***
${GITHUB_HOST}      https://api.github.com
${ISSUES_URI}       /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues/12/comments

*** Test Cases ***
Exemplo: Postando com body template
    # Conectar com autenticação básica na API do GitHub
    Conectar com autenticação por token na API do GitHub
    Postar uma nova issue com label "robot framework"

Tarefa 4 Exercício 1 Advanced API
    Conectar com autenticação por token na API do GitHub
    POST na Issue "12" comentando "Comentário cadastrado via Robot Framework!"

*** Keywords ***
# Conectar com autenticação básica na API do GitHub
#     ${AUTH}             Create List           ${MY_GITHUB_USER}      ${MY_GITHUB_PASS}
#     Create Session      alias=mygithubAuth    url=${GITHUB_HOST}     auth=${AUTH}     disable_warnings=True

#### ----- Recentemente a API do GitHub mudou a forma de autenticação, crie o seu TOKEN e use no teste
#### ----- conforme nova keyword abaixo:
Conectar com autenticação por token na API do GitHub
    ${HEADERS}          Create Dictionary    Authorization=Bearer ${MY_GITHUB_TOKEN}
    Create Session      alias=mygithubAuth   url=${GITHUB_HOST}     headers=${HEADERS}     disable_warnings=True

Postar uma nova issue com label "${LABEL}"
    ${BODY}         Format String    ${CURDIR}/data/input/post_issue.json
    ...             user_git=${MY_GITHUB_USER}
    ...             label=${LABEL}
    Log             Meu Body ficou:\n${BODY}
    ${RESPONSE}     Post Request    alias=mygithubAuth    uri=${ISSUES_URI}   data=${BODY}
    Confere sucesso na requisição   ${RESPONSE}

POST na Issue "12" comentando "Comentário cadastrado via Robot Framework!"
    ${BODY}         Format String    ${CURDIR}/data/input/post_comment.json
    ...             user_git=${MY_GITHUB_USER}
    Log             Meu Body ficou:\n${BODY}
    ${RESPONSE}     Post Request    alias=mygithubAuth    uri=${ISSUES_URI}   data=${BODY}
    Confere sucesso na requisição   ${RESPONSE}

Confere sucesso na requisição
    [Arguments]      ${RESPONSE}
    Should Be True   '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...  msg=Erro na requisição! Verifique: ${RESPONSE}
