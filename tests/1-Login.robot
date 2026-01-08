*** Settings ***
Resource    ../resources/base.robot
Resource    ../resources/UI/TC1_sign_up_page_keywords.robot
Resource    ../variables/env_variables.robot

Suite Setup     Open Browser To Base Url
Suite Teardown  Close All Browser


*** Test Cases ***
Register User
    #Set Selenium Speed    0.1
    &{address}=    Create Address Data
    ...    ${NAME}      ${LASTNAME}    ${COMPANY}
    ...    ${ADRESS}    ${ADRESS2}     Canada
    ...    ${STATE}     ${CITY}        ${ZIPCODE}
    ...    ${PHONE}
    Register New User    ${USER_NAME}    ${USER_PASSWORD}    &{address}
