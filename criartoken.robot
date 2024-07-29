*** Settings ***
Library     Collections
Library     RequestsLibrary

*** Variables ***
${BASEURL}      https://restful-booker.herokuapp.com

*** Test Cases ***
Gerar um token
    ${data}=        Create Dictionary       username=admin      password=password123
    
    #Enviando a solicitação de POST
    ${response}=        POST        ${BASEURL}/auth     json=${data}
    Should Be True    ${response.ok}
    Should Be Equal As Numbers    ${response.status_code}    200
    
    #Validando os valores retornados e formatando para json
    ${data_response}=       Set Variable        ${response.json()}
    
    #Capturando o token gerado.
    ${token}=       Get From Dictionary    ${data_response}    token
    Log    Seu token é:${token}
    
    