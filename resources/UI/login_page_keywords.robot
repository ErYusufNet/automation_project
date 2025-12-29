*** Settings ***
Resource    ../../variables/locators.robot
Resource    ../../variables/env_variables.robot
Resource    ../base.robot
Library     SeleniumLibrary
Library     ../../libs/email_generator.py


*** Keywords ***
Go To Login Page
    #Set Selenium Speed    0.5
    Click Button    ${COOKIE}
    Click Element    ${LOGIN}

    ${email}=    Generate Unique Email
    Set Test Variable    ${GENERATED_EMAIL}    ${email}

    Input Text    ${SIGNUP_NAME}      ${USER_NAME}
    Input Text    ${SIGNUP_EMAIL}     ${email}
    Click Button    ${SIGNUP_BUTTON}

    Select Radio Button    title    Mr
    Input Text    ${SIGNUP_PASSWORD}    ${USER_PASSWORD}
    Select From List By Index    ${DAY}      2
    Select From List By Label    ${MONTH}    January
    Select From List By Label    ${YEAR}     1996


