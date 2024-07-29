*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${BASE_URL}     https://restful-booker.herokuapp.com
${RESPONSE}

*** Keywords ***
Step 1: Criando um dicionario
    ${bookingdates}=        Create Dictionary       checkin=2024-04-10      checkout=2024-04-22
    ${data}=        Create Dictionary
        ...     firstname=Diogao
        ...     lastname=Qazando
        ...     totalprice=987
        ...     depositpaid=true
        ...     bookingdates=${bookingdates}
        ...     additionalneeds=Breakfast

        Log    ${data}
        Set Test Variable    ${data}

Step 2: Cadastrando uma nova reserva
        #Enviando s solicitação POST
        ${RESPONSE}=        POST        ${BASE_URL}/booking     json=${data}
        Log    ${RESPONSE.text}
        Log    ${RESPONSE.status_code}
        Log    ${RESPONSE.reason}
        
        Set Suite Variable    ${RESPONSE}

Step 3: Verificando se o response é true
    Should Be True    ${RESPONSE.ok}

Step 4: validando se o status code é 200
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200

Step 5: Validando os valores retornados
    ${booking}=     Set Variable        ${RESPONSE.json()}
    Log Dictionary    ${booking}  #Exibe o conteudo do dicionario para identificar as chaves
    Set Test Variable    ${booking}
    
Step 6: Validação dos valores dentro da chave 'booking
    ${booking_info}=        Get From Dictionary    ${booking}              booking
    Should Be Equal As Strings    ${booking_info['firstname']}             Diogao
    Should Be Equal As Strings    ${booking_info['lastname']}              Qazando
    Should Be Equal As Strings    ${booking_info['totalprice']}            987
    Should Be Equal As Strings    ${booking_info['additionalneeds']}       Breakfast

*** Test Cases ***
Cenário 1: Efetuando uma nova reserva
    Step 1: Criando um dicionario
    Step 2: Cadastrando uma nova reserva
    Step 3: Verificando se o response é true
    Step 4: validando se o status code é 200

Cenário 2: Validando dados da reserva
    Step 5: Validando os valores retornados
    Step 6: Validação dos valores dentro da chave 'booking



