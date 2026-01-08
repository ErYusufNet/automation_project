*** Settings ***
Resource    ../../variables/locators.robot
Resource    ../../variables/env_variables.robot
Resource    ../base.robot
Library     SeleniumLibrary
Library     Collections
Library     ../../libs/email_generator.py





*** Keywords ***
Go To Sign Up Page

    Click Element   ${LOGIN}

Generate Signup Email
    ${email}=    Generate Unique Email
    Set Test Variable    ${GENERATED_EMAIL}    ${email}
    RETURN    ${email}

Fill Signup Account Section
    [Arguments]    ${name}    ${password}    ${email}
    Input Text    ${SIGNUP_NAME}       ${name}
    Input Text    ${SIGNUP_EMAIL}      ${email}
    Click Button  ${SIGNUP_BUTTON}

    # Account Information sayfası açıldıktan sonra
    Select Radio Button          title    Mr
    Input Text                  ${SIGNUP_PASSWORD}    ${password}
    Select From List By Index   ${DAY}      2
    Select From List By Label   ${MONTH}    January
    Select From List By Label   ${YEAR}     1996
    Select Checkbox             ${CHECKBOX1}
    Select Checkbox             ${CHECKBOX2}

Create Address Data
    [Arguments]    ${first_name}    ${last_name}    ${company}
    ...            ${address1}      ${address2}     ${country}
    ...            ${state}         ${city}         ${zipcode}
    ...            ${phone}
    &{address}=    Create Dictionary
    ...    first=${first_name}
    ...    last=${last_name}
    ...    company=${company}
    ...    address1=${address1}
    ...    address2=${address2}
    ...    country=${country}
    ...    state=${state}
    ...    city=${city}
    ...    zipcode=${zipcode}
    ...    phone=${phone}
    RETURN    &{address}

Fill Signup Address Section
    [Arguments]    &{address}
    Input Text    ${FIRST_NAME_LCT}    ${address.first}
    Input Text    ${LAST_NAME_LCT}     ${address.last}
    Input Text    ${COMPANY_LCT}       ${address.company}
    Input Text    ${ADRESS1_LCT}       ${address.address1}
    Input Text    ${ADRESS2_LCT}       ${address.address2}
    Select From List By Label    ${COUNTRY}      ${address.country}
    Input Text    ${STATE_LCT}         ${address.state}
    Input Text    ${CITY_LCT}          ${address.city}
    Input Text    ${ZIPCODE_LCT}       ${address.zipcode}
    Input Text    ${PHONE_LCT}         ${address.phone}

Submit Create Account
    Click Button    ${CREATE_ACCOUNT}

Click Continue
    Click Element    ${CONTINUE_LCT}

Verify Account Created
    Wait Until Element Is Visible    ${ACCOUNT_CREATED_MSG}    15s
    Element Should Contain           ${ACCOUNT_CREATED_MSG}    ACCOUNT CREATED!


Verify Logged In As User
    Wait Until Element Is Visible    ${LOGGED_IN_AS}    10s
    Element Should Contain      ${LOGGED_IN_AS}    Logged in as

Delete Account
    Click Button    ${DELETE_LCT}
    Wait Until Element Is Visible    ${ACCOUNT_DELETED}    15s
    Element Should Contain      ${ACCOUNT_DELETED}    ACCOUNT DELETED!
    Click Element    ${CONTINUE_LCT}

Register New User
    [Arguments]    ${user_name}    ${user_password}    &{address}
    Go To Sign Up Page
    ${email}=    Generate Signup Email
    Fill Signup Account Section    ${user_name}    ${user_password}    ${email}
    Fill Signup Address Section    &{address}
    Submit Create Account
    Verify Account Created
    Click Continue
    Verify Logged In As User
