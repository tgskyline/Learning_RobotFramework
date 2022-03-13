*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //span[@class='a-size-base a-color-base apb-browse-refinements-indent-1 a-text-bold'][contains(.,'Eletrônicos e Tecnologia')]
${TEXT_HEADER_ELETRONICO}    Eletrônicos e Tecnologia
${CAMPO_BUSCA}    twotabsearchtextbox
${BTN_PESQUISA}    nav-search-submit-button

*** Keywords ***

# CASO DE TESTE 1
Abrir o navegador
    Open Browser     browser=${BROWSER}
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

# CASO DE TESTE 2

Digitar o nome de produto "${PESQUISA_PRODUTO}" no campo de pesquisa
    Input Text    locator=${CAMPO_BUSCA}    text=${PESQUISA_PRODUTO}

Clicar no botão de pesquisa
    Click Element    ${BTN_PESQUISA}

Verificar o resultado da pesquisa se esta listando o produto pesquisado
    Element Should Be Visible    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Xbox Series S')])[2]

Verificar o resultado da pesquisa se esta listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]

# GHERKIN STEPS

# CASO DE TESTE 1

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

E a categoria "Celulares e Comunicação" deve ser exibida na página
    Verificar se aparece a categoria "Celulares e Comunicação"

# CASO DE TESTE 2

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se esta listando o produto "Console Xbox Series S"