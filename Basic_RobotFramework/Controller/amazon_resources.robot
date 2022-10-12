*** Settings ***
Library  SeleniumLibrary    timeout=10s
Library  ../../Library/chromedriversync.py
Library  ../../Library/screenshot.py


*** Variables ***
${BROWSER}    chrome
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //span[@class='a-size-base a-color-base apb-browse-refinements-indent-1 a-text-bold'][contains(.,'Eletrônicos e Tecnologia')]
${TEXT_HEADER_ELETRONICO}    Eletrônicos e Tecnologia
${CAMPO_BUSCA}    twotabsearchtextbox
${BTN_PESQUISA}    nav-search-submit-button
${BTN_ADC_CARRINHO}    add-to-cart-button
${MODAL_ADC_PEDIDO}    //h1[contains(@id,'attach-warranty-header')]
${CLIQUE_FORA}    //div[contains(@class,'a-declarative attach-dss-backdrop')]
${MSG_ADC_CARRINHO}    //span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
${BTN_IR_CARRINHO}    //a[contains(.,'Ir para o carrinho')]
${MSG_CAR_VAZIO}    //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

*** Keywords ***

# CASO DE TESTE 1

Atualiza o ChromeDrive
    ${chromedriver_path}=    Get Chromedriver Path
    Set Global Variable    ${chromedriver_path}

Abrir o navegador
    Atualiza o ChromeDrive
    Open Browser     browser=${BROWSER}    executable_path=${chromedriver_path}
    Maximize Browser Window

Fechar o navegador
    Pyscreenshot
    Close Browser
    Capture Page Screenshot

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
    Wait Until Element Is Visible    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Xbox Series S')])[2]

Verificar o resultado da pesquisa se esta listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]

# CASO DE TESTE 4
Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=(//span[contains(.,'${PRODUTO}')])[2]
    Click Element    locator=${BTN_ADC_CARRINHO}

# CASO DE TESTE 5

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=${MODAL_ADC_PEDIDO}
    Click Element    locator=${CLIQUE_FORA}
    Wait Until Element Is Visible    locator=${MSG_ADC_CARRINHO}
    Click Element    locator=${BTN_IR_CARRINHO}

Remover o produto "${PRODUTO}" do carrinho
    Click Element    locator=//input[contains(@aria-label,'Excluir ${PRODUTO}')]

Verificar se o carrinho fica vazio
    Wait Until Element Contains    locator=${MSG_CAR_VAZIO}    text=Seu carrinho de compras da Amazon está vazio.


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


# CASO DE TESTE 3

Dado que estou na home page da Amazon.com.br, pequiso "Xbox Series S"
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    
Quando adicionar o produto "Console Xbox Series S" no carrinho
    Verificar o resultado da pesquisa se esta listando o produto "Console Xbox Series S"

 Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
     Adicionar o produto "Console Xbox Series S" no carrinho

# CASO DE TESTE 4

E existe o produto "Console Xbox Series S" no carrinho
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio
