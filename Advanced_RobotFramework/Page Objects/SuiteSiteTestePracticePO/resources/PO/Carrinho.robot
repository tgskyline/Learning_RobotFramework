*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CARRINHO_TITLE}       Order - My Store
${CARRINHO_DELETAR}     xpath=//*[@class="cart_quantity_delete"]
${CARRINHO_MSG}         xpath=//*[@id="center_column"]/p[@class='alert alert-warning']

*** Keywords ***
Excluir o produto do carrinho
    Title Should Be    ${CARRINHO_TITLE}
    Wait Until Element Is Visible    ${CARRINHO_DELETAR}
    Click Element      ${CARRINHO_DELETAR}

#### Conferências
Conferir se o carrinho fica vazio
    Wait Until Element Is Visible   ${CARRINHO_MSG}
    Element Text Should Be          ${CARRINHO_MSG}    Your shopping cart is empty.
