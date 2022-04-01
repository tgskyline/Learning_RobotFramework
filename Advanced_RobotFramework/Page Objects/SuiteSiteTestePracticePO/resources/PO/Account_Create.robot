*** Settings ***
Resource    C:/Users/tiago.santos/OneDrive/Documentos/Automação de Testes/RobotFramework/WebTesting/Advanced_RobotFramework/Page Objects/SuiteSiteTestePracticePO/resources/Resource.robot
Library    SeleniumLibrary
Library    String
Library    Process

*** Variables ***
${AC_TITLE}    xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
${AC_BTN_RADIO_GENDER}    id=id_gender2
${AC_FIELD_FIRSTNAME}    id=customer_firstname
${AC_FIELD_LASTNAME}    id=customer_lastname 
${AC_FIELD_PASSWD}     id=passwd
${AC_FIELD_ADRESS_LINE1}    id=address1 
${AC_FIELD_CITY}    id=city 
${AC_FIELD_STATE}    id=id_state
${AC_FIELD_POSTCODE}    id=postcode
${AC_FIELD_PHONE_MOBILE}    id=phone_mobile
${AC_BTN_REGISTER}    submitAccount

*** Keywords ***
Preencher os dados obrigatórios
    Wait Until Element Is Visible   ${AC_TITLE}
    Click Element                   ${AC_BTN_RADIO_GENDER}
    Input Text                      ${AC_FIELD_FIRSTNAME}    Teste
    Input Text                      ${AC_FIELD_LASTNAME}     Teste do Teste que ta Testado
    Input Text                      ${AC_FIELD_PASSWD}                123456
    Input Text                      ${AC_FIELD_ADRESS_LINE1}            Rua Framework, Bairro Robot
    Input Text                      ${AC_FIELD_CITY}                  Floripa
    Set Focus To Element            ${AC_FIELD_STATE}
    ### No firefox ocorreu problema ao achar o listbox State, então coloquei um if para esperar
    ### pelo elemento quando for firefox
    Run Keyword If    '${BROWSER}'=='firefox'  Wait Until Element Is Visible   ${AC_FIELD_STATE}
    Select From List By Index       ${AC_FIELD_STATE}            Florida
    Input Text                      ${AC_FIELD_POSTCODE}         12345
    Input Text                      ${AC_FIELD_PHONE_MOBILE}          99988877

Submeter cadastro
    Click Button    ${AC_BTN_REGISTER}