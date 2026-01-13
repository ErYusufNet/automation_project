*** Settings ***
Documentation     UI-level keywords for signup with existing email scenarios.
...               Validates that system prevents registration with an already registered email.
Resource          ../../variables/locators.robot
Resource          ../../variables/env_variables.robot
Resource          ../base.robot
Library           SeleniumLibrary
Library           Collections
Resource          TC1_sign_up_page_keywords.robot
Resource          TC2_login_keywords.robot


*** Keywords ***
Register User With Existing Email
    [Documentation]    Attempts to register a user using an already registered email
    ...                and verifies the appropriate error message is displayed.
    [Arguments]    ${name}
    Verify Home Page Is Visible
    Go To Sign Up Page
    Verify New User Sign Up Visible
    Fill Existing Email    ${name}
    Verify Email Address Already Exists Error

Fill Existing Email
    [Documentation]    Fills signup form with an already registered email address.
    [Arguments]    ${name}
    Input Text    ${SIGNUP_NAME}     ${name}
    Input Text    ${SIGNUP_EMAIL}    ${USER_EMAIL}
    Click Button  ${SIGNUP_BUTTON}

Verify Email Address Already Exists Error
    [Documentation]    Verifies 'Email Address already exist!' error message is visible.
    Wait Until Element Is Visible    ${VERIFY_EMAIL_EXIST_MSG}    10s
    Element Text Should Be           ${VERIFY_EMAIL_EXIST_MSG}    Email Address already exist!
