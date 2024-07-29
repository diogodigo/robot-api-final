*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Keywords ***

Step 1: Consultando o uma reserva com o ID
    ${response}=        GET     https://restful-booker.herokuapp.com/booking/247
    Set Test Variable    ${response}

Step 2: Verificando os dados da reserva
         #Verificando os dados da reserva
        ${fristnamevalue}=      Get From Dictionary    ${response.json()}    firstname
        Should Be Equal As Strings    ${fristnamevalue}    Diogao

Setp 3: Validando o lastname
        #Validando o lastname
        ${lastnamevalue}=       Get From Dictionary    ${response.json()}    lastname
        Should Be Equal As Strings    ${lastnamevalue}    Qazando

Step 4: Validando o totalprice
        #Validando o totalprice
        ${totalpricevalue}=      Get From Dictionary    ${response.json()}    totalprice
        Should Be Equal As Strings    ${totalpricevalue}    987

Step 5: Verificando se o depositpaid é true
        #verificando se o depositpaid é true
        ${depositpaid}=     Get From Dictionary    ${response.json()}    depositpaid
        Should Be True    ${depositpaid}

Step 6: Validando o additionalneeds
        #Validando o additionalneeds
        ${additionalneedsvalue}=    Get From Dictionary    ${response.json()}    additionalneeds
        Should Be Equal As Strings    ${additionalneedsvalue}    Breakfast


*** Test Cases ***
Cenário 1: Consultando as reservas com um ID
    Step 1: Consultando o uma reserva com o ID
    Step 2: Verificando os dados da reserva
    Setp 3: Validando o lastname
    Step 4: Validando o totalprice
    Step 5: Verificando se o depositpaid é true
    Step 6: Validando o additionalneeds
    




