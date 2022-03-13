## Learning_RobotFramework
Aprendizado sobre RobotFramework

ANOTAÇÕES

 - Para instalar uma versão especifica do Robot Framework

> pip install --upgrade robotframework==3.2.2

 -  Para verificar os pacotes/bibliotecas do Python instalado
 
> pip freeze
 
 - Libraries Externas mais utilizadas
 
 Selenium
> pip install -U robotframework-seleniumlibrary
 
 Requests
> pip install -U robotframework-requests

- Extensão do VsCode

Robot Framework Language Server da Robocorp

- Instalação de Drivers

Driver do Firefox, digitar geckdriver no google, navegar até Assets e baixar a versão mais recente para o SO

Driver do Chrome, acessar o site abaixo e baixar a mais versão mais recente

https://sites.google.com/a/chromium.org/chromedriver/downloads

Posteriormente deve ser descompactar e alocar os arquivos .exe na pasta aonde foi instalado o Pyhton

C:\Users\Tiago Gomes\AppData\Local\Programs\Python\Python310\Scripts

- Atualizando bibliotecas

> pip freeze

será listado todas as bibliotecas do pyhton, selecione somente as com robot framework e utilize o comando abaixo para cada uma delas

> pip install -U [Descrição da Biblioteca]

- Usar extensão do Google Chrome True Path da qaworld

- Rodando somente um Caso de Teste da Suíte

> robot -t ["nome do teste em aspas duplas"] [nome do arquivo]

- Formas de rodar o teste por linha de comando

>