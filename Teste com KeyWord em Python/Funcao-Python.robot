*** Settings ***
Library     ../Library/KeyWordPython.py

*** Test Cases ***
Diga Olá Mundo com Python
    fala comigo "Tiago"

*** Keywords ***
fala comigo "${nome}"
    ${resultado}    Hello Word    Tiago
    Should Be Equal    ${resultado}    Hello Word, eu sou ${nome}.
    Log To Console    ${\n}${\n}${resultado}${\n}



