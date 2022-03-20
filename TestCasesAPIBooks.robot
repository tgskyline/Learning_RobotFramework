*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource         ResourceAPI.robot
Suite Setup      Conectar a minhas API

*** Test Cases ***

Buscar a listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros


