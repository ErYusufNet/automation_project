*** Settings ***
Resource    ../../variables/locators.robot
Resource    ../../variables/env_variables.robot
Resource    ../base.robot
Library     SeleniumLibrary
Library     Collections
Resource    TC1_sign_up_page_keywords.robot


*** Keywords ***


Verify home page is visible
    Wait Until Element Is Visible    ${HOME}
    Element Should Contain    ${HOME}    Home
Verify login to your account is visible
    Page Should Contain    Login to your account
    Wait Until Element Is Visible    ${LOGIN_TO_YOUR_ACCOUNT_MSG}    10s
    Element Should Contain           ${LOGIN_TO_YOUR_ACCOUNT_MSG}    Login to your account


Fill email and password
    Go To Sign Up Page
    Input Text    ${LOGIN_EMAIL}    ${USER_EMAIL}
    Input Text    ${LOGIN_PASSWORD}    ${USER_PASSWORD}
    Click Button    ${LOGIN_BUTTON}

Login user with correct email and password
    Verify home page is visible
    Go To Sign Up Page
    Verify login to your account is visible
    Fill email and password
    Verify Logged In As User
    Delete Account




