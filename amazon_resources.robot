*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //span[@class='a-size-base a-color-base apb-browse-refinements-indent-1 a-text-bold'][contains(.,'Eletrônicos e Tecnologia')]
${TEXT_HEADER_ELETRONICO}    Eletrônicos e Tecnologia
${CAMPO_BUSCA}    twotabsearchtextbox
${BTN_PESQUISA}    nav-search-submit-button

*** Keywords ***
Abrir o navegador
    Open Browser     browser=chrome
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go to    url=${URL} 
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${TEXT_HEADER_ELETRONICO}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//span[@dir='auto'][contains(.,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PESQUISA_PRODUTO}" no campo de pesquisa
    Input Text    locator=${CAMPO_BUSCA}    text=${PESQUISA_PRODUTO}

Clicar no botão de pesquisa
    Click Element    ${BTN_PESQUISA}

Verificar o resultado da pesquisa se esta listando o produto pesquisado
    Element Should Be Visible    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Xbox Series S')])[2]

Verificar o resultado da pesquisa se esta listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]