*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource         ResourceAPI.robot
Suite Setup      Conectar a minhas API

*** Test Cases ***

Buscar a listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros
    Conferir status code    200
    Conferir o reason    OK
    Conferir se retorna uma lista com 200 livros

Buscar um livro especifico (GET em um livro especifico)
    Requisitar o livro "15"
    Conferir status code    200
    Conferir o reason    OK
    Conferir se retorna todos os dados corretos do livro 15
    
Cadastrar um novo livro (POST)
    Cadastrar um novo livro
    Conferir status code   200
    Conferir o reason    OK

Alterar um livro (PUT)
    Conferir de retorna todos os dados alterados do livro    150

Deletar um livro (DELETE)
    Conferir se deleta o livro "200" (o response body deve ser vazio)
