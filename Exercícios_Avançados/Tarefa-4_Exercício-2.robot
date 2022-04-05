*** Settings ***
Documentation       Exemplos da própria Library: https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot
...                 Doc da API do GitHub: https://developer.github.com/v3/
...                 Referências das API https://docs.github.com/pt/rest/reference
Library             RequestsLibrary
Library             Collections
Library    OperatingSystem
Library    String
Resource            C:/Users/tiago.santos/OneDrive/Documentos/Automação de Testes/RobotFramework/WebTesting/Advanced_RobotFramework/API/variables/my_user_and_passwords.robot

*** Variables ***
${GITHUB_HOST}      https://api.github.com
${ISSUES_URI}       /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues/12


*** Test Cases ***

Tarefa 4 Exercício 2
    Conectar com autenticação por token na API do GitHub
    Consulta os "comments" pela Query "/search?q=sort:comments" da Issue 12 ordenando pela Query " AND direction:desc"

*** Keywords ***

Conectar com autenticação por token na API do GitHub
    ${HEADERS}          Create Dictionary    Authorization=Bearer ${MY_GITHUB_TOKEN}
    Create Session      alias=mygithubAuth   url=${GITHUB_HOST}     headers=${HEADERS}     disable_warnings=True

Confere sucesso na requisição
    [Arguments]      ${RESPONSE}
    Should Be True   '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...  msg=Erro na requisição! Verifique: ${RESPONSE}   

Consulta os ${COMMENTS} pela Query ${SORT_COMMENTS} da Issue 12 ordenando pela Query ${DIRECTION}
    &{PARAMS}           Create Dictionary    sort=${SORT_COMMENTS}    direction=${DIRECTION}           
    ${MY_COMMENTS}      Get Request          alias=mygithubAuth       uri=${ISSUES_URI}    params=${PARAMS}
    Log                 Lista de Comments: ${MY_COMMENTS.json()}   
    Log                 Quantidade de comentários na ISSUE #12: ${MY_COMMENTS.json()["comments"]}
    Confere sucesso na requisição   ${MY_COMMENTS}  


    
    
           