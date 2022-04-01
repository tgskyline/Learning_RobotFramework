*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${LOGIN_FIELD_EMAILCREATEACCOUNT}    id=email_create
${LOGIN_BTN_CREATEACCOUNT}           id=SubmitCreate 

*** Keywords ***

Informar um e-mail válido
    Wait Until Element Is Visible   ${LOGIN_FIELD_EMAILCREATEACCOUNT}
    ${EMAIL}                        Generate Random String
    Input Text                      ${LOGIN_FIELD_EMAILCREATEACCOUNT}    ${EMAIL}@testerobot.com

Clicar em "Create an account"
    Click Button    ${LOGIN_BTN_CREATEACCOUNT}
    

