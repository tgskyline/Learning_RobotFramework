*** Settings ***
Resource    C:/Users/tiago.santos/OneDrive/Documentos/Automação de Testes/RobotFramework/WebTesting/Advanced_RobotFramework/Page Objects/SuiteSiteTestePracticePO/resources/Resource.robot
Library    SeleniumLibrary
Library    String
Library    Process

*** Variables ***
${MYACC_MSG_WELCOME}    xpath=//*[@id="center_column"]/p

*** Keywords ***

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${MYACC_MSG_WELCOME}
    Element Text Should Be           ${MYACC_MSG_WELCOME}
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           xpath=//*[@id="header"]/div[2]//div[1]/a/span    Teste Teste do Teste que ta Testado