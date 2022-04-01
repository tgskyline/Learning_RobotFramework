*** Settings ***
Resource            ../resources/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Caso de Teste com PO 01: Remover Produtos do Carrinho
    Acessar a página home do site
    Adicionar o produto "t-shirt" no carrinho
    Excluir o produto do carrinho
    Conferir se o carrinho fica vazio

### EXERCÍCIO
# Caso de Teste com PO 02: Adicionar Cliente
#     Acessar a página home do site
#     Clicar em "Sign in"
#     Informar um e-mail válido
#     Clicar em "Create an account"
#     Preencher os dados obrigatórios
#     Submeter cadastro
#     Conferir se o cadastro foi efetuado com sucesso
