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
    