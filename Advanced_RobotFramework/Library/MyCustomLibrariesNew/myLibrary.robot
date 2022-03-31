*** Settings ***
# Library         ./Advanced_RobotFramework/Library/MyCustomLibraries/Libraries/HashLibrary/geradorHash.py
Library    C:/Users/tiago.santos/OneDrive/Documentos/Automação de Testes/RobotFramework/WebTesting/Advanced_RobotFramework/Library/MyCustomLibraries/Libraries/HashLibrary/geradorHash.py


*** Test Cases ***
Teste de conversão de string para HASH sha256
    Converter "Estou ficando ninja em Robot Framework!!" para sha256

Teste de conversão de arquivo para HASH sha256
    Converter o arquivo "arquivo_PDF.pdf" para sha256

*** Keywords ***
Converter "${CONTEUDO}" para sha256
    ${CONTEUDO_HASH}   Gerar Hash    ${CONTEUDO}
    Log   ${CONTEUDO_HASH}

Converter o arquivo "${FILE}" para sha256
    ${CONTEUDO_HASH}   Gerar Hash Arquivo   ./Advanced_RobotFramework/Library/MyCustomLibraries/${FILE}
    Log   ${CONTEUDO_HASH}
