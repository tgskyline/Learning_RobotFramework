*** Settings ***
Documentation   Resolução da Tarefa 06

*** Variables ***
@{NUMEROS}    0    1    2    3    4    5    6    7    8    9    10

*** Test Case ***
Qual é o número
    [Tags]    number
    Eu sou o numero

*** Keywords ***
Eu sou o numero
    Log to console    ${\n}
    FOR    ${INDICE}   ${VALOR}    IN ENUMERATE    @{NUMEROS}
        IF    ${VALOR} == 5
            Log To Console    Eu sou o número 5!  
        ELSE IF    ${VALOR} == 10
            Log To Console    Eu sou o número 10!  
        ELSE   
            Log To Console    ${VALOR} = Eu não sou o número 5 e nem o 10! 
        END
    END
        
*** Comments ***
Teste feito para testar comentários

# *** Test Cases ***
# Teste de imprimir apenas alguns números
#   Imprimir somente se for 5 e 10

# *** Keywords ***
# Imprimir somente se for 5 e 10
#   Log To Console  ${\n}

#   FOR    ${numero}    IN   @{NUMEROS}
#       IF  ${numero} == 5
#           Log To Console    Eu sou o número 5!
#       ELSE IF  ${numero} == 10
#           Log To Console    Eu sou o número 10!
#       ELSE
#           Log To Console    Eu não sou o número 5 e nem o 10!
#       END
#   END

#   Log To Console  ${\n}
#   #FICA A DICA
#   # Existem outros modos de fazer, veja abaixo:
#   FOR    ${numero}    IN   @{NUMEROS}
#       IF  ${numero} == 5 or ${numero} == 10
#           Log To Console    Eu sou o número ${numero}!
#       ELSE
#           Log To Console    Eu não sou o número 5 e nem o 10!
#       END
#   END

#   Log To Console  ${\n}
#   FOR    ${numero}    IN   @{NUMEROS}
#       IF  ${numero} in (5, 10)
#           Log To Console    Eu sou o número ${numero}!
#       ELSE
#           Log To Console    Eu não sou o número 5 e nem o 10!
#       END              
#   END
    