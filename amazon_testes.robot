*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

# Para fazer em produção use
# Suite Setup
# Suite Teardown

*** Test Cases ***

# MODELO PROCEDURAL

Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verfica o menu eletrônico do site da Amazon.com.br
    ...              e verifica a categoria Computadores e informática
    [Tags]           menus  catergorias
    Acessar a home page do site Amazon.com.br
    # Verificar se o título da página fica "Teste para dar Erro"
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Celulares e Comunicação"

Caso de Teste 02 - Pesquisa de um Produto (Feito por mim)
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca     
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se esta listando o produto pesquisado

Caso de Teste 03 - Pesquisa de um Produto (Resolvido pela professora)
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca     
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se esta listando o produto "Console Xbox Series S"
    # Verificar o resultado da pesquisa se esta listando o produto "Erro Proposital"

Caso de Teste 04 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se esta listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
 
Caso de Teste 05 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se esta listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio